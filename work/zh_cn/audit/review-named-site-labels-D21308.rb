#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English is the semantic anchor; aligned Japanese and Chinese are supporting evidence. Official Korean manual PDF pp. 1 and 9 supply world and named-location/map context, not an exhaustive gazetteer. Register exact complete names only, without creating bare surname/location aliases.'
specs = [
  {key: 'place:snakestail-grotto', english: 'Snakestail Grotto', category: 'place',
   korean: '스네이크테일 동굴(Snakestail Grotto)', count: 1,
   notes: 'default:19487 names Snakestail Grotto; Japanese スネークテイル洞 corroborates the cave. Chinese 蛇尾河 differs in geographical suffix; English and Japanese support retaining 동굴 rather than changing it to a river.'},
  {key: 'place:galette-shrine', english: 'Galette Shrine', category: 'place',
   korean: '갈레트의 성소(Galette Shrine)', count: 1,
   notes: 'default:23704 has the exact shrine label; Japanese ガレットの祭壇 and Chinese 盖莱特神殿 corroborate. Retain 갈레트 as in the separately registered Galette Inn; do not merge either place.'},
  {key: 'place:wardens-dell-falls', english: "Warden's Dell Falls", category: 'place',
   korean: "워든스 델 폭포(Warden's Dell Falls)", count: 1,
   notes: "default:46172 names Warden's Dell Falls; Japanese ウォーデンのデルフォール and Chinese 典狱长的溪谷瀑布 support a named waterfall. Retain the existing Korean wording and pair the complete source name."},
  {key: 'place:crofters-falls', english: "Crofter's Falls", category: 'place',
   korean: "크로프터스 폭포(Crofter's Falls)", count: 1,
   notes: "default:59793 names Crofter's Falls; Japanese クロフターズ・フォールズ and Chinese 佃农的瀑布 support the waterfall label. Preserve the Korean spelling; add the full English annotation."},
  {key: 'title:didens-folly', english: "Diden's Folly", category: 'title',
   korean: "디든의 어리석음(Diden's Folly)", count: 1,
   notes: "default:63145 has Diden's Folly, Japanese ダイデンズ・フォリー and Chinese 迪登的愚蠢. Preserve the current Korean and register the named label as title only: this standalone row does not establish whether it is a location, work, or quest, nor identity with Loch Diden."},
  {key: 'place:oasis-of-ingress', english: 'Oasis of Ingress', category: 'place',
   korean: '잉그레스 오아시스(Oasis of Ingress)', variants: '잉그레스의 오아시스', count: 2,
   notes: 'default:35867 welcomes the player to the Oasis of Ingress and default:64848 names it. Japanese イングレス・オアシス and Chinese 英格雷斯绿洲 corroborate. Normalize the two Korean forms to 잉그레스 오아시스 and pair the complete name, preserving the independently established 미사루(Mitharu) reference.'},
  {key: 'place:remes-camp', english: "Remes' Camp", category: 'place',
   korean: "레메스의 야영지(Remes' Camp)", count: 1,
   notes: "default:65075 names Remes' Camp; Japanese レメスのキャンプ and Chinese 雷米斯营地 corroborate. Retain the complete Korean label and do not infer a separate person or alias Remes."}
]
expected = {
  '19487' => ['스네이크테일 동굴', specs[0][:korean]],
  '23704' => ['갈레트의 성소', specs[1][:korean]],
  '46172' => ['워든스 델 폭포', specs[2][:korean]],
  '59793' => ['크로프터스 폭포', specs[3][:korean]],
  '63145' => ['디든의 어리석음', specs[4][:korean]],
  '35867' => ['잉그레스의 오아시스', specs[5][:korean]],
  '64848' => ['잉그레스 오아시스', specs[5][:korean]],
  '65075' => ['레메스의 야영지', specs[6][:korean]]
}.freeze

ReviewedDiscoverySpecs.run(21308, 'Complete Named Site Labels', specs, context,
                           '## D-21273:') do |_spec, key, text, _source|
  raise "unexpected resource #{key.inspect}" unless key[0] == 'default'
  old, replacement = expected.fetch(key[1])
  raise "unexpected Korean #{key.inspect}" unless text.include?(old)
  [text.sub(old, replacement), false]
end
