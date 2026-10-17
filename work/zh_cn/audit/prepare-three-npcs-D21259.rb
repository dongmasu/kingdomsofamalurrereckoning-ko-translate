#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "person:dessidyn", english: "Dessidyn", aliases: "Witch Knight Dessidyn",
   category: "person", korean: "데시딘(Dessidyn)", count: 7,
   notes: "English default:19680 identifies Witch Knight Dessidyn leading the final Tuatha encampment and default:43118 the vanguard; the kill objective and standalone names corroborate. Japanese 魔騎士デシディン and Chinese 女巫骑士戴斯丁 corroborate the full titled name. Preserve existing 데시딘 and source-local Witch Knight titles atomically rather than nesting labels."},
  {key: "person:jock-macnelly", english: "Jock MacNelly", category: "person",
   korean: "조크 맥넬리(Jock MacNelly)", count: 6,
   notes: "English default:46217/56769 explicitly identifies Jock MacNelly as the person who crafts Chaos weapons for the player; four standalone names agree. Japanese ジョック・マクネリー and Chinese 乔克·麦克内利 corroborate. Retain repeated 조크 맥넬리 and pair the explicit full-name mention only; do not invent a bare Jock alias."},
  {key: "person:nard-caloss", english: "Nard Caloss", category: "person",
   korean: "나드 칼로스(Nard Caloss)", count: 7,
   notes: "English default:47236 calls Nard Caloss the resident craftsman; default:48396 describes the skilled mason/blacksmith needed to repair the Black Odeon's Fate Shrine, and progress/objective/name labels corroborate. Japanese ナード・カロス and Chinese 纳德·卡洛斯 corroborate. Retain existing 나드 칼로스 and pair all explicit full names without changing unrelated shrine/faction terms."}
]
context = "Independent role-bearing source discovery plus exact English-led Japanese/Chinese comparison across all resources reviews 20 default row keys. All three names are absent as registered canonical/aliases or existing name-owned occurrences. Official Korean manual PDF pages 1/3/8/9 cover characters, dialogue and world context, not a complete NPC directory. Other full-name candidates already owned by surname entries are deliberately excluded pending provenance checks, not duplicated. Preserve unrelated names, particles, tokens and line breaks; existing holds and historical global totals remain unchanged."
ReviewedDiscoverySpecs.run(21_259, "Dessidyn Jock MacNelly And Nard Caloss", specs, context,
  "## D-21258: Eventide Clan And Homeland References") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  pattern, label = case spec[:key]
                   when "person:dessidyn"
                     if english.include?("Witch Knight Dessidyn")
                       [/마녀 기사 데시딘(?:\(Witch Knight Dessidyn\))?/, "마녀 기사 데시딘(Witch Knight Dessidyn)"]
                     else
                       [/데시딘(?:\(Dessidyn\))?/, spec[:korean]]
                     end
                   when "person:jock-macnelly"
                     [/조크 맥넬리(?:\(Jock MacNelly\))?/, spec[:korean]]
                   when "person:nard-caloss"
                     [/나드 칼로스(?:\(Nard Caloss\))?/, spec[:korean]]
                   end
  raise "reviewed NPC span missing #{key.inspect}" unless text.match?(pattern)
  text.gsub!(pattern, label)
  [text, false]
end
