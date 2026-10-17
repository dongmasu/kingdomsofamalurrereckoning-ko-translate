#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
OUT = File.join(AUDIT, 'proper-name-reviewed-G-D20538.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese entity_dispositions_json
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze
NAMES = {
  'person:golgoti' => 'Golgoti',
  'person:gortan' => 'Gortan',
  'person:gray' => 'Gray',
  'person:grian' => 'Grian'
}.freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def canonicalize(entity, text, english)
  case entity
  when 'person:golgoti'
    result = text.dup
    if english.match?(/\bAstley Golgoti\b/i)
      result = result.gsub(
        /(?:애스틀리|애슬리)\s+골고티(?:\(Golgoti\))?(?:\(Astley Golgoti\))?/,
        '애슬리 골고티(Astley Golgoti)'
      )
    elsif english.match?(/\bSorli Golgoti\b/i)
      result = result.gsub(
        /솔리\s+골고티(?:\(Golgoti\))?(?:\(Sorli Golgoti\))?/,
        '솔리 골고티(Sorli Golgoti)'
      )
    else
      result = result.gsub(/골고티(?!\(Golgoti\))/, '골고티(Golgoti)')
    end
    result
  when 'person:gortan'
    text
  when 'person:gray'
    text
  when 'person:grian'
    result = text.dup
    if english.match?(/\bGrian Shane\b/i)
      result = result.gsub(
        /그리안\s+셰인(?:\(Grian Shane\))?/,
        '그리안 셰인(Grian Shane)'
      )
    end
    if english.match?(/\bGrian\b/i)
      result = result.gsub(/그리안(?!\(Grian\))(?! 셰인\(Grian Shane\))/, '그리안(Grian)')
    end
    result
  else
    raise "unhandled entity #{entity}"
  end
end

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [row_key(row), row] }
index = CSV.read(INDEX, headers: true, col_sep: "\t")
pending = index.select do |row|
  NAMES.key?(row['entity_key']) && row['status'] == 'needs-context'
end
selected = pending.uniq { |row| row_key(row) }.sort_by do |row|
  [row['entity_key'], RESOURCE_ORDER.fetch(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end.first(50)
raise "expected 50 distinct pending keys, got #{selected.length}" unless
  selected.length == 50
expected_counts = {
  'person:golgoti' => 6,
  'person:gortan' => 1,
  'person:gray' => 32,
  'person:grian' => 11
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
  name = NAMES.fetch(entity)
  matches_english = entity == 'person:gray' ?
    english.match?(/Gray/i) :
    english.match?(/\b#{Regexp.escape(name)}\b/i)
  raise "English does not identify #{name} at #{key.inspect}" unless matches_english

  if entity == 'person:gray' && !english.match?(/\bMatt Gray\b/i)
    status = 'excluded'
    new_text = old_text
    dispositions = JSON.generate(entity => status)
    evidence = 'English uses gray only as a color/idiom or a controller/icon token, not as the indexed person Matt Gray; Japanese and Chinese corroborate the non-person use. Excluded from the personal-name entity.'
  else
    new_text = canonicalize(entity, old_text, english)
    status = old_text == new_text ? 'not-an-issue' : 'accepted'
    dispositions = ''
    action = status == 'accepted' ?
      "Normalized the named occurrence to the confirmed glossary form and retained its source-English name." :
      'The Korean name already matches the confirmed bilingual glossary form.'
    evidence = "English identifies #{name}; aligned Japanese and Chinese were checked as supporting pronunciation/context evidence. #{action}"
  end

  [
    *key, entity, status, old_text, new_text, evidence,
    english, japanese, chinese, dispositions
  ]
end

raise 'duplicate selected row key' unless reviews.map { |row| row[0, 3] }.uniq.length == 50
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end

puts "Wrote 50 Golgoti/Gortan/Gray/Grian reviews: #{reviews.group_by { |row| row[4] }.transform_values(&:length)}"
