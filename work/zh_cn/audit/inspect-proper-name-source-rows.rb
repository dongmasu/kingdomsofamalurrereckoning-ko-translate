#!/usr/bin/env ruby
require 'csv'
require 'json'

abort 'usage: inspect-proper-name-source-rows.rb ENGLISH_REGEX' unless ARGV.length == 1
pattern = Regexp.new(ARGV.first, Regexp::IGNORECASE)
CSV.foreach('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t") do |row|
  english = JSON.parse(row['en_texts_json']).compact.join("\n")
  next unless english.match?(pattern)

  puts "#{row['resource']}:#{row['ID_Linha']}:#{row['Tipo_Variante']}"
  puts "EN: #{english}"
  puts "KO: #{row['work_text']}"
  puts "JA: #{JSON.parse(row['ja_texts_json']).compact.join(' | ')}"
  puts "ZH: #{row['zh_text']}"
end
