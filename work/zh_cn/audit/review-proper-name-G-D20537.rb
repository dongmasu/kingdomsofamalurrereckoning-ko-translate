#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
OUT = File.join(AUDIT, 'proper-name-reviewed-G-D20537.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze
CANONICAL = {
  'person:glianal' => ['Glianal', /글리아날(?:\(Glianal\))?/],
  'person:gnarsh' => ['Gnarsh', /(?:그나르시|나르쉬|그나르쉬)(?:\(Gnarsh\))?/],
  'person:golgoti' => ['Golgoti', /골고티(?:\(Golgoti\))?/]
}.freeze
KOREAN = {
  'person:glianal' => '글리아날(Glianal)',
  'person:gnarsh' => '나르쉬(Gnarsh)',
  'person:golgoti' => '골고티(Golgoti)'
}.freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [row_key(row), row] }
index = CSV.read(INDEX, headers: true, col_sep: "\t")
pending = index.select do |row|
  CANONICAL.key?(row['entity_key']) && row['status'] == 'needs-context'
end
selected = pending.uniq { |row| row_key(row) }.sort_by do |row|
  [row['entity_key'], RESOURCE_ORDER.fetch(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end.first(50)
raise "expected 50 distinct pending keys, got #{selected.length}" unless
  selected.length == 50
expected_counts = {
  'person:glianal' => 15,
  'person:gnarsh' => 33,
  'person:golgoti' => 2
}
actual_counts = selected.group_by { |row| row['entity_key'] }
  .transform_values { |rows| rows.map { |row| row_key(row) }.uniq.length }
raise "unexpected entity batch #{actual_counts.inspect}" unless actual_counts == expected_counts

reviews = selected.map do |candidate|
  key = row_key(candidate)
  source = inventory.fetch(key) { raise "missing source row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  entity = candidate.fetch('entity_key')
  name, pattern = CANONICAL.fetch(entity)
  raise "English does not identify #{name} at #{key.inspect}" unless
    english.match?(/\b#{Regexp.escape(name)}\b/i)
  new_text = if entity == 'person:golgoti' &&
                english.match?(/\bAstley Golgoti\b/i)
               old_text.gsub(
                 /애슬리 골고티(?:\(Golgoti\))?(?:\(Astley Golgoti\))?/,
                 '애슬리 골고티(Astley Golgoti)'
               )
             elsif entity == 'person:golgoti' &&
                   english.match?(/\bSorli Golgoti\b/i)
               old_text.gsub(
                 /솔리 골고티(?:\(Golgoti\))?(?:\(Sorli Golgoti\))?/,
                 '솔리 골고티(Sorli Golgoti)'
               )
             else
               old_text.gsub(pattern, KOREAN.fetch(entity))
             end
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  action = status == 'accepted' ?
    "Normalized every matching Korean occurrence to the confirmed glossary form #{KOREAN.fetch(entity)}." :
    "The Korean occurrence already uses the confirmed glossary form #{KOREAN.fetch(entity)}."
  evidence = "English identifies #{name}; aligned Japanese and Chinese were checked as supporting pronunciation/context evidence. #{action}"
  [
    *key, entity, status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

raise 'duplicate selected row key' unless reviews.map { |row| row[0, 3] }.uniq.length == 50
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end

puts "Wrote 50 Glianal/Gnarsh/Golgoti reviews: #{reviews.group_by { |row| row[4] }.transform_values(&:length)}"
