#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelTravelersD21822
  extend self

  M = ReviewedNameBatches
  D = 21_822
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21821.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '1206', ''] => {
      old: '트래블러(Travelers)들', new: '트래블러(The Travelers)들',
      disposition: 'accepted'
    },
    ['default', '14458', ''] => {
      old: '트래블러(Travelers)', new: '트래블러(The Travelers)',
      disposition: 'accepted'
    },
    ['default', '3427', ''] => {
      old: '트래블러(The Travelers)', new: '트래블러(The Travelers)',
      disposition: 'not-an-issue'
    }
  }.freeze
  LABEL = 'The Travelers'
  EVIDENCE = <<~TEXT.strip.freeze
    English gives the exact faction label `The Travelers`; Japanese
    `トラベラーズ` and Chinese `旅行者` corroborate the group reading. The
    Korean wording already matches the established `트래블러` form. Add the
    missing exact English article only at default:1206 and default:14458,
    matching the already paired default:3427 label. Existing
    `faction:travelers` dispositions D-20770, D-20771, and D-20775 remain
    intact; this is label-display normalization only, not a new entity,
    index disposition, or recount.
  TEXT

  def key(row)
    M.key(row)
  end

  def source_text(inventory, source_key)
    source = inventory.fetch(source_key) { raise "missing source #{source_key.inspect}" }
    english = JSON.parse(source.fetch('en_texts_json')).compact.uniq
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.uniq
    [source, english, japanese]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21821 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21821 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [DISPOSITIONS, MANIFEST, SNAPSHOT, report, addendum].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    index = M.table(M::INDEX)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch(LABEL)
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
                 .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
               .map { |parts| parts.map(&:to_s) }
    raise "unexpected unpaired label memberships: #{unpaired.inspect}" unless
      unpaired == [['default', '1206', ''], ['default', '14458', '']]
    raise "unexpected paired evidence: #{paired.inspect}" unless
      paired == [['default', '3427', '']]

    index_rows_by_key = index.group_by { |row| key(row.to_h) }
    reviews = TARGETS.map do |source_key, target|
      source, english, japanese = source_text(inventory, source_key)
      current = source.fetch('work_text')
      raise "stale Korean cell at #{source_key.inspect}" unless current == target.fetch(:old)
      raise "unexpected exact English at #{source_key.inspect}" unless english == [LABEL]
      raise "unexpected Japanese at #{source_key.inspect}" unless japanese == ['トラベラーズ']
      raise "unexpected Chinese at #{source_key.inspect}" unless source.fetch('zh_text') == '旅行者'
      prior = index_rows_by_key.fetch(source_key, [])
      expected_status = source_key[1] == '3427' ? 'not-an-issue' : 'accepted'
      raise "missing or changed prior faction decision at #{source_key.inspect}" unless
        prior.length == 1 && prior.first.fetch('entity_key') == 'faction:travelers' &&
        prior.first.fetch('status') == expected_status
      {
        'english_candidate' => LABEL,
        'disposition' => target.fetch(:disposition),
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english.join("\n"),
        'japanese' => japanese.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => current,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => target.fetch(:old),
        'new' => target.fetch(:new),
        'entity_key' => 'candidate:The Travelers',
        'status' => target.fetch(:disposition),
        'entity_dispositions_json' => '{}',
        'previous_status' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'previous_evidence' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('evidence')] }
        )
      }
    end
    raise 'candidate membership count differs' unless reviews.length == 3

    M.write_table(DISPOSITIONS, HEADERS,
                  reviews.map { |row| HEADERS.to_h { |field| [field, row[field]] } })
    M.write_table(MANIFEST, M::HEADERS,
                  reviews.map { |row| M::HEADERS.to_h { |field| [field, row.fetch(field, '')] } })

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'unexpected edit resource or count' unless
      checks.length == 1 && checks.first.fetch(:resource) == 'default' &&
      checks.first.fetch(:cells) == 2
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    TARGETS.each do |source_key, target|
      raise "post-edit text mismatch at #{source_key.inspect}" unless
        inventory.fetch(source_key).fetch('work_text') == target.fetch(:new)
    end
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    # Refresh only existing occurrence text snapshots for the two edited keys.
    index_backup = File.join(backup_dir, 'proper-name-occurrences.tsv')
    FileUtils.mkdir_p(backup_dir)
    old_index_bytes = File.binread(M::INDEX)
    raise 'occurrence index changed before refresh' unless
      Digest::SHA256.hexdigest(old_index_bytes) == index_hash
    if File.exist?(index_backup)
      raise "index backup differs: #{index_backup}" unless File.binread(index_backup) == old_index_bytes
    else
      File.binwrite(index_backup, old_index_bytes)
    end
    raise 'index backup is not byte-identical' unless File.binread(index_backup) == old_index_bytes
    before_index = M.table(M::INDEX).map(&:to_h)
    target_keys = unpaired.to_set
    refreshed_count = 0
    before_status_counts = before_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    after_index = before_index.map do |row|
      if target_keys.include?(key(row))
        row['korean_current'] = inventory.fetch(key(row)).fetch('work_text')
        refreshed_count += 1
      end
      row
    end
    raise "unexpected refreshed occurrence count #{refreshed_count}" unless refreshed_count == 2
    M.write_table(M::INDEX, M.table(M::INDEX).headers, after_index)
    current_index = M.table(M::INDEX).map(&:to_h)
    raise 'occurrence index row count/order changed' unless
      current_index.length == before_index.length &&
      current_index.map { |row| [row['entity_key'], *key(row)] } ==
        before_index.map { |row| [row['entity_key'], *key(row)] }
    before_index.zip(current_index).each do |before, after|
      expected = before.dup
      expected['korean_current'] = after['korean_current'] if target_keys.include?(key(before))
      raise "unexpected occurrence-index field change at #{key(before).inspect}" unless after == expected
    end
    after_status_counts = current_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise 'occurrence-index status totals changed' unless before_status_counts == after_status_counts

    index_hash_after = Digest::SHA256.file(M::INDEX).hexdigest
    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), current_index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed Travelers memberships remain in candidate snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    raise 'unexpected next candidate count' unless snapshot.length == 13
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'unexpected index change during validation' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash_after

    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_counts = current_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = current_index.select { |row| row.fetch('status') == 'uncertain' }
    hashes = M.hashes
    index_hash_before = Digest::SHA256.hexdigest(old_index_bytes)
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed all three bounded `The Travelers` label memberships. Added the exact English article at default:1206 and default:14458, using the already paired default:3427 label `트래블러(The Travelers)` as the display reference.
      English `The Travelers`, Japanese `トラベラーズ`, and Chinese `旅行者` support the faction label. Existing `faction:travelers` decisions D-20770, D-20771, and D-20775 were preserved; no entity, status, evidence, or cumulative count was added or recounted.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{current_index.length}; #{counts_text} (statuses unchanged).
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
      Last batch pre-edit backup and byte validation:
      - default: 2 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
      #{verification.strip}
      Occurrence index: #{current_index.length} rows; pre-refresh SHA-256 `#{index_hash_before}`; post-refresh SHA-256 `#{index_hash_after}`; backup `#{index_backup}`. Exactly two existing `korean_current` cells were refreshed; status, evidence, key order, row count, and status totals are unchanged.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    details = reviews.map do |row|
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}`#{row.fetch('old') == row.fetch('new') ? '' : " -> `#{row.fetch('new')}`"}."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Travelers Label Pairing\n\nAdded the exact English article to default:1206 and default:14458 as `트래블러(The Travelers)` (retaining the Korean plural at 1206), matching the already paired default:3427 label. Prior `faction:travelers` decisions and indexed statuses remain unchanged; only two `korean_current` snapshots were refreshed.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Travelers Label Pairing\n\nAdded the missing exact English article at default:1206 and default:14458, matching default:3427. Existing faction decisions remain intact; no entity or index disposition was added.\n"
      end
      File.write(path, text)
    end

    File.write(report, <<~TEXT)
      # D-#{D}: The Travelers Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English provides the exact `The Travelers` faction label. Japanese
      `トラベラーズ` and Chinese `旅行者` corroborate the same group. The
      existing Korean root `트래블러` is retained. At default:1206 and
      default:14458, add the exact English article to the parenthetical,
      matching default:3427. The Korean plural marker `들` at default:1206
      remains outside the parenthetical.

      #{details}

      ## Historical Scope

      The existing `faction:travelers` accepted/not-an-issue decisions and
      their evidence remain unchanged. This batch only standardizes exact
      bilingual label displays; it does not create another faction entity or
      reopen or recount D-20770, D-20771, or D-20775.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Changed only default:1206 and default:14458:
      `트래블러(Travelers)들` -> `트래블러(The Travelers)들` and
      `트래블러(Travelers)` -> `트래블러(The Travelers)`. The paired
      default:3427 label was retained.

      The CSV editor and independent verifier checked the byte-identical
      pre-edit backup, BOM, mixed line endings, row order/count, target cells,
      unchanged non-target bytes, and inverse reconstruction.

      The occurrence index `korean_current` cache was refreshed only for the
      two existing `faction:travelers` rows. Its byte-identical pre-refresh
      backup is `#{index_backup}`. Independent parsed comparison confirms
      exactly two fields changed; statuses, evidence, order, row count, and
      cumulative counts are unchanged.

      #{summary}
    TEXT
    puts "D-#{D}: three memberships reviewed, two English labels standardized; byte, index, data, and residual validation PASS."
  end
end

ReviewShortLabelTravelersD21822.run if $PROGRAM_NAME == __FILE__
