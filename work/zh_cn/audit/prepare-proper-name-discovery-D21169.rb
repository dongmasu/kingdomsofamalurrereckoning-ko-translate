#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21169)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  ['resource:scarwood-bark', 'Scarwood Bark', '스카우드 나무껍질(Scarwood Bark)', 'resource',
   'English lists Scarwood Bark as a repeatable alchemical reagent alongside other named plants; Japanese スカーウッドの樹皮 and Chinese 伤痕之木树皮 confirm bark, not an arbitrary tree. Reuse the existing Scarwood stem and normalize omitted/shortened 나무껍질 forms.'],
  ['resource:leechwood-bark', 'Leechwood Bark', '리치우드 나무껍질(Leechwood Bark)', 'resource',
   'English lists Leechwood Bark as an alchemical reagent; Japanese リーチウッドの樹皮 and Chinese 水蛭木树皮 corroborate. Normalize the localized Leechwood stem and omitted/shortened 나무껍질 forms.'],
  ['place:obsidian-isle', 'Obsidian Isle', '옵시디언 섬(Obsidian Isle)', 'place',
   'English names the island location in repeated travel, ship and quest references. Japanese オブシディアン島 and Chinese 黑曜石岛 corroborate. Reuse the repeated phonetic 옵시디언 섬, rather than one-off 오브시디언 or literal 흑요석.'],
  ['person:three-swords', 'Three Swords', '세 자루의 검(Three Swords)', 'person',
   'English explicitly calls Three Swords a Varani blademaster/mercenary and explains the epithet comes from his favored three weapons; dialogue, corpse objectives and his legendary blades refer to the same person. Japanese スリーソード and Chinese 传说三剑 corroborate. Normalize the source-specific epithet variants without treating the three weapons as a separate entity.'],
  ['unique item:honor-brands', 'Honor Brands', '아너 브랜드(Honor Brands)', 'unique item',
   'English calls Honor Brands forged Faeblades, including counterfeit blades made by Brit Hagni/Codgan and later Ysa-made authentic examples. Japanese オナーブランド and Chinese 荣耀之刃/荣誉佩剑 corroborate a named blade line, not generic honor marks. Normalize transliteration and literal Korean forms; preserve the Ysa-qualified complete title at default 64046.']
]
definitions = specs.map do |entity, english, korean, category, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => category, 'korean_canonical' => korean,
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21169-D-21170', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF pp. 4, 7 and 8 provides alchemy, equipment, and faction/quest context; it does not enumerate these named reagents or DLC locations."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  entities = by_key.fetch(key).map { |row| row['entity_key'] }.sort
  text.gsub!(/스카우드(?:\(Scarwood\))?\s*(?:나무)?껍질(?:\(Scarwood Bark\))?/, '스카우드 나무껍질(Scarwood Bark)') if entities.include?('resource:scarwood-bark')
  text.gsub!(/리치우드(?:\(Leechwood\))?\s*(?:나무)?껍질(?:\(Leechwood Bark\))?/, '리치우드 나무껍질(Leechwood Bark)') if entities.include?('resource:leechwood-bark')
  text.gsub!(/(?:옵시디언|오브시디언|흑요석) 섬(?:\(Obsidian Isle\))?/, '옵시디언 섬(Obsidian Isle)') if entities.include?('place:obsidian-isle')
  if entities.include?('person:three-swords')
    text.gsub!(/(?:세 자루의 검|세 자루 검|삼검|세 검|스리 소드|스리 소즈|쓰리 소드|쓰리 소즈)(?:\(Three Swords\))?/, '세 자루의 검(Three Swords)')
  end
  if entities.include?('unique item:honor-brands')
    text.gsub!(/이사의 (?:명예 표장|아너 브랜드)(?:\(Ysa Honor Brands\))?/, '이사의 아너 브랜드(Ysa Honor Brands)')
    text.gsub!(/(?:아너 브랜드|명예의 징표|명예의 낙인|명예 표장)(?:\(Honor Brands\))?/, '아너 브랜드(Honor Brands)')
  end
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => entities.map { |entity| definitions.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ') + ' All three resources searched. Normalize only exact source-matched spans; keep reagent quantities, formatting, other entities, existing terminal decisions and historical global totals unchanged.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
raise "unexpected source count #{reviews.length}" unless reviews.length == 90
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21169.tsv'), glossary.headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21169.tsv'), m::HEADERS.take(12), reviews)
puts "#{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
