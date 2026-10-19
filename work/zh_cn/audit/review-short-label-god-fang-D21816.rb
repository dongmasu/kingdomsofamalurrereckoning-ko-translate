#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelGodFangD21816
  extend self

  M = ReviewedNameBatches
  D = 21_816
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21815.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '15664', ''] => ['신의 송곳니', '신의 송곳니(The God Fang)'],
    ['base', '1168', '11'] => ['신의 송곳니 (The God Fang)', '신의 송곳니(The God Fang)'],
    ['base', '3041', '11'] => ['신의 송곳니 (The God Fang)', '신의 송곳니(The God Fang)'],
    ['base', '4308', '11'] => ['신의 송곳니 (The God Fang)', '신의 송곳니(The God Fang)']
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    All four exact English source labels are `The God Fang`. Reuse the
    established Korean rendering `신의 송곳니` and standardize its complete
    bilingual label as `신의 송곳니(The God Fang)`, with no space before
    the parenthesis. The Japanese and Chinese renderings vary among these
    exact rows and do not settle the referent type; English remains the
    meaning anchor. This decision covers label pairing and spacing only.
    D-4847's uncertainty about whether the referent is an item, creature, or
    other entity remains open; no entity is registered and no prior index
    disposition or cumulative count is changed.
  TEXT

  def key(row)
    M.key(row)
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    candidate = candidates.fetch('The God Fang')
    keys = candidate_keys(candidate)
    raise "The God Fang candidate keys differ: #{keys.inspect}" unless
      keys.to_set == EXPECTED.keys.to_set && keys.length == EXPECTED.length

    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    raise "unexpected unpaired labels: #{unpaired.inspect}" unless
      unpaired == [['default', '15664', '']]
    raise "unexpected paired labels: #{paired.inspect}" unless
      paired.to_set == EXPECTED.keys.select { |key| key.first == 'base' }.to_set

    prior_by_key = index.group_by { |row| key(row) }
    EXPECTED.map do |source_key, (old, revised)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English mismatch at #{source_key.inspect}" unless english == 'The God Fang'
      raise "Korean mismatch at #{source_key.inspect}" unless [old, revised].include?(korean)
      raise "unexpected Korean line break at #{source_key.inspect}" if
        revised.match?(/\r|\n/)

      prior = prior_by_key.fetch(source_key, [])
      {
        'english_candidate' => 'The God Fang',
        'disposition' => 'accepted',
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => old,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => old,
        'new' => revised,
        'entity_key' => 'candidate:The God Fang',
        'status' => 'accepted',
        'entity_dispositions_json' => '{}',
        'previous_status' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'previous_evidence' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('evidence')] }
        )
      }
    end
  end

  def retained_backups(prior_block, checks)
    lines = prior_block.lines.grep(/^- (?:affix|base|default): \d+ cells; pre .*backup `/)
    backups = lines.to_h do |line|
      [line[/\A- (\w+):/, 1], line.strip]
    end
    checks.each do |check|
      backups[check.fetch(:resource)] =
        "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; " \
        "pre `#{check.fetch(:before_sha256)}`; " \
        "post `#{check.fetch(:after_sha256)}`; " \
        "backup `#{check.fetch(:backup)}`."
    end
    M::RESOURCES.map { |resource| backups[resource] }.compact.join("\n")
  end

  def apply_or_resume(edits, backup_dir)
    FileUtils.mkdir_p(backup_dir)
    edits.group_by { |row| row.fetch('resource') }.map do |resource, group|
      path = M.csv_path(resource)
      backup = File.join(backup_dir, File.basename(path))
      current = File.binread(path)
      before = File.exist?(backup) ? File.binread(backup) : current
      updated, row_count = ProperNameCellEditor.prepare(before, group)
      FileUtils.copy_file(path, backup) unless File.exist?(backup)
      raise "backup differs from pre-edit bytes: #{backup}" unless
        File.binread(backup) == before
      if current == before
        File.binwrite(path, updated)
      elsif current != updated
        raise "active CSV is neither pre-edit nor reviewed post-edit bytes: #{path}"
      end
      after = File.binread(path)
      raise "post-edit bytes differ from reviewed result: #{path}" unless after == updated
      {
        resource: resource, cells: group.length, rows: row_count,
        before_sha256: Digest::SHA256.hexdigest(before),
        after_sha256: Digest::SHA256.hexdigest(after), backup: backup,
        validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
      }
    end
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21815 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21815 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    artifacts = [
      SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
    raise 'D-21816 artifact already exists' if artifacts.any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'unexpected review count' unless reviews.length == EXPECTED.length

    edits = reviews.map do |row|
      M::HEADERS.to_h { |header| [header, row.fetch(header, '')] }
    end
    {
      DISPOSITIONS => [HEADERS, reviews],
      MANIFEST => [M::HEADERS, edits]
    }.each do |path, (headers, rows)|
      if File.exist?(path)
        existing = M.table(path)
        raise "existing generated artifact differs: #{path}" unless
          existing.headers == headers &&
          existing.map(&:to_h) == rows.map { |row| headers.to_h { |header| [header, row[header]] } }
      else
        M.write_table(path, headers, rows)
      end
    end

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = apply_or_resume(edits, backup_dir)
    raise 'unexpected resources edited' unless
      checks.map { |check| check.fetch(:resource) }.sort == %w[base default]
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    reviews.each do |row|
      source_key = key(row)
      raise "post-edit text mismatch at #{source_key.inspect}" unless
        inventory.fetch(source_key).fetch('work_text') == row.fetch('new')
    end
    raise 'index changed unexpectedly' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    prior_decisions = ShortLabelDiscovery20261018.reviewed_dispositions
    prior_decisions.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    glossary = M.table(glossary_path).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index, reviewed_dispositions: prior_decisions
    )
    raise 'The God Fang remains in refreshed candidates' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The God Fang' }
    raise 'next short-label group is not The Isles' unless
      snapshot.first&.fetch('english_candidate') == 'The Isles'

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'validation changed CSV/index/glossary' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    hashes = M.hashes
    backup_text = retained_backups(prior_block, checks)
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    index_hash_after = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_hash_after = Digest::SHA256.file(glossary_path).hexdigest
    count_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    source_manifest = reviews.map do |row|
      "- `#{key(row).join(':')}`: `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}` -> `#{row.fetch('new')}`."
    end.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed all 4 exact `The God Fang` label keys: four Korean labels were standardized to `신의 송곳니(The God Fang)`; one missing English pairing and three spacing variants were corrected.
      D-4847's uncertainty about referent type remains open. This is a label-pairing/spacing decision only; no entity was registered, no occurrence-index status or cumulative count changed, and historical findings were not reopened or recounted.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{count_text} (unchanged).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      These focused index counts are not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variants.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Edit manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      #{backup_text}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash_after}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash_after}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The God Fang Label Pairing\n\nReviewed all four exact `The God Fang` keys across `base` and `default`; standardized their Korean labels as `신의 송곳니(The God Fang)`. This closes only the missing bilingual-label/spacing scope. The inconsistent aligned Japanese/Chinese variants do not establish referent type, so D-4847 remains open and no proper-name entity or occurrence-index entry was created. No prior finding or cumulative count was reopened or recounted.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The God Fang Label Pairing\n\nThe four exact English labels now use the consistent Korean display `신의 송곳니(The God Fang)`. This change standardizes label pairing and spacing only; the item/creature/other referent type remains unresolved under D-4847. See the review report and edit addendum.\n"
      end
      File.write(path, text)
    end

    File.write(report, <<~TEXT)
      # D-#{D}: The God Fang Label Pairing

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      English is consistent across the four exact rows and remains the meaning
      anchor. The Korean literal translation is already consistent; only the
      parenthetical English coverage and spacing were normalized. Japanese
      and Chinese vary among the aligned rows, so they were not used to infer
      whether the referent is an item, creature, or another entity type.

      #{source_manifest}

      D-4847 at `default:15664` remains historically `uncertain` on entity
      type. This batch does not supersede that unresolved question, register
      an entity, alter the occurrence index/glossary, or recount prior totals.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Four `Texto` cells across `base` and `default` were standardized to
      `신의 송곳니(The God Fang)`. No other CSV cell changed.

      #{summary}

      The byte-identical pre-edit backups and independent verifier confirm the
      UTF-8 BOM, pre-existing mixed line endings, row order/count, target cells,
      unchanged non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-#{D}: four bilingual label corrections; D-4847 type uncertainty preserved; #{validation.strip}; residual audit PASS."
  end
end

ReviewShortLabelGodFangD21816.run if $PROGRAM_NAME == __FILE__
