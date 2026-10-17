#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'fileutils'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module ProperNameCorrectionD21021
  M = ReviewedNameBatches
  ROOT = M::ROOT
  AUDIT = M::AUDIT
  RESOURCE = 'default'
  ID = '610'
  VARIANT = ''
  ENTITY_KEYS = %w[person:magwyr lore:the-telling].freeze
  OLD = '내 전승(The Telling)은 언제나 왕의 전승에 속하지, 시녀의 전승에 속하는 건 아니야. 네게 선택권이 있다면 우리 모두에게도 선택권이 있는 거야.'
  NEW = '내 전승(The Telling)은 언제나 왕의 전승에 속하지, 시녀(The Maid)의 전승에 속하는 건 아니야. 네게 선택권이 있다면 우리 모두에게도 선택권이 있는 거야.'
  EVIDENCE = 'Corrective bilingual-label restoration only. The English “not the Maid’s” and Japanese ウィンダメアの烈女 identify the context-bound Maid of Windemere title; the Chinese wording is supporting context. D-20978 already accepted this exact row as Magwyr’s short title, while D-21017 accepted The Telling here. Restore 시녀(The Maid) without reopening either disposition or adding to historical tallies.'
  BACKUP_DIR = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21021'
  MANIFEST = File.join(AUDIT, 'proper-name-edits-D21021.tsv')

  module_function

  def run
    raise 'D-21021 manifest already exists' if File.exist?(MANIFEST)
    inventory = M.refresh_inventory
    key = [RESOURCE, ID, VARIANT]
    source = inventory.fetch(key)
    raise 'unexpected active Korean text at default:610' unless source.fetch('work_text') == OLD
    current_hashes = M.hashes
    path = M.csv_path(RESOURCE)
    before = File.binread(path)
    before_hash = Digest::SHA256.hexdigest(before)
    backup = File.join(BACKUP_DIR, File.basename(path))
    FileUtils.mkdir_p(BACKUP_DIR)
    raise "backup already exists and differs: #{backup}" if File.exist?(backup) && File.binread(backup) != before
    FileUtils.copy_file(path, backup) unless File.exist?(backup)
    raise 'pre-edit backup is not byte-identical' unless File.binread(backup) == before

    edit = {
      'ID_Linha' => ID, 'Tipo_Variante' => VARIANT, 'old' => OLD, 'new' => NEW
    }
    updated, row_count = ProperNameCellEditor.prepare(before, [edit])
    raise 'active CSV changed after backup' unless File.binread(path) == before
    File.binwrite(path, updated)
    raise 'active CSV write verification failed' unless File.binread(path) == updated

    index = M.table(M::INDEX)
    rows = ENTITY_KEYS.map do |entity|
      matches = index.select do |row|
        row['entity_key'] == entity && M.key(row) == key
      end
      raise "expected one existing index key for #{entity}" unless matches.length == 1
      matches.first
    end
    previous_status = rows.to_h { |row| [row['entity_key'], row['status']] }
    previous_evidence = rows.to_h { |row| [row['entity_key'], row['evidence']] }
    raise 'expected both existing keys to be accepted' unless previous_status.values.all? { |status| status == 'accepted' }

    manifest_row = {
      'resource' => RESOURCE,
      'ID_Linha' => ID,
      'Tipo_Variante' => VARIANT,
      'entity_key' => ENTITY_KEYS.join('|'),
      'status' => 'accepted',
      'old' => OLD,
      'new' => NEW,
      'evidence' => EVIDENCE,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY_KEYS.to_h { |entity| [entity, 'accepted'] }),
      'previous_status' => JSON.generate(previous_status),
      'previous_evidence' => JSON.generate(previous_evidence)
    }
    M.write_table(MANIFEST, M::HEADERS, [manifest_row])

    rows.each do |row|
      row['korean_current'] = NEW
      row['evidence'] = "#{row['evidence']} D-21021 correction: restored the separately accepted contextual title label 시녀(The Maid) at this exact row."
    end
    M.write_table(M::INDEX, index.headers, index)

    glossary_path = File.join(AUDIT, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    ENTITY_KEYS.each do |entity|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise "missing glossary entry #{entity}" unless entry
      ids = entry['evidence_ids'].to_s.split('|')
      entry['evidence_ids'] = (ids + ['D-21021']).uniq.join('|')
      entry['notes'] = "#{entry['notes']} D-21021 restores the existing contextual Magwyr title and preserves the established The Telling label at default:610; no entity or row disposition is recounted."
    end
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))

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
    M.checkpoint(21021, [manifest_row], [check], verification, M.refresh_inventory,
                 review_states: %w[needs-context accepted])
    puts "D-21021 corrective edit: default:610; #{verification.strip}; backup=#{backup}"
    puts "Original active hashes before this correction: #{current_hashes.inspect}"
  end
end

ProperNameCorrectionD21021.run if $PROGRAM_NAME == __FILE__
