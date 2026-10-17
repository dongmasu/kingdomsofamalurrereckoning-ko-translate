#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
inventory = m.refresh_inventory
index = m.table(m::INDEX)
patches = {
  '10596' => ['여름의 페이', '여름 페이(Summer Fae)'],
  '11415' => ['여름과 겨울의 페이', '여름 페이(Summer Fae)와 겨울 페이(Winter Fae)'],
  '25437' => ['윈터 페이', '겨울 페이(Winter Fae)'],
  '26072' => ['소로우즈의 페이', '비탄의 페이(Fae of Sorrows)'],
  '30187' => ['시일리 페이', '실리 페이(Seelie Fae)'],
  '32987' => ['윈터 페이', '겨울 페이(Winter Fae)'],
  '44880' => ['세엘리 페이', '실리 페이(Seelie Fae)'],
  '50784' => ['언시일리(Unseelie) 페이', '언실리 페이(Unseelie Fae)']
}.freeze
reviews = (patches.keys + ['18225']).sort_by(&:to_i).map do |id|
  key = ['default', id, '']
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  occurrences = index.select { |row| m.key(row) == key && row['entity_key'].start_with?('people:') && row['entity_key'].include?('fae') }
  raise "no held Fae entity #{id}" unless occurrences.any? { |row| row['status'] == 'uncertain' }
  if id == '18225'
    raise 'Fae lands source changed' unless JSON.parse(source['en_texts_json']).compact.join.include?('heart of the Fae lands')
    text = old
    status = 'excluded'
    evidence = 'English Fae lands names a territorial concept, represented atomically as 페이랜드(Faelands) in Korean, with Japanese フェイランド and Chinese 灵族大陆 corroborating. It is not an independently displayed Fae-race span in this row. Exclude the race-component hit and preserve the correctly paired full place name.'
  else
    from, to = patches.fetch(id)
    raise "reviewed Fae variant changed #{id}" unless old.include?(from)
    text = old.sub(from, to)
    text.gsub!(/(?<![가-힣])페이(?!랜드|블레이드|지|트위버|헌터|\s*\()/, '페이(Fae)')
    status = 'accepted'
    evidence = 'Focused EN/JA/ZH comparison resolves the Korean variant, not an identity ambiguity: 여름의 페이=Summer Fae, 윈터 페이=Winter Fae, 소로우즈의 페이=Fae of Sorrows, 시일리/세엘리 페이=Seelie Fae, and 언시일리(Unseelie) 페이=Unseelie Fae. Pair the complete qualified group name and any independent Fae mention, preserving all other names, particles, token boundaries, and line breaks. At default:11415 English coordinates Summer and Winter Fae; restore both complete Korean group names without assuming a new group identity. Update existing indexed keys only.'
  end
  decisions = occurrences.to_h { |row| [row['entity_key'], status] }
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => decisions.keys.join('|'), 'status' => status,
    'old' => old, 'new' => text, 'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(decisions)
  }
end
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
variants = {
  'people:summer-fae' => ['여름의 페이'],
  'people:winter-fae' => ['윈터 페이', '겨울의 페이'],
  'people:fae-of-sorrows' => ['소로우즈의 페이'],
  'people:seelie-fae' => ['시일리 페이', '세엘리 페이'],
  'people:unseelie-fae' => ['언시일리(Unseelie) 페이']
}
glossary.each do |row|
  additions = variants[row['entity_key']]
  row['korean_variants'] = (row['korean_variants'].to_s.split('|') + additions).uniq.join('|') if additions
  next unless row['entity_key'].start_with?('people:') && row['entity_key'].include?('fae')
  evidence = index.select { |occurrence| occurrence['entity_key'] == row['entity_key'] }
    .sort_by { |occurrence| [m::RESOURCES.index(occurrence['resource']), occurrence['ID_Linha'].to_i] }
  row['evidence_ids'] = evidence.first(6).map { |occurrence| [occurrence['resource'], occurrence['ID_Linha'], occurrence['Tipo_Variante']].reject { |value| value.to_s.empty? }.join(':') }.join('|')
end
m.write_table(glossary_path, glossary.headers, glossary)
out = File.join(__dir__, "proper-name-reviewed-fae-variants-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil, review_states: %w[uncertain not-an-issue accepted])
