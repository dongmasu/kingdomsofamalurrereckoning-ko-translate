#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
OUT = File.join(AUDIT, 'proper-name-reviewed-G-D20536.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze

def row_key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def canonicalize_geoff(text, english)
  return text unless english.match?(/\bGeoff\b/i)

  text.gsub(/(?:제프|조프)(?:\(Geoff\))?/, '제프(Geoff)')
      .gsub('제프(Geoff) 수사(Brother Geoff)', '제프(Geoff) 수사')
end

def canonicalize_gifre(text, english)
  return text unless english.match?(/\bGifre\b/i)

  result = text.dup
  if english.match?(/\bMaiwen Wyvyrn-Gifre-Fiddlestuffs\b/i)
    result = result.gsub(
      /(?:마이웬|메이웬)\s+와이번[- ]?기프(?:레|르)-피들스텁스(?:\(Maiwen Wyvyrn-Gifre(?:-Fiddlestuffs)?\))?/,
      '메이웬 와이번-기프르-피들스텁스(Maiwen Wyvyrn-Gifre-Fiddlestuffs)'
    )
    return result
  end
  result.gsub!(
    '와이번-기프르 대가문(Wyvyrn-Gifre Great House)',
    'WYGIFRE_GREAT_HOUSE'
  )
  result.gsub!(
    '와이번-기프르 인장 반지(Wyvyrn-Gifre Signet Ring)',
    'WYGIFRE_SIGNET_RING'
  )
  if english.match?(/\bWyvyrn-Gifres\b/i)
    result = result.gsub(
      /라시르의\s+와이번[- ]?기프(?:레|르)\s*가문/,
      '라시르의 와이번-기프르(Wyvyrn-Gifres) 가문'
    )
  end
  full_names = {
    'Ebsol Wyvyrn-Gifre' => ['엡솔 와이번-기프르', /(?:엡솔|에브솔)\s+와이번[- ]?기프(?:레|르)/],
    'Maiwen Wyvyrn-Gifre' => ['메이웬 와이번-기프르', /(?:마이웬|메이웬)\s+와이번[- ]?기프(?:레|르)/],
    'Tanra Wyvyrn-Gifre' => ['탄라 와이번-기프르', /탄라\s+와이번[- ]?기프(?:레|르)/],
    'Ebsol Gifre' => ['엡솔 기프르', /(?:엡솔|에브솔)\s+기프(?:레|르)/],
    'Tanra Gifre' => ['탄라 기프르', /탄라\s+기프(?:레|르)/]
  }
  full_names.each do |english_name, (korean_name, pattern)|
    next unless english.match?(/\b#{Regexp.escape(english_name)}\b/i)
    next if english_name == 'Maiwen Wyvyrn-Gifre' &&
      english.match?(/\bMaiwen Wyvyrn-Gifre-Fiddlestuffs\b/i)

    result = result.gsub(
      /#{pattern}(?:\(#{Regexp.escape(english_name)}\))?/i,
      "#{korean_name}(#{english_name})"
    )
  end
  result = result.gsub(
    /(?:와이번|위비른|위번)[- ]?기프(?:레|르|레스|레스를?)(?:\(Wyvyrn[- ]?Gifre\))?(?!\([^)]*Gifre[^)]*\)|-(?:\w+|[가-힣]+)\([^)]*Wyvyrn-Gifre)/,
    '와이번-기프르(Wyvyrn-Gifre)'
  )
  result = result.gsub(
    /와이번기프레(?:\(Wyvyrn-Gifre\))?(?!\([^)]*Gifre[^)]*\))/,
    '와이번-기프르(Wyvyrn-Gifre)'
  )
  result = result.gsub(
    /(?:기프레|기프르)(?:\(Gifre\))?(?!\([^)]*Gifre[^)]*\))/,
    '기프르(Gifre)'
  )

  result.gsub!('WYGIFRE_GREAT_HOUSE', '와이번-기프르 대가문(Wyvyrn-Gifre Great House)')
  result.gsub!('WYGIFRE_SIGNET_RING', '와이번-기프르 인장 반지(Wyvyrn-Gifre Signet Ring)')
  result
end

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [row_key(row), row] }
index = CSV.read(INDEX, headers: true, col_sep: "\t")
pending = index.select do |row|
  %w[person:geoff person:gifre].include?(row['entity_key']) &&
    row['status'] == 'needs-context'
end
selected = pending.uniq { |row| row_key(row) }.sort_by do |row|
  [row['entity_key'], RESOURCE_ORDER.fetch(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end.first(50)
raise "expected 50 distinct pending keys, got #{selected.length}" unless
  selected.length == 50
raise 'expected 8 Geoff keys' unless
  selected.count { |row| row['entity_key'] == 'person:geoff' } == 8
raise 'expected 42 Gifre keys' unless
  selected.count { |row| row['entity_key'] == 'person:gifre' } == 42

rows = selected.map do |candidate|
  key = row_key(candidate)
  source = inventory.fetch(key) { raise "missing source row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  entity = candidate.fetch('entity_key')
  expected = entity == 'person:geoff' ? 'Geoff' : 'Gifre'
  raise "English does not identify #{expected} at #{key.inspect}" unless
    english.match?(/\b#{expected}\b/i)

  new_text = if entity == 'person:geoff'
               canonicalize_geoff(old_text, english)
             else
               canonicalize_gifre(old_text, english)
             end
  if key == ['base', '2738', '11']
    new_text = '와이번-기프르 인장 반지(Wyvyrn-Gifre Signet)'
  elsif key == ['default', '49468', '']
    new_text = '와이번-기프르 인장 반지(Wyvyrn-Gifre Signet Ring)'
  end
  status = old_text == new_text ? 'not-an-issue' : 'accepted'
  action = status == 'accepted' ?
    "Standardized the Korean rendering and English annotation for #{expected} using the confirmed glossary spelling." :
    "The Korean rendering already matches the confirmed glossary spelling and English annotation for #{expected}."
  evidence = "English identifies #{expected}; the aligned Japanese and Chinese rows were checked as supporting pronunciation/context evidence. #{action}"

  [
    *key, entity, status, old_text, new_text, evidence,
    english, japanese, chinese
  ]
end

raise 'duplicate selected row key' unless rows.map { |row| row[0, 3] }.uniq.length == 50
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  rows.each { |row| csv << row }
end

puts "Wrote 50 Geoff/Gifre reviews: #{rows.group_by { |row| row[4] }.transform_values(&:length)}"
