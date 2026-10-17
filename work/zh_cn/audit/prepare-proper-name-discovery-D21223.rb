#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:iver-house", english: "Iver House", category: "place",
   korean: "아이버의 집(Iver House)", count: 2, variants: "아이버 하우스|아이버 가문",
   notes: "English and Japanese アイヴァー・ハウス name the house; Chinese 艾维尔的家 supports a residence, not a clan/faction. Follow the user's house-name policy as 아이버의 집, preserving complete English. Do not treat this site as an alias for Fynwick Iver or other Iver people."},
  {key: "person:mace-darkken", english: "Mace Darkken", category: "person",
   korean: "메이스 다켄(Mace Darkken)", count: 7, variants: "메이스 다르켄|메이스 다큰",
   notes: "English identifies the Wolf Pack ranger; Japanese メイス・ダーケン and Chinese 梅斯·达肯 corroborate. Reuse 메이스 다켄 at default:11185. Local short Mace at default:26896 is explicitly the same person in the preceding sentence; annotate it locally, not as a global alias, since ordinary mace is a weapon."},
  {key: "person:pwyn-malwich", english: "Pwyn Malwich", category: "person",
   korean: "푸윈 말위치(Pwyn Malwich)", count: 3, variants: "퓐 말위치|프윈 말위치",
   notes: "English repeats this full name in memorial lists; Japanese プウィン・マルウィッチ and Chinese 普文·麦尔维奇 corroborate. Reuse default:19539 푸윈 말위치 rather than alternating the contracted 퓐/프윈 forms. Preserve all list hyphens, other names and empty trailing entries."},
  {key: "title:siege-breaker", english: "Siege Breaker", category: "title",
   korean: "공성 파괴자(Siege Breaker)", count: 4, variants: "공성파괴자",
   notes: "English addresses the protagonist by this title; Japanese 救国の英雄/包囲を破りし者 and Chinese 破城者 corroborate its siege-breaking context. Reuse the existing 공성 파괴자; put the vocative 여 after the complete bilingual label, not inside its Korean name."}
]
context = "English-led review of a residence, two people and a title across affix/base/default. Official Korean manual PDF pages 1/8 provide setting and dialogue context, not these names. Only evidenced name spans and the title's vocative placement change; no global Mace/Iver alias or family merge."
ReviewedDiscoverySpecs.run(21_223, "House, Ranger, Memorial Name And Title", specs, context,
  "## D-21222: Eight Explicit Full Names") do |spec, key, text, _source|
  case spec[:key]
  when "place:iver-house"
    text = text.gsub(/아이버 (?:하우스|가문)(?:\(Iver House\))?/, spec[:korean])
  when "person:mace-darkken"
    text = text.gsub(/메이스 (?:다켄|다르켄|다큰)(?:\(Mace Darkken\))?/, spec[:korean])
    text = text.sub("메이스를", "메이스(Mace)를") if key == ["default", "26896", ""]
  when "person:pwyn-malwich"
    text = text.gsub(/(?:푸윈|퓐|프윈) 말위치(?:\(Pwyn Malwich\))?/, spec[:korean])
  when "title:siege-breaker"
    text = text.gsub(/공성 ?파괴자(여)?(?:\(Siege Breaker\))?/) { "#{spec[:korean]}#{$1}" }
  end
  [text, false]
end
