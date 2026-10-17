#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:reedsong-inn", english: "Reedsong Inn", category: "place",
   korean: "리드송 여관(Reedsong Inn)", count: 5,
   notes: "English names the inn both in repeated labels and in the welcome/donation dialogue. Japanese 葦歌の宿 and Chinese 芦歌旅馆 corroborate. Reuse base/default 리드송, replacing the alternate literal 갈대노래 only in the exact inn span; preserve Meyra and Lyria as separate names."},
  {key: "place:blue-bear-tavern", english: "Blue Bear Tavern", category: "place",
   korean: "블루 베어 주점(Blue Bear Tavern)", count: 5,
   notes: "English identifies the Emaire tavern, its owners and the adjacent forge. Japanese ブルーベア酒場 and Chinese 蓝熊酒馆 corroborate 주점 rather than inconsistent 여관/선술집. Reuse the complete accepted-looking label at default:27924, without reopening its other named people or staffs. Preserve source-local lowercase tavern at default:62891."},
  {key: "place:chinglous-inn", english: "Chinglous Inn", category: "place",
   korean: "칭글로우 여관(Chinglous Inn)", count: 1,
   notes: "English standalone label explicitly names an inn; Japanese チングラスの宿屋 and Chinese 钦鲁斯旅馆 corroborate the place type. Retain active 칭글로우 rather than claim an officially prescribed pronunciation. The full inn is not a global alias for an unqualified place/person Chinglous."},
  {key: "place:galette-inn", english: "Galette Inn", category: "place",
   korean: "갈레트 여관(Galette Inn)", count: 1,
   notes: "English standalone label names the inn, Japanese ガレットの宿屋 and Chinese 盖莱特旅馆 corroborate. Reuse existing 갈레트. Do not merge the inn with Galette village/tunnels or broaden its exact full-name matcher to bare Galette."},
  {key: "place:duneshead-mine", english: "Duneshead Mine", category: "place",
   korean: "듄스헤드 광산(Duneshead Mine)", count: 2,
   notes: "Both English labels name the same mine; Japanese デューンズヘッド鉱山/デューンヘッド鉱山 and Chinese 沙丘矿井 corroborate its type despite the Japanese spelling variation. Retain the repeated English-anchored Korean 듄스헤드 and annotate the complete place name."}
]
context = "English-led full-name review across all three active resources, with aligned Japanese/Chinese comparisons, distinguishes inns, tavern and mine from settlements, owners and named items. Official Korean manual PDF pages 4 and 9 explains world-map destinations and social/world facilities but does not prescribe these individual place spellings. Use complete bilingual names without nested short-name parentheses; preserve surrounding dialogue, quantities, tokens and prior entity decisions. Historical global totals and existing reviewed holds are not reopened."
ReviewedDiscoverySpecs.run(21_237, "Five Inns Tavern And Mine", specs, context,
  "## D-21236: Dverga People And Source-Adjectival Dvergan") do |spec, key, text, source|
  pattern = case spec[:key]
            when "place:reedsong-inn" then /(?:리드송(?:\(Reedsong\))?|갈대노래) 여관(?:\(Reedsong Inn\))?/
            when "place:blue-bear-tavern" then /(?:블루 베어|푸른 곰) (?:여관|주점|선술집)(?:\(Blue Bear Tavern\))?/
            when "place:chinglous-inn" then /칭글로우(?:\(Chinglous\))? 여관(?:\(Chinglous Inn\))?/
            when "place:galette-inn" then /갈레트(?:\(Galette\))? 여관(?:\(Galette Inn\))?/
            when "place:duneshead-mine" then /듄스헤드(?:\(Duneshead\))? 광산(?:\(Duneshead Mine\))?/
            end
  replacement = spec[:korean]
  if spec[:key] == "place:blue-bear-tavern" && key == ["default", "62891", ""]
    replacement = "블루 베어 주점(Blue Bear tavern)"
  end
  raise "expected one venue span #{key}" unless text.scan(pattern).length == 1
  [text.sub(pattern, replacement), false]
end
