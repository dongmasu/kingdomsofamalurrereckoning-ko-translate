#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'optparse'
require_relative 'proper-name-cell-editor'

options = {}
OptionParser.new do |parser|
  parser.on('--review PATH') { |path| options[:review] = path }
  parser.on('--backup-dir PATH') { |path| options[:backup] = path }
end.parse!
abort 'need --review and --backup-dir' unless options[:review] && options[:backup] && ARGV.empty?
root = File.expand_path('../../..', __dir__)
reviews = CSV.read(options[:review], headers: true, col_sep: "\t")
reviews.select { |row| ProperNameCellEditor.applyable_edit?(row) }
       .group_by { |row| row['resource'] }.each do |resource, edits|
  abort 'unknown resource' unless %w[affix base default].include?(resource)
  filename = "locatexts_zh_cn.koalocatext_#{resource}.csv"
  before = File.binread(File.join(options[:backup], filename))
  after = File.binread(File.join(root, 'work/zh_cn', filename))
  original = ProperNameCellEditor.parse(before)
  current = ProperNameCellEditor.parse(after)
  raise 'headers/rows differ' unless original.headers == current.headers && original.length == current.length
  targets = edits.to_h { |edit| [[edit['ID_Linha'], edit['Tipo_Variante'].to_s], edit] }
  raise 'duplicate targets' unless targets.length == edits.length
  before_spans = ProperNameCellEditor.records(before)
  after_spans = ProperNameCellEditor.records(after)
  texto = original.headers.index('Texto')
  indices = []
  original.each_with_index do |row, ordinal|
    raise 'row order differs' unless ProperNameCellEditor.key(row) == ProperNameCellEditor.key(current[ordinal])
    target = targets[ProperNameCellEditor.key(row)]
    expected = row.to_h
    if target
      raise 'old/new values differ from manifest' unless row['Texto'] == target['old'] && current[ordinal]['Texto'] == target['new']
      expected['Texto'] = target['new']
      indices << ordinal + 1
    end
    raise 'unexpected non-target change' unless expected == current[ordinal].to_h
  end
  raise 'missing target' unless indices.length == edits.length
  masked_before = before.dup
  masked_after = after.dup
  inverse = after.dup
  indices.reverse_each do |ordinal|
    original_field = before.byteslice(before_spans[ordinal][texto])
    inverse[after_spans[ordinal][texto]] = original_field
    masked_before[before_spans[ordinal][texto]] = ''
    masked_after[after_spans[ordinal][texto]] = ''
  end
  raise 'non-target bytes changed' unless masked_before == masked_after
  raise 'inverse does not equal backup' unless inverse == before
  raise 'BOM/line endings changed' unless before.byteslice(0, 3) == after.byteslice(0, 3) &&
    before.scan(/\r\n|\r|\n/n) == after.scan(/\r\n|\r|\n/n)
  puts "#{resource}: PASS #{edits.length} cells; #{original.length} ordered rows; masked non-target bytes + inverse equal backup; SHA-256 #{Digest::SHA256.hexdigest(after)}"
end
