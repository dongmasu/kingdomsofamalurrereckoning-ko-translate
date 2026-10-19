#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectBloodRiteLabelD21690
  extend self

  M = ReviewedNameBatches
  D = 21_690
  ENTITY = 'event:blood-rite'
  KEY = ['default', '40632', ''].freeze
  OLD = '피의 의식을 위하여!'
  NEW = '피의 의식(Blood Rite)을 위하여!'
  ENGLISH = 'For the Blood rite!'
  JAPANESE = '"血の儀式"のために！'
  CHINESE = '为了血祭！'
  NOTE = 'Focused corrective follow-up to D-21689: its default:40632 occurrence was marked not-an-issue without adding the missing English annotation. English identifies the named Red Legion rite; Japanese 血の儀式 and Chinese 血祭 corroborate. Add only (Blood Rite), preserve the prior terminal index status/evidence, and do not recount.'

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = docs.values.first[marker]
    raise 'D-21689 checkpoint is not current' unless prior&.include?('Latest verified proper-name batch: D-21689 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior }

    report_name = "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    manifest_name = "proper-name-edits-D#{D}.tsv"
    paths = [File.join(__dir__, report_name), File.join(__dir__, addendum_name),
             File.join(__dir__, manifest_name)]
    raise "D-#{D} correction artifacts already exist" if paths.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'Blood Rite English source differs' unless english == ENGLISH
    raise 'Blood Rite Japanese source differs' unless japanese == JAPANESE
    raise 'Blood Rite Chinese source differs' unless source.fetch('zh_text') == CHINESE
    raise 'active Korean cell is neither expected old nor corrected text' unless
      [OLD, NEW].include?(source.fetch('work_text'))

    index = M.table(M::INDEX)
    matches = index.select do |row|
      row.fetch('entity_key') == ENTITY && M.key(row) == KEY
    end
    raise "expected one indexed Blood Rite occurrence, found #{matches.length}" unless matches.length == 1
    indexed = matches.first.to_h
    raise 'D-21689 terminal status/evidence differs' unless
      indexed.fetch('status') == 'not-an-issue' &&
      indexed.fetch('evidence').start_with?('D-21689:')

    review = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'accepted',
      'old' => OLD, 'new' => NEW, 'evidence' => NOTE,
      'english' => english, 'japanese' => japanese, 'chinese' => CHINESE,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => JSON.generate(ENTITY => indexed.fetch('status')),
      'previous_evidence' => JSON.generate(ENTITY => indexed.fetch('evidence'))
    }
    manifest = File.join(__dir__, manifest_name)
    M.write_table(manifest, M::HEADERS, [review])

    before_hashes = M.hashes
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    if source.fetch('work_text') == OLD
      checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup_dir, before_hashes)
      verification = M.command!(
        'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
        '--review', manifest, '--backup-dir', backup_dir
      )
    else
      backup_file = File.join(backup_dir, 'locatexts_zh_cn.koalocatext_default.csv')
      raise 'resumed correction has no original byte backup' unless File.file?(backup_file)
      original = ProperNameCellEditor.parse(File.binread(backup_file))
      original_row = original.find do |row|
        row.fetch('ID_Linha') == KEY[1] && row['Tipo_Variante'].to_s == KEY[2]
      end
      raise 'correction backup does not contain the old source cell' unless
        original_row && original_row.fetch('Texto') == OLD
      verification = M.command!(
        'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
        '--review', manifest, '--backup-dir', backup_dir
      )
      checks = [{
        resource: 'default', cells: 1, rows: original.length,
        before_sha256: Digest::SHA256.file(backup_file).hexdigest,
        after_sha256: before_hashes.fetch('default'), backup: backup_file,
        validation: 'resumed from applied edit; independent inverse verification PASS'
      }]
    end

    inventory = M.refresh_inventory
    raise 'Blood Rite correction did not persist' unless inventory.fetch(KEY).fetch('work_text') == NEW
    index = M.table(M::INDEX)
    row = index.find { |candidate| candidate.fetch('entity_key') == ENTITY && M.key(candidate) == KEY }
    raise 'Blood Rite occurrence disappeared during correction' unless row
    raise 'prior terminal status/evidence changed' unless
      row.fetch('status') == indexed.fetch('status') &&
      row.fetch('evidence') == indexed.fetch('evidence')
    other_rows = index.select { |candidate| M.key(candidate) == KEY }
    other_rows.each { |candidate| candidate['korean_current'] = NEW }
    M.write_table(M::INDEX, index.headers, index.map(&:to_h))

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise "final residual bilingual audit failed:\n#{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    hashes = M.hashes
    edit = checks.fetch(0)
    raise 'active default hash differs from verified edit' unless
      hashes.fetch('default') == edit.fetch(:after_sha256)
    integrity = "- default: 1 cell; pre `#{edit.fetch(:before_sha256)}`; post `#{edit.fetch(:after_sha256)}`; backup `#{edit.fetch(:backup)}`."
    retained = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'previous backup record missing' unless retained
    retained_lines = retained.lines.reject { |line| line.start_with?('- default:') }
    retained_lines << integrity
    counts = index.group_by { |entry| entry['status'] }.transform_values(&:length)
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    hashes_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    block = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Corrected one missed bilingual label at default:40632, adding `(Blood Rite)` to the already translated `피의 의식`. The D-21689 indexed `not-an-issue` status/evidence is preserved; indexed counts are unchanged and not recounted.
      Next batch: D-#{D + 1}; continue all-resource candidate review and residual checks.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{index.count { |entry| entry['status'] == 'uncertain' }}. These bounded index counts do not measure the discovery remainder.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes_text}
      Last batch pre-edit backup and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained_lines.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Corrective source manifest: `work/zh_cn/audit/#{manifest_name}`.
    TEXT

    File.write(File.join(__dir__, report_name), <<~TEXT)
      # D-#{D}: Corrective Blood Rite Bilingual Label

      ## Scope

      #{block}

      ## Evidence

      #{NOTE}
      The English imperative `For the Blood rite!` refers to the same named
      Red Legion ceremony as the other D-21689 rows. Korean `피의 의식` was
      semantically correct but lacked the required English pairing. Only the
      source-supported name span was changed; the particle and exclamation
      mark remain intact.

      D-21689's report said seven Blood Rite variants were standardized and
      treated all eight `not-an-issue` rows as adequate. The batch actually
      changed eight rows; default:40632 was the overlooked ninth unpaired
      label state (two other rows already had the full pair). This correction
      fixes the missed annotation and clarifies the earlier report without
      reopening or recasting its terminal index decision.
    TEXT

    File.write(File.join(__dir__, addendum_name), <<~TEXT)
      # D-#{D} Edit Addendum

      One default `Texto` cell changed. Backup: `#{edit.fetch(:backup)}`.
      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backup, BOM, mixed line endings, ordered rows,
      target cell, unchanged non-target bytes, and inverse reconstruction.

      #{block}

      This follow-up also corrects D-21689's summary: eight Blood Rite rows
      were edited, while default:40632 remained missing its English label
      despite its `not-an-issue` disposition. D-#{D} fixes that cell without
      changing the preserved index status/evidence.
    TEXT

    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: Corrective Blood Rite Label Pairing\n\nD-21689 marked default:40632 `not-an-issue`, but independent residual validation found that `피의 의식` lacked the required English annotation for `For the Blood rite!`. D-#{D} changes only the cell to `피의 의식(Blood Rite)을 위하여!` using aligned English/Japanese/Chinese evidence. The existing occurrence-index status/evidence and counts remain unchanged. D-21689's summary is clarified: eight rows were edited; default:40632 was the overlooked ninth unpaired state, with two other rows already paired. No historical global tally was recomputed.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: Blood Rite Follow-Up\n\nThe residual bilingual audit found one missed English label at default:40632 after D-21689. The Korean meaning was correct; D-#{D} added `(Blood Rite)` and preserved the earlier terminal index status/evidence. The independent data and residual audits now pass.\n"
      end
      File.write(path, text)
    end

    %w[named-scope-review-D21689-20261018.md named-scope-edit-addendum-D21689-20261018.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') do |file|
        file.write("\n\n## D-#{D} Follow-Up Correction\n\nDefault:40632 was counted among D-21689's eight `not-an-issue` rows but was not fully annotated. D-#{D} added `(Blood Rite)`; the prior index status/evidence is retained. The D-21689 report's edit count is clarified: eight rows changed, and only seven of its eight not-an-issue rows were already adequately bilingual.\n")
      end
    end
    puts "D-#{D}: corrected default:40632; prior terminal decision preserved; #{validation.strip}; final residual audit PASS."
  end
end

CorrectBloodRiteLabelD21690.run if $PROGRAM_NAME == __FILE__
