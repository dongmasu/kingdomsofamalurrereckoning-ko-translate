#!/usr/bin/env ruby

require 'csv'
require 'json'

HOUSES = {
  'House of Ballads' => ['발라드의 집', /하우스 오브 발라드|발라드(?:의)? (?:집|가문|하우스)/],
  'House of Pride' => ['긍지의 집', /(?:긍지|자만|교만|오만|자존심|프라이드)(?:의)? (?:집|가문|하우스)|하우스 오브 프라이드/],
  'House of Seasons' => ['계절의 집', /(?:계절|시즌스)(?:의)? (?:집|가문|하우스)|하우스 오브 시즌스/],
  'House of Sorrows' => ['비탄의 집', /(?:비탄|슬픔|소로우)(?:의)? (?:집|가문|하우스)|하우스 오브 소로우/],
  'House of Valor' => ['용맹의 집', /(?:용맹|발로르|발러|밸러)(?:의)? (?:집|가문|전당|하우스)|하우스 오브 (?:발러|밸러|발로르|발로)/],
  'House of Vengeance' => ['복수의 집', /(?:복수|벤전스)(?:의)? (?:집|가문|하우스)|하우스 오브 벤전스/]
}.freeze
HEADERS = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese].freeze
rows = []
CSV.foreach('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t") do |row|
  english = JSON.parse(row['en_texts_json']).join("\n---\n")
  names = HOUSES.keys.select { |name| english.match?(/\b#{Regexp.escape(name)}\b/i) }
  next if names.empty?
  old = row['work_text']
  text = old.dup
  missing = []
  names.each do |name|
    canonical, pattern = HOUSES.fetch(name)
    # Source says Pride, not Valor; this is a verified wrong-faction reference.
    text = text.sub('용맹의 집', '긍지의 집') if row['resource'] == 'default' && row['ID_Linha'] == '20293'
    found = false
    text.gsub!(/(?:#{pattern})(?:[ \t]*\(#{Regexp.escape(name)}\))?/i) do |matched|
      found = true
      suffix = Regexp.last_match.post_match
      compound = suffix.match(/\A[^()\r\n]{0,40}\(([^)]+)\)/)
      whole_title = compound && compound[1].match?(/\b#{Regexp.escape(name)}\b/i)
      whole_title && !matched.include?('(') ? canonical : "#{canonical}(#{name})"
    end
    missing << name unless found
  end
  status = missing.empty? ? (text == old ? 'not-an-issue' : 'accepted') : 'uncertain'
  text = old unless missing.empty?
  evidence = 'D-20393 explicit English House title; Korean normalization from D-20382/D-20386; manual PDF p.7 faction context; '
  evidence += "Japanese #{JSON.parse(row['ja_texts_json']).join(' | ')}; Chinese #{row['zh_text']}"
  evidence += "; unmatched Korean #{missing.join('|')}" unless missing.empty?
  rows << [
    row['resource'], row['ID_Linha'], row['Tipo_Variante'],
    names.map { |name| 'faction:' + name.downcase.tr(' ', '-') }.join('|'),
    status, old, text, evidence, english,
    JSON.parse(row['ja_texts_json']).join("\n---\n"), row['zh_text']
  ]
end
CSV.open(File.join(__dir__, 'proper-name-proposals-houses-D20393.tsv'), 'w',
         col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  rows.each { |row| csv << row }
end
puts "distinct rows=#{rows.length}"
puts rows.group_by { |row| row[4] }.transform_values(&:length).inspect
rows.select { |row| row[4] == 'uncertain' }.each do |row|
  puts "#{row[0]}:#{row[1]} #{row[8].gsub(/\s+/, ' ')[0,190]} | #{row[5].gsub(/\s+/, ' ')[0,220]}"
end
