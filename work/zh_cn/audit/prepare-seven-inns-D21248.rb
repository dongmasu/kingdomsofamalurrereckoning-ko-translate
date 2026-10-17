#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:sea-foam-tavern", english: "Sea Foam Tavern", aliases: "Sea Foam",
   category: "place", korean: "씨폼 선술집(Sea Foam Tavern)", count: 3,
   notes: "English base:1123 names Sea Foam Tavern. English default:14749 describes sitting in the Sea Foam, and default:29868 recalls meeting someone outside it. Japanese シーフォーム酒場/シーフォーム and Chinese 海沫酒馆 corroborate the venue, though Japanese translates the long book literally. Normalize 씨폼, 바다 거품 and 바다거품 only in these three approved venue mentions. Preserve source-short Sea Foam in prose instead of inserting Tavern into its English annotation."},
  {key: "place:valor-inn", english: "Valor Inn", category: "place",
   korean: "용맹 여관(Valor Inn)", count: 1,
   notes: "English base:1400 is the named Valor Inn destination label, Japanese バローの宿屋 and Chinese 英勇旅馆 corroborate the inn. Retain the Korean 용맹 여관; do not assert an identity with the House of Valor faction or Valor Arena."},
  {key: "place:thelgood-inn", english: "Thelgood Inn", category: "place",
   korean: "셀굿 여관(Thelgood Inn)", count: 1,
   notes: "English base:1854 explicitly names Thelgood Inn; Japanese セルグッドの宿屋 and Chinese 塞尔古德旅馆 corroborate. Retain established 셀굿 and pair the complete inn name rather than only Thelgood. This is a distinct place entry, not a second person or proof of ownership by the registered Thelgood person."},
  {key: "place:summerland-inn", english: "Summerland Inn", category: "place",
   korean: "서머랜드 여관(Summerland Inn)", count: 1,
   notes: "English base:4343 names Summerland Inn, Japanese サマーランドの宿屋 and Chinese 夏国旅馆 corroborate. Retain existing 서머랜드 여관 and annotate the full source label; no inference about the wider Summerlands."},
  {key: "place:golden-wheel-inn", english: "Golden Wheel Inn", category: "place",
   korean: "황금 바퀴 여관(Golden Wheel Inn)", count: 1,
   notes: "English base:4842 names Golden Wheel Inn, Japanese 金の輪亭 and Chinese 金轮旅馆 corroborate the named inn. Retain existing 황금 바퀴 여관 and add the full English label."},
  {key: "place:salty-salmon-inn", english: "Salty Salmon Inn", category: "place",
   korean: "솔티 새먼 여관(Salty Salmon Inn)", count: 1,
   notes: "English default:14550 names Salty Salmon Inn, Japanese ソルティサーモン宿屋 and Chinese 咸鲑鱼旅馆 corroborate the venue. Retain existing 솔티 새먼 여관 and annotate the complete label."},
  {key: "place:crossroads-inn", english: "Crossroads Inn", category: "place",
   korean: "교차로 여관(Crossroads Inn)", count: 1,
   notes: "English default:27427 names Crossroads Inn, Japanese クロスロード宿屋 and Chinese 十字路口旅馆 corroborate the named venue. Retain existing 교차로 여관 and annotate the complete label; do not globally alias generic crossroads."}
]
context = "English-led named-venue comparison across all three resources with exact aligned Japanese and Chinese. Manual PDF pages 3/4/8/9 provide world, map, dialogue and inhabited-place context, not an exhaustive inn directory. Nine distinct rows cover seven venues; retain unrelated proper names, the long poem/book, speaker register, particles, tokens and exact paragraph breaks. Existing 28 indexed holds and separate unresolved Hreid identity remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_248, "Seven Named Inns And Sea Foam Short Forms", specs, context,
  "## D-21247: Row-Specific Site Hold Evidence Clarification") do |spec, key, text, source|
  if spec[:key] == "place:sea-foam-tavern"
    case key
    when ["base", "1123", "11"]
      raise "unexpected Sea Foam base" unless text == "씨폼(Sea Foam) 선술집"
      text = spec[:korean]
    when ["default", "14749", ""]
      raise "Sea Foam prose span missing" unless text.include?("바다 거품 여관")
      text.sub!("바다 거품 여관", "씨폼(Sea Foam) 선술집")
    when ["default", "29868", ""]
      raise "Sea Foam book span missing" unless text.include?("바다거품 술집")
      text.sub!("바다거품 술집", "씨폼(Sea Foam) 선술집")
    else
      raise "unreviewed Sea Foam key #{key.inspect}"
    end
  else
    old = {
      "place:valor-inn" => "용맹 여관",
      "place:thelgood-inn" => "셀굿(Thelgood) 여관",
      "place:summerland-inn" => "서머랜드 여관",
      "place:golden-wheel-inn" => "황금 바퀴 여관",
      "place:salty-salmon-inn" => "솔티 새먼 여관",
      "place:crossroads-inn" => "교차로 여관"
    }.fetch(spec[:key])
    raise "unexpected standalone inn text" unless text == old
    text = spec[:korean]
  end
  [text, false]
end
