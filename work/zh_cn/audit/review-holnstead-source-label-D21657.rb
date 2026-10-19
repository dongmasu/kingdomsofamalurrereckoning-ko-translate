#!/usr/bin/env ruby
require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module HolnsteadSourceLabelD21657
  extend self
  M = ReviewedNameBatches
  D = 21_657
  TARGET = ['default', '39788', ''].freeze
  ENGLISH = 'Holnstead'
  JAPANESE = 'ホルンステッド'
  CHINESE = '霍恩斯泰德'
  OLD = '홀른스테드'
  NEW = '홀른스테드(Holnstead)'
  ANCHORS = {
    ['base', '4299', '11'] => ['Holnstead', '홀른스테드(Holnstead)'],
    ['base', '1957', '11'] => ['The Holnstead', '홀른스테드 (The Holnstead)']
  }.freeze
  NOTE = 'Source-local name annotation only. English default:39788 is exactly Holnstead; Japanese ホルンステッド and Chinese 霍恩斯泰德 support the same displayed name. The exact base:4299 label already pairs 홀른스테드(Holnstead), and base:1957 pairs The Holnstead. Add only the missing English parenthetical. Do not infer whether this is a place, building, person, or other entity; do not add glossary/index ownership or global totals.'

  def review(inventory)
    exact = inventory.each_with_object([]) do |(key, row), keys|
      keys << key if JSON.parse(row.fetch('en_texts_json')).compact.uniq == [ENGLISH]
    end.sort
    expected = [TARGET, ['base', '4299', '11']].sort
    raise "exact label scope changed: #{exact.inspect}" unless exact == expected
    row = inventory.fetch(TARGET)
    raise 'target Japanese changed' unless JSON.parse(row['ja_texts_json']).compact.uniq == [JAPANESE]
    raise 'target Chinese changed' unless row['zh_text'] == CHINESE
    raise 'target Korean changed' unless [OLD, NEW].include?(row['work_text'])
    ANCHORS.each do |key, (english, korean)|
      source = inventory.fetch(key)
      raise "anchor English changed: #{key}" unless JSON.parse(source['en_texts_json']).compact.uniq == [english]
      raise "anchor Korean changed: #{key}" unless source['work_text'] == korean
      raise "anchor Japanese changed: #{key}" unless JSON.parse(source['ja_texts_json']).compact.uniq == [JAPANESE]
      raise "anchor Chinese changed: #{key}" unless source['zh_text'] == '霍恩家园'
    end
    true
  end

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    old_block = docs.values.first[marker]
    raise 'expected D-21656 checkpoint' unless old_block&.include?('Latest verified proper-name batch: D-21656 ')
    raise 'checkpoint copies disagree' unless docs.values.all? { |text| text[marker] == old_block }
    inventory = M.refresh_inventory
    review(inventory)
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    raise 'target has existing occurrence ownership' if
      M.table(M::INDEX).any? { |r| M.key(r) == TARGET }
    raise 'Holnstead glossary ownership appeared' if
      M.table(glossary_path).any? { |r| ([r['english_canonical']] + r['english_aliases'].to_s.split('|')).compact.any? { |s| s.casecmp?(ENGLISH) } }
    raise 'batch manifest already exists' if File.exist?(File.join(__dir__, "proper-name-edits-D#{D}.tsv"))
    raise 'target text changed before edit' unless inventory.fetch(TARGET)['work_text'] == OLD
    hashes = M.hashes
    review_row = {
      'resource' => 'default', 'ID_Linha' => '39788', 'Tipo_Variante' => '',
      'entity_key' => 'source-label:holnstead', 'status' => 'accepted',
      'old' => OLD, 'new' => NEW, 'evidence' => NOTE,
      'english' => ENGLISH, 'japanese' => JAPANESE, 'chinese' => CHINESE,
      'entity_dispositions_json' => '{}', 'previous_status' => '{}',
      'previous_evidence' => '{}'
    }
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    M.write_table(manifest, M::HEADERS, [review_row])
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, hashes)
    verification = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                              '--review', manifest, '--backup-dir', backup_dir)
    inventory = M.refresh_inventory
    review(inventory)
    raise 'target edit missing' unless inventory.fetch(TARGET)['work_text'] == NEW
    active = M.hashes
    raise 'unrelated resource changed' unless %w[affix base].all? { |r| active[r] == hashes[r] }
    raise 'glossary changed' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash
    raise 'index changed' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise 'residual audit failed' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    index = M.table(M::INDEX)
    counts = index.group_by { |r| r['status'] }.transform_values(&:length)
    held = index.select { |r| r['status'] == 'uncertain' }
    backup = checks.fetch(0)
    prior_backups = old_block[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'prior backup list missing' unless prior_backups
    prior_backups = prior_backups.lines.reject { |line| line.start_with?('- default:') }.join
    backup_line = "- default: 1 cell; pre `#{backup[:before_sha256]}`; post `#{backup[:after_sha256]}`; backup `#{backup[:backup]}`."
    prior_backups << backup_line << "\n"
    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed one source-local missing annotation at default:39788: 홀른스테드 -> 홀른스테드(Holnstead).
      Exact English Holnstead, Japanese ホルンステッド and Chinese 霍恩斯泰德 align. base:4299 and base:1957 are unchanged consistency anchors, not separately adjudicated.
      No entity category, glossary entry, occurrence disposition, alias, or historical global tally was added.
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index.count { |r| r['status'] == 'needs-context' }}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |r| M.key(r) }.uniq.length} distinct CSV row keys.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{active.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backup and byte validation:
      #{backup_line}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{prior_backups.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}` (unchanged).
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      Residual audit and proper-name data validation: PASS.
      Next: D-#{D + 1}; continue source discovery; preserve unclassified-name holds unless new evidence resolves them.
    TEXT
    File.write(File.join(__dir__, report_name), <<~TEXT)
      # D-#{D}: Holnstead Source-Local Annotation

      #{NOTE}

      Exact English/Japanese/Chinese and old/new Korean cells are retained
      in the manifest. No PAK or PAK-derived resource was consulted.

      #{summary}
    TEXT
    File.write(File.join(__dir__, addendum_name), <<~TEXT)
      # D-#{D} Edit Addendum

      Only default:39788 Texto changed. The byte-preserving editor verified
      BOM, mixed line endings, row count/order, exact target cell, unchanged
      non-target bytes, and inverse reconstruction against the byte-identical
      pre-edit backup. Index, glossary, affix, and base are unchanged.

      #{summary}
    TEXT
    docs.each do |path, text|
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text = text.sub(marker, block)
      text += "\n## D-#{D}: Holnstead Source-Local Annotation\n\n#{NOTE}\n" if path == M::DOCS[3]
      File.write(path, text)
    end
    puts verification, validation, residual
  end
end

HolnsteadSourceLabelD21657.run if $PROGRAM_NAME == __FILE__
