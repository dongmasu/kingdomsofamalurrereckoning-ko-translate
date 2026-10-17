#!/usr/bin/env ruby
require 'stringio'
require_relative 'prepare-jakin-short-alias-D21375'

m = ReviewedNameBatches
mod = JakinShortAliasD21375
reviews = m.table(File.join(__dir__, 'proper-name-edits-D21375.tsv')).map(&:to_h)
inventory = m.refresh_inventory
old_texts = reviews.to_h { |row| [m.key(row), row.fetch('old')] }
index = m.table(m::INDEX)
new_keys = reviews.map { |row| [mod::ENTITY, *m.key(row)] }
restored_index = index.map(&:to_h).reject do |row|
  new_keys.include?([row.fetch('entity_key'), *m.key(row)])
end.map do |row|
  row = row.dup
  row['korean_current'] = old_texts.fetch(m.key(row), row['korean_current'])
  if row['entity_key'] == mod::ENTITY
    raise 'unexpected prior alias metadata' unless row['matched_english'] == 'Jakin|Jakin Madsen'
    row['matched_english'] = 'Jakin Madsen'
  end
  row
end
serialize = lambda do |headers, rows|
  CSV.generate(col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
end
index_hash = Digest::SHA256.hexdigest(serialize.call(index.headers, restored_index))
raise "pre-D21375 index reconstruction mismatch #{index_hash}" unless
  index_hash == '2961a069239c3a3b51186a3ffbb7548b947e6b811a23c68ad5d1a05790618fb3'

glossary = m.table(mod::GLOSSARY)
original = m.table(File.join(__dir__, 'proper-name-discovery-definitions-D21171.tsv'))
  .find { |row| row['entity_key'] == mod::ENTITY }.to_h
restored_glossary = glossary.map(&:to_h).map do |row|
  row['entity_key'] == mod::ENTITY ? original : row
end
glossary_hash = Digest::SHA256.hexdigest(serialize.call(glossary.headers, restored_glossary))
raise "pre-D21375 glossary reconstruction mismatch #{glossary_hash}" unless
  glossary_hash == '722e6f97fe04d1bc8e2eef8511123786eb846160e3fcf04f74181db2f6da2e6b'

current = index.map(&:to_h).select { |row| row['entity_key'] == mod::ENTITY }
expected = build_occurrences(inventory.values, glossary.map(&:to_h)).select do |values|
  values.first == mod::ENTITY
end.map { |values| values.take(4) }.sort
raise 'registered Jakin source/index coverage differs' unless
  expected == current.map { |row| [mod::ENTITY, *m.key(row)] }.sort
puts "PASS exact pre-D21375 index and glossary reconstruction; 41 new short-name keys; eight historical full-name keys preserved; #{expected.length} source matches"
