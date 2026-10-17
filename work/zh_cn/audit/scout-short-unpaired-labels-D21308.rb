#!/usr/bin/env ruby
require 'csv'
require 'json'
require 'set'

audit = File.dirname(__FILE__)
glossary = CSV.read(File.join(audit, 'proper-name-glossary.tsv'), headers: true, col_sep: "\t")
terms = glossary.flat_map do |row|
  [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
end.map(&:downcase).to_set

CSV.foreach('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t") do |row|
  english = JSON.parse(row['en_texts_json']).compact.first.to_s
  korean = row['work_text']
  next if english.empty? || english.size > 55 || korean.include?('(')
  next unless english.match?(/\A[A-Z][A-Za-z '\-]+\z/)
  next if terms.include?(english.downcase)

  puts [row['resource'], row['ID_Linha'], english, korean,
        JSON.parse(row['ja_texts_json']).first, row['zh_text']].join("\t")
end
