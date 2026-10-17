#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

abort 'usage: review-proper-name-place-windemere-continuation.rb START_D' unless ARGV.length == 1

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:windemere'
english_name = 'Windemere'
korean_name = '윈더미어'
existing_definition = glossary.select { |row| row['entity_key'] == entity }
raise 'duplicate Windemere glossary entity' if existing_definition.length > 1

definition = if existing_definition.empty?
  glossary.headers.zip([
    entity, english_name, 'place', "#{korean_name}(#{english_name})",
    'Castle Windemere|Windemere Castle|Kingdom of Windemere|Windemere Stone',
    '윈드미어',
    'base:2671|base:461|default:20433|default:22873|default:38422',
    'confirmed',
    'English names the place; Japanese ウィンダメア and Chinese 温德米尔 corroborate. Reuse the accepted project spelling 윈더미어 (D-19776, D-19780, D-19785). The official Korean manual reference and extraction were checked but do not mention Windemere, so no manual spelling is inferred. Maid of Windemere is a separate person/title: never annotate or rewrite 윈더미어의 시녀 as a place component. Pair Castle Windemere/Windemere Castle, Kingdom of Windemere, and Windemere Stone as complete labels.'
  ]).to_h
else
  row = existing_definition.first
  raise 'existing Windemere glossary definition conflicts with reviewed canonical' unless
    row['english_canonical'] == english_name &&
    row['category'] == 'place' &&
    row['korean_canonical'] == "#{korean_name}(#{english_name})"
  row.to_h
end

inventory = m.refresh_inventory.values
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
indexed = index.select { |row| row['entity_key'] == entity }.to_h { |row| [m.key(row), row] }
generated.each do |occurrence|
  key = m.key(occurrence)
  next if indexed.key?(key)
  occurrence['korean_current'] = sources.fetch(key).fetch('work_text')
  index << occurrence
end

particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라 은 는 이 가 을 를 와 과 의
  에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')

