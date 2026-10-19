#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module SourceLabelResidualsD21640
  extend self
  M = ReviewedNameBatches
  D = 21_640
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  TARGETS = {
    ['default', '34611', ''] => {
      english: 'Cynric Pit', japanese: 'シンリック・ピット',
      chinese: '辛瑞克洞穴', old: '신릭 피트', new: '신릭 피트(Cynric Pit)',
      slug: 'cynric-pit',
      note: 'Pair only this exact source label. Do not merge it with Cynric Mine, Cynric Quarry, the Cynric family, or a person.'
    },
    ['default', '26209', ''] => {
      english: "Winter's Embrace", japanese: 'ウィンターエンブレイス',
      chinese: "冬之抱拥\uFEFF", old: '겨울의 포옹',
      new: "겨울의 포옹(Winter's Embrace)", slug: 'winters-embrace',
      note: 'Preserve the source apostrophe and keep this exact label separate from the concatenated WintersEmbrace source form.'
    },
    ['default', '39445', ''] => {
      english: 'WintersEmbrace', japanese: 'ウィンターエンブレイス',
      chinese: "冬之抱拥\uFEFF", old: '겨울의 포옹',
      new: '겨울의 포옹(WintersEmbrace)', slug: 'wintersembrace',
      note: "Preserve this exact concatenated source spelling; do not merge it with Winter's Embrace."
    },
    ['default', '44734', ''] => {
      english: 'Aftershock', japanese: 'アフターショック',
      chinese: '余震', old: '여진', new: '여진(Aftershock)',
      slug: 'aftershock',
      note: 'Retain the Korean meaning and add the exact source label; no skill or other entity category is inferred from the isolated label.'
    },
    ['default', '53849', ''] => {
      english: 'Upheaval', japanese: 'アップヒーブル',
      chinese: '剧变', old: '격변', new: '격변(Upheaval)',
      slug: 'upheaval',
      note: 'This is the isolated title-case source label. Ordinary lowercase upheaval in default:1085 and default:10183 is prose and remains untouched; no skill category is inferred.'
    }
  }.freeze
  EYRIE_HOLDS = {
    ['default', '5973', ''] => {
      english: 'Eyrie Peak', korean: '에어리 봉우리(Eyrie Peak)'
    },
    ['default', '58845', ''] => {
      english: 'Eryie Peak', korean: '에리예 봉우리'
    }
  }.freeze

  def source_matches(inventory, term)
    pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/
    inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.map { |source| M.key(source) }.uniq.sort
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      current = source.fetch('work_text')
      old = spec.fetch(:old)
      raise "English source changed at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless source.fetch('zh_text') == spec.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless
        [old, spec.fetch(:new)].include?(current)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => "source-label:#{spec.fetch(:slug)}",
        'status' => 'accepted', 'old' => old, 'new' => spec.fetch(:new),
        'evidence' => "Source-local bilingual label only. English is exact; Japanese and Chinese corroborate the aligned label. #{spec.fetch(:note)} No referent identity, global alias, glossary entity, occurrence registration, or historical tally is added.",
        'english' => english, 'japanese' => japanese, 'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}', 'previous_evidence' => '{}'
      }
    end
  end

  def ensure_outputs_absent!(report_name, addendum_name)
    paths = [
      File.join(__dir__, report_name),
      File.join(__dir__, addendum_name)
    ]
    raise "D-#{D} report/addendum already exists" if paths.any? { |path| File.exist?(path) }
  end

  def backup_dir_for_batch
    existing = Dir.glob("/private/tmp/ko-translate-backups/*/before-proper-name-D#{D}")
    raise 'multiple D-21640 backup directories found' if existing.length > 1
    existing.first ||
      "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
  end

  def validate_scope!(inventory)
    TARGETS.each_value do |spec|
      matches = source_matches(inventory, spec.fetch(:english))
      expected = TARGETS.select { |_key, candidate| candidate.equal?(spec) }.keys
      raise "unexpected exact-label scope for #{spec[:english]}: #{matches.inspect}" unless matches == expected
    end

    EYRIE_HOLDS.each do |key, spec|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "Eyrie hold source changed at #{key.inspect}" unless
        english == spec.fetch(:english) && source.fetch('work_text') == spec.fetch(:korean)
    end
    raise 'historical Eryie Peak hold is missing' unless
      File.read(File.join(__dir__, 'decision-register-20261009.md'))
        .include?('| D-17792 | `default` 58845 | Eryie Peak | Keep current translation. | uncertain |')
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'unexpected current checkpoint' unless previous&.include?('Latest verified proper-name batch: D-21639 ')
    raise 'checkpoint documents differ' unless documents.values.all? { |text| text[marker] == previous }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    ensure_outputs_absent!(report_name, addendum_name)
    active_hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    validate_scope!(inventory)
    rows = reviews(inventory)
    raise 'unexpected D-21640 manifest scope' unless
      rows.length == 5 && rows.map { |row| M.key(row) }.sort == TARGETS.keys.sort

    index = M.table(M::INDEX)
    raise 'D-21640 source labels already have indexed ownership' if
      index.any? { |row| TARGETS.key?(M.key(row)) }

    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    backup_dir = backup_dir_for_batch
    current_is_old = rows.all? do |row|
      inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('old')
    end
    current_is_new = rows.all? do |row|
      inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    existing_manifest = File.exist?(manifest)
    if existing_manifest
      saved_rows = M.table(manifest).map(&:to_h)
      raise 'existing D-21640 manifest differs from reviewed scope' unless saved_rows == rows
      raise 'D-21640 CSV is only partially applied' unless current_is_old || current_is_new
    else
      raise 'D-21640 CSV changed before manifest creation' unless current_is_old
      M.write_table(manifest, M::HEADERS, rows)
    end

    if current_is_old
      checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, active_hashes)
    else
      backup = File.join(backup_dir, 'locatexts_zh_cn.koalocatext_default.csv')
      raise 'completed D-21640 edit has no pre-edit backup' unless File.file?(backup)
      original = ProperNameCellEditor.parse(File.binread(backup))
      rows.each do |row|
        match = original.find do |candidate|
          ProperNameCellEditor.key(candidate) == ProperNameCellEditor.key(row)
        end
        raise "backup old cell mismatch at #{M.key(row).inspect}" unless
          match && match['Texto'] == row.fetch('old')
      end
      checks = [{
        resource: 'default', cells: rows.length, rows: original.length,
        before_sha256: Digest::SHA256.file(backup).hexdigest,
        after_sha256: active_hashes.fetch('default'), backup: backup,
        validation: 'resumed from already-applied, verified byte-identical backup'
      }]
    end
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
    post_hashes = M.hashes
    raise 'CSV hashes do not match editor results' unless checks.all? do |check|
      post_hashes.fetch(check[:resource]) == check[:after_sha256]
    end
    raise 'glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'occurrence index changed' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'candidate shortlist changed' unless Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash

    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless data_validation.include?('PASS')
    raise 'residual source/index audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    index_rows = index.map(&:to_h)
    index_counts = index_rows.group_by { |row| row['status'] }.transform_values(&:length)
    uncertain_rows = index_rows.select { |row| row['status'] == 'uncertain' }
    pending_rows = index_rows.select { |row| row['status'] == 'needs-context' }
    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    glossary_count = M.table(GLOSSARY).length
    variant_rows = M.table(CANDIDATES)
    variant_counts = variant_rows.group_by { |row| row['status'] }.transform_values(&:length)
    retained_backup_block = previous[
      /(?:Last actual CSV-edit backups \(retained across no-edit batches\)|No CSV edits in D-\d+; last actual CSV-edit backups are retained):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior per-resource CSV backup history missing' unless retained_backup_block
    retained_backup_lines = retained_backup_block.lines.reject { |line| line.start_with?('- default:') }
    retained_backup_lines << "- default: 5 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"

    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed five isolated source-label rows: five accepted Texto annotations; no entity category, identity, alias, glossary entry, or occurrence disposition was added. `Cynric Pit`, `Aftershock`, `Winter's Embrace`, `WintersEmbrace`, and the label `Upheaval` now carry their exact English source forms.
      `Warding Blast` was already covered by D-21622 and was not reopened. Ordinary lowercase `upheaval` at default:1085/10183 remains prose and unchanged. `Eyrie Peak` at default:5973 retains its existing complete bilingual label; `Eryie Peak` at default:58845 remains under the historical D-17792 uncertainty and was not reopened.
      Indexed matches: #{index_rows.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending_rows.length}, in #{pending_rows.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{uncertain_rows.length}, in #{uncertain_rows.map { |row| M.key(row) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      The separate variant-consistency shortlist has #{variant_rows.length} terms (registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}); it is not exhaustive. D-21639 reconciled the all-resource heuristic refresh at 29,628 phrases versus the saved 29,604-phrase baseline; neither figure is a completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained_backup_lines.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index_rows.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      D-21639 all-resource refresh: `work/zh_cn/audit/proper-name-candidate-refresh-D21639-20261017.md`; evidence TSV: `work/zh_cn/audit/proper-name-candidate-refresh-D21639.tsv`.
      Residual source/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/).map(&:strip).join('; ')}.
      Data validation: #{data_validation.strip}
      Next: D-21641; continue source-local discovery without reopening terminal decisions. Preserve the unresolved Eryie Peak scope and distinguish isolated labels from confirmed entity categories.
    TEXT

    report_rows = rows.map do |row|
      "| `#{M.key(row).join(':')}` | `#{row['english']}` | `#{row['status']}` | `#{row['old']}` | `#{row['new']}` |"
    end.join("\n")
    report = <<~TEXT
      # D-#{D}: Residual Source-Label Annotations

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Reviewed five exact, isolated English labels across the aligned
      affix/base/default source inventory. English controls the exact source
      spelling; Japanese and Chinese corroborate the labels. Add only the
      English annotation to the established Korean rendering. These are
      source-label decisions, not claims that each item is a skill, person,
      place, or other registered entity.

      | Key | English | Disposition | Korean old | Korean new |
      | --- | --- | --- | --- | --- |
      #{report_rows}

      `Cynric Pit` remains separate from Cynric Mine/Quarry, the Cynric
      family, and any individual. `Winter's Embrace` and `WintersEmbrace`
      preserve their distinct source spellings despite aligned Japanese,
      Chinese, and Korean renderings. Only the title-case isolated
      `Upheaval` label was paired; lowercase prose at default:1085/10183 was
      not edited.

      `Warding Blast` was already resolved in D-21622 and is not reopened.
      `Eyrie Peak` default:5973 already has its exact English annotation.
      `Eryie Peak` default:58845 remains unchanged under D-17792: whether
      `Peak` is within the proper name is unresolved. No equivalence between
      Eyrie Peak and Eryie Peak is inferred.

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence-index, candidate-shortlist and non-target CSV bytes remained unchanged.
      - #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join("\n- ")}
      - #{data_validation.strip}

      No PAK or PAK-derived data was consulted. Full proper-name
      discovery/residual validation remains incomplete.
    TEXT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      Five default `Texto` cells received exact English source-label
      annotations. No affix/base cells, glossary entries, occurrence records,
      entity identities, or historical tallies changed.

      Pre-edit byte-identical backup:
      `#{checks.first.fetch(:backup)}`

      #{verification.strip}

      The D-17792 Eryie Peak uncertainty and all previously terminal
      dispositions remain unchanged. See the D-#{D} review and exact source
      manifest for locale evidence and per-row notes.
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Residual Source-Label Annotations"
    raise 'D-21640 decision-register section already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      Five isolated source labels were paired with their exact English
      spellings at `default:34611`, `26209`, `39445`, `44734`, and `53849`.
      No entity category, identity, alias, glossary entry, or occurrence
      disposition was inferred or added.

      | Key | English label | Disposition |
      | --- | --- | --- |
      | `default:34611` | `Cynric Pit` | accepted, exact source-label pairing |
      | `default:26209` | `Winter's Embrace` | accepted, exact source-label pairing |
      | `default:39445` | `WintersEmbrace` | accepted, exact source-label pairing; spelling kept distinct |
      | `default:44734` | `Aftershock` | accepted, exact source-label pairing |
      | `default:53849` | `Upheaval` | accepted, isolated title-case label only |

      `Warding Blast` is already covered by D-21622. Lowercase prose
      `upheaval` at default:1085/10183 is unchanged. `Eyrie Peak` at
      default:5973 retains its existing bilingual label; `Eryie Peak` at
      default:58845 remains uncertain under D-17792 and was not reopened.
      Do not merge the two Peak labels or infer an entity type for these
      isolated labels. Full proper-name discovery remains incomplete.
    TEXT

    File.write(File.join(__dir__, report_name), report + "\n<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n")
    File.write(File.join(__dir__, addendum_name), addendum + "\n")
    File.write(register_path, register)
    documents.each do |path, text|
      raise "missing checkpoint in #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"))
    end
    puts "D-#{D}: five source-label edits; no entity/index/glossary disposition changes.\n#{verification}\n#{data_validation}\n#{residual}"
  end
end

SourceLabelResidualsD21640.run if $PROGRAM_NAME == __FILE__
