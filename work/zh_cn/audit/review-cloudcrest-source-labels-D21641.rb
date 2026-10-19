#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CloudcrestSourceLabelsD21641
  extend self
  M = ReviewedNameBatches
  D = 21_641
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  INDEX = File.join(__dir__, 'proper-name-occurrences.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  TARGETS = %w[37607 39417 42369 44597 48012].to_h do |id|
    [['default', id, ''], {
      english: 'Cloudcrest', japanese: 'クラウドクレスト', chinese: '云顶',
      old: '클라우드크레스트', new: '클라우드크레스트(Cloudcrest)'
    }]
  end.freeze
  ALREADY_PAIRED = {
    ['default', '21014', ''] => {
      korean: '클라우드크레스트(Cloudcrest)', japanese: 'クラウドクレスト', chinese: '云顶'
    },
    ['default', '46364', ''] => {
      korean: '클라우드크레스트(Cloudcrest)', japanese: 'クラウドクレスト', chinese: '云顶'
    },
    ['default', '55334', ''] => {
      korean: '클라우드크레스트(Cloudcrest)', japanese: 'Cloudcrest', chinese: 'Cloudcrest'
    }
  }.freeze

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.uniq.join("\n"),
      source.fetch('zh_text'),
      source.fetch('work_text')
    ]
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      english, japanese, chinese, current = source_texts(inventory.fetch(key))
      raise "English source changed at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless chinese == spec.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless [spec.fetch(:old), spec.fetch(:new)].include?(current)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => 'source-label:cloudcrest', 'status' => 'accepted',
        'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' => 'Exact standalone English source label only. The aligned Japanese and Chinese labels corroborate the source spelling and Korean transliteration. This row-local annotation does not assign an entity category, link the label to Cloudcrest Mountain, Peak, or Passage, or create a global alias.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => '{}', 'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end
  end

  def validate_scope!(inventory)
    exact_labels = inventory.select do |_key, source|
      JSON.parse(source.fetch('en_texts_json')).compact.uniq == ['Cloudcrest']
    end.keys.sort
    expected = (TARGETS.keys + ALREADY_PAIRED.keys).sort
    raise "unexpected exact Cloudcrest label scope: #{exact_labels.inspect}" unless exact_labels == expected

    ALREADY_PAIRED.each do |key, expected|
      english, japanese, chinese, current = source_texts(inventory.fetch(key))
      raise "prepaired source changed at #{key.inspect}" unless
        english == 'Cloudcrest' && japanese == expected.fetch(:japanese) &&
        chinese == expected.fetch(:chinese) && current == expected.fetch(:korean)
    end
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'unexpected current checkpoint' unless previous&.include?('Latest verified proper-name batch: D-21640 ')
    raise 'checkpoint documents differ' unless documents.values.all? { |text| text[marker] == previous }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    report_path = File.join(__dir__, report_name)
    addendum_path = File.join(__dir__, addendum_name)
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21641 output already exists' if [report_path, addendum_path, manifest].any? { |path| File.exist?(path) }

    active_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    validate_scope!(inventory)
    rows = reviews(inventory)
    raise 'unexpected edit count' unless rows.length == 5

    target_keys = TARGETS.keys
    index_rows = M.table(INDEX)
    raise 'a source-label row already has indexed ownership' if
      index_rows.any? { |row| target_keys.include?(M.key(row)) }
    M.write_table(manifest, M::HEADERS, rows)

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, active_hashes)
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    rows.each do |row|
      raise "post-edit mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    validate_scope!(inventory)

    hashes = M.hashes
    raise 'CSV hashes differ from editor output' unless checks.all? do |check|
      hashes.fetch(check.fetch(:resource)) == check.fetch(:after_sha256)
    end
    raise 'glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'occurrence index changed' unless Digest::SHA256.file(INDEX).hexdigest == index_hash
    raise 'candidate shortlist changed' unless Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash

    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'data validation failed' unless data_validation.include?('PASS')
    raise 'residual audit failed' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    index_counts = index_rows.group_by { |row| row['status'] }.transform_values(&:length)
    uncertain = index_rows.select { |row| row['status'] == 'uncertain' }
    pending = index_rows.select { |row| row['status'] == 'needs-context' }
    old_block = previous[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior backup history missing' unless old_block
    retained = old_block.lines.reject { |line| line.start_with?('- default:') }
    retained << "- default: 5 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    glossary_count = M.table(GLOSSARY).length
    variant_count = M.table(CANDIDATES).length
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)

    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed five exact standalone `Cloudcrest` source-label rows: all five Korean cells now carry the English source spelling. This is row-local label annotation only; it does not classify or register an entity, connect these rows to Cloudcrest Mountain/Peak/Passage, or create a global alias. Three other exact standalone labels were already paired and remain unchanged.
      Earlier Cloudcrest Mountain, Peak, and Passage decisions remain intact. Their entity identities and all previously terminal source rows were not reopened or recounted.
      Indexed matches: #{index_rows.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{uncertain.length}, in #{uncertain.map { |row| M.key(row) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      The separate variant-consistency shortlist has #{variant_count} terms and is not exhaustive. D-21639 reconciled the all-resource heuristic refresh at 29,628 phrases versus the saved 29,604-phrase baseline; neither figure is a completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      - default: 5 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index_rows.length} rows; SHA-256 `#{index_hash}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      D-21639 all-resource refresh: `work/zh_cn/audit/proper-name-candidate-refresh-D21639-20261017.md`; evidence TSV: `work/zh_cn/audit/proper-name-candidate-refresh-D21639.tsv`.
      Residual source/index audit: PASS; #{residual_lines.join('; ')}.
      Data validation: #{data_validation.strip}
      Next: D-21642; continue bounded source-local discovery without reopening terminal decisions or inferring entity identity from an isolated label.
    TEXT

    report_rows = rows.map do |row|
      "| `default:#{row['ID_Linha']}` | `#{row['english']}` | `#{row['old']}` | `#{row['new']}` |"
    end.join("\n")
    report = <<~TEXT
      # D-#{D}: Cloudcrest Source-Label Consistency

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed the five exact, standalone `Cloudcrest` labels that lacked
      English pairing. English controls the exact source form; Japanese
      `クラウドクレスト` and Chinese `云顶` corroborate the aligned label.
      The three already paired rows at default:21014, 46364, and 55334 were
      checked and retained.

      | Key | English | Korean old | Korean new |
      | --- | --- | --- | --- |
      #{report_rows}

      This source-label-only decision does not determine whether any isolated
      label denotes Cloudcrest Mountain, Cloudcrest Peak, or Cloudcrest
      Passage. It creates no entity, occurrence disposition, or global alias.
      D-21134 and D-21138 distinctions and all terminal decisions remain
      unchanged. The official Korean manual files contain no direct
      `Cloudcrest` entry.

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence index, candidate shortlist, and non-target CSV bytes remained unchanged.
      - #{residual_lines.join("\n- ")}
      - #{data_validation.strip}

      No PAK or PAK-derived data was consulted. Full proper-name discovery
      remains incomplete.
    TEXT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      Five default `Texto` cells received the exact English source-label
      annotation `Cloudcrest`. No affix/base cells, glossary entries,
      occurrence records, identities, aliases, or historical tallies changed.

      Pre-edit byte-identical backup:
      `#{checks.first.fetch(:backup)}`

      #{verification.strip}

      The already paired labels and all prior Cloudcrest entity decisions
      remain unchanged. See the D-#{D} review and manifest for aligned
      locale evidence and row-level values.
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Cloudcrest Source-Label Consistency"
    raise 'decision-register section already exists' if register.include?(heading)
    register << <<~REGISTER

      #{heading}

      Five exact standalone `Cloudcrest` labels without English pairing were
      annotated at default:37607, 39417, 42369, 44597, and 48012. Japanese
      `クラウドクレスト` and Chinese `云顶` corroborate the English label.
      These are row-local source-label annotations only: no entity category,
      identity, alias, glossary entry, or occurrence disposition was added.
      The already paired exact labels at default:21014, 46364, and 55334
      remain unchanged.

      Preserve D-21134 Cloudcrest Mountain and D-21138 Cloudcrest Peak /
      Passage as distinct registered entities. The five short labels are not
      assigned to any of them; no global `Cloudcrest` alias is inferred.
      Earlier terminal decisions and historical tallies were not reopened or
      recounted. Full proper-name discovery remains incomplete.
    REGISTER

    File.write(report_path, report + "\n")
    File.write(addendum_path, addendum + "\n")
    File.write(register_path, register)
    documents.each do |path, text|
      raise "missing checkpoint in #{path}" unless text.match?(marker)
      text.sub!(marker, "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n")
      File.write(path, text)
    end
    puts "D-#{D}: five source-label edits; entity/index/glossary dispositions unchanged.\n#{verification}\n#{data_validation}\n#{residual}"
  end
end

CloudcrestSourceLabelsD21641.run if $PROGRAM_NAME == __FILE__
