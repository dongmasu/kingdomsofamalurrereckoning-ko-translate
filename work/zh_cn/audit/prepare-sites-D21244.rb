#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:lightwatch-inn", english: "Lightwatch Inn", category: "place",
   korean: "라이트워치 여관(Lightwatch Inn)", aliases: "Lightwatch", count: 5,
   notes: "English full-name rows identify the Crownhold drinking establishment; the two short-name rows explicitly describe its ale shipment and reopening for business. Japanese ライトウォッチ宿屋/ライトウォッチ and Chinese 光守旅店/光守 corroborate. Keep full-name 여관 and source-short 라이트워치 separately; no Inn expansion in the shortened dialogue."},
  {key: "place:corner-shop", english: "The Corner Shop", category: "place",
   korean: "모퉁이 상점(The Corner Shop)", aliases: "Corner Shop", count: 5,
   notes: "English standalone labels and supply-shopping directions name the shop; Japanese コーナーショップ and Chinese 街角小店 corroborate. Reuse the base 모퉁이 상점 rather than 코너 숍/모퉁이 가게. Keep capitalized The in the two standalone source titles, but not the grammatical lowercase the before Corner Shop in prose."},
  {key: "place:darkvari-mine", english: "Darkvari Mine", category: "place",
   korean: "다크바리 광산(Darkvari Mine)", count: 3,
   notes: "English Steg's quest and destination label name the mine; Japanese ダークヴァリ鉱山 and Chinese 达克瓦瑞矿井/矿场 corroborate. Reuse the already bilingual default:54137 place name. Existing person:darkvari exclusions for mine-only rows remain intact; a new site entry does not reclassify them as people or assert ownership."},
  {key: "place:mythal-keep", english: "Mythal Keep", category: "place",
   korean: "미살 요새(Mythal Keep)", count: 2,
   notes: "Both English labels say Mythal Keep; Japanese ミサル砦 and Chinese 迈塞尔要塞 corroborate. Retain 미살 and correct base:2996's unsupported Mithal annotation to the exact full English Mythal Keep. Mythal's Reach is a different source form, not an inferred alias."},
  {key: "place:scarbelly-cavern", english: "Scarbelly Cavern", category: "place",
   korean: "스카벨리 동굴(Scarbelly Cavern)", count: 2,
   notes: "English labels explicitly name a cavern; Japanese スカーベリー洞窟 and Chinese 伤腹洞穴/斯卡贝里洞穴 corroborate. Retain the repeated Korean 스카벨리 동굴 and pair the full place name; no person named Scarbelly is inferred."},
  {key: "place:shade-river-caves", english: "Shade River Caves", category: "place",
   korean: "셰이드 강 동굴(Shade River Caves)", aliases: "Shade River Cave", count: 4,
   notes: "English names the spider-den site in the Barten/Garaner quest and two map labels. Japanese シェイド川洞窟 and Chinese 暗影河洞穴/暗河洞穴/阴影之河洞穴 corroborate; Japanese omits the place in default:34054, so English/Chinese supply that explicit location. Reuse 셰이드 강 동굴 rather than 붙여쓴 셰이드강/셰이드 리버. Preserve source singular/plural/case in each label."}
]
context = "Full-name and tightly supported short-name discovery across affix/base/default, anchored in English and checked against aligned Japanese and Chinese. Official Korean manual PDF pages 4/7/9 explains destinations, quest objectives and world facilities; it does not prescribe these individual names. Keep complete bilingual place labels, source-local form/case, existing character spellings, particles, tokens and line breaks. Preserve all existing person exclusions, 28 indexed identity/translation holds and the separate unresolved Hreid relationship; no historical global tally is reopened."
ReviewedDiscoverySpecs.run(21_244, "Six Named Inns Shops Mine Keep And Caves", specs, context,
  "## D-21243: Site Identity Limits And Grammatical Articles") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  pattern, korean = case spec[:key]
                    when "place:lightwatch-inn"
                      if english.include?("Lightwatch Inn")
                        [/라이트워치 여관(?:\(Lightwatch Inn\))?/, "라이트워치 여관"]
                      else
                        [/라이트워치(?:\(Lightwatch\))?/, "라이트워치"]
                      end
                    when "place:corner-shop"
                      [/(?:모퉁이 상점|모퉁이 가게|코너 숍)(?: ?\((?:The )?Corner Shop\))?/, "모퉁이 상점"]
                    when "place:darkvari-mine"
                      [/다크바리 광산(?:\(Darkvari Mine\))?/, "다크바리 광산"]
                    when "place:mythal-keep"
                      [/미살(?:\(Mithal\))? 요새(?:\(Mythal Keep\))?/, "미살 요새"]
                    when "place:scarbelly-cavern"
                      [/스카벨리(?:\(Scarbelly\))? 동굴(?:\(Scarbelly Cavern\))?/, "스카벨리 동굴"]
                    when "place:shade-river-caves"
                      [/(?:셰이드 강|셰이드강|셰이드 리버) 동굴(?:\(Shade River Caves?\))?/, "셰이드 강 동굴"]
                    end
  terms = [spec[:english], *spec.fetch(:aliases, "").split("|")].sort_by { |term| -term.length }
  term_pattern = Regexp.new("(?<![A-Za-z])(?:#{terms.map { |term| Regexp.escape(term) }.join('|')})(?![A-Za-z])", Regexp::IGNORECASE)
  labels = english.scan(term_pattern).map { |label| label.sub(/\Athe /, "") }
  raise "expected one source/Korean site span #{key}" unless labels.length == 1 && text.scan(pattern).length == 1
  [text.sub(pattern, "#{korean}(#{labels.first})"), false]
end
