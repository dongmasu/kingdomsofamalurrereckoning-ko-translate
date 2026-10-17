#!/usr/bin/env ruby
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

abort 'usage: verify-proper-name-batch-chain.rb FIRST_D LAST_D [SKIP_D ...]' unless ARGV.length >= 2
first_d, last_d = ARGV.take(2).map { |value| Integer(value) }
skipped = ARGV.drop(2).map { |value| Integer(value) }.to_set
raise 'reversed D range' if first_d > last_d
m = ReviewedNameBatches
states = m::RESOURCES.to_h { |resource| [resource, File.binread(m.csv_path(resource))] }
counts = Hash.new(0)
(first_d..last_d).reject { |d| skipped.include?(d) }.reverse_each do |d|
  reviews = m.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
  reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
    filename = "locatexts_zh_cn.koalocatext_#{resource}.csv"
    backups = Dir.glob("/private/tmp/ko-translate-backups/*/before-proper-name-D#{d}/#{filename}")
    raise "missing/ambiguous backup D-#{d} #{resource}: #{backups.inspect}" unless backups.length == 1
    backup = backups.first
    before = File.binread(backup)
    after = states.fetch(resource)
    original = ProperNameCellEditor.parse(before)
    current = ProperNameCellEditor.parse(after)
    raise "headers/row count changed D-#{d}" unless
      original.headers == current.headers && original.length == current.length
    targets = edits.to_h { |row| [[row['ID_Linha'], row['Tipo_Variante'].to_s], row] }
    raise 'duplicate manifest target' unless targets.length == edits.length
    before_spans = ProperNameCellEditor.records(before)
    after_spans = ProperNameCellEditor.records(after)
    texto = original.headers.index('Texto')
    ordinals = []
    original.each_with_index do |row, ordinal|
      raise "row order changed D-#{d}" unless
        ProperNameCellEditor.key(row) == ProperNameCellEditor.key(current[ordinal])
      target = targets[ProperNameCellEditor.key(row)]
      expected = row.to_h
      if target
        raise "old/new manifest mismatch D-#{d}" unless
          row['Texto'] == target['old'] && current[ordinal]['Texto'] == target['new']
        expected['Texto'] = target['new']
        ordinals << ordinal + 1
      end
      raise "non-target cell changed D-#{d}" unless expected == current[ordinal].to_h
    end
    raise 'missing target' unless ordinals.length == edits.length
    masked_before, masked_after, inverse = before.dup, after.dup, after.dup
    ordinals.reverse_each do |ordinal|
      inverse[after_spans[ordinal][texto]] = before.byteslice(before_spans[ordinal][texto])
      masked_before[before_spans[ordinal][texto]] = ''
      masked_after[after_spans[ordinal][texto]] = ''
    end
    raise "non-target bytes changed D-#{d}" unless masked_before == masked_after
    raise "inverse differs from backup D-#{d}" unless inverse == before
    raise "BOM/line endings changed D-#{d}" unless
      before.byteslice(0, 3) == after.byteslice(0, 3) &&
      before.scan(/\r\n|\r|\n/n) == after.scan(/\r\n|\r|\n/n)
    states[resource] = before
    counts[resource] += edits.length
    puts "PASS D-#{d} #{resource}: #{edits.length} Texto cells; #{original.length} ordered rows; exact masked bytes, BOM/line endings, and inverse backup"
  end
end
puts "Verified edit events by resource: #{counts.inspect}"
puts "Reconstructed pre-D-#{first_d} hashes:"
states.each { |resource, bytes| puts "#{resource}: #{Digest::SHA256.hexdigest(bytes)}" }
