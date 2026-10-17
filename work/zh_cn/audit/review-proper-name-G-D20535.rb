#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'build-proper-name-occurrences'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
OUT = File.join(AUDIT, 'proper-name-reviewed-G-D20535.tsv')
FULL_NAME_KEY = 'person:gavroche-valle'
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze

FULL_NAME = [
  FULL_NAME_KEY, 'Gavroche Valle', 'person',
  '가브로슈 발레(Gavroche Valle)', '',
  '가브로슈 발레|가브로슈 발',
  'D-20535', 'confirmed',
  'Complete personal name of the smith apprentice. English Gavroche Valle, Japanese ガブロッシュ・ヴァレ, and Chinese 加夫罗什·瓦勒 support 가브로슈 발레(Gavroche Valle), distinct from the Gavroche component.'
].freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def write_table(path, headers, rows)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
end

def canonicalize(text)
  result = text.gsub(/(?:개스크|가스크)(?:\(Gask\))?/, '가스크(Gask)')
  result = result.gsub(
    /가브로슈\s+(?:발레|발)(?:\(Gavroche Valle\))?/,
    '가브로슈 발레(Gavroche Valle)'
  )
  result = result.gsub(
    /가브로슈(?!\s+발레\(Gavroche Valle\))(?!\(Gavroche\))/,
    '가브로슈(Gavroche)'
  )
  result = result.gsub(
    '가브로슈 발레(Gavroche Valle)은',
    '가브로슈 발레(Gavroche Valle)는'
  )
  result.gsub(/(?:조프|제프)(?:\(Geoff\))?/, '제프(Geoff)')
end

resource_order = { 'affix' => 0, 'base' => 1, 'default' => 2 }
inventory_rows = CSV.read(INVENTORY, headers: true, col_sep: "\t")
inventory = inventory_rows.to_h { |row| [row_key(row), row] }

glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
entry = glossary.headers.zip(FULL_NAME).to_h
existing_entry = glossary.find { |row| row['entity_key'] == FULL_NAME_KEY }
if existing_entry
  expected = entry.dup
  expected['evidence_ids'] = existing_entry['evidence_ids']
  raise 'Gavroche Valle glossary entry conflicts with canonical form' unless
    existing_entry.to_h == expected
else
  glossary << entry
end

index_table = CSV.read(INDEX, headers: true, col_sep: "\t")
index_headers = index_table.headers
index = index_table.map(&:to_h)
indexed = index.to_h { |row| [[row['entity_key'], *row_key(row)], row] }
derived = build_occurrences(inventory_rows, [entry]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise 'no Gavroche Valle full-name matches' if derived.empty?
derived.each do |row|
  key = row_key(row)
  component = indexed[['person:gavroche', *key]]
  raise "full-name row lacks pending Gavroche component #{key.inspect}" unless
    component && component['status'] == 'needs-context'
  prior = indexed[[FULL_NAME_KEY, *key]]
  if prior
    raise "stale Gavroche Valle source snapshot #{key.inspect}" unless
      prior['korean_current'] == row['korean_current'] &&
      prior['english_source'] == row['english_source']
  else
    index << row
    indexed[[FULL_NAME_KEY, *key]] = row
  end
end
entry['evidence_ids'] = (
  ['D-20535'] + derived.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }.uniq
).join('|')
if existing_entry
  existing_entry['evidence_ids'] = entry['evidence_ids']
end
index.sort_by! do |row|
  [resource_order.fetch(row['resource']), row['ID_Linha'].to_i,
   row['Tipo_Variante'].to_s, row['entity_key']]
end
write_table(GLOSSARY, glossary.headers, glossary.map(&:to_h))
write_table(INDEX, index_headers, index)

spec = [
  ['person:gask', 19],
  ['person:gavroche', 22],
  ['person:geoff', 9]
]
selected = spec.flat_map do |entity, count|
  rows = index.select do |row|
    row['entity_key'] == entity && row['status'] == 'needs-context'
  end.uniq { |row| row_key(row) }
  rows.sort_by! do |row|
    [resource_order.fetch(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
  end
  raise "not enough pending rows for #{entity}" if rows.length < count
  rows.first(count).map { |row| row_key(row) }
end
raise 'expected 50 distinct selected keys' unless selected.uniq.length == 50
selected_set = selected.to_h { |key| [key, true] }
linked = index.select do |row|
  selected_set.key?(row_key(row)) && row['status'] == 'needs-context'
end.group_by { |row| row_key(row) }

reviews = selected.map do |key|
  source = inventory.fetch(key) { raise "missing inventory row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  entities = linked.fetch(key).map { |row| row.fetch('entity_key') }.uniq.sort
  expected_name =
    if entities.include?('person:gask')
      'Gask'
    elsif entities.include?('person:gavroche')
      'Gavroche'
    elsif entities.include?('person:geoff')
      'Geoff'
    end
  raise "unexpected name group #{key.inspect}" unless expected_name
  raise "English does not identify #{expected_name} at #{key.inspect}" unless
    english.match?(/\b#{Regexp.escape(expected_name)}\b/i)
  if english.match?(/\bGavroche Valle\b/i)
    raise "full-name occurrence missing from index #{key.inspect}" unless
      entities.include?(FULL_NAME_KEY)
  end
  new_text = canonicalize(old_text)
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  description = status == 'accepted' ?
    "Normalized #{expected_name} to the confirmed English-indexed glossary form, including every matching occurrence in the Korean cell." :
    "The Korean cell already uses the canonical bilingual form for #{expected_name}."
  evidence = "English identifies #{expected_name}; aligned Japanese and Chinese were compared. #{description}"

  [
    *key, entities.join('|'), status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

raise 'duplicate review row key' unless reviews.map { |row| row[0, 3] }.uniq.length == 50
reviews.sort_by! do |row|
  [resource_order.fetch(row[0]), row[1].to_i, row[2]]
end
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end

puts "Wrote 50 Gask/Gavroche/Geoff reviews: " \
     "#{reviews.group_by { |row| row[4] }.transform_values(&:length)}; " \
     "registered #{derived.length} Gavroche Valle occurrences."
