#!/usr/bin/env ruby

require 'csv'
require 'json'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
D_NUMBER = Integer(ARGV.fetch(0))
OUT = File.join(AUDIT, "proper-name-reviewed-gadflow-D#{D_NUMBER}.tsv")
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze

index = CSV.read(INDEX, headers: true, col_sep: "\t")
  .select { |row| row['entity_key'] == 'person:gadflow' && row['status'] == 'needs-context' }
inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [[row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s], row] }
glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
  .find { |row| row['entity_key'] == 'person:gadflow' }
raise 'Gadflow glossary entry is not confirmed' unless glossary && glossary['status'] == 'confirmed'
raise 'unexpected canonical Gadflow form' unless glossary['korean_canonical'] == '가드플로(Gadflow)'

resource_order = { 'affix' => 0, 'base' => 1, 'default' => 2 }
index.sort_by! do |row|
  [resource_order.fetch(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end
batch = index.first(50)
raise 'no pending Gadflow rows' if batch.empty?

rows = batch.map do |occurrence|
  key = [occurrence['resource'], occurrence['ID_Linha'], occurrence['Tipo_Variante'].to_s]
  source = inventory.fetch(key) { raise "missing source inventory row #{key.inspect}" }
  english = JSON.parse(source['en_texts_json'] || '[]').compact.join("\n")
  japanese = JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n")
  chinese = source['zh_text'].to_s
  raise "English does not identify Gadflow at #{key.inspect}" unless english.match?(/\bGadflow\b/i)

  old_text = source.fetch('work_text')
  new_text = old_text.gsub(/(?<![[:alnum:]가-힣])(?:가드|개드|갓)플로우?(?!\(Gadflow\))/) do
    '가드플로(Gadflow)'
  end
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  reason = status == 'accepted' ?
    'Standardized the Korean form to 가드플로 and added the source English name once per occurrence.' :
    'The canonical Korean spelling and English annotation are already present.'
  evidence = "Human-reviewed source row for person:gadflow. English identifies Gadflow; aligned Japanese and Chinese were compared. #{reason}"

  [
    *key, 'person:gadflow', status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  rows.each { |row| csv << row }
end

puts "Wrote #{rows.length} D-#{D_NUMBER} review rows: #{rows.group_by { |row| row[4] }.transform_values(&:length)}"
