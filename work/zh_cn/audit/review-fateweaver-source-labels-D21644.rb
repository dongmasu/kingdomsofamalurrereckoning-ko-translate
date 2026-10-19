#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module FateweaverSourceLabelsD21644
  extend self
  M = ReviewedNameBatches
  D = 21_644
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  INDEX = File.join(__dir__, 'proper-name-occurrences.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')

  TARGETS = {
    ['default', '2677', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweaver)'
    },
    ['default', '6481', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweaver)'
    },
    ['default', '11605', ''] => {
      english: 'Fateweavers', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweavers)'
    },
    ['default', '25724', ''] => {
      english: 'Fateweavers', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버들', new: '페이트위버들(Fateweavers)'
    },
    ['default', '28832', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '운명술사', new: '페이트위버(Fateweaver)'
    },
    ['default', '37750', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweaver)'
    },
    ['default', '43495', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweaver)'
    },
    ['default', '47257', ''] => {
      english: 'Fateweaver', japanese: 'フェイトウィーバー', chinese: '织命者',
      old: '페이트위버', new: '페이트위버(Fateweaver)'
    }
  }.freeze

  ALREADY_PAIRED = {
    ['default', '4133', ''] => '페이트위버(Fateweaver)',
    ['default', '7635', ''] => '페이트위버(Fateweaver)',
    ['default', '11967', ''] => '페이트위버(Fateweaver)'
  }.freeze

  def texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.uniq.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.uniq.join("\n"),
      source.fetch('zh_text'),
      source.fetch('work_text')
    ]
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      english, japanese, chinese, current = texts(inventory.fetch(key))
      raise "English source changed at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless chinese == spec.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless current == spec.fetch(:old)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => 'source-label:fateweaver',
        'status' => 'accepted', 'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' =>
          'Exact standalone English source label only. The official Korean manual uses 페이트위버 for Fateweaver (PDF pp. 1, 3, 5); aligned Japanese フェイトウィーバー and Chinese 织命者 corroborate. Add the exact English label and normalize only the one inconsistent Korean rendering. This source-label annotation does not create or reopen a person, people, faction, title, or occurrence-index disposition.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => '{}', 'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end
  end

  def validate_scope!(inventory)
    expected = TARGETS.keys + ALREADY_PAIRED.keys
    %w[Fateweaver Fateweavers].each do |term|
      exact = inventory.select do |_key, source|
        JSON.parse(source.fetch('en_texts_json')).compact.uniq == [term]
      end.keys
      term_targets = TARGETS.select { |_key, spec| spec.fetch(:english) == term }.keys
      paired_targets = ALREADY_PAIRED.keys.select do |key|
        JSON.parse(inventory.fetch(key).fetch('en_texts_json')).compact.uniq == [term]
      end
      raise "unexpected exact #{term} scope: #{exact.inspect}" unless
        exact.sort == (term_targets + paired_targets).sort
    end

    ALREADY_PAIRED.each do |key, korean|
      english, japanese, chinese, current = texts(inventory.fetch(key))
      raise "already-paired source changed at #{key.inspect}" unless
        english == 'Fateweaver' && japanese == 'フェイトウィーバー' &&
        chinese == '织命者' && current == korean
    end
    true
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'unexpected current checkpoint' unless previous&.include?('Latest verified proper-name batch: D-21643 ')
    raise 'checkpoint documents differ' unless documents.values.all? { |text| text[marker] == previous }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    report_path = File.join(__dir__, report_name)
    addendum_path = File.join(__dir__, addendum_name)
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21644 output already exists' if [report_path, addendum_path, manifest].any? { |path| File.exist?(path) }

    active_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    validate_scope!(inventory)
    rows = reviews(inventory)
    raise 'unexpected D-21644 review scope' unless rows.length == 8

    target_keys = TARGETS.keys
    index_rows = M.table(INDEX)
    raise 'a source-label target already has indexed ownership' if
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
    retained << "- default: 8 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    glossary_count = M.table(GLOSSARY).length
    variant_count = M.table(CANDIDATES).length
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)

    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed eight exact standalone `Fateweaver`/`Fateweavers` source labels: six singular and two plural. All now use the official-manual Korean `페이트위버` form with their exact English source spelling; the inconsistent `운명술사` label was normalized. Three exact singular labels already paired at default:4133, 7635, and 11967 were verified and retained.
      This is row-local source-label annotation only. Existing historical judgments, including default:37750 and default:43495, are not reopened or recounted; no person/faction identity, glossary entry, occurrence disposition, or global alias was added.
      Indexed matches: #{index_rows.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{uncertain.length}, in #{uncertain.map { |row| M.key(row) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      The separate variant-consistency shortlist has #{variant_count} terms and is not exhaustive. The all-resource heuristic scan remains a bounded discovery aid, not a completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      - default: 8 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
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
      Next: D-21645; continue all-resource single-label and unregistered-name discovery without reopening terminal decisions.
    TEXT

    report_rows = rows.map do |row|
      "| `default:#{row['ID_Linha']}` | `#{row['english']}` | `#{row['old']}` | `#{row['new']}` |"
    end.join("\n")
    report = <<~TEXT
      # D-#{D}: Fateweaver Source-Label Consistency

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed the eight exact standalone English labels that lacked an
      English annotation. The official Korean manual uses `페이트위버` for
      Fateweaver (PDF pages 1, 3, and 5); Japanese `フェイトウィーバー` and
      Chinese `织命者` corroborate. Preserve the source number: six rows are
      `Fateweaver`, and two are `Fateweavers`. The inconsistent Korean
      `운명술사` was normalized to the manual form.

      | Key | English | Korean old | Korean new |
      | --- | --- | --- | --- |
      #{report_rows}

      The exact singular labels at default:4133, 7635, and 11967 were already
      paired as `페이트위버(Fateweaver)` and remain unchanged. This adds only
      row-local source spelling; it does not classify the standalone labels
      as people, a race, a faction, or an order. Earlier decisions at
      default:37750 and default:43495 remain terminal and were not recounted.
      No glossary owner, occurrence-index record, global alias, or historical
      tally was added or changed. Existing Fateweaving decisions were not
      reopened.

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

      Eight default `Texto` cells received the exact English annotation for
      `Fateweaver`/`Fateweavers`; the one inconsistent Korean label was
      normalized to the official manual's `페이트위버`. Three already paired
      labels were retained.

      No glossary, occurrence index, prior disposition, or global tally was
      changed. The pre-edit byte-identical backup is
      `#{checks.first.fetch(:backup)}`.

      #{verification.strip}
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Fateweaver Source-Label Consistency"
    raise 'decision-register section already exists' if register.include?(heading)
    register << <<~REGISTER

      #{heading}

      Eight exact standalone source labels, six `Fateweaver` and two
      `Fateweavers`, were annotated at default:2677, 6481, 11605, 25724,
      28832, 37750, 43495, and 47257. The official Korean manual uses
      `페이트위버`; Japanese `フェイトウィーバー` and Chinese `织命者`
      corroborate. Three already paired exact singular labels remain intact.

      This row-local annotation does not add or reopen an entity identity,
      glossary entry, occurrence disposition, or global alias. Historical
      decisions at default:37750/43495 and the separate Fateweaving
      dispositions remain unchanged and are not recounted. Full discovery
      remains incomplete.
    REGISTER

    File.write(report_path, report + "\n")
    File.write(addendum_path, addendum + "\n")
    File.write(register_path, register)
    documents.each do |path, text|
      raise "missing checkpoint in #{path}" unless text.match?(marker)
      text.sub!(marker, "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n")
      File.write(path, text)
    end
    puts "D-#{D}: eight source-label edits; entity/index/glossary dispositions unchanged.\n#{verification}\n#{data_validation}\n#{residual}"
  end
end

FateweaverSourceLabelsD21644.run if $PROGRAM_NAME == __FILE__
