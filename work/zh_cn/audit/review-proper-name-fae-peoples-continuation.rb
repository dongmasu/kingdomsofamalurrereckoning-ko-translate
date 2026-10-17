#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
specs = [
  ['Fae', '페이', ['페이']],
  ['Summer Fae', '여름 페이', ['여름 페이']],
  ['Winter Fae', '겨울 페이', ['겨울 페이']],
  ['Wild Fae', '야생 페이', ['야생 페이']],
  ['Seelie Fae', '실리 페이', ['실리 페이', '실리페이']],
  ['Unseelie Fae', '언실리 페이', ['언실리 페이', '언실리페이']],
  ['Tuatha Fae', '투아사 페이', ['투아사 페이', '투아타 페이']],
  ['Fae of Sorrows', '비탄의 페이', ['비탄의 페이']]
]
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
inventory = m.refresh_inventory
definitions = specs.map do |english, korean, variants|
  entity = "people:#{english.downcase.tr(' ', '-')}"
  raise "already registered #{entity}" if glossary.any? { |row| row['entity_key'] == entity }
  glossary.headers.zip([
    entity, english, 'people', "#{korean}(#{english})", '', variants.reject { |value| value == korean }.join('|'),
    'default:17355|default:11236|default:61284|default:57123', 'confirmed',
    'English race/seasonal-group identity is primary. Japanese フェイ/サマー・フェイ/ウィンター・フェイ and Chinese 灵族/夏灵/冬灵 corroborate. Preserve established 페이 and complete qualified group labels; do not alter Faelands, Faeblades, Fateweaver or ordinary 페이지. Manual PDF p. 1 supplies eastern-war setting context, not a complete Fae taxonomy.'
  ]).to_h
end
generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
raise 'Fae source scope changed' unless generated.count { |row| row['entity_key'] == 'people:fae' } == 1312
spec_by_entity = definitions.zip(specs).to_h { |definition, spec| [definition['entity_key'], spec] }
explicit_subjects = {
  ['default', '27083', ''] => ['우린 손님을', '우리 페이(Fae)는 손님을'],
  ['default', '57123', ''] => ['우리는 미든(Midden)을', '우리 겨울 페이(Winter Fae)는 미든(Midden)을']
}.freeze
reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  text = old.dup
  visible = english.gsub(/\$[^$]*\$/, ' ').match?(/(?<![A-Za-z])Fae(?![A-Za-z])/i)
  if explicit_subjects.key?(key)
    from, to = explicit_subjects.fetch(key)
    raise "explicit Fae subject changed #{key.inspect}" unless old.start_with?(from)
    text.sub!(from, to)
  end
  if key[0] == 'default' && %w[34684 34685].include?(key[1])
    raise "explicit Fae alias changed #{key.inspect}" unless text.include?('요정')
    text.sub!('요정', '페이(Fae)')
  end
  if visible
    specs.drop(1).sort_by { |english_name, _korean, _variants| -english_name.length }.each do |english_name, korean, variants|
      next unless english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
      pattern = Regexp.new("(?<![가-힣])(?:#{variants.map { |value| Regexp.escape(value) }.join('|')})(?:\\s*\\((?<label>[^()]*)\\))?")
      text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
        label = match[:label]
        next if label && !label.match?(/(?<![A-Za-z])Fae(?![A-Za-z])/i)
        next if text[0...match.begin(0)].count('(') > text[0...match.begin(0)].count(')')
        text[match.begin(0)...match.end(0)] = "#{korean}(#{english_name})"
      end
    end
    pattern = /(?<![가-힣])페이(?!랜드|블레이드|지|트위버|헌터)(?:\s*\((?<label>[^()]*)\))?/
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      next if match[:label]
      next if text[0...match.begin(0)].count('(') > text[0...match.begin(0)].count(')')
      text[match.begin(0)...match.end(0)] = '페이(Fae)'
    end
  end
  labels = text.scan(/\(([^()]*)\)/).flatten
  decisions = occurrences.to_h do |occurrence|
    entity = occurrence['entity_key']
    english_name, _korean, _variants = spec_by_entity.fetch(entity)
    covered = labels.any? { |label| label.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i) }
    [entity, !visible ? 'excluded' : (!covered ? 'uncertain' : (old == text ? 'not-an-issue' : 'accepted'))]
  end
  text = old if decisions.values.include?('uncertain')
  decisions.transform_values! { |status| status == 'accepted' ? 'not-an-issue' : status } if text == old
  status = if decisions.values.include?('uncertain')
             'uncertain'
           elsif !visible
             'excluded'
           else
             text == old ? 'not-an-issue' : 'accepted'
           end
  evidence = 'English names the Fae race and, where explicit, a qualified seasonal/group name; aligned Japanese and Chinese corroborate. Pair complete group names atomically and generic 페이 as 페이(Fae), preserving particles, repeated mentions, existing unrelated full labels, and every token, number and line ending. Exclude Faelands, Faeblades, Fateweaver, and the ordinary word 페이지 from replacement. Manual p. 1 provides world context, not an exhaustive taxonomy.'
  evidence += ' English explicitly says We Fae/We Winter Fae; restore that source-confirmed subject from the shortened Korean pronoun. English and Chinese confirm the Winter qualification at default:57123, while Japanese shortens it to we.' if explicit_subjects.key?(key)
  evidence += ' English Fae, Japanese フェイ and Chinese 灵族 confirm that Korean 요정 here denotes the same race, not a distinct fairy entity.' if key[0] == 'default' && %w[34684 34685].include?(key[1])
  evidence += ' A source group has no safely identified Korean span/covering label; the entire cell remains unchanged pending focused review.' if status == 'uncertain'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => occurrences.map { |row| row['entity_key'] }.join('|'),
    'status' => status, 'old' => old, 'new' => text, 'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(decisions)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, "proper-name-reviewed-fae-peoples-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
puts "#{generated.length} Fae entity matches; #{reviews.length} row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
m.run(out, start_d, nil)
