#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'build-proper-name-occurrences'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
OUT = File.join(AUDIT, 'proper-name-reviewed-garaner-D20534.tsv')
FULL_NAME = [
  'person:garaner-vernt', 'Garaner Vernt', 'person',
  '가라너 버른트(Garaner Vernt)', '',
  '가라너 버른트|가라너 번트|가라너 베른트|가라네르 베른트',
  'D-20534|base:1556|default:6098|default:17048|default:21532|default:28992|default:45878|default:49983|default:52327|default:53458|default:54964|default:55100|default:56807|default:57716|default:59852|default:61539|default:63265',
  'confirmed',
  'Complete personal name. Reuse the confirmed Garaner and Vernt forms; Japanese ガラナー・ヴァーント and Chinese 加兰里尔·冯特 corroborate the full-name identity.'
].freeze
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def canonicalize(text)
  result = text.gsub(
    /(?:가라너|가라네르)\s+(?:번트|버른트|베른트)(?:\(Garaner Vernt\))?/,
    '가라너 버른트(Garaner Vernt)'
  )
  result = result.gsub(
    /(?:가라너|가라네르)(?!\s+버른트\(Garaner Vernt\))(?!\(Garaner(?: Vernt)?\))/,
    '가라너(Garaner)'
  )
  result.gsub(/가스크(?!\(Gask\))/, '가스크(Gask)')
end

def write_table(path, headers, rows)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
end

inventory_rows = CSV.read(INVENTORY, headers: true, col_sep: "\t")
glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
entry = glossary.headers.zip(FULL_NAME).to_h
existing_entry = glossary.find { |row| row['entity_key'] == entry['entity_key'] }
if existing_entry
  existing = existing_entry.to_h
  expected = entry.dup
  expected['evidence_ids'] = existing['evidence_ids']
  raise 'Garaner Vernt glossary entry conflicts with reviewed canonical form' unless
    existing == expected
  existing_entry['evidence_ids'] = entry['evidence_ids']
else
  glossary << entry
end

index_table = CSV.read(INDEX, headers: true, col_sep: "\t")
index_headers = index_table.headers
index = index_table.map(&:to_h)
indexed_keys = index.to_h do |row|
  [[row['entity_key'], *row_key(row)], row]
end
derived = build_occurrences(inventory_rows, [entry]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
derived.each do |row|
  key = row_key(row)
  %w[person:garaner person:vernt].each do |component|
    raise "full-name row lacks pending component #{component}: #{key.inspect}" unless
      indexed_keys[[component, *key]]&.fetch('status') == 'needs-context'
  end
  prior = indexed_keys[[entry['entity_key'], *key]]
  if prior
    raise "stale full-name source snapshot #{key.inspect}" unless
      prior['korean_current'] == row['korean_current'] &&
      prior['english_source'] == row['english_source']
  else
    index << row
    indexed_keys[[entry['entity_key'], *key]] = row
  end
end
resource_order = { 'affix' => 0, 'base' => 1, 'default' => 2 }
index.sort_by! do |row|
  [resource_order.fetch(row['resource']), row['ID_Linha'].to_i,
   row['Tipo_Variante'].to_s, row['entity_key']]
end
write_table(GLOSSARY, glossary.headers, glossary.map(&:to_h))
write_table(INDEX, index_headers, index)

pending = index.select do |row|
  row['entity_key'] == 'person:garaner' && row['status'] == 'needs-context'
end
raise "expected 40 Garaner rows, got #{pending.map { |row| row_key(row) }.uniq.length}" unless
  pending.map { |row| row_key(row) }.uniq.length == 40
gask_pending = index.select do |row|
  row['entity_key'] == 'person:gask' && row['status'] == 'needs-context'
end.uniq { |row| row_key(row) }
  .sort_by { |row| [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante']] }
  .first(10)
raise "expected 10 Gask rows, got #{gask_pending.length}" unless gask_pending.length == 10

pending_keys = (pending + gask_pending).map { |row| row_key(row) }.uniq
raise 'expected 50 distinct review rows' unless pending_keys.length == 50
linked_entities = index.select do |row|
  pending_keys.include?(row_key(row)) && row['status'] == 'needs-context'
end.group_by { |row| row_key(row) }

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [row_key(row), row] }

reviews = pending_keys.map do |key|
  source = inventory.fetch(key) { raise "missing inventory row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  entities = linked_entities.fetch(key).map { |row| row.fetch('entity_key') }.uniq.sort
  names = []
  names << 'Garaner' if english.match?(/\bGaraner\b/i)
  names << 'Vernt' if entities.include?('person:vernt')
  names << 'Gask' if english.match?(/\bGask\b/i)
  raise "English does not identify the indexed name at #{key.inspect}" if names.empty?
  raise "row mixes unrelated name groups at #{key.inspect}" if names.include?('Garaner') && names.include?('Gask')

  if english.match?(/\bGaraner Vernt\b/i)
    raise "full-name occurrence missing from index #{key.inspect}" unless
      entities.include?('person:garaner-vernt')
  end
  new_text = canonicalize(old_text)
  unless english.match?(/\bGaraner Vernt\b/i)
    new_text = new_text.gsub(
      /가라너 버른트\(Garaner Vernt\)/,
      '가라너(Garaner)'
    )
  end
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  detail = if status == 'accepted'
             "Normalized #{names.uniq.join(' and ')} to the confirmed English-indexed glossary forms, annotating each corresponding occurrence in the Korean cell."
           else
             "All #{names.uniq.join(' and ')} occurrences already use the confirmed glossary forms with English annotations."
           end
  evidence = "English identifies #{names.uniq.join(' and ')}; aligned Japanese and Chinese were compared. #{detail}"

  [
    *key, entities.join('|'), status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

raise 'duplicate resource/ID/variant review key' unless
  reviews.map { |row| row[0, 3] }.uniq.length == reviews.length
reviews.sort_by! do |row|
  [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(row[0]), row[1].to_i, row[2]]
end

CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end

puts "Wrote #{reviews.length} Garaner row reviews to #{OUT}: " \
     "#{reviews.group_by { |row| row[4] }.transform_values(&:length)}"
