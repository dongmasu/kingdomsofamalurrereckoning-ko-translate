#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21165)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  ['place:craft-hall', 'Craft Hall', '장인의 전당(Craft Hall)', 'place',
   'English identifies the Didenhil artisans building founded/run by Cora; Japanese 職人の広間/職人館 and Chinese 工匠大厅 corroborate a named venue, not a crafting action. Reuse default 38 장인의 전당 and preserve the independently established Didenhil/Cora/Olin names.'],
  ['organization:aron-excavations', 'Aron Excavations', '아론 채굴사(Aron Excavations)', 'organization',
   'English identifies the mining outfit competing with Motus, with a mine and operations office. Japanese アロン採掘所 and Chinese 埃隆矿业 corroborate. Reuse 아론 and the explicit company rendering 채굴사 rather than alternating 발굴단/채굴장. Office and Mine are separate complete location labels; do not alter Edgar Aron or unrelated short Aron references.'],
  ['place:aron-excavations-office', 'Aron Excavations Office', '아론 채굴사 사무소(Aron Excavations Office)', 'place',
   'English Office, Japanese オフィス/事務所 and Chinese 办公室 identify the company office; pair its complete label without nested Aron or company parentheses.'],
  ['place:aron-excavations-mine', 'Aron Excavations Mine', '아론 채굴사 광산(Aron Excavations Mine)', 'place',
   'English Mine, Japanese 採掘所 and Chinese 矿场/矿井 identify the company mine; pair its complete label without nested company parentheses.'],
  ['lore:great-scale', 'Great Scale', '위대한 저울(Great Scale)', 'lore term',
   'English explicitly describes a mighty spell sealing doors, requiring summoned monsters and rebalancing, not an ordinary scale or a place name. Japanese 偉大なる天秤 and Chinese 大天平/巨大天平 corroborate. Reuse the repeated 위대한 저울 wording; keep ordinary short 저울 references unchanged.'],
  ['unique-item:great-scale-sigil-stone', 'Great Scale Sigil Stone', '위대한 저울의 인장석(Great Scale Sigil Stone)', 'unique item',
   'English labels the named sigil stone; Japanese 偉大なる天秤の印石 corroborates despite the Chinese literal 巨鳞. Pair the complete item label atomically.'],
  ['organization:crossing-keepers', 'Crossing Keepers', '교차점의 수호자들(Crossing Keepers)', 'organization',
   'English defines an ancient order of Fae journeymen guarding secret sources of Fae magic; Maxen/Halcyor and Pura plot establish the magical Crossing, not a road intersection or stone. Japanese 力の交差点の番人/クロッシングの番人 and Chinese 关口守护者/交汇守护者 corroborate. Reuse the meaningful 교차점의 수호자들 form at 48605, replacing 교차로/교차석/크로싱 variants only within exact source-matched rows.'],
  ['person:first-scaith', 'First Scaith', '최초의 스케이스(First Scaith)', 'person',
   'English identifies Faitir’s reanimated ancestor, with an explicit self-identification and repeated name labels. Japanese ファースト・スケイス/初代スケイス and Chinese 第一斯卡斯/先祖斯卡斯 corroborate. Reuse 최초의 스케이스 at 5873/47467; normalize only the full named title, not generic Scaith army references.']
]
definitions = specs.map do |entity, english, korean, category, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => category, 'korean_canonical' => korean,
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21165-D-21166', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF pp. 1, 4 and 7 supplies setting, crafting and faction/quest context, not an exhaustive roster of these names."
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
  entities = by_key.fetch(key).map { |row| row.fetch('entity_key') }.sort
  protected = {}
  protect = lambda do |pattern, replacement|
    text.gsub!(pattern) do
      token = "\u0001PN#{protected.length}\u0002"
      protected[token] = replacement
      token
    end
  end
  if entities.include?('place:craft-hall')
    text.gsub!(/(?:장인의 전당|제작자의 전당|제작의 전당|제작 공방|공예 작업장|공예 전당|공예 회관|제작자 회관)(?:\(Craft Hall\))?/, '장인의 전당(Craft Hall)')
    text.gsub!('다이덴힐(Didenhil) 장인들의 이름난 장인의 전당(Craft Hall)', '다이덴힐(Didenhil)의 이름난 장인의 전당(Craft Hall)')
  end
  if entities.include?('organization:aron-excavations')
    protect.call(/(?:아론(?:\(Aron\))?|애런)\s*(?:발굴|채굴)\s*사무소(?:\(Aron Excavations Office\))?/, '아론 채굴사 사무소(Aron Excavations Office)') if entities.include?('place:aron-excavations-office')
    protect.call(/(?:아론(?:\(Aron\))?|애런)\s*발굴\s*광산(?:\(Aron Excavations Mine\))?/, '아론 채굴사 광산(Aron Excavations Mine)') if entities.include?('place:aron-excavations-mine')
    text.gsub!(/아론(?:\(Aron\))?\s*(?:채굴 회사|채굴사|채굴장|채굴소|발굴단|발굴지)(?:\(Aron Excavations\))?/, '아론 채굴사(Aron Excavations)')
    text.gsub!('아론 채굴사(Aron Excavations)은', '아론 채굴사(Aron Excavations)는')
    text.gsub!('아론 채굴사(Aron Excavations)을', '아론 채굴사(Aron Excavations)를')
  end
  if entities.include?('lore:great-scale')
    protect.call(/위대한 저울의 인장석(?:\(Great Scale Sigil Stone\))?/, '위대한 저울의 인장석(Great Scale Sigil Stone)') if entities.include?('unique-item:great-scale-sigil-stone')
    text.gsub!(/(?:위대한 저울|거대한 저울|대저울)(?:\(Great Scale\))?/, '위대한 저울(Great Scale)')
  end
  if entities.include?('organization:crossing-keepers')
    text.gsub!(/(?:교차로의 수호자들|교차점의 수호자들|교차석의 수호자들|교차지기들|크로싱 수호자)(?:\(Crossing Keepers\))?/, '교차점의 수호자들(Crossing Keepers)')
    text.gsub!('교차점의 수호자들(Crossing Keepers)를', '교차점의 수호자들(Crossing Keepers)을')
  end
  if entities.include?('person:first-scaith')
    text.gsub!(/(?:최초의 스케이스|퍼스트 스케이스|첫 번째 스케이스|첫째 스케이스|첫 스케이스)(?:\(First Scaith\))?/, '최초의 스케이스(First Scaith)')
  end
  protected.each { |token, replacement| text.gsub!(token, replacement) }
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => entities.map { |entity| definitions.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ') + ' All three resources searched; preserve other names, existing decisions, formatting and historical global totals. Adjust only particles directly required by the changed Korean name endings (Aron company at 20693/50501/57092 and Keepers at 54080).',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
raise "unexpected source count #{reviews.length}" unless reviews.length == 61
paths = %w[proper-name-discovery-definitions-D21165.tsv proper-name-discovery-D21165.tsv]
m.write_table(File.join(__dir__, paths[0]), glossary.headers, definitions)
m.write_table(File.join(__dir__, paths[1]), m::HEADERS.take(12), reviews)
puts "#{reviews.length} rows; #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
