#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21167)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  ['place:brigand-hall', 'Brigand Hall', '브리건드 홀(Brigand Hall)', '', 'English identifies the notorious thieves den and the Warsworn/Niskaru cavern destination; Japanese ブリガンド・ホール/ブリガンド洞窟 and Chinese 强盗大厅 corroborate. Reuse the established 브리건드 홀, not alternating 회관/전당/literal 도적단.'],
  ['place:brigand-hall-caverns', 'Brigand Hall Caverns', '브리건드 홀 동굴(Brigand Hall Caverns)', '', 'English gives the complete Caverns location label; Japanese ブリガンド・ホール洞窟 and Chinese 强盗大厅洞穴 corroborate. Use one complete bilingual name, not nested Brigand Hall parentheses.'],
  ['place:dark-harbor', 'Dark Harbor', '다크 하버(Dark Harbor)', '', 'English identifies Dead Kel’s private port and former Dvergan shipyard; Japanese ダークハーバー/ダーク・ハーバー and Chinese 黑暗港湾/黑暗港口 corroborate. Reuse the repeated 다크 하버 rather than literal 어두운/어둠의 항구.'],
  ['place:bitter-cove', 'Bitter Cove', '비터 코브(Bitter Cove)', '', 'English identifies the dangerous refuge/storage destination east by the hills; Japanese ビター洞穴 and Chinese 严寒洞穴/苦海湾 corroborate identity but do not establish a consistent topographic translation. Reuse the predominant bilingual 비터 코브 without inferring a bay or gorge from inconsistent support labels.'],
  ['place:lunar-gardens', 'Lunar Gardens', '달빛 정원(Lunar Gardens)', 'Garden of Eternal Night', 'English explicitly identifies the magically night-bound Rathir gardens and gives Garden of Eternal Night as an alternate name at 12579. Japanese 月の庭園/永遠の夜の庭 and Chinese 月光花园/永夜花园 corroborate. Reuse repeated 달빛 정원; preserve the distinct alias wording 영원한 밤의 정원(Garden of Eternal Night).'],
  ['place:mudhold-fasting', 'Mudhold Fasting', '머드홀드 패스팅(Mudhold Fasting)', '', 'English names Angharad’s underground cavern refuge, not abstention from food. Japanese マッドホールド地下通路 and Chinese 泥岩通道 corroborate a named location. Reuse the repeated full-name 머드홀드 패스팅; replace literal 단식, isolated 파스팅, and inferred 격리소.'],
  ['place:sundur-caverns', 'Sundur Caverns', '순두르 동굴(Sundur Caverns)', '', 'English names the cave lair of Nix in eastern Haxhi. Japanese サンドゥール洞窟 alongside サンダー洞窟 and Chinese 桑达尔洞穴 corroborate. Preserve the source Sundur spelling and existing 순두르 at 15670/38556, rather than English-Thunder-like 선더.'],
  ['place:weeping-gorge', 'Weeping Gorge', '위핑 협곡(Weeping Gorge)', '', 'English identifies the named chasm crossed by the bridge summoned after defeating Sir Elswin. Japanese 嘆きの渓谷 and Chinese 悲泣/哭泣峡谷 corroborate. Reuse the predominant 위핑 협곡, not alternating 울음/비탄의 협곡.'],
  ['place:bracken-bay', 'Bracken Bay', '브래컨 만(Bracken Bay)', '', 'English names the bay sheltering Rathir’s northern Quays; Japanese ブラッケン湾 and Chinese 布拉肯湾 corroborate. Reuse 브래컨 만 at 7109/53184; normalize isolated 브래큰.'],
  ['place:glen-suthain', 'Glen Suthain', '글렌 수세인(Glen Suthain)', '', 'English identifies the Alfar ancestral homeland/frozen forest in two histories and Eleanor/Tirin accounts; Japanese グレン渓谷 and Chinese 苏塞恩峡谷 corroborate identity. Reuse the repeated 글렌 수세인; normalize isolated 수테인 and add missing local English glosses without changing the existing histories or other names.'],
  ['place:loch-diden', 'Loch Diden', '다이덴 호수(Loch Diden)', '', 'English names the lake at Didenhil; Japanese ダイデン湖 and Chinese 迪登湖 corroborate both lake and shared Diden stem. Align with established 다이덴힐(Didenhil): use 다이덴 호수 rather than 로크 디든/로크 다이덴/디덴 호수. At 21097 retain shoreline meaning as 호수 기슭 rather than splicing a gloss into 호숫가.']
]
definitions = specs.map do |entity, english, korean, aliases, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => 'place', 'korean_canonical' => korean,
    'english_aliases' => aliases, 'korean_variants' => '',
    'evidence_ids' => 'D-21167-D-21168', 'status' => 'confirmed',
    'notes' => "#{note} Official Korean manual PDF pp. 1 and 4 provides homeland/race and map/location context; p. 7 distinguishes faction and other quests. It is not an exhaustive location gazetteer."
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
  if entities.include?('place:brigand-hall')
    stem = '(?:브리건드 (?:홀|전당|회관)|도적들의 전당|도적단 회관|산적 전당)'
    text.gsub!(/#{stem}(?:\(Brigand Hall\))?\s*동굴(?:\(Brigand Hall Caverns\))?/, "\u0001CAVERN\u0002")
    text.gsub!(/#{stem}(?:\(Brigand Hall\))?/, '브리건드 홀(Brigand Hall)')
    text.gsub!("\u0001CAVERN\u0002", '브리건드 홀 동굴(Brigand Hall Caverns)')
  end
  text.gsub!(/(?:다크 하버|어두운 항구|어둠의 항구)(?:\(Dark Harbor\))?/, '다크 하버(Dark Harbor)') if entities.include?('place:dark-harbor')
  text.gsub!(/비터 (?:만|코브)(?:\(Bitter Cove\))?/, '비터 코브(Bitter Cove)') if entities.include?('place:bitter-cove')
  text.gsub!(/(?:달의 정원|달빛 정원|월광 정원)(?:\(Lunar Gardens\))?/, '달빛 정원(Lunar Gardens)') if entities.include?('place:lunar-gardens')
  if entities.include?('place:mudhold-fasting')
    text.gsub!(/머드홀드(?:\(Mudhold\))? (?:패스팅|파스팅|단식|격리소)(?:\(Mudhold Fasting\))?/, '머드홀드 패스팅(Mudhold Fasting)')
    text.gsub!('머드홀드 패스팅(Mudhold Fasting)로', '머드홀드 패스팅(Mudhold Fasting)으로')
  end
  text.gsub!(/(?:순두르|선더) 동굴(?:\(Sundur Caverns\))?/, '순두르 동굴(Sundur Caverns)') if entities.include?('place:sundur-caverns')
  text.gsub!(/(?:위핑 협곡|울음 협곡|비탄의 협곡)(?:\(Weeping Gorge\))?/, '위핑 협곡(Weeping Gorge)') if entities.include?('place:weeping-gorge')
  text.gsub!(/브래(?:컨|큰) 만(?:\(Bracken Bay\))?/, '브래컨 만(Bracken Bay)') if entities.include?('place:bracken-bay')
  text.gsub!(/글렌 수(?:세|테)인(?:\(Glen Suthain\))?/, '글렌 수세인(Glen Suthain)') if entities.include?('place:glen-suthain')
  if entities.include?('place:loch-diden')
    text.gsub!('디덴 호숫가의', '다이덴 호수(Loch Diden) 기슭의')
    text.gsub!(/(?:로크 (?:다이덴|디든)|디덴 호수)(?:\(Loch Diden\))?/, '다이덴 호수(Loch Diden)')
  end
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => entities.map { |entity| definitions.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ') + ' Search spans affix/base/default. Only source-matched location spans and directly required particles change; preserve prior person/faction/other-entity decisions, opaque tokens, intentional line breaks and historical global totals.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
raise "unexpected source count #{reviews.length}" unless reviews.length == 98
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21167.tsv'), glossary.headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21167.tsv'), m::HEADERS.take(12), reviews)
puts "#{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