name_pattern = /(?<![가-힣])(?<name>윈더미어|윈드미어)(?:\s*\(Windemere\))?(?<particle>#{particle_pattern})?(?![가-힣])/
compound_specs = [
  {
    english: /\b(?:Castle Windemere|Windemere Castle)\b/i,
    korean: /(?<![가-힣])(?:윈더미어|윈드미어)(?:\s*\(Windemere\))?\s*성(?:\s*\((?:Castle Windemere|Windemere Castle)\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    korean_canonical: '윈더미어 성',
    label: 'Castle Windemere'
  },
  {
    english: /\bKingdom of Windemere\b/i,
    korean: /(?<![가-힣])(?:윈더미어|윈드미어)(?:\s*\(Windemere\))?\s*왕국(?:\s*\(Kingdom of Windemere\))?(?<particle>#{particle_pattern})?(?![가-힣])/i,
    korean_canonical: '윈더미어 왕국',
    label: 'Kingdom of Windemere'
  },
  {
    english: /\bWindemere Stone\b/i,
    korean: /(?<![가-힣])(?:윈더미어|윈드미어)(?:\s*\(Windemere\))?(?:의\s*)?돌(?:\s*\(Windemere Stone\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    korean_canonical: '윈더미어의 돌',
    label: 'Windemere Stone'
  }
].freeze
maid_pattern = /\b(?:The\s+)?Maid(?:\s+of)?\s+Windemere(?:'s)?\b/i
place_word_pattern = /(?<![A-Za-z])Windemere(?![A-Za-z])/i
title_korean_pattern = /\A\s*의\s*시녀/
compound_tail_pattern = /\A\s*(?:성|왕국|의\s*돌)\s*\(/

def source_place_text(texts, maid_pattern)
  texts.map { |text| text.to_s.gsub(maid_pattern, ' ') }.join("\n")
end

def replace_compounds(text, source_text, specs)
  found = false
  changed = false
  missing = []
  specs.each do |spec|
    source_match = source_text.match(spec.fetch(:english))
    next unless source_match
    english_label = source_match[0]
    korean_matches = text.to_enum(:scan, spec.fetch(:korean)).map { Regexp.last_match.dup }
    if korean_matches.empty?
      missing << spec.fetch(:label)
      next
    end
    found = true
    korean_matches.reverse_each do |match|
      particle = match[:particle].to_s
      replacement = "#{spec.fetch(:korean_canonical)}(#{english_label})#{particle}"
      next if replacement == match[0]
      text[match.begin(0)...match.end(0)] = replacement
      changed = true
    end
  end
  [text, found, changed, missing]
end

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  raise "missing aligned Japanese/Chinese evidence for #{key.inspect}" if japanese.empty? || chinese.empty?
  old = source.fetch('work_text')
  location_source = source_place_text(english_texts, maid_pattern)
  has_place = location_source.match?(place_word_pattern)
  text = old.dup
  found = false
  changed = false
  missing_compounds = []

  if has_place
    text, compound_found, compound_changed, missing_compounds =
      replace_compounds(text, location_source, compound_specs)
    found ||= compound_found
    changed ||= compound_changed

    unless missing_compounds.empty?
      text = old.dup
      found = false
      changed = false
    else
      text.to_enum(:scan, name_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
        before = text[0...match.begin(0)]
        after = text[match.end(0)..].to_s
        next if before.count('(') > before.count(')')
        next if after.match?(title_korean_pattern)
        next if match[:particle].to_s == '의' && after.match?(/\A\s*시녀/)
        next if after.match?(compound_tail_pattern)
        found = true
        particle = match[:particle].to_s
        replacement = "#{korean_name}(#{english_name})#{particle}"
        next if replacement == match[0]
        text[match.begin(0)...match.end(0)] = replacement
        changed = true
      end
    end
  end

  status, evidence = if !has_place
    [
      'excluded',
      'The English hit belongs only to the named Maid of Windemere person/title, outside this place entity scope. Excluded rather than resolved as a place occurrence; preserve the complete Korean title and do not annotate its Windemere component.'
    ]
  elsif !missing_compounds.empty?
    [
      'uncertain',
      "English identifies the complete place compound(s) #{missing_compounds.join(', ')}, corroborated by Japanese and Chinese, but no safely bounded matching Korean compound was found. Left the entire cell unchanged rather than annotate only a component."
    ]
  elsif !found
    [
      'uncertain',
      'English identifies Windemere as a place and Japanese/Chinese corroborate, but no safely bounded Korean place-name span was found outside Maid of Windemere. Left unchanged.'
    ]
  elsif changed
    [
      'accepted',
      'English identifies Windemere as a place; Japanese ウィンダメア and Chinese 温德米尔 corroborate. Reused the accepted Korean place spelling 윈더미어, paired complete castle/kingdom/stone labels atomically, and preserved Maid of Windemere titles, particles, placeholders, line breaks, and surrounding text. The official Korean manual reference/extraction has no Windemere entry; no manual spelling was inferred.'
    ]
  else
    [
      'not-an-issue',
      'English identifies the place and Japanese ウィンダメア / Chinese 温德米尔 corroborate. The Korean place span already uses the accepted 윈더미어 form and is paired or contextually complete; no edit is needed. Maid of Windemere titles and complete compounds were preserved.'
    ]
  end

  text = old.dup if status == 'uncertain'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'duplicate generated Windemere row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
raise 'non-accepted Windemere edit' unless
  reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }

m.write_table(glossary_path, glossary.headers,
              glossary.map(&:to_h) + (existing_definition.empty? ? [definition] : []))
m.write_table(m::INDEX, index.headers, index)
out = File.join(__dir__, 'proper-name-reviewed-windemere-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "Windemere: #{reviews.length} source rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
m.run(out, Integer(ARGV.fetch(0)), 50)
