#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_138
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
values = [
  [
    'place:cloudcrest-peak', 'Cloudcrest Peak', 'place',
    '클라우드크레스트 봉우리(Cloudcrest Peak)', '', '클라우드크레스트 봉우리',
    "D-#{d}", 'confirmed',
    'English names Cloudcrest Peak at default:23476 and CloudCrest Peak at default:39617. Japanese クラウドクレスト・ピーク and Chinese 云顶峰 agree. Reuse the existing bilingual Korean peak label and preserve source-local English case. Do not merge with Cloudcrest Mountain or Passage.'
  ],
  [
    'place:cloudcrest-passage', 'Cloudcrest Passage', 'place',
    '클라우드크레스트 통로(Cloudcrest Passage)', '', '클라우드크레스트 통로',
    "D-#{d}", 'confirmed',
    'English labels base:2301:11 and default:24901 as Cloudcrest Passage. Japanese クラウドクレストの通路 and Chinese 云顶通道 corroborate. Annotate the whole named passage, not only the Cloudcrest component; retain distinction from Peak and Mountain.'
  ],
  [
    'person:helyc-crosse', 'Helyc Crosse', 'person',
    '헬릭 크로스(Helyc Crosse)', 'Helyc', '헬릭|크로스',
    "D-#{d}", 'confirmed',
    'English explicitly identifies Helyc Crosse as the Teeth of Naros expedition leader. Japanese ヘリク・クロッセ and Chinese 赫利克·克罗塞 corroborate. Helyc is a row-scoped search alias; expedition, camp and journal contexts identify the leader. The unrelated brother/Warsworn reference default:4552 and isolated exclamation default:30418 do not establish the full-name link and remain uncertain and unchanged. Do not add Crosse as a global alias or conflate Lyenna/Helyca.'
  ],
  [
    'person:helyca-crosse', 'Helyca Crosse', 'person',
    '헬리카 크로스(Helyca Crosse)', '', '헬리카|크로스',
    "D-#{d}", 'confirmed',
    'English explicitly labels default:60240 Helyca Crosse and Chinese 赫利卡·克罗塞 agrees, while Japanese has the Helyc spelling ヘリク・クロッセ. Retain the English-led existing bilingual label. Register the explicit source form separately without asserting that Helyca is either the same person as or a different person from Helyc; identity equivalence remains unproved. No global surname alias.'
  ]
]
definitions = values.map { |row| glossary.headers.zip(row).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = {
  'place:cloudcrest-peak' => [['default', '23476', ''], ['default', '39617', '']],
  'place:cloudcrest-passage' => [['base', '2301', '11'], ['default', '24901', '']],
  'person:helyc-crosse' => [['base', '4144', '11']] + %w[
    1677 1805 2797 3118 4552 5184 6734 7003 15487 22979 24962
    27718 29046 29316 30418 30959 31738 36911 37137 44271 46401
    47138 53323 54200 58827
  ].map { |id| ['default', id, ''] },
  'person:helyca-crosse' => [['default', '60240', '']]
}
actual = generated.group_by { |row| row['entity_key'] }.transform_values do |rows|
  rows.map { |row| m.key(row) }.sort
end
raise 'unexpected Cloudcrest/Helyc source matches' unless actual == expected.transform_values(&:sort)
reviews = generated.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
end.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  entity = match.fetch('entity_key')
  held = entity == 'person:helyc-crosse' && %w[4552 30418].include?(key[1])
  if entity == 'place:cloudcrest-passage'
    proposed = '클라우드크레스트 통로(Cloudcrest Passage)'
  elsif entity == 'place:cloudcrest-peak'
    english_label = JSON.parse(source.fetch('en_texts_json')).compact.first
    proposed = "클라우드크레스트 봉우리(#{english_label})"
  elsif entity == 'person:helyc-crosse' && !held
    proposed.gsub!(/헬릭 크로스(?!\()/, '헬릭 크로스(Helyc Crosse)')
    proposed.gsub!(/헬릭(?! 크로스|\()/, '헬릭(Helyc)')
  end
  status = held ? 'uncertain' : (proposed == old ? 'not-an-issue' : 'accepted')
  evidence = if held
               'English gives only Helyc, without the full surname or expedition context. The brother who joined the Warsworn at 4552 and the isolated exclamation at 30418 cannot safely be linked to expedition leader Helyc Crosse from these rows. Retain the existing Korean; do not infer identity from a shared first name.'
             elsif entity == 'person:helyca-crosse'
               'English Helyca Crosse and Chinese 赫利卡·克罗塞 support the existing 헬리카 label; Japanese alone uses Helyc. Preserve the explicit English form and do not infer identity equivalence or distinction.'
             elsif entity.start_with?('place:')
               'English explicitly names the Peak or Passage; Japanese and Chinese corroborate. Use the full local English feature label, preserving CloudCrest case at 39617. Mountain, Peak and Passage remain separate source-indexed names.'
             else
               'English identifies the expedition leader Helyc Crosse or his camp/journal and expedition context. Japanese and Chinese corroborate. Reuse the existing bilingual full name and annotate missing short/full mentions only; no global Crosse alias or merger with Lyenna/Helyca.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
