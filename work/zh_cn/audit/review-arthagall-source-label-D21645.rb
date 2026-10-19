#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ArthagallSourceLabelD21645
  extend self
  M = ReviewedNameBatches
  D = 21_645
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  INDEX = File.join(__dir__, 'proper-name-occurrences.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')

  TARGET = ['default', '49669', ''].freeze
  ALREADY_PAIRED = {
    ['default', '8422', ''] => '아르타갈(Arthagall)',
    ['default', '59914', ''] => '아르타갈(Arthagall)'
  }.freeze
  ENGLISH = 'Arthagall'
  JAPANESE = 'アーサガール'
  CHINESE = '亚尔撒加尔'
  OLD = '아르타갈'
  NEW = '아르타갈(Arthagall)'

  def source_texts(row)
    [
      JSON.parse(row.fetch('en_texts_json')).compact.uniq.join("\n"),
      JSON.parse(row.fetch('ja_texts_json')).compact.uniq.join("\n"),
      row.fetch('zh_text'),
      row.fetch('work_text')
    ]
  end

  def validate_scope!(inventory)
    exact = inventory.select do |_key, row|
      JSON.parse(row.fetch('en_texts_json')).compact.uniq == [ENGLISH]
    end.keys.sort
    expected = [TARGET, *ALREADY_PAIRED.keys].sort
    raise "unexpected exact source-label scope: #{exact.inspect}" unless exact == expected

    ALREADY_PAIRED.each do |key, korean|
      english, japanese, chinese, current = source_texts(inventory.fetch(key))
      raise "paired source label changed at #{key.inspect}" unless
        english == ENGLISH && japanese == JAPANESE &&
        chinese == CHINESE && current == korean
    end

    english, japanese, chinese, current = source_texts(inventory.fetch(TARGET))
    raise 'target English evidence changed' unless english == ENGLISH
    raise 'target Japanese source unexpectedly changed' unless japanese == ENGLISH
    raise 'target Chinese source unexpectedly changed' unless chinese == ENGLISH
    raise 'target Korean cell changed' unless [OLD, NEW].include?(current)

    true
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'unexpected current checkpoint' unless
      previous&.include?('Latest verified proper-name batch: D-21644 ')
    raise 'checkpoint documents differ' unless
      documents.values.all? { |text| text[marker] == previous }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    report_path = File.join(__dir__, report_name)
    addendum_path = File.join(__dir__, addendum_name)
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21645 output already exists' if
      [report_path, addendum_path, manifest].any? { |path| File.exist?(path) }

    active_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    validate_scope!(inventory)

    row = {
      'resource' => TARGET[0], 'ID_Linha' => TARGET[1], 'Tipo_Variante' => TARGET[2],
      'entity_key' => 'source-label:arthagall',
      'status' => 'accepted', 'old' => OLD, 'new' => NEW,
      'evidence' =>
        'Exact standalone English source label only. The active default contains two other exact Arthagall labels, both already paired as 아르타갈(Arthagall), with Japanese アーサガール and Chinese 亚尔撒加尔. This target row leaves the name untranslated in Japanese and Chinese; the parallel exact labels provide the cross-locale corroboration. Pair this one previously bare Korean label with the exact English source. This row-local display decision does not infer a person, creature, faction, place, or other entity category and does not create a glossary or occurrence-index disposition.',
      'english' => ENGLISH, 'japanese' => JAPANESE, 'chinese' => CHINESE,
      'entity_dispositions_json' => '{}',
      'previous_status' => '{}', 'previous_evidence' => '{}'
    }
    raise 'target label already has an occurrence-index disposition' if
      M.table(INDEX).any? { |candidate| M.key(candidate) == TARGET }

    M.write_table(manifest, M::HEADERS, [row])
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, active_hashes)
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    raise 'post-edit target mismatch' unless inventory.fetch(TARGET).fetch('work_text') == NEW
    validate_scope!(inventory)
    hashes = M.hashes
    raise 'CSV hashes differ from editor output' unless
      hashes.fetch('default') == checks.first.fetch(:after_sha256)
    raise 'glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'occurrence index changed' unless Digest::SHA256.file(INDEX).hexdigest == index_hash
    raise 'candidate shortlist changed' unless
      Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash

    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless data_validation.include?('PASS')
    raise 'residual source/index audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    index_rows = M.table(INDEX)
    counts = index_rows.group_by { |item| item['status'] }.transform_values(&:length)
    unresolved = index_rows.select { |item| item['status'] == 'uncertain' }
    pending = index_rows.select { |item| item['status'] == 'needs-context' }
    retained = previous[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior backup history missing' unless retained
    retained = retained.lines.reject { |line| line.start_with?('- default:') }
    retained << "- default: 1 cell; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"

    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)
    glossary_count = M.table(GLOSSARY).length
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    batch = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed one exact standalone `Arthagall` source label at default:49669. Added the exact English spelling to the existing Korean `아르타갈`; the identical labels at default:8422 and default:59914 already use `아르타갈(Arthagall)` and were retained. Those parallel rows use Japanese `アーサガール` and Chinese `亚尔撒加尔`; the target row leaves the name untranslated in those two languages.
      This is a row-local source-label annotation only; no identity category, glossary entity, occurrence-index disposition, prior terminal decision, or historical tally was added or reopened.
      Indexed matches: #{index_rows.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |item| M.key(item) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{unresolved.length}, in #{unresolved.map { |item| M.key(item) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      - default: 1 cell; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index_rows.length} rows; SHA-256 `#{index_hash}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      Residual source/index audit: PASS; #{residual_lines.join('; ')}.
      Data validation: #{data_validation.strip}
      Next: D-21646; continue deduplicated discovery of unregistered and unpaired proper-name source labels across affix/base/default.
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Arthagall Source-Label Consistency"
    raise 'decision-register section already exists' if register.include?(heading)
    register << <<~REGISTER

      #{heading}

      Added the exact English source spelling to default:49669:
      `아르타갈` -> `아르타갈(Arthagall)`. The exact labels at default:8422
      and default:59914 were already paired and remain unchanged. Japanese
      `アーサガール` and Chinese `亚尔撒加尔` corroborate. This row-local
      annotation does not infer an identity category or add a glossary,
      occurrence-index disposition, or global tally. Full discovery remains
      incomplete.
    REGISTER

    rows = <<~ROWS
      | Key | English | Korean old | Korean new |
      | --- | --- | --- | --- |
      | `default:49669` | `Arthagall` | `아르타갈` | `아르타갈(Arthagall)` |
    ROWS
    report = <<~REPORT
      # D-#{D}: Arthagall Source-Label Consistency

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed the exact standalone English label `Arthagall` across the active
      default resource. The source contains three exact labels: default:8422
      and default:59914 already pair the same Korean spelling with English;
      default:49669 omitted that source spelling. The two parallel rows use
      Japanese `アーサガール` and Chinese `亚尔撒加尔`; the target row leaves
      the English name untranslated in those locales.

      #{rows}

      Only the missing row-local English annotation was added. No person,
      creature, faction, place, or other identity category is inferred, and
      no glossary or occurrence-index record was created. Existing historical
      judgments and tallies were not reopened or recounted.

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
      - #{residual_lines.join("\n- ")}
      - #{data_validation.strip}

      No PAK or PAK-derived data was consulted. Full proper-name discovery
      remains incomplete.
    REPORT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      One default `Texto` cell was changed from `아르타갈` to
      `아르타갈(Arthagall)`. Two identical standalone labels already had the
      bilingual form and were retained.

      No glossary, occurrence index, prior disposition, or global tally was
      changed. The pre-edit byte-identical backup is
      `#{checks.first.fetch(:backup)}`.

      #{verification.strip}
    TEXT

    File.write(report_path, report + "\n")
    File.write(addendum_path, addendum + "\n")
    File.write(register_path, register)
    documents.each do |path, text|
      raise "missing checkpoint in #{path}" unless text.match?(marker)
      text.sub!(
        marker,
        "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{batch}<!-- current-proper-name-batch:end -->\n"
      )
      File.write(path, text)
    end
    puts "D-#{D}: one source-label edit; entity/index/glossary dispositions unchanged.\n#{verification}\n#{data_validation}\n#{residual}"
  end
end

ArthagallSourceLabelD21645.run if $PROGRAM_NAME == __FILE__
