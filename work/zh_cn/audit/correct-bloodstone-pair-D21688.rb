#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectBloodstonePairD21688
  extend self
  M = ReviewedNameBatches
  D = 21_688
  ENTITY = 'unique_item:bloodstone'
  KEY = ['default', '20046', ''].freeze
  OLD = '더펠(Derfel)이 모아 달라고 한 물건 세 가지, 서클릿과 블러드스톤, 칸드리안의 장미를 모두 찾았다. 더펠(Derfel)에게 가져다주자.'
  NEW = '더펠(Derfel)이 모아 달라고 한 물건 세 가지, 서클릿과 블러드스톤(Bloodstone), 칸드리안의 장미를 모두 찾았다. 더펠(Derfel)에게 가져다주자.'
  ENGLISH = 'I have acquired the three items Derfel asked me to gather: the circlet, the Bloodstone, and the Rose of Kandrian. I should return to Derfel with the items.'
  JAPANESE = 'デルフェルに集めるよう頼まれた3個のアイテムを手に入れた。サークレット、ブラッドストーン、そしてカンドリアンのバラだ。デルフェルの元へ届けよう。'
  CHINESE = '我获得了德尔菲尔请求我收集的三样东西：金环、血石和坎德利安玫瑰。我应该带着这些物品回去找德尔菲尔。'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Focused corrective follow-up to D-21680: its default:20046 manifest row
    was classified not-an-issue even though the active Korean item name was
    unpaired. English names the Bloodstone among the acquired quest items;
    Japanese ブラッドストーン and Chinese 血石 corroborate the same item.
    Pair only that existing exact Korean span as 블러드스톤(Bloodstone).
    D-21680's prior indexed status/evidence and every other entity or phrase
    on the row remain unchanged; this correction is not a global tally or
    terminal-history recount.
  TEXT

  def review(source, indexed)
    raise 'Bloodstone entity/key mismatch' unless indexed.fetch('entity_key') == ENTITY &&
      M.key(indexed) == KEY
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English Bloodstone source differs' unless english == ENGLISH
    raise 'Japanese Bloodstone source differs' unless japanese == JAPANESE
    raise 'Chinese Bloodstone source differs' unless source.fetch('zh_text') == CHINESE
    old = source.fetch('work_text')
    raise 'active Korean cell is neither audited text nor corrected text' unless [OLD, NEW].include?(old)
    raise 'D-21680 terminal status changed' unless indexed.fetch('status') == 'not-an-issue'
    raise 'D-21680 terminal evidence changed' unless indexed.fetch('evidence').start_with?('D-21680:')
    current = source.fetch('work_text')
    raise 'active Korean cell is neither audited text nor corrected text' unless [OLD, NEW].include?(current)
    {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'accepted',
      'old' => OLD, 'new' => NEW, 'evidence' => NOTE,
      'english' => ENGLISH, 'japanese' => JAPANESE, 'chinese' => CHINESE,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => JSON.generate(ENTITY => indexed.fetch('status')),
      'previous_evidence' => JSON.generate(ENTITY => indexed.fetch('evidence'))
    }
  end

  def sync_occurrence_snapshots(index)
    rows = index.select { |row| M.key(row) == KEY }
    raise "expected three existing row occurrences, found #{rows.length}" unless rows.length == 3
    decisions = rows.map { |row| [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')] }
    rows.each { |row| row['korean_current'] = NEW }
    raise 'row snapshot sync modified entity decisions' unless
      decisions == rows.map { |row| [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')] }
    rows
  end

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = docs.values.first[marker]
    raise 'D-21687 checkpoint is not current' unless prior&.include?('Latest verified proper-name batch: D-21687 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior }
    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21688 report/addendum already exist' if [File.join(__dir__, report_name),
      File.join(__dir__, addendum_name)].any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    matches = index.select { |row| row['entity_key'] == ENTITY && M.key(row) == KEY }
    raise "expected exactly one existing Bloodstone occurrence, found #{matches.length}" unless matches.length == 1
    indexed = matches.first.to_h
    source = inventory.fetch(KEY)
    row = review(source, indexed)
    if File.exist?(manifest)
      saved = M.table(manifest).map(&:to_h)
      raise 'existing D-21688 manifest differs from reviewed correction' unless saved == [row]
    else
      M.write_table(manifest, M::HEADERS, [row])
    end

    backup = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = []
    if source.fetch('work_text') == OLD
      checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup, before_hashes)
      verification = M.command!(
        'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
        '--review', manifest, '--backup-dir', backup
      )
    else
      backup_file = File.join(backup, 'locatexts_zh_cn.koalocatext_default.csv')
      raise 'resumed correction has no pre-edit backup' unless File.file?(backup_file)
      original = ProperNameCellEditor.parse(File.binread(backup_file))
      original_row = original.find do |candidate|
        candidate.fetch('ID_Linha') == KEY[1] &&
          candidate['Tipo_Variante'].to_s == KEY[2]
      end
      raise 'resumed correction backup does not contain the reviewed old cell' unless
        original_row && original_row.fetch('Texto') == OLD
      verification = M.command!(
        'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
        '--review', manifest, '--backup-dir', backup
      )
      checks = [{
        resource: 'default', cells: 1, rows: original.length,
        before_sha256: Digest::SHA256.file(backup_file).hexdigest,
        after_sha256: before_hashes.fetch('default'), backup: backup_file,
        validation: 'resumed from applied edit; independent inverse verification PASS'
      }]
    end
    inventory = M.refresh_inventory
    raise 'Bloodstone corrected Korean cell did not persist' unless
      inventory.fetch(KEY).fetch('work_text') == NEW
    index = M.table(M::INDEX)
    siblings = sync_occurrence_snapshots(index)
    raise 'Bloodstone index occurrence changed or duplicated' unless
      siblings.any? { |entry| entry['entity_key'] == ENTITY }
    raise 'prior Bloodstone status/evidence was modified' unless
      siblings.find { |entry| entry['entity_key'] == ENTITY }.fetch('status') == indexed.fetch('status') &&
      siblings.find { |entry| entry['entity_key'] == ENTITY }.fetch('evidence') == indexed.fetch('evidence')
    M.write_table(M::INDEX, index.headers, index.map(&:to_h))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise "residual audit still reports an uncovered bilingual name:\n#{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    hashes = M.hashes
    check = checks.fetch(0)
    raise 'default CSV hash differs from editor result' unless hashes.fetch('default') == check.fetch(:after_sha256)
    integrity = "- default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    prior_backups = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'previous backup record missing' unless prior_backups
    backup_lines = prior_backups.lines.reject { |line| line.start_with?('- default:') }
    backup_lines << integrity
    index_counts = index.group_by { |entry| entry['status'] }.transform_values(&:length)
    counts_text = index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    unresolved = index.select { |entry| %w[needs-context uncertain].include?(entry['status']) }
    pending = index.select { |entry| entry['status'] == 'needs-context' }
    hashes_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Corrected one missed Bloodstone name annotation at default:20046; existing terminal index status/evidence remains `not-an-issue` from D-21680. Indexed counts are unchanged; this is not a recount.
      Next batch: D-21689; continue all-resource source discovery and residual checks.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: #{pending.length}; reviewed unresolved indexed holds: #{unresolved.count { |entry| entry['status'] == 'uncertain' }}. These bounded index counts do not measure the overall discovery remainder.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes_text}
      Last batch pre-edit backup and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{backup_lines.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
    TEXT
    report = <<~TEXT
      # D-#{D}: Corrective Bloodstone Bilingual Label

      ## Scope

      #{block}

      ## Evidence

      #{NOTE}
      English default:20046 lists the Bloodstone as one of three acquired items. Japanese and Chinese identify the same item; only the Korean name span lacked the English annotation. D-21680's manifest had recorded this row as `not-an-issue` and made no edit, a scope/fixture oversight. This correction changes only `블러드스톤` to `블러드스톤(Bloodstone)`. It retains D-21680's terminal status/evidence in the occurrence index and all other row text, names, particles, and prior dispositions.
    TEXT
    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      One default `Texto` cell changed. Backup: `#{check.fetch(:backup)}`.
      The byte-preserving editor and independent verifier checked the byte-identical pre-edit backup, BOM, mixed line endings, ordered rows, keys/variants, target cell, unchanged non-target bytes, and inverse reconstruction.

      #{block}
    TEXT
    File.write(File.join(__dir__, report_name), report)
    File.write(File.join(__dir__, addendum_name), addendum)
    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: Corrective Bloodstone Label Pairing\n\nThe D-21680 audit manifest had marked default:20046 `not-an-issue` without pairing its Bloodstone reference. D-#{D} corrects only `블러드스톤` to `블러드스톤(Bloodstone)` using the aligned English/Japanese/Chinese evidence. The existing index status and evidence remain unchanged; the byte-preserving edit and final residual bilingual audit passed. No historical tally was recomputed.\n"
      end
      File.write(path, text)
    end
    puts "D-#{D}: corrected default:20046; prior terminal decision preserved; #{validation.strip}; final residual audit PASS."
  end
end

CorrectBloodstonePairD21688.run if $PROGRAM_NAME == __FILE__
