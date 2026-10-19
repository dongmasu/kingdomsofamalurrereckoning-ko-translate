#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectTitleInclusiveProperNameLabelsD21692
  extend self

  M = ReviewedNameBatches
  D = 21_692
  CHANGES = {
    ['default', '39042', ''] => {
      entity: 'person:mandolph',
      english: 'Ambassador Mandolph',
      japanese: 'マンドルフ大使',
      chinese: '曼多尔夫大使',
      old: '맨돌프(Mandolph) 대사',
      new: '맨돌프 대사(Ambassador Mandolph)',
      status: 'accepted',
      evidence: 'English explicitly identifies Ambassador Mandolph; aligned Japanese マンドルフ大使 and Chinese 曼多尔夫大使 identify the same complete title/name. The existing Korean name pairing is already correct, but the title-inclusive label was split as 맨돌프(Mandolph) 대사 while the same source label at default:16250 is 맨돌프 대사(Ambassador Mandolph). Standardize only this displayed proper-name label. Preserve the existing person:mandolph accepted status/evidence and do not recount.'
    },
    ['base', '1114', '11'] => {
      entity: 'person:caledus',
      english: 'Archsage Caledus',
      japanese: '大賢者カルダス',
      chinese: '大贤者克雷多斯',
      old: '대현자 칼레두스(Caledus)',
      new: '대현자 칼레두스(Archsage Caledus)',
      status: 'not-an-issue',
      evidence: 'English explicitly labels Archsage Caledus; aligned Japanese 大賢者カルダス and Chinese 大贤者克雷多斯 confirm the rank/name compound. The person name is already correctly paired, but this standalone base label omits the English rank from its parentheses while base:3019 and default:23576 use the complete 대현자 칼레두스(Archsage Caledus). Standardize only this title-inclusive label. Preserve the existing person:caledus not-an-issue status/evidence and do not recount.'
    }
  }.freeze

  def run
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise "D-#{D} correction artifacts already exist" if
      [report, addendum, manifest].any? { |path| File.exist?(path) }

    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = docs.values.first[marker]
    raise 'D-21691 checkpoint is not current' unless
      prior&.include?('Latest verified proper-name batch: D-21691 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    reviews = CHANGES.map do |key, change|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "English source differs at #{key.inspect}" unless english == change.fetch(:english)
      raise "Japanese source differs at #{key.inspect}" unless japanese == change.fetch(:japanese)
      raise "Chinese source differs at #{key.inspect}" unless source.fetch('zh_text') == change.fetch(:chinese)
      raise "Korean source differs at #{key.inspect}" unless source.fetch('work_text') == change.fetch(:old)
      row = index.find do |entry|
        entry.fetch('entity_key') == change.fetch(:entity) &&
          M.key(entry) == key
      end
      raise "existing occurrence missing at #{key.inspect}" unless row
      raise "existing terminal status changed at #{key.inspect}" unless
        row.fetch('status') == change.fetch(:status)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => change.fetch(:entity), 'status' => 'accepted',
        'old' => change.fetch(:old), 'new' => change.fetch(:new),
        'evidence' => "D-#{D}: #{change.fetch(:evidence)}",
        'english' => english, 'japanese' => japanese, 'chinese' => change.fetch(:chinese),
        'entity_dispositions_json' => JSON.generate(change.fetch(:entity) => 'accepted'),
        'previous_status' => JSON.generate(change.fetch(:entity) => row.fetch('status')),
        'previous_evidence' => JSON.generate(change.fetch(:entity) => row.fetch('evidence'))
      }
    end
    raise 'duplicate source row keys in correction' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    M.write_table(manifest, M::HEADERS, reviews)

    before_hashes = M.hashes
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, before_hashes)
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    reviews.each do |review|
      raise "correction failed at #{M.key(review).inspect}" unless
        inventory.fetch(M.key(review)).fetch('work_text') == review.fetch('new')
    end

    # Keep all prior entity decisions intact while synchronizing the current cell snapshot.
    index = M.table(M::INDEX)
    reviews.each do |review|
      index.select { |entry| M.key(entry) == M.key(review) }.each do |entry|
        entry['korean_current'] = review.fetch('new')
      end
    end
    M.write_table(M::INDEX, index.headers, index.map(&:to_h))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise "final residual audit failed:\n#{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cell; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    retained = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'previous backup record missing' unless retained
    retained_lines = retained.lines.reject do |line|
      checks.any? { |check| line.start_with?("- #{check.fetch(:resource)}:") }
    end
    retained_lines.concat(integrity.lines)
    hashes_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    counts = index.group_by { |entry| entry.fetch('status') }.transform_values(&:length)
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Corrected two title-inclusive bilingual labels using aligned English/Japanese/Chinese and established same-scope forms: default:39042 `#{CHANGES[['default', '39042', '']][:old]}` -> `#{CHANGES[['default', '39042', '']][:new]}`; base:1114:11 `#{CHANGES[['base', '1114', '11']][:old]}` -> `#{CHANGES[['base', '1114', '11']][:new]}`. Existing occurrence-index statuses/evidence are preserved; no new key or cumulative count is added.
      Next batch: D-#{D + 1}; continue remaining short-label candidate groups and residual discovery from `proper-name-short-label-discovery-D21689.tsv`, resolving one scoped group at a time.
      Indexed matches: #{index.length}; #{counts_text}. Unreviewed indexed matches: 0; reviewed uncertain holds: #{index.count { |entry| entry['status'] == 'uncertain' }}. These counts do not measure discovery remaining.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes_text}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained_lines.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT
    File.write(report, "# D-#{D}: Title-Inclusive Proper-Name Label Corrections\n\n#{block}\n\n## Evidence\n\n#{reviews.map { |row| "- #{row.fetch('resource')}:#{row.fetch('ID_Linha')}: #{row.fetch('evidence')}" }.join("\n")}\n")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{block}\n\nThe byte-preserving editor and independent verifier checked the target cells, ordered rows, BOM, mixed line endings, unchanged non-target bytes, byte-identical pre-edit backups, and inverse reconstruction.\n")

    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n\n## D-#{D}: Title-Inclusive Name Display Follow-Up\n\nD-#{D} adds the complete English labels to default:39042 (`Ambassador Mandolph`) and base:1114:11 (`Archsage Caledus`) to match established same-scope forms. The underlying person occurrence statuses and historical evidence are preserved; no occurrence key or cumulative total is added.\n"
      elsif path.end_with?('README.md')
        text << "\n\n## D-#{D}: Title-Inclusive Name Display Follow-Up\n\nTwo source labels had the Korean name paired but omitted the English title from parentheses. English-led review with aligned Japanese and Chinese standardized default:39042 and base:1114:11; prior person dispositions and index counts remain unchanged. See the D-#{D} report and edit addendum.\n"
      end
      File.write(path, text)
    end
    puts "D-#{D}: corrected 2 title-inclusive labels; prior statuses preserved; data and residual audits PASS."
  end
end

CorrectTitleInclusiveProperNameLabelsD21692.run if $PROGRAM_NAME == __FILE__
