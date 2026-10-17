#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:saltwell-caverns", english: "Saltwell Caverns",
   category: "place", korean: "솔트웰 동굴(Saltwell Caverns)", count: 11,
   notes: "English default:21434 locates Hugues' former lab in Saltwell Caverns, default:32006 describes its revivification papers, and keys at default:33702/64459 reinforce the dungeon. Japanese ソルトウェル洞窟 and Chinese 盐井洞穴 corroborate; Chinese sometimes shortens the setting to 盐井矿. Normalize only the exact English Caverns scope, not the unreviewed Saltwell Mines or bare Saltwell references. Retain 솔트웰 and use the complete bilingual name rather than embedding Saltwell alone."},
  {key: "place:three-lamps-inn", english: "Three Lamps Inn",
   aliases: "Three Lamps Tavern|Three Lamps", category: "place",
   korean: "세 등불 여관(Three Lamps Inn)", count: 10,
   notes: "English default:11665 locates the inn in Didenhil, default:2457 offers food/drink/beds, and default:31217/43870/44204 identify Esme/Gray's establishment using the short name Three Lamps. Japanese 三灯亭 and Chinese 三灯旅馆 corroborate; default:6937 explicitly uses Tavern/酒馆. Normalize 세 개의 등불 to 세 등불. Preserve source-local Inn, Tavern or short Three Lamps in parentheses, use 선술집 in the explicit Tavern label, and omit grammatical lowercase the from prose annotations."},
  {key: "place:dark-glow-caverns", english: "Dark Glow Caverns",
   category: "place", korean: "다크 글로우 동굴(Dark Glow Caverns)", count: 2,
   notes: "English default:32997/62493 are identical named cave labels; Japanese ダーク・グロー洞窟 and Chinese 黑光洞穴 corroborate. Normalize 다크 글로우 동굴/어둠빛 동굴 to the existing transliterated name and complete English annotation; no linkage to any other dark cave."}
]
context = "Exact English-led comparison across affix/base/default and aligned Japanese/Chinese reviews 23 distinct source rows. Manual PDF pages 3/4/8/9 cover the world's map, dialogue, labs and named-world context, not an exhaustive venue directory. Retain unrelated characters, place names, particles, register, tokens and line breaks. Existing 28 indexed holds and separate Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_250, "Saltwell Caverns Three Lamps And Dark Glow", specs, context,
  "## D-21249: Three Books Haldebiers Blade And Enders Fire") do |spec, key, text, source|
  case spec[:key]
  when "place:saltwell-caverns"
    pattern = /솔트웰(?:\(Saltwell\))? 동굴(?:\(Saltwell Caverns\))?/
    raise "Saltwell cave span missing" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  when "place:three-lamps-inn"
    english = JSON.parse(source["en_texts_json"]).compact.join("\n")
    label = if english.include?("Three Lamps Tavern")
              "세 등불 선술집(Three Lamps Tavern)"
            elsif english.include?("Three Lamps Inn")
              spec[:korean]
            else
              "세 등불 여관(Three Lamps)"
            end
    pattern = /세 (?:개의 )?등불 여관(?:\((?:The )?Three Lamps(?: Inn)?\))?/
    raise "Three Lamps venue span missing" unless text.match?(pattern)
    text.gsub!(pattern, label)
  when "place:dark-glow-caverns"
    raise "unexpected Dark Glow standalone" unless ["다크 글로우 동굴", "어둠빛 동굴"].include?(text)
    text = spec[:korean]
  end
  [text, false]
end
