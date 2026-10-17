#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'Cross-resource English source review with aligned Japanese/Chinese. Official manual PDF p. 9 distinguishes world locations, factions and shrines; it does not enumerate these sites. Complete compound item and location labels remain atomic. Generic lowercase cave descriptions and previously reviewed parent-entity decisions are preserved.'
specs = [
  {key: 'place:flooded-cavern', english: 'Flooded Cavern', aliases: 'Flooded Caverns',
   category: 'place', korean: '침수된 동굴(Flooded Cavern)', count: 13,
   variants: '물에 잠긴 동굴|홍수 동굴',
   notes: 'English journals/objectives identify the Gallows End cave and use capitalized Flooded Cavern/Caverns; Japanese 浸水した洞窟/水没した洞窟 and Chinese 水淹洞穴/淹水的洞穴 corroborate. Standardize named references to 침수된 동굴 with source-local singular/plural annotation. Lowercase flooded cavern descriptions at 10917, 11306, 40606 and 57689 remain descriptive and unchanged; do not infer named-label status from a case-insensitive matcher.'},
  {key: 'place:sanctuary-grotto', english: 'Sanctuary Grotto', category: 'place',
   korean: '안식처 동굴(Sanctuary Grotto)', count: 1,
   notes: 'default:33638 is the complete named cave label; Japanese 聖域洞 and Chinese 圣所洞穴 support it. Retain the current Korean rather than infer a relation to generic Sanctuaries.'},
  {key: 'place:executioners-den', english: "Executioner's Den", category: 'place',
   korean: "처형인의 소굴(Executioner's Den)", count: 4,
   notes: 'default:48665 identifies the mother’s former hideout and 61891 its trapdoor entrance. Japanese 処刑人の隠れ家 and Chinese 处刑人巢穴 corroborate. Retain 처형인의 소굴. Exclude base:2853 from this place scope because its complete named key item is separately registered; no nested annotations.'},
  {key: 'unique item:executioners-den-key', english: "Executioner's Den Key", category: 'unique item',
   korean: "처형인의 소굴 열쇠(Executioner's Den Key)", count: 1,
   notes: 'base:2853 is the full Executioner’s Den Key item, corroborated by Japanese 処刑人の隠れ家の鍵 and Chinese 处刑人巢穴的钥匙. Normalize 처형자의 은신처 to the location spelling 처형인의 소굴, preserving a single complete item annotation.'},
  {key: 'place:sirens-den', english: "Siren's Den", category: 'place',
   korean: "사이렌의 소굴(Siren's Den)", count: 6, variants: '세이렌의 소굴|사이렌 소굴',
   notes: 'English Olaf/Nesta quest journals identify the same northern hideout, Siren’s Den; Japanese サイレンの隠れ処 and Chinese 塞伦巢穴 corroborate. Reuse the already-bilingual majority 사이렌의 소굴, correcting the isolated 세이렌 and unlabelled short Korean forms. Preserve the final anaphoric 소굴 in default:4649 rather than duplicating the full name where Korean elides it.'},
  {key: 'place:berenikes-camp', english: "Berenike's Camp", category: 'place',
   korean: "베레니케의 야영지(Berenike's Camp)", count: 1,
   notes: 'default:37171 names the camp; Japanese ベレニケのキャンプ and Chinese 贝列尼可的营地 corroborate. Preserve the independently established 베레니케(Berenike) person spelling but register the complete camp as a separate place.'},
  {key: 'title:the-brownie-den', english: 'The Brownie Den', category: 'title',
   korean: '브라우니 소굴(The Brownie Den)', count: 2, variants: '브라우니 굴',
   notes: 'default:37398 and 61861 repeat the exact capitalized label, Japanese ブラウニーの巣 and Chinese 棕矮妖巢穴. Standardize the two Korean labels to 브라우니 소굴. Register only the named title; these two standalone rows do not establish that it is Rundamir, and generic brownie den mentions are not aliases.'},
  {key: 'place:sun-camp-ruins', english: 'Sun Camp ruins', category: 'place',
   korean: '태양 야영지 유적(Sun Camp ruins)', count: 3,
   variants: '태양 캠프 유적|태양 야영지(Sun Camp) 폐허|선 캠프(Sun Camp) 유적',
   notes: 'default:50705/52836/56122 repeat Sun Camp ruins; Japanese 太陽のキャンプの遺跡 and Chinese 太阳营地废墟 corroborate. D-20877/D-20878 place:sun-camp deliberately left this complete location label unchanged. Register this distinct complete ruins label, normalize all three to 태양 야영지 유적, and preserve the prior parent-scope exclusions without recounting them.'},
  {key: 'place:overlook-camp', english: 'Overlook Camp', category: 'place',
   korean: '전망대 야영지(Overlook Camp)', count: 1,
   notes: 'default:62923 is the exact camp label, corroborated by Japanese 見張りキャンプ and Chinese 俯瞰营地. Retain the Korean and pair the complete English name.'}
]
site_replacements = {
  'place:sanctuary-grotto' => '안식처 동굴',
  'place:berenikes-camp' => '베레니케의 야영지',
  'place:overlook-camp' => '전망대 야영지'
}.freeze
ReviewedDiscoverySpecs.run(21309, 'Cave and Camp Names', specs, context,
                           '## D-21308:') do |spec, key, text, source|
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  new_text = case spec[:key]
             when 'place:flooded-cavern'
               if %w[10917 11306 40606 57689].include?(key[1])
                 text
               else
                 label = english.include?('Flooded Caverns') ? '침수된 동굴(Flooded Caverns)' : spec[:korean]
                 raise "missing cave wording #{key.inspect}" unless text.match?(/(?:홍수 동굴|물에 잠긴 동굴|침수된 동굴)(?:\(Flooded Caverns?\))?/)
                 text.sub(/(?:홍수 동굴|물에 잠긴 동굴|침수된 동굴)(?:\(Flooded Caverns?\))?/, label)
               end
             when 'place:executioners-den'
               next [text, true] if key[0] == 'base'
               text.sub(/처형인의 소굴(?:\(Executioner's Den\))?/, spec[:korean])
             when 'unique item:executioners-den-key'
               raise 'unexpected key item' unless text == '처형자의 은신처 열쇠'
               spec[:korean]
             when 'place:sirens-den'
               text.sub(/(?:세이렌의 소굴|사이렌의 소굴|사이렌 소굴)(?:\(Siren's Den\))?/, spec[:korean])
             when 'title:the-brownie-den'
               raise 'unexpected brownie title' unless ['브라우니 굴', '브라우니 소굴'].include?(text)
               spec[:korean]
             when 'place:sun-camp-ruins'
               raise 'unexpected ruins label' unless ['태양 캠프 유적', '태양 야영지(Sun Camp) 폐허', '선 캠프(Sun Camp) 유적'].include?(text)
               spec[:korean]
             else
               raise 'unexpected standalone label' unless text == site_replacements.fetch(spec[:key])
               spec[:korean]
             end
  [new_text, false]
end
