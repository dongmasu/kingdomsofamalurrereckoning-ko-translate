#!/usr/bin/env ruby

require 'digest'
require_relative 'continue-proper-name-reviewed-batches'

# D-21543 was applied before D-21541/D-21542 in this resumed session.
# An optional latest batch extends the chain without changing that history.
abort 'usage: verify-proper-name-application-order-D21533-D21546.rb [LATEST_D >= 21546]' if ARGV.length > 1
latest = ARGV.empty? ? 21_546 : Integer(ARGV.fetch(0), 10)
raise 'latest batch must be at least D-21546' unless latest >= 21_546
ORDER = [
  *(21_547..latest).to_a.reverse,
  21_546, 21_545, 21_544, 21_542, 21_541, 21_543,
  *(21_533..21_540).to_a.reverse
].freeze
m = ReviewedNameBatches
states = m::RESOURCES.to_h { |resource| [resource, File.binread(m.csv_path(resource))] }
counts = Hash.new(0)

ORDER.each do |d|
  path = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
  reviews = m.table(path)
  reviews.select { |row| row['old'] != row['new'] }
    .group_by { |row| row['resource'] }.each do |resource, edits|
      filename = "locatexts_zh_cn.koalocatext_#{resource}.csv"
      backups = Dir.glob("/private/tmp/ko-translate-backups/*/before-proper-name-D#{d}/#{filename}")
      raise "missing/ambiguous backup D-#{d} #{resource}: #{backups.inspect}" unless backups.length == 1
      before = File.binread(backups.first)
      after = states.fetch(resource)
      original = ProperNameCellEditor.parse(before)
      current = ProperNameCellEditor.parse(after)
      raise "headers/row count changed D-#{d}" unless
        original.headers == current.headers && original.length == current.length
      targets = edits.to_h { |row| [[row['ID_Linha'], row['Tipo_Variante'].to_s], row] }
      raise "duplicate manifest target D-#{d}" unless targets.length == edits.length
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
      raise "missing target D-#{d}" unless ordinals.length == edits.length
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
      puts "PASS D-#{d} #{resource}: #{edits.length} Texto cells; exact masked bytes and inverse backup"
    end
end

puts "Verified edit events by resource: #{counts.inspect}"
puts 'Reconstructed pre-D-21533 hashes:'
states.each { |resource, bytes| puts "#{resource}: #{Digest::SHA256.hexdigest(bytes)}" }
