#!/usr/bin/env ruby

require 'csv'
require 'json'

RULES = {
  'Almain' => ['알마인', %w[알마인 알메인]],
  'Varani' => ['바라니', %w[바라니 바리니]],
  'Ljosalfar' => ['료스알브', %w[료스알브 로살파르 로사르파르 로사르파 로살파]],
  'Dokkalfar' => ['도크알브', %w[도크알브 도칼파르 도카르파르 도칼파 도카르파]]
}.freeze

headers = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese]
rows = []
CSV.foreach('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t") do |row|
  english = JSON.parse(row['en_texts_json']).join("\n---\n")
  names = RULES.keys.select { |name| english.match?(/\b#{name}s?\b/i) }
  next if names.empty?
  old = row['work_text']
  text = old.dup
  missing = []
  names.each do |name|
    canonical, variants = RULES.fetch(name)
    pattern = Regexp.union(variants.sort_by { |variant| -variant.length })
    found = false
    text.gsub!(/#{pattern}(어)?(?:[ \t]*\(#{name}s?\))?/i) do |matched|
      found = true
      match = Regexp.last_match
      language = match[1].to_s
      suffix = match.post_match
      compound = suffix.match(/\A[^()\r\n]{0,40}\(([^)]+)\)/)
      whole_title = compound && compound[1].match?(/\b#{name}s?\b/i)
      if whole_title && !matched.include?('(')
        canonical + language
      else
        canonical + language + "(#{name})"
      end
    end
    missing << name unless found
  end
  status = missing.empty? ? (text == old ? 'not-an-issue' : 'accepted') : 'uncertain'
  text = old unless missing.empty?
  evidence = 'D-20392 official Korean manual PDF p.1 (peoples), English named ethnic context; '
  evidence += "Japanese #{JSON.parse(row['ja_texts_json']).join(' | ')}; Chinese #{row['zh_text']}"
  evidence += "; no recognized Korean counterpart for #{missing.join('|')}" unless missing.empty?
  rows << [
    row['resource'], row['ID_Linha'], row['Tipo_Variante'],
    names.map { |name| "people:#{name.downcase}" }.join('|'),
    status, old, text, evidence, english,
    JSON.parse(row['ja_texts_json']).join("\n---\n"), row['zh_text']
  ]
end
path = File.join(__dir__, 'proper-name-proposals-peoples-D20392.tsv')
CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << headers
  rows.each { |row| csv << row }
end
puts "reviewed distinct rows=#{rows.length}"
puts rows.group_by { |row| row[4] }.transform_values(&:length).inspect
rows.select { |row| row[4] == 'uncertain' }.each do |row|
  puts "#{row[0]}:#{row[1]} #{row[8].gsub(/\s+/, ' ')} | #{row[5].gsub(/\s+/, ' ')}"
end
