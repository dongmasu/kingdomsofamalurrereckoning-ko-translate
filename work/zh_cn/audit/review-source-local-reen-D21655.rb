#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module SourceLocalReenD21655
  extend self
  M = ReviewedNameBatches
  D = 21_655
  TARGET = ['default', '14868', ''].freeze
  ANCHORS = %w[4313 18023 52051].map { |id| ['default', id, ''] }.freeze
  ENGLISH = 'Savant Reen'
  JAPANESE = '一級魔道師リーン'
  CHINESE = '博学者里恩'
  OLD = '사반트 린'
  NEW = '사반트 린(Savant Reen)'
  NOTE = 'Source-local missing bilingual annotation only. English Savant Reen, Japanese 一級魔道師リーン and Chinese 博学者里恩 align. Reuse the identical English-label Korean at default:4313/18023/52051. Preserve all D-19507/D-19510 decisions and rank/name choices; anchors are not re-adjudicated or counted. No entity, alias, occurrence disposition or historical global tally is added.'

  def review(inventory)
    keys = inventory.select do |_key, row|
      JSON.parse(row.fetch('en_texts_json')).compact.uniq == [ENGLISH]
    end.keys.sort
    raise 'exact English-label scope changed' unless keys == [TARGET, *ANCHORS].sort
    [TARGET, *ANCHORS].each do |key|
      row = inventory.fetch(key)
      raise 'Japanese evidence changed' unless JSON.parse(row['ja_texts_json']).compact.uniq == [JAPANESE]
      raise 'Chinese evidence changed' unless row['zh_text'] == CHINESE
      expected = key == TARGET ? [OLD, NEW] : [NEW]
      raise "Korean evidence changed: #{key}" unless expected.include?(row['work_text'])
    end
    {
      'resource' => TARGET[0], 'ID_Linha' => TARGET[1], 'Tipo_Variante' => '',
      'entity_key' => 'source-label:savant-reen', 'status' => 'accepted',
      'old' => OLD, 'new' => NEW, 'evidence' => NOTE,
      'english' => ENGLISH, 'japanese' => JAPANESE, 'chinese' => CHINESE,
      'entity_dispositions_json' => '{}', 'previous_status' => '{}',
      'previous_evidence' => '{}'
    }
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    previous = documents.values.first[marker]
    raise 'resume checkpoint changed' unless previous&.include?('Latest verified proper-name batch: D-21654 ')
    raise 'checkpoint documents disagree' unless documents.values.all? { |text| text[marker] == previous }
    inventory = M.refresh_inventory
    row = review(inventory)
    raise 'target already indexed; focused owner review required' if
      M.table(M::INDEX).any? { |match| M.key(match) == TARGET }
    paths = %w[proper-name-glossary.tsv proper-name-occurrences.tsv proper-name-variant-discovery-candidates-20261015.tsv]
    preserved = paths.to_h { |name| [File.join(__dir__, name), Digest::SHA256.file(File.join(__dir__, name)).hexdigest] }
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'batch already exists' if File.exist?(manifest)
    raise 'target no longer contains reviewed old cell' unless inventory.fetch(TARGET)['work_text'] == OLD
    hashes = M.hashes
    M.write_table(manifest, M::HEADERS, [row])
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, hashes)
    verification = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                              '--review', manifest, '--backup-dir', backup_dir)
    inventory = M.refresh_inventory
    review(inventory)
    raise 'target edit missing' unless inventory.fetch(TARGET)['work_text'] == NEW
    active = M.hashes
    raise 'unrelated resource changed' unless %w[affix base].all? { |r| active[r] == hashes[r] }
    preserved.each { |path, hash| raise "#{path} changed" unless Digest::SHA256.file(path).hexdigest == hash }
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise 'residual audit incomplete' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'data validation failed' unless validation.include?('PASS')
    index = M.table(M::INDEX)
    counts = index.group_by { |r| r['status'] }.transform_values(&:length)
    held = index.select { |r| r['status'] == 'uncertain' }
    retained = previous[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'prior backup checkpoint missing' unless retained
    check = checks.fetch(0)
    backup_line = "- default: 1 cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    retained = retained.lines.reject { |line| line.start_with?('- default:') }.join + backup_line + "\n"
    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed one new source-local missing annotation at default:14868: 사반트 린 -> 사반트 린(Savant Reen).
      Default:4313/18023/52051 are unchanged consistency anchors, not new decisions. D-19507/D-19510 remain intact.
      No glossary entity, alias, occurrence disposition or historical global tally was added.
      Indexed matches: #{index.length}; #{counts.sort.map { |s, n| "#{s}=#{n}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index.count { |r| r['status'] == 'needs-context' }}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |r| M.key(r) }.uniq.length} distinct CSV row keys.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{active.map { |r, h| "- #{r}: `#{h}`." }.join("\n")}
      Last batch pre-edit backup and byte validation:
      #{backup_line}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}` (unchanged).
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{preserved.fetch(File.join(__dir__, 'proper-name-glossary.tsv'))}` (unchanged).
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Source-label manifest: `work/zh_cn/audit/#{File.basename(manifest)}`.
      Residual source/index audit and data validation: PASS.
      Next: D-#{D + 1}; continue all-resource source discovery; do not reopen reviewed holds without new evidence.
    TEXT
    File.write(File.join(__dir__, report_name), <<~TEXT)
      # D-#{D}: Savant Reen Source-Local Annotation

      #{NOTE}

      Exact EN/JA/ZH and old/new Korean cells are retained in the manifest.
      The official Korean manual extraction/reference has no direct Reen entry.
      No PAK or PAK-derived resource was consulted. Published ZIP unchanged.

      #{summary}
    TEXT
    File.write(File.join(__dir__, addendum_name), <<~TEXT)
      # D-#{D} Edit Addendum

      Only default:14868 Texto changed. BOM, mixed line-ending sequence,
      ordered row keys/count, target cell and all non-target bytes passed
      independent verification and inverse reconstruction against the backup.
      Glossary/index/candidate bytes and affix/base CSVs are unchanged.

      #{summary}
    TEXT
    documents.each do |path, text|
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text = text.sub(marker, block)
      text += "\n## D-#{D}: Savant Reen Source-Local Annotation\n\n#{NOTE}\n" if path == M::DOCS[3]
      File.write(path, text)
    end
    puts verification, validation, residual
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['prepare']
    puts JSON.generate(SourceLocalReenD21655.review(ReviewedNameBatches.refresh_inventory))
  when ['apply']
    SourceLocalReenD21655.run
  else
    abort 'usage: review-source-local-reen-D21655.rb prepare|apply'
  end
end
