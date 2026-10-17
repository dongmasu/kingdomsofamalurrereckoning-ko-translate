#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module FenianCycleParticleD21022
  M = ReviewedNameBatches
  ROOT = M::ROOT
  AUDIT = M::AUDIT
  ID = '51496'
  ENTITY = 'lore:fenian-cycle'
  RESOURCE = 'default'
  PREVIOUS = "그녀는 정정당당히 스렝(Sreng)을 꺾고,\r\n페니안 전설군(Fenian Cycles)를 지켰네.\r\n이 처녀의 활약은,\r\n무겁고 버거운 대가를 치렀지.\r\n\r\n필멸자의 부족들 사이에 살며\r\n그들과 거래를 했고,\r\n그 마을 사람들은 모두 두려워했네\r\n다가오는 그 눈부신 전사를."
  FINAL = PREVIOUS.sub('전설군(Fenian Cycles)를', '전설군(Fenian Cycles)을')
  BATCH_BACKUP = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21022'
  STAGE_BACKUP = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21022-particle'
  MANIFEST = File.join(AUDIT, 'proper-name-edits-D21022.tsv')

  module_function

  def run
    path = M.csv_path(RESOURCE)
    active = File.binread(path)
    stage_path = File.join(STAGE_BACKUP, File.basename(path))
    raise 'stage backup missing or not byte-identical' unless File.binread(stage_path) == active
    row = M.table(MANIFEST).map(&:to_h).find { |entry| entry['ID_Linha'] == ID }
    raise 'missing default:51496 batch manifest row' unless row && row['entity_key'] == ENTITY
    raise 'manifest does not contain the expected particle error' unless row['new'] == PREVIOUS

    target = {
      'ID_Linha' => ID, 'Tipo_Variante' => '', 'old' => PREVIOUS, 'new' => FINAL
    }
    updated, rows = ProperNameCellEditor.prepare(active, [target])
    stage_preview, = ProperNameCellEditor.prepare(File.binread(stage_path), [target])
    raise 'stage preview differs from active correction' unless stage_preview == updated
    raise 'active CSV changed during correction validation' unless File.binread(path) == active
    File.binwrite(path, updated)
    raise 'active CSV write verification failed' unless File.binread(path) == updated

    row['new'] = FINAL
    manifest_rows = M.table(MANIFEST).map(&:to_h)
    manifest_rows[manifest_rows.index { |entry| entry['ID_Linha'] == ID }] = row
    M.write_table(MANIFEST, M::HEADERS, manifest_rows)

    index = M.table(M::INDEX)
    matches = index.select do |entry|
      entry['entity_key'] == ENTITY && entry['resource'] == RESOURCE &&
        entry['ID_Linha'] == ID && entry['Tipo_Variante'].to_s.empty?
    end
    raise 'expected one existing Fenian Cycle occurrence' unless matches.length == 1
    matches.first['korean_current'] = FINAL
    M.write_table(M::INDEX, index.headers, index)

    batch_backup = File.join(BATCH_BACKUP, File.basename(path))
    verification = M.command!('ruby', File.join(AUDIT, 'verify-proper-name-edits.rb'),
                              '--review', MANIFEST, '--backup-dir', BATCH_BACKUP)
    check = {
      resource: RESOURCE,
      cells: 5,
      rows: ProperNameCellEditor.parse(updated).length,
      before_sha256: Digest::SHA256.file(batch_backup).hexdigest,
      after_sha256: Digest::SHA256.hexdigest(updated),
      backup: batch_backup,
      validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
    }
    M.checkpoint(21022, manifest_rows, [check], verification, M.refresh_inventory)
    puts "default:#{ID}: corrected Korean particle after adding the canonical label."
    puts "Stage backup: #{stage_path}; SHA-256 #{Digest::SHA256.file(stage_path).hexdigest}"
    puts verification.strip
  end
end

FenianCycleParticleD21022.run if $PROGRAM_NAME == __FILE__
