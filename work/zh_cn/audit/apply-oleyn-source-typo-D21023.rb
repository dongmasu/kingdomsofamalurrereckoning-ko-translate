#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module OleynSourceTypoD21023
  M = ReviewedNameBatches
  ROOT = M::ROOT
  AUDIT = M::AUDIT
  RESOURCE = 'default'
  ID = '27211'
  ENTITY = 'person:oleyn'
  OLD_SPAN = '순수한 레인(Leyn the Pure)'
  NEW_SPAN = '순수한 올레인(Oleyn the Pure)'
  EVIDENCE = 'English default:27211 contains the malformed leading form “leyn the Pure”; the same complete epithet is spelled “Oleyn the Pure” in English default:57550. The aligned Japanese 純粋なるオレイン and Chinese 纯洁的奥蕾因 identify Oleyn, and the remaining Knight of the Golden Knot / Destroyer of Sreng / Keeper of the Fenian Cycle title sequence matches her established role. Correct only this exact row to 올레인(Oleyn the Pure); do not register “Leyn” as a global alias or infer any other source correction.'
  BACKUP_DIR = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21023'
  MANIFEST = File.join(AUDIT, 'proper-name-edits-D21023.tsv')

  module_function

  def run
    raise 'D-21023 manifest already exists' if File.exist?(MANIFEST)
    inventory = M.refresh_inventory
    key = [RESOURCE, ID, '']
    source = inventory.fetch(key)
    active_text = source.fetch('work_text')
    raise 'expected one bounded Leyn source typo' unless active_text.scan(OLD_SPAN).length == 1
    old_text = active_text
    new_text = old_text.sub(OLD_SPAN, NEW_SPAN)

    path = M.csv_path(RESOURCE)
    before = File.binread(path)
    backup = File.join(BACKUP_DIR, File.basename(path))
    FileUtils.mkdir_p(BACKUP_DIR)
    raise "backup exists and differs: #{backup}" if File.exist?(backup) && File.binread(backup) != before
    FileUtils.copy_file(path, backup) unless File.exist?(backup)
    raise 'pre-edit backup is not byte-identical' unless File.binread(backup) == before
    before_hash = Digest::SHA256.hexdigest(before)
    edit = { 'ID_Linha' => ID, 'Tipo_Variante' => '', 'old' => old_text, 'new' => new_text }
    updated, row_count = ProperNameCellEditor.prepare(before, [edit])
    raise 'active CSV changed after backup' unless File.binread(path) == before
    File.binwrite(path, updated)
    raise 'active CSV write verification failed' unless File.binread(path) == updated

    glossary_path = File.join(AUDIT, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Oleyn glossary entry missing' unless entry && entry['status'] == 'confirmed'
    entry['evidence_ids'] = (entry['evidence_ids'].to_s.split('|') + ['D-21023', "default:#{ID}"]).uniq.join('|')
    entry['notes'] = "#{entry['notes']} D-21023 resolves only default:27211's source typo “leyn the Pure” as Oleyn the Pure, corroborated by the repeated English epithet at default:57550 and aligned Japanese/Chinese. No global Leyn alias is added."
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))

    index = M.table(M::INDEX)
    raise 'Oleyn occurrence key already exists' if index.any? do |row|
      row['entity_key'] == ENTITY && M.key(row) == key
    end
    occurrence = {
      'entity_key' => ENTITY,
      'resource' => RESOURCE,
      'ID_Linha' => ID,
      'Tipo_Variante' => '',
      'matched_english' => 'leyn the Pure [source typo; same epithet as Oleyn the Pure at default:57550]',
      'english_source' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
      'korean_current' => new_text,
      'status' => 'accepted',
      'evidence' => "D-21023: #{EVIDENCE}"
    }
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + [occurrence])

    manifest_row = {
      'resource' => RESOURCE,
      'ID_Linha' => ID,
      'Tipo_Variante' => '',
      'entity_key' => ENTITY,
      'status' => 'accepted',
      'old' => old_text,
      'new' => new_text,
      'evidence' => EVIDENCE,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => '',
      'previous_evidence' => ''
    }
    M.write_table(MANIFEST, M::HEADERS, [manifest_row])
    verification = M.command!('ruby', File.join(AUDIT, 'verify-proper-name-edits.rb'),
                              '--review', MANIFEST, '--backup-dir', BACKUP_DIR)
    check = {
      resource: RESOURCE,
      cells: 1,
      rows: row_count,
      before_sha256: before_hash,
      after_sha256: Digest::SHA256.hexdigest(updated),
      backup: backup,
      validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
    }
    M.checkpoint(21023, [manifest_row], [check], verification, M.refresh_inventory,
                 review_states: %w[needs-context])
    puts "D-21023: corrected the bounded Oleyn source typo at default:#{ID}."
    puts verification.strip
    puts "Backup: #{backup}"
  end
end

OleynSourceTypoD21023.run if $PROGRAM_NAME == __FILE__
