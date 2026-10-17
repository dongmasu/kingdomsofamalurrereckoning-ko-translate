#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'fileutils'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module DraugToothpicksCorrectionD21500
  extend self

  M = ReviewedNameBatches
  D = 21_500
  ENTITY = 'unique_item:draugs-toothpicks'
  KEY = ['default', '17768', ''].freeze
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  BACKUP_DIR = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
  INDEX_BACKUP = File.join(BACKUP_DIR, 'proper-name-occurrences.tsv')
  SOURCE_ENGLISH = "These foul-smelling ceremonial daggers were said to be the toothpicks of the fabled troll, Draug."
  SOURCE_JAPANESE = '嫌な臭いのするこれらの儀式用のダガーは、トロールのドラウグの爪楊枝だったとされる。'
  SOURCE_CHINESE = '这些散发着恶臭的仪式匕首据说是传说中的巨魔德拉格的剔牙刀。'
  DETAIL = <<~TEXT.chomp
    ### D-21500: Lowercase `toothpicks` Alias Collision

    Corrected one occurrence-index disposition without changing the Korean
    cell or adding a source key. English default:17768 uses lowercase
    `toothpicks` descriptively for Draug's ceremonial daggers; aligned
    Japanese and Chinese likewise describe the ordinary object rather than
    writing the named item `Draug's Toothpicks`. The case-insensitive short
    alias had caused a false proper-name match. Excluded only
    `unique_item:draugs-toothpicks / default:17768`; the Korean text remains
    unchanged and the occurrence key remains in the index.

    The active occurrence index was backed up byte-for-byte at
    `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21500/proper-name-occurrences.tsv`.
    Its parsed row order and all fields other than this key's status/evidence
    were verified against the backup. No active CSV changed.
  TEXT

  def prepare
    raise 'D-21500 manifest already exists' if File.exist?(MANIFEST)
    raise 'D-21500 backup directory already exists' if File.exist?(BACKUP_DIR)
    raise 'D-21500 review report already exists' if
      Dir.glob(File.join(__dir__, "named-scope-review-D#{D}-*.md")).any?

    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    matches = index.select do |row|
      row['entity_key'] == ENTITY && M.key(row) == KEY
    end
    raise 'expected exactly one indexed Toothpicks match' unless matches.length == 1
    occurrence = matches.first.to_h
    raise 'unexpected prior disposition' unless occurrence['status'] == 'not-an-issue'
    raise 'unexpected prior batch evidence' unless occurrence['evidence'].start_with?('D-21498: ')
    raise 'unexpected short-alias match' unless occurrence['matched_english'] == 'Toothpicks'

    source = inventory.fetch(KEY)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise 'English descriptor changed' unless english == SOURCE_ENGLISH
    raise 'Japanese descriptor changed' unless japanese == SOURCE_JAPANESE
    raise 'Chinese descriptor changed' unless chinese == SOURCE_CHINESE
    raise 'English uses the named-item capitalization' unless
      english.include?('toothpicks') && !english.include?('Toothpicks')

    evidence = 'English default:17768 uses lowercase toothpicks as a common-noun description of Draug’s ceremonial daggers, not the named item Draug’s Toothpicks. Aligned Japanese ドラウグの爪楊枝 and Chinese 德拉格的剔牙刀 describe the same ordinary object. The prior case-insensitive short-alias match is excluded from unique_item:draugs-toothpicks; preserve the current Korean cell and all other entity dispositions.'
    review = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'excluded',
      'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
      'evidence' => evidence, 'english' => english, 'japanese' => japanese,
      'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'excluded'),
      'previous_status' => JSON.generate(ENTITY => occurrence['status']),
      'previous_evidence' => JSON.generate(ENTITY => occurrence['evidence'])
    }
    [review, inventory, M.table(M::INDEX).headers]
  end

  def write_detail(path, after_marker: false)
    text = File.read(path)
    return if text.include?('### D-21500: Lowercase `toothpicks` Alias Collision')

    if after_marker
      marker = "<!-- current-proper-name-batch:end -->\n"
      raise "missing current-batch marker in #{path}" unless text.include?(marker)
      text.sub!(marker, "#{marker}\n#{DETAIL}\n")
    else
      text << "\n\n#{DETAIL}\n"
    end
    File.write(path, text)
  end

  def verify_index(before, review)
    after = File.binread(M::INDEX)
    old_rows = CSV.parse(before.dup.force_encoding('UTF-8'),
                         headers: true, col_sep: "\t")
    new_rows = CSV.parse(after.dup.force_encoding('UTF-8'),
                         headers: true, col_sep: "\t")
    raise 'occurrence-index headers/row count changed' unless
      old_rows.headers == new_rows.headers && old_rows.length == new_rows.length

    changed = 0
    old_rows.each_with_index do |row, ordinal|
      expected = row.to_h
      if expected['entity_key'] == ENTITY &&
         M.key(expected) == KEY
        expected['status'] = 'excluded'
        expected['evidence'] = "D-#{D}: #{review.fetch('evidence')}"
        changed += 1
      end
      raise "unexpected occurrence-index change at row #{ordinal + 1}" unless
        expected == new_rows[ordinal].to_h
    end
    raise 'expected one corrected occurrence-index row' unless changed == 1
    raise 'index backup is not byte-identical' unless File.binread(INDEX_BACKUP) == before
    puts "Occurrence index: PASS one disposition correction; #{old_rows.length} ordered rows; all other parsed fields unchanged; backup SHA-256 #{Digest::SHA256.hexdigest(before)}; active SHA-256 #{Digest::SHA256.hexdigest(after)}"
  end

  def finalize_documents
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    text = File.read(addendum)
    text.sub!(
      /The byte-preserving editor and separate verifier checked.*?backups\.\n/m,
      'No active CSV was modified. The occurrence-index correction was verified against its byte-identical backup; only the target status/evidence changed in parsed records.' + "\n"
    )
    File.write(addendum, text)
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    write_detail(report)
    write_detail(addendum)
    M::DOCS.each { |path| write_detail(path, after_marker: true) }
  end

  def apply
    review, inventory, headers = prepare
    index_before = File.binread(M::INDEX)
    FileUtils.mkdir_p(BACKUP_DIR)
    FileUtils.copy_file(M::INDEX, INDEX_BACKUP)
    raise 'index backup is not byte-identical' unless File.binread(INDEX_BACKUP) == index_before

    M.write_table(MANIFEST, M::HEADERS, [review])
    M.checkpoint(D, [review], [], '', inventory, review_states: ['not-an-issue'])
    verify_index(index_before, review)

    finalize_documents
  end

  def verify
    review = M.table(MANIFEST).first.to_h
    raise 'D-21500 manifest must contain one row' unless
      M.table(MANIFEST).length == 1
    verify_index(File.binread(INDEX_BACKUP), review)
    finalize_documents
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: correct-draug-toothpicks-lowercase-D21500.rb [apply|verify]' if
    ARGV.length > 1 || !%w[apply verify].include?(ARGV.fetch(0, 'apply'))
  ARGV.first == 'verify' ? DraugToothpicksCorrectionD21500.verify :
    DraugToothpicksCorrectionD21500.apply
end
