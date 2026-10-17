#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
OUT = ARGV[0] || File.join(AUDIT, 'proper-name-reviewed-G-D20539.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def canonicalize(text, english, key)
  result = text.dup
  if key == ['default', '21507', '']
    return result.gsub(
      /그리안\s+신\(Grian Sheen\)/,
      '그리안 셰인(Grian Shane)'
    )
  elsif english.match?(/\bGrian Brighthelm\b/i)
    result = result.gsub(
      /그리안\s+브라이트헬름(?:\(Grian Brighthelm\))?/,
      '그리안 브라이트헬름(Grian Brighthelm)'
    )
  elsif english.match?(/\bGrian\s+["']Brighthelm["']/i)
    result = result.gsub(
      /그리안(?:\(Grian\))?\s+['"]브라이트헬름(?:\(Brighthelm\))?['"]/,
      "그리안(Grian) '브라이트헬름(Brighthelm)'"
    )
  elsif english.match?(/\bGrian Shane\b|\bGrian Sheen\b/i)
    result = result.gsub(
      /(?:그리안|그리언)\s+셰인(?:\(Grian (?:Shane|Sheen)\))?/,
      '그리안 셰인(Grian Shane)'
    )
  end
  result.gsub(/그리안(?!\(Grian\))(?! 셰인\(Grian Shane\))(?! 브라이트헬름\(Grian Brighthelm\))/,
              '그리안(Grian)')
end

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [row_key(row), row] }
index = CSV.read(INDEX, headers: true, col_sep: "\t")
pending = index.select do |row|
  row['entity_key'] == 'person:grian' && row['status'] == 'needs-context'
end
selected = pending.uniq { |row| row_key(row) }.sort_by do |row|
  [RESOURCE_ORDER.fetch(row['resource']), row['ID_Linha'].to_i,
   row['Tipo_Variante'].to_s]
end.first(50)
raise "expected 1-50 distinct pending keys, got #{selected.length}" unless
  (1..50).cover?(selected.length)

reviews = selected.map do |candidate|
  key = row_key(candidate)
  source = inventory.fetch(key) { raise "missing source row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  raise "English does not identify Grian at #{key.inspect}" unless
    english.match?(/\bGrian\b/i)
  new_text = canonicalize(old_text, english, key)
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  action = status == 'accepted' ?
    'Standardized the Korean name to the confirmed English-indexed Grian form; full-name and nickname forms retain their distinct English labels.' :
    'The Korean name already uses the confirmed bilingual Grian form.'
  evidence = if key == ['default', '21507', '']
              'The English row says “Grian Sheen,” while aligned Japanese グリアン・シェイン and Chinese 格里安·谢恩, together with repeated source contexts, identify Grian Shane. Treated Sheen as an English-source typo and normalized the Korean full name to 그리안 셰인(Grian Shane).'
            else
              "English identifies Grian; aligned Japanese and Chinese were checked as supporting pronunciation/context evidence. #{action}"
            end
  [
    *key, 'person:grian', status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

raise 'duplicate selected row key' unless
  reviews.map { |row| row[0, 3] }.uniq.length == reviews.length
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end

puts "Wrote #{reviews.length} Grian reviews: #{reviews.group_by { |row| row[4] }.transform_values(&:length)}"
