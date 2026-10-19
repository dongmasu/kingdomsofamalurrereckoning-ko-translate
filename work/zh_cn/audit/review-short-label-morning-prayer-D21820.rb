#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelMorningPrayerD21820
  extend self

  M = ReviewedNameBatches
  D = 21_820
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21819.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '40212', ''] => ['아침 기도', '아침 기도(The Morning Prayer)', 'accepted'],
    ['base', '3104', '11'] => ['아침 기도 (The Morning Prayer)', '아침 기도(The Morning Prayer)', 'accepted']
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    The exact English source label is `The Morning Prayer`. Aligned Japanese
    `朝のお祈り` and Chinese `晨间祷告` both support the ordinary meaning
    “morning prayer”; they do not establish a unique named rite, organization,
    or other entity. Preserve the Korean translation `아침 기도`, add the
    missing English pairing at default:40212, and normalize only the
    unnecessary space before the parenthesis in base:3104:11 so both exact
    labels use `아침 기도(The Morning Prayer)`. No entity or prior index
    disposition is registered, changed, or recounted.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21819 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21819 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [DISPOSITIONS, MANIFEST, SNAPSHOT, report, addendum].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Morning Prayer')
    candidate_keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    raise "unexpected candidate keys: #{candidate_keys.inspect}" unless
      candidate_keys.to_set == EXPECTED.keys.to_set
    raise 'unexpected unpaired label' unless
      JSON.parse(candidate.fetch('unpaired_label_keys_json')).map { |parts| parts.map(&:to_s) } ==
        [['default', '40212', '']]
    raise 'unexpected paired evidence' unless
      JSON.parse(candidate.fetch('paired_evidence_keys_json')).map { |parts| parts.map(&:to_s) } ==
        [['base', '3104', '11']]

    prior_by_key = index.group_by { |row| key(row) }
    reviews = EXPECTED.map do |source_key, (old, revised, disposition)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      current = source.fetch('work_text')
      raise "stale Korean text at #{source_key.inspect}" unless current == old
      raise "unexpected English label at #{source_key.inspect}" unless english == 'The Morning Prayer'
      raise "unexpected aligned locale at #{source_key.inspect}" unless
        japanese == '朝のお祈り' && chinese == '晨间祷告'
      prior = prior_by_key.fetch(source_key, [])
      {
        'english_candidate' => 'The Morning Prayer',
        'disposition' => disposition,
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
        'entity_key' => 'candidate:The Morning Prayer',
        'status' => disposition,
        'entity_dispositions_json' => '{}',
        'previous_status' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'previous_evidence' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('evidence')] }
        )
      }
    end

    M.write_table(DISPOSITIONS, HEADERS,
                  reviews.map { |row| HEADERS.to_h { |field| [field, row[field]] } })
    M.write_table(MANIFEST, M::HEADERS,
                  reviews.map { |row| M::HEADERS.to_h { |field| [field, row.fetch(field, '')] } })
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'unexpected edit resources' unless checks.map { |check| check.fetch(:resource) }.to_set == %w[base default].to_set
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    EXPECTED.each do |source_key, (_old, revised, _disposition)|
      raise "post-edit text mismatch at #{source_key.inspect}" unless
        inventory.fetch(source_key).fetch('work_text') == revised
    end
    raise 'occurrence index changed unexpectedly' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed Morning Prayer candidate was not removed' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The Morning Prayer' }
    raise 'unexpected next candidate' unless
      snapshot.first&.fetch('english_candidate') == 'The Proud Warsworn'
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed both bounded `The Morning Prayer` labels: default:40212 gained the missing English pairing, and base:3104:11 was standardized to the same no-space Korean (English) display `아침 기도(The Morning Prayer)`.
      English, Japanese `朝のお祈り`, and Chinese `晨间祷告` support the ordinary “morning prayer” meaning but do not establish a distinct named rite or institution. Existing Korean wording was preserved; no entity, glossary entry, indexed status/count, or cumulative total changed.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts_text} (unchanged).
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
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    details = reviews.map do |row|
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}` -> `#{row.fetch('new')}`."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Morning Prayer Label Pairing\n\nStandardized the two exact labels at default:40212 and base:3104:11 as `아침 기도(The Morning Prayer)`, preserving the Korean meaning and removing the stray space before the parenthesis. The multilingual evidence does not establish a distinct rite or named institution; no entity or index entry was added.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Morning Prayer Label Pairing\n\nAdded the missing English pairing and standardized spacing in the existing paired label. This review preserves `아침 기도` and does not classify it as a distinct named rite or institution.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Morning Prayer Short-Label Pairing Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English gives the exact label `The Morning Prayer`; Japanese
      `朝のお祈り` and Chinese `晨间祷告` support the ordinary prayer meaning.
      They do not establish whether this is a named rite or organization.
      Keep the Korean `아침 기도` and standardize the complete display.

      #{details}

      ## Historical Scope

      This batch changes only the bilingual display and parenthesis spacing
      for the two candidate labels. It does not register a new proper-name
      entity or alter previous row-level findings and cumulative totals.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      default:40212 changed from `아침 기도` to `아침 기도(The Morning Prayer)`.
      base:3104:11 changed from `아침 기도 (The Morning Prayer)` to
      `아침 기도(The Morning Prayer)`. No glossary or occurrence-index bytes
      changed.

      #{summary}

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backups, BOM, mixed line endings, row order/count,
      target cells, unchanged non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-#{D}: two label memberships reviewed; English pairing and spacing standardized; validation and residual audit PASS."
  end
end

ReviewShortLabelMorningPrayerD21820.run if $PROGRAM_NAME == __FILE__
