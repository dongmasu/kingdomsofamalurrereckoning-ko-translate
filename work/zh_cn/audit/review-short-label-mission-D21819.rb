#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelMissionD21819
  extend self

  M = ReviewedNameBatches
  D = 21_819
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21818.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '15366', ''] => ['선교회', '선교회(The Mission)', 'accepted'],
    ['default', '5273', ''] => ['선교회', '선교회(The Mission)', 'accepted'],
    ['default', '7421', ''] => ['선교회', '선교회(The Mission)', 'accepted'],
    ['default', '8398', ''] => ['선교회(The Mission)', '선교회(The Mission)', 'not-an-issue']
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    The exact English source label is `The Mission`. Japanese uses 修道院
    (monastery) while Chinese uses 布道所 (preaching/mission site), so the
    locales do not establish one precise institutional or building category.
    Preserve the existing Korean rendering `선교회` and add only the exact
    English label in parentheses at default:15366, 5273, and 7421. Retain the
    already paired default:8398 label. D-4705, D-1301, D-2037, and D-2347's
    separate category uncertainties remain open; no entity is registered and
    no prior index disposition or cumulative count is changed.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21818 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21818 ')
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
    candidate = candidates.fetch('The Mission')
    candidate_keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    raise "unexpected candidate keys: #{candidate_keys.inspect}" unless
      candidate_keys.to_set == EXPECTED.keys.to_set
    raise 'unexpected unpaired label keys' unless
      JSON.parse(candidate.fetch('unpaired_label_keys_json')).map { |parts| parts.map(&:to_s) }.to_set ==
        [%w[default 15366], %w[default 5273], %w[default 7421]].map { |parts| parts + [''] }.to_set
    raise 'unexpected paired evidence key' unless
      JSON.parse(candidate.fetch('paired_evidence_keys_json')).map { |parts| parts.map(&:to_s) } ==
        [['default', '8398', '']]

    prior_by_key = index.group_by { |row| key(row) }
    reviews = EXPECTED.map do |source_key, (old, revised, disposition)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      current = source.fetch('work_text')
      raise "stale Korean text at #{source_key.inspect}" unless current == old
      raise "unexpected English label at #{source_key.inspect}" unless english == 'The Mission'
      raise "unexpected aligned locale at #{source_key.inspect}" unless
        japanese == '修道院' && chinese == '布道所'
      prior = prior_by_key.fetch(source_key, [])
      {
        'english_candidate' => 'The Mission',
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
        'entity_key' => 'candidate:The Mission',
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
    raise 'unexpected edit set' unless checks.map { |check| check.fetch(:resource) } == ['default']
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
    raise 'reviewed Mission candidate was not removed' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The Mission' }
    raise 'unexpected next candidate' unless
      snapshot.first&.fetch('english_candidate') == 'The Morning Prayer'
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
      Reviewed all four bounded `The Mission` label memberships: added the English pairing `선교회(The Mission)` at default:15366, 5273, and 7421; retained the already-paired label at default:8398.
      English is the meaning anchor. Japanese uses `修道院` (monastery) and Chinese uses `布道所` (preaching/mission site), so the specific institution/building category remains unresolved. D-4705, D-1301, D-2037, and D-2347 remain open; no entity, glossary entry, indexed status/count, or cumulative total changed.
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
      Last batch pre-edit backup and byte validation:
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
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}`#{row.fetch('old') == row.fetch('new') ? '' : " -> `#{row.fetch('new')}`"}."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Mission Label Pairing\n\nAdded missing English pairings to the three unpaired labels at default:15366, 5273, and 7421 as `선교회(The Mission)`, retaining the existing Korean wording and the already-paired default:8398 label. Locale disagreement over whether the referent is a monastery, mission site, organization, or building remains unresolved; the four historical uncertainties were preserved without recount.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Mission Short-Label Review\n\nAdded the missing English label to three `선교회` entries and retained the existing paired entry. The inconsistent locale descriptions do not settle the institution's exact type, so no entity was registered and the prior uncertainty remains open.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Mission Short-Label Pairing Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English provides the exact capitalized label `The Mission`. The aligned
      Japanese `修道院` suggests a monastery, while Chinese `布道所` suggests a
      preaching/mission site. These translations do not establish whether the
      game referent is a building, organization, or broader institution.
      Preserve the existing Korean `선교회`; add English pairing only.

      #{details}

      ## Historical Scope

      D-4705, D-1301, D-2037, and D-2347 are retained as separate unresolved
      category judgments at the four exact labels. This batch does not decide
      whether they denote a single organization or location and does not change
      any occurrence-index state or historical total.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Three cells changed: default:15366, default:5273, and default:7421,
      each from `선교회` to `선교회(The Mission)`. The already-paired
      default:8398 label was retained. No glossary or occurrence-index bytes
      changed.

      #{summary}

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backup, BOM, mixed line endings, row order/count,
      target cells, unchanged non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-#{D}: four memberships reviewed; three pairings added; validation and residual audit PASS."
  end
end

ReviewShortLabelMissionD21819.run if $PROGRAM_NAME == __FILE__
