#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module AesirDanninSourceLabelD21652
  extend self

  M = ReviewedNameBatches
  D = 21_652
  INDEX = M::INDEX
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv')
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  BACKUP_DIR = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
  BACKUP = File.join(BACKUP_DIR, 'locatexts_zh_cn.koalocatext_default.csv')
  TARGET = ['default', '15109', ''].freeze
  PARALLEL = ['default', '28077', ''].freeze
  ENGLISH = 'I have eaten the fruit of Irminsul, the Tree King, and sown blood into the fields of Aesir Dannin.'
  JAPANESE = '私は"樹木の王"アーミンスールの果実を食べ、イーシア・ダニンの野に血をまいた'
  CHINESE = '我吃过树王伊尔明苏尔的果实，并在埃西尔·丹宁的田地里撒过血。'
  OLD = '나는 나무의 왕 이르민술의 열매를 먹었고, 아이시르 다닌의 들판에 피를 뿌렸어.'
  NEW = '나는 나무의 왕 이르민술의 열매를 먹었고, 아이시르 다닌(Aesir Dannin)의 들판에 피를 뿌렸어.'
  PARALLEL_KOREAN = '나는 나무의 왕 이르민술(Irminsul)의 열매를 먹었고, 아이시르 다닌(Aesir Dannin)의 들판에 피를 뿌렸다.'

  def key(row)
    M.key(row)
  end

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.uniq.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.uniq.join("\n"),
      source.fetch('zh_text'),
      source.fetch('work_text')
    ]
  end

  def validate_scope!(inventory)
    exact = inventory.each_with_object([]) do |(source_key, source), keys|
      english = JSON.parse(source.fetch('en_texts_json')).compact.uniq
      keys << source_key if english == [ENGLISH]
    end.sort
    raise "unexpected exact source rows: #{exact.inspect}" unless exact == [TARGET, PARALLEL].sort

    english, japanese, chinese, korean = source_texts(inventory.fetch(TARGET))
    raise 'target English changed' unless english == ENGLISH
    raise 'target Japanese changed' unless japanese == JAPANESE
    raise 'target Chinese changed' unless chinese == CHINESE
    raise 'target Korean changed' unless [OLD, NEW].include?(korean)

    parallel = inventory.fetch(PARALLEL)
    raise 'parallel English changed' unless source_texts(parallel)[0] == ENGLISH
    raise 'parallel Japanese changed' unless source_texts(parallel)[1] == JAPANESE
    raise 'parallel Chinese changed' unless source_texts(parallel)[2] == CHINESE
    raise 'parallel Korean anchor changed' unless source_texts(parallel)[3] == PARALLEL_KOREAN
    true
  end

  def review(inventory)
    validate_scope!(inventory)
    {
      'resource' => TARGET[0],
      'ID_Linha' => TARGET[1],
      'Tipo_Variante' => TARGET[2],
      'entity_key' => 'source-label:aesir-dannin',
      'status' => 'accepted',
      'old' => OLD,
      'new' => NEW,
      'evidence' => 'Source-local bilingual name annotation only. English explicitly names Aesir Dannin; aligned Japanese イーシア・ダニン and Chinese 埃西尔·丹宁 corroborate the same name. The identical English sentence at default:28077 already has the complete Korean (English) annotation and provides a source-local consistency anchor. Pair only this missing name span; do not infer a person, place, people, or other entity category. Preserve D-4598 translation uncertainty at default:15109 and D-19424 not-an-issue at default:28077; do not add a glossary entity, occurrence disposition, alias, or historical tally.',
      'english' => ENGLISH,
      'japanese' => JAPANESE,
      'chinese' => CHINESE,
      'entity_dispositions_json' => '{}',
      'previous_status' => '{}',
      'previous_evidence' => '{}'
    }
  end

  def checkpoint_block(documents)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    previous = documents.values.first[marker]
    raise 'latest checkpoint is not D-21651' unless
      previous&.include?('Latest verified proper-name batch: D-21651 ')
    raise 'checkpoint documents differ' unless documents.values.all? { |text| text[marker] == previous }
    [marker, previous]
  end

  def run
    documents = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker, previous = checkpoint_block(documents)
    register = File.read(M::DOCS[3])
    raise 'D-4598 uncertainty history changed' unless
      register.include?('| D-4598 | `default` 15109 | Irminsul / Tree King / Aesir Dannin | unchanged | uncertain |')
    raise 'D-19424 parallel-row closure missing' unless
      register.include?('| D-19424 | `default` 28055, 28057, 28059, 28062, 28066, 28070, 28074-28077, 28079-28081, 28088, 28090, 28096, 28098 | not an issue |')

    before_hashes = M.hashes
    index_hash = Digest::SHA256.file(INDEX).hexdigest
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    candidates_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory = M.refresh_inventory
    rows = [review(inventory)]
    index_before = M.table(INDEX).map(&:to_h)
    raise 'target already has an occurrence-index disposition' if
      index_before.any? { |row| key(row) == TARGET }
    raise 'parallel anchor has an occurrence-index disposition' if
      index_before.any? { |row| key(row) == PARALLEL }

    if File.exist?(MANIFEST)
      saved = M.table(MANIFEST).map(&:to_h)
      raise 'existing D-21652 manifest differs from reviewed scope' unless saved == rows
      raise 'D-21652 CSV is only partially applied' unless
        inventory.fetch(TARGET).fetch('work_text') == NEW
      raise 'D-21652 backup is missing' unless File.file?(BACKUP)
      backup_rows = ProperNameCellEditor.parse(File.binread(BACKUP))
      original = backup_rows.find do |row|
        ProperNameCellEditor.key(row) == TARGET.drop(1)
      end
      raise 'backup target does not preserve the old cell' unless original && original['Texto'] == OLD
      checks = [{
        resource: 'default',
        cells: 1,
        rows: backup_rows.length,
        before_sha256: Digest::SHA256.file(BACKUP).hexdigest,
        after_sha256: before_hashes.fetch('default'),
        backup: BACKUP,
        validation: 'resumed after CSV edit; verified against byte-identical pre-edit backup'
      }]
    else
      raise 'active CSV differs from the reviewed old text' unless
        inventory.fetch(TARGET).fetch('work_text') == OLD
      raise 'pre-edit backup is missing' unless File.file?(BACKUP)
      raise 'pre-edit backup is not byte-identical to the active CSV' unless
        File.binread(BACKUP) == File.binread(M.csv_path('default'))
      M.write_table(MANIFEST, M::HEADERS, rows)
      checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, BACKUP_DIR, before_hashes)
    end

    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', BACKUP_DIR
    )
    inventory = M.refresh_inventory
    validate_scope!(inventory)
    raise 'target post-edit text differs' unless inventory.fetch(TARGET).fetch('work_text') == NEW
    raise 'parallel Korean anchor changed' unless inventory.fetch(PARALLEL).fetch('work_text') == PARALLEL_KOREAN
    hashes = M.hashes
    raise 'unexpected resource changed' unless
      %w[affix base].all? { |resource| before_hashes.fetch(resource) == hashes.fetch(resource) }
    raise 'glossary changed' unless Digest::SHA256.file(GLOSSARY).hexdigest == glossary_hash
    raise 'occurrence index changed' unless Digest::SHA256.file(INDEX).hexdigest == index_hash
    raise 'candidate shortlist changed' unless Digest::SHA256.file(CANDIDATES).hexdigest == candidates_hash

    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'proper-name data validation failed' unless validation.include?('PASS')

    index = M.table(INDEX).map(&:to_h)
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    pending = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    old_backups = previous[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior backup history missing' unless old_backups
    retained = old_backups.lines.reject { |line| line.start_with?('- default:') }
    retained << "- default: 1 cell; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.\n"
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)
    hash_lines = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    glossary_count = M.table(GLOSSARY).length

    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed one missing `Aesir Dannin` annotation at default:15109. The identical English/Japanese/Chinese sentence at default:28077 already has the complete Korean (English) name and was used only as a consistency anchor.
      English names Aesir Dannin; Japanese イーシア・ダニン and Chinese 埃西尔·丹宁 corroborate. Only this source-local Korean name span was paired; no entity category, identity, glossary entry, occurrence disposition, alias, or global tally was added.
      D-4598's translation uncertainty at default:15109 and D-19424's `not an issue` disposition at default:28077 remain unchanged and were not reopened.
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys; these are not the complete residual discovery set.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_lines}
      Last batch pre-edit backup and byte validation:
      - default: 1 cell; pre `#{checks.first.fetch(:before_sha256)}`; post `#{checks.first.fetch(:after_sha256)}`; backup `#{checks.first.fetch(:backup)}`.
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.join.rstrip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(INDEX).hexdigest}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Source-label manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
      Residual source/index audit: PASS; #{residual_lines.join('; ')}.
      Data validation: #{validation.strip}
      Next: D-#{D + 1}; continue all-resource source discovery without reopening prior holds absent new evidence.
    TEXT

    heading = "## D-#{D}: Aesir Dannin Source-Local Name Annotation"
    register_path = M::DOCS[3]
    unless register.include?(heading)
      register << <<~REGISTER

        #{heading}

        Added the missing English name annotation at `default:15109`, using the
        identical already-paired sentence at `default:28077` as a consistency
        anchor. English Aesir Dannin, Japanese イーシア・ダニン, and Chinese
        埃西尔·丹宁 agree on the source name. No entity category, identity,
        glossary entry, occurrence disposition, alias, or historical tally was
        added. D-4598's sentence-level uncertainty at ID 15109 and D-19424's
        terminal `not an issue` at ID 28077 remain unchanged. Full discovery
        remains incomplete.
      REGISTER
    end

    report = <<~REPORT
      # D-#{D}: Aesir Dannin Source-Local Name Annotation

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      The exact English sentence occurs at default:15109 and default:28077.
      English names Aesir Dannin; aligned Japanese イーシア・ダニン and
      Chinese 埃西尔·丹宁 corroborate. The parallel default:28077 Korean
      already has `아이시르 다닌(Aesir Dannin)`, while default:15109 was
      missing only the English parenthetical.

      | Key | English name | Korean old | Korean new |
      | --- | --- | --- | --- |
      | `default:15109` | `Aesir Dannin` | `아이시르 다닌` | `아이시르 다닌(Aesir Dannin)` |

      This is source-local annotation only. It does not classify Aesir
      Dannin as a person, place, people, or other entity and does not infer
      the meaning of the surrounding mythic sentence. D-4598's `uncertain`
      translation disposition at default:15109 remains intact. D-19424's
      `not an issue` disposition at default:28077 is unchanged and was not
      reopened.

      ## Current Checkpoint

      #{summary}

      ## Validation

      - #{verification.strip}
      - Glossary, occurrence index, candidate shortlist, and non-target resource bytes remained unchanged.
      - #{residual_lines.join("\n- ")}
      - #{validation.strip}

      Full proper-name discovery remains incomplete. No PAK or PAK-derived
      resource was consulted.
    REPORT
    addendum = <<~ADDENDUM
      # D-#{D} Edit Addendum

      One default `Texto` cell changed from `아이시르 다닌` to
      `아이시르 다닌(Aesir Dannin)`. The identical sentence at
      default:28077 already carries the bilingual name and remains unchanged.

      The D-4598 uncertainty and D-19424 `not an issue` decision were not
      reopened. No glossary, occurrence index, or global tally changed.

      #{summary}

      The byte-preserving editor verified BOM, mixed line endings, row count
      and order, exact target cell, unchanged non-target bytes, and inverse
      reconstruction against the byte-identical backup.
    ADDENDUM

    File.write(register_path, register)
    File.write(REPORT, report + "\n")
    File.write(ADDENDUM, addendum + "\n")
    documents.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      File.write(path, text.sub(marker, replacement))
    end
    puts "D-#{D}: one source-local annotation; prior dispositions preserved.\n#{verification}\n#{validation}\n#{residual}"
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['prepare']
    inventory = ReviewedNameBatches.refresh_inventory
    row = AesirDanninSourceLabelD21652.review(inventory)
    puts "D-21652: default:15109; #{row.fetch('old')} -> #{row.fetch('new')}"
  when ['apply']
    AesirDanninSourceLabelD21652.run
  else
    abort 'usage: review-aesir-dannin-source-label-D21652.rb prepare|apply'
  end
end
