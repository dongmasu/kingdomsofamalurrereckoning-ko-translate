#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module YsaSourceLabelsD21651
  extend self

  M = ReviewedNameBatches
  D = 21_651
  INDEX = M::INDEX
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")

  TARGETS = {
    ['default', '5300', ''] => {
      english: 'Presenting the Master Mystic, wise Daughter of Ysa!',
      japanese: '賢きイーサの娘、"神秘を極めし者"を紹介します！',
      chinese: '介绍，神秘大师，智慧的伊萨之女！',
      old: '이사의 지혜로운 딸, 신비학의 대가를 소개합니다!',
      new: '이사(Ysa)의 지혜로운 딸, 신비학의 대가를 소개합니다!'
    },
    ['default', '64930', ''] => {
      english: 'I was once a grand knight in the clan of Ysa, but misfortune befell me when I believed the lies of the witch. She lured me, wooed me, honored me, promised me power.',
      japanese: 'かつてはイーサの一族の偉大な騎士だったが、魔女の嘘を信じたために不幸が降り掛かった。彼女は誘惑し、求め、褒め称えた。そして力を与えると約束した',
      chinese: '我曾是伊萨一族的伟大骑士，可当我相信女巫的谎言时，厄运降临我身。她诱惑我，向我求爱，许我以荣耀和力量。',
      old: '나는 한때 이사 일족의 위대한 기사였지만 마녀의 거짓말을 믿고 불행에 빠졌어. 그녀는 나를 유혹하고, 사랑을 속삭이고, 치켜세우며 힘을 약속했지.',
      new: '나는 한때 이사(Ysa) 일족의 위대한 기사였지만 마녀의 거짓말을 믿고 불행에 빠졌어. 그녀는 나를 유혹하고, 사랑을 속삭이고, 치켜세우며 힘을 약속했지.'
    }
  }.freeze

  def key(row)
    M.key(row)
  end

  def reviews(inventory)
    TARGETS.map do |source_key, spec|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      current = source.fetch('work_text')
      raise "English changed at #{source_key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese changed at #{source_key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese changed at #{source_key.inspect}" unless source.fetch('zh_text') == spec.fetch(:chinese)
      raise "Korean changed at #{source_key.inspect}" unless
        [spec.fetch(:old), spec.fetch(:new)].include?(current)

      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => 'source-label:ysa',
        'status' => 'accepted',
        'old' => spec.fetch(:old),
        'new' => spec.fetch(:new),
        'evidence' => 'Source-local bilingual annotation only. English names Ysa; aligned Japanese and Chinese corroborate the same source span. This does not decide whether the honorific/clan refers to the city, a historical person, or an affiliated group. Preserve the existing uncertain place:ysa disposition and evidence at this key; do not add a glossary entity, occurrence, alias, or global tally.',
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end
  end

  def validate_holds!(index)
    TARGETS.each_key do |source_key|
      rows = index.select { |row| key(row) == source_key && row['entity_key'] == 'place:ysa' }
      raise "expected one existing place:ysa hold at #{source_key.inspect}" unless rows.length == 1
      raise "place:ysa disposition changed at #{source_key.inspect}" unless rows.first['status'] == 'uncertain'
    end
  end

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    previous_block = docs.values.first[marker]
    raise 'latest checkpoint is not D-21650' unless previous_block&.include?('Latest verified proper-name batch: D-21650 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == previous_block }
    raise 'D-21651 report/addendum already exist' if [REPORT, ADDENDUM].any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    index_hash_before = Digest::SHA256.file(INDEX).hexdigest
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    index_table = M.table(INDEX)
    index = index_table.map(&:to_h)
    validate_holds!(index)
    rows = reviews(inventory)
    raise 'unexpected source-label scope' unless rows.map { |row| key(row) }.sort == TARGETS.keys.sort

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    backup_path = File.join(backup_dir, 'locatexts_zh_cn.koalocatext_default.csv')
    if File.exist?(MANIFEST)
      saved = M.table(MANIFEST).map(&:to_h)
      raise 'existing D-21651 manifest differs from reviewed scope' unless saved == rows
      raise 'resumed D-21651 CSV is only partially applied' unless rows.all? do |row|
        inventory.fetch(key(row)).fetch('work_text') == row.fetch('new')
      end
      raise 'resumed D-21651 backup is missing' unless File.file?(backup_path)
      backup_rows = ProperNameCellEditor.parse(File.binread(backup_path))
      rows.each do |row|
        original = backup_rows.find do |candidate|
          ProperNameCellEditor.key(candidate) == ProperNameCellEditor.key(row)
        end
        raise "backup old cell mismatch at #{key(row).inspect}" unless
          original && original['Texto'] == row.fetch('old')
      end
      checks = [{
        resource: 'default',
        cells: rows.length,
        rows: backup_rows.length,
        before_sha256: Digest::SHA256.file(backup_path).hexdigest,
        after_sha256: before_hashes.fetch('default'),
        backup: backup_path,
        validation: 'resumed after CSV edit; verified against original byte-identical backup'
      }]
    else
      raise 'D-21651 CSV changed before manifest creation' unless rows.all? do |row|
        inventory.fetch(key(row)).fetch('work_text') == row.fetch('old')
      end
      M.write_table(MANIFEST, M::HEADERS, rows)
      checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    end
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    rows.each do |row|
      raise "post-edit mismatch at #{key(row).inspect}" unless
        inventory.fetch(key(row)).fetch('work_text') == row.fetch('new')
    end

    index_before = M.table(INDEX).map(&:to_h)
    index_semantics = lambda do |records|
      records.map { |record| record.reject { |field, _value| field == 'korean_current' } }
    end
    rows.each do |review|
      snapshot = index_table.find do |record|
        key(record) == key(review) && record['entity_key'] == 'place:ysa'
      end
      raise "place:ysa hold disappeared at #{key(review).inspect}" unless snapshot
      snapshot['korean_current'] = review.fetch('new')
    end
    M.write_table(INDEX, index_table.headers, index_table.map(&:to_h))
    index = M.table(INDEX).map(&:to_h)
    validate_holds!(index)
    raise 'index disposition/evidence changed' unless
      index_semantics.call(index_before) == index_semantics.call(index)
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    raise 'proper-name glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'candidate shortlist changed' unless Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash
    after_hashes = M.hashes
    raise 'unexpected resource changed' unless
      %w[affix base].all? { |resource| before_hashes.fetch(resource) == after_hashes.fetch(resource) }

    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'index disposition/evidence changed during validation' unless
      index_semantics.call(index_before) == index_semantics.call(M.table(INDEX).map(&:to_h))

    index_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    held = index.select { |row| row['status'] == 'uncertain' }
    pending = index.select { |row| row['status'] == 'needs-context' }
    candidate_rows = M.table(CANDIDATES)
    candidate_counts = candidate_rows.group_by { |row| row['status'] }.transform_values(&:length)
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    prior_backups = previous_block[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior backup history missing' unless prior_backups
    retained = prior_backups.lines.reject { |line| line.start_with?('- default:') }
    retained << "- default: 2 cells; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"
    report_name = File.basename(REPORT)
    addendum_name = File.basename(ADDENDUM)
    hashes = after_hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed two source-local Ysa labels; both received bilingual English annotations. No entity type, identity, alias, glossary entry, occurrence disposition, or historical tally was added or changed.
      The place-versus-person/affiliation questions at default:5300 and default:64930 remain uncertain; this scope annotates only the exact source name and does not resolve those holds.
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidate_rows.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}` (only the two target `korean_current` snapshots were synchronized; dispositions and evidence are unchanged).
      Proper-name glossary: #{M.table(GLOSSARY).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Source-label manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
      Residual source/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Next: D-#{D + 1}; continue source discovery/residual checks without reopening prior holds absent new evidence.
    TEXT

    report_rows = rows.map do |row|
      "| `#{key(row).join(':')}` | `#{row['english']}` | `#{row['old']}` | `#{row['new']}` |"
    end.join("\n")
    report = <<~TEXT
      # D-#{D}: Source-Local Ysa Name Annotations

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      English names the exact source form `Ysa`; Japanese イーサ and Chinese
      伊萨 corroborate it. Add only the missing English parenthetical to the
      established Korean name. The referenced city/person/affiliation remains
      unresolved; no entity classification or relationship is inferred.

      | Key | English context | Korean old | Korean new |
      | --- | --- | --- | --- |
      #{report_rows}

      The existing `place:ysa` holds at these keys remain `uncertain` with
      their original evidence. The source-local annotation neither resolves
      nor recounts them. The already paired Ysa label at default:61515 and the
      complete bilingual source phrase at default:57728 were checked and left
      unchanged.

      ## Current Checkpoint

      #{summary}

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence index, candidate shortlist, and non-target resource bytes remained unchanged.
      - #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join("\n- ")}
      - #{validation.strip}

      Full proper-name discovery remains incomplete. No PAK or PAK-derived
      resource was consulted.
    TEXT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      Two default `Texto` cells received source-local `Ysa` annotations. The
      original `place:ysa` uncertain dispositions and evidence at both keys
      remain unchanged. The occurrence index's two matching `korean_current`
      snapshots were synchronized; no index disposition or evidence changed.

      #{summary}

      The byte-preserving editor and independent verifier checked BOM, mixed
      line endings, row count/order, exact target cells, non-target bytes, and
      inverse reconstruction against the byte-identical pre-edit backup.
    TEXT

    register_path = M::DOCS[3]
    register = File.read(register_path)
    heading = "## D-#{D}: Source-Local Ysa Name Annotations"
    raise 'D-21651 register entry already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      Added exact English source labels at `default:5300` and `default:64930`.
      English Ysa and the aligned Japanese/Chinese forms identify the same
      source-name span. The city-versus-person/affiliation questions remain
      uncertain; both existing `place:ysa` hold records and their evidence
      are unchanged. No entity, alias, glossary, occurrence, or global tally
      was added.
    TEXT
    File.write(register_path, register)
    File.write(REPORT, report + "\n")
    File.write(ADDENDUM, addendum + "\n")
    docs.each do |path, text|
      File.write(path, text.sub(marker, "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"))
    end
    puts "D-#{D}: two source-label edits; Ysa entity holds preserved.\n#{verification}\n#{validation}\n#{residual}"
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['prepare']
    inventory = ReviewedNameBatches.refresh_inventory
    rows = YsaSourceLabelsD21651.reviews(inventory)
    puts "D-21651: #{rows.length} Ysa source labels; #{rows.count { |row| row['old'] != row['new'] }} Texto edits."
    rows.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
  when ['apply']
    YsaSourceLabelsD21651.run
  else
    abort 'usage: review-ysa-source-labels-D21651.rb prepare|apply'
  end
end
