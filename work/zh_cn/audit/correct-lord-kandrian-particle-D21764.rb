#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectLordKandrianParticleD21764
  extend self

  M = ReviewedNameBatches
  D = 21_764
  KEY = ['default', '54366', ''].freeze
  OLD = '불쌍한 칸드리안 경(Lord Kandrian)이 잠든 채 세상을 떠나셨어. 참 안된 일이야. 그래, 에리온 레이다른(Erion Rheidarn)이 새 칸드리안 경(Lord Kandrian)가 됐다는 소식은 반갑겠지.'.freeze
  NEW = '불쌍한 칸드리안 경(Lord Kandrian)이 잠든 채 세상을 떠나셨어. 참 안된 일이야. 그래, 에리온 레이다른(Erion Rheidarn)이 새 칸드리안 경(Lord Kandrian)이 됐다는 소식은 반갑겠지.'.freeze
  ENTITY = 'title:lord-kandrian'
  EVIDENCE = 'Corrective particle-only residual audit. The English sentence says Erion Rheidarn is the new Lord Kandrian; the Korean complement of 되다 takes 이 after 경, not 가 after the closing English parenthesis. Japanese カンドリアン卿 and Chinese 坎德利安领主 confirm the title but do not control Korean grammar. Change only the final particle. Preserve D-21763 identity/status/evidence and do not add or recount an occurrence.'

  def run
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise "D-#{D} reports already exist" if [report, addendum].any? { |path| File.exist?(path) }

    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21763 checkpoint is not current' unless prior&.include?('Latest verified proper-name batch: D-21763 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior }

    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    raise 'English source mismatch' unless JSON.parse(source.fetch('en_texts_json')).compact.join("\n") ==
      "Poor old Lord Kandrian passed away in his sleep, very sad. Yes. You'll be happy to hear that Erion Rheidarn is the new Lord Kandrian."
    raise 'Japanese source mismatch' unless JSON.parse(source.fetch('ja_texts_json')).compact.join("\n").include?('カンドリアン卿')
    raise 'Chinese source mismatch' unless source.fetch('zh_text').include?('坎德利安领主')
    active_text = source.fetch('work_text')
    raise 'Korean source mismatch' unless [OLD, NEW].include?(active_text)

    index = M.table(M::INDEX)
    occurrence = index.find { |row| row.fetch('entity_key') == ENTITY && M.key(row) == KEY }
    raise 'prior occurrence missing' unless occurrence
    previous_status = occurrence.fetch('status')
    previous_evidence = occurrence.fetch('evidence')
    raise 'prior accepted status changed' unless previous_status == 'accepted' &&
      previous_evidence.start_with?('D-21763:')

    edit = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'accepted', 'old' => OLD, 'new' => NEW,
      'evidence' => EVIDENCE,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => JSON.generate(ENTITY => previous_status),
      'previous_evidence' => JSON.generate(ENTITY => previous_evidence)
    }
    M.write_table(manifest, M::HEADERS, [edit])

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    backup_path = File.join(backup_dir, 'locatexts_zh_cn.koalocatext_default.csv')
    raise 'byte-identical correction backup missing' unless File.file?(backup_path)
    backup_hash = Digest::SHA256.file(backup_path).hexdigest
    checks = if active_text == OLD
               expected = M.hashes.merge('default' => backup_hash)
               ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, expected)
             else
               raise 'active correction does not match backup' unless
                 ProperNameCellEditor.parse(File.binread(backup_path)).find do |row|
                   row['ID_Linha'] == KEY[1] && row['Tipo_Variante'].to_s == KEY[2]
                 end['Texto'] == OLD
               [{
                 resource: 'default', cells: 1,
                 before_sha256: backup_hash,
                 after_sha256: Digest::SHA256.file(M.csv_path('default')).hexdigest,
                 backup: backup_path,
                 validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
               }]
             end
    verification = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                              '--review', manifest, '--backup-dir', backup_dir)
    inventory = M.refresh_inventory
    raise 'corrected active text mismatch' unless inventory.fetch(KEY).fetch('work_text') == NEW

    index = M.table(M::INDEX)
    matching_rows = index.select { |row| M.key(row) == KEY }
    raise 'no occurrence rows matched the corrected key' if matching_rows.empty?
    updated = matching_rows.find { |row| row.fetch('entity_key') == ENTITY }
    raise 'occurrence status/evidence changed' unless updated.fetch('status') == previous_status &&
      updated.fetch('evidence') == previous_evidence
    matching_rows.each { |row| row['korean_current'] = NEW }
    M.write_table(M::INDEX, index.headers, index)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise "data validation failed: #{validation}" unless validation.include?('PASS')
    raise "residual validation failed: #{residual}" unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    hashes = M.hashes
    statuses = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    prior_block = prior.lines.join
    retained = prior_block[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n<!--)/m, 1]
    raise 'retained backup list missing' unless retained
    backup_line = checks.map do |check|
      "- default: #{check.fetch(:cells)} cell; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    retained = retained.lines.reject { |line| line.start_with?('- default:') }.join.rstrip
    retained = [retained, backup_line].reject(&:empty?).join("\n")
    integrity = checks.map do |check|
      "- default: #{check.fetch(:cells)} cell; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    status_text = statuses.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    candidate = M.table(File.join(__dir__, 'proper-name-short-label-discovery-D21762.tsv'))
    first_candidate = candidate.first.fetch('english_candidate')
    hash_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Corrected one Korean particle in default:54366; the D-21763 `title:lord-kandrian` accepted disposition and evidence are unchanged. This is a text correction only: no key, entity, or cumulative decision count was added.
      Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D21762.tsv` (#{candidate.length} bounded groups; begins `#{first_candidate}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_text}.
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{statuses.fetch('uncertain', 0)}, in #{index.select { |row| row['status'] == 'uncertain' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These are focused entity/row index states, not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and does not establish an overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_text}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Data validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Corrective cell manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT

    File.write(report, "# D-#{D}: Lord Kandrian Particle Correction\n\n#{block}\n\n## Correction\n\n- `default:54366`: `경(Lord Kandrian)가 됐다는` -> `경(Lord Kandrian)이 됐다는`.\n- Prior occurrence status: `#{previous_status}`; prior evidence and tally retained exactly.\n\n## Evidence\n\n#{EVIDENCE}\n")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{block}\n\nThe byte-preserving editor and independent verifier checked the exact target cell, row ordering, BOM, mixed line endings, unchanged non-target bytes, byte-identical pre-edit backup, and inverse reconstruction.\n")

    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n\n## D-#{D}: Lord Kandrian Particle Correction\n\nCorrected the complement particle at default:54366 from `가` to `이` after `경(Lord Kandrian)`. The existing D-21763 accepted title disposition, evidence, and all counts remain unchanged.\n"
      elsif path.end_with?('README.md')
        text << "\n\n## D-#{D}: Lord Kandrian Particle Correction\n\nA particle-only correction at default:54366 changed `경(Lord Kandrian)가` to `경(Lord Kandrian)이`. The prior proper-name judgment and occurrence totals were preserved. See the D-#{D} review report and edit addendum.\n"
      end
      File.write(path, text)
    end
    puts "D-#{D}: corrected one particle; prior classification/count preserved; byte, data, and residual validation PASS."
  end
end

CorrectLordKandrianParticleD21764.run if $PROGRAM_NAME == __FILE__
