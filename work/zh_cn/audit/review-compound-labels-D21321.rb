#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'These nine closed compound English names occur only as standalone base labels, with corresponding Japanese/Chinese names. Pair the existing Korean with the exact full English label; do not infer an equipment class, rarity, skill identity, or connection to similarly worded ordinary nouns. The official Korean manual PDF pp. 6-8 distinguishes inventory names, equipment classes and crafting components, but does not identify these individual titles. Register source-local titles rather than unsupported unique-item or skill identities. No alias expansion or global Korean-substring replacement.'
labels = [
  ['304', 'Stormblade', '폭풍 칼날', 'ストームブレード', '风暴之刃'],
  ['394', 'Frostmoon', '서리달', 'フロストムーン', '霜月'],
  ['630', 'Moonfrost', '달서리', 'ムーンフロスト', '月之霜华'],
  ['784', 'Darkaegis', '암흑 수호막', '闇の盾', '黑暗巨盾'],
  ['1219', 'Venomstrike', '맹독 강타', 'ベノムストライク', '毒液攻击'],
  ['1240', 'Stormbrand', '폭풍의 낙인', 'ストームブランド', '风暴巨剑'],
  ['1590', 'Mirrorknives', '거울칼', '鏡のナイフ', '镜子匕首'],
  ['1733', 'Coldspike', '한랭 가시', 'コールドスパイク', '寒冷尖刺'],
  ['1946', 'Stormseeker', '폭풍 추적자', 'ストームシーカー', '风暴寻求者']
].freeze
specs = labels.map do |id, english, korean, japanese, chinese|
  {key: "title:#{english.downcase}", english: english, category: 'title',
   korean: "#{korean}(#{english})", count: 1,
   notes: "Standalone base:#{id}:11 #{english}; Japanese #{japanese}, Chinese #{chinese}. Preserve #{korean} and add the complete English annotation. This is only a source-local naming disposition; subtype/identity beyond this exact label is not established."}
end
ReviewedDiscoverySpecs.run(21321, 'Standalone Compound Name Labels', specs,
                           context, '## D-21320:') do |spec, key, text, source|
  label = labels.find { |row| row[1] == spec[:english] }
  raise 'unexpected compound label/source' unless key == ['base', label[0], '11'] &&
    text == label[2] && JSON.parse(source['en_texts_json']).compact == [label[1]] &&
    JSON.parse(source['ja_texts_json']).compact == [label[3]] && source['zh_text'] == label[4]
  [spec[:korean], false]
end
