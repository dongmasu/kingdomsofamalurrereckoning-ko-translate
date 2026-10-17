#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "faction:eventide", english: "Eventide", aliases: "Eventide clan",
   category: "faction", korean: "이븐타이드(Eventide)", count: 38,
   notes: "English default:3814/25806 explicitly identifies Eventide as a respected clan, default:11027 its members, and multiple quest/dialogue rows its survivors and homeland. Japanese エヴンタイド族 and Chinese 晚潮部族 corroborate; Chinese 夜潮 at default:6878 is supporting-local variation, not another clan. Normalize 이븐타이드/이브타이드/에븐타이드/에벤타이드/이브닝타이드 to the repeated standalone 이븐타이드 and annotate every explicit Korean name mention. Preserve default:15745's complete source-local Eventide clan label. Retain clan, people and homeland metonymy without inventing a second place entity. base:1206 Eventide Treasure is a separately scoped compound label: replace the misleading everyday 해질녘 interpretation with the clan-name stem and annotate the entire title, not a nested faction name."}
]
context = "Independent source investigation followed by exact English-led aligned Japanese/Chinese review across affix/base/default covers 38 distinct rows. Official Korean manual PDF pages 1/3/7/9 provide Fae, world and faction context, not this clan's name. Ashmoor is separately registered; preserve its current labels and all other characters, places, tokens, register and line breaks. Do not replace source-local clan/people/land wording globally. Existing 28 indexed holds and separate unresolved Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_258, "Eventide Clan And Homeland References", specs, context,
  "## D-21257: Ashmoor Clan And Source-Local Homeland References") do |spec, key, text, source|
  if key == ["base", "1206", "11"]
    raise "treasure label differs" unless text == "해질녘의 보물"
    text = "이븐타이드의 보물(Eventide Treasure)"
  elsif key == ["default", "15745", ""]
    raise "complete clan label differs" unless text.include?("이븐타이드 부족(Eventide clan)")
  else
    pattern = /(?:이븐타이드|이브타이드|에븐타이드|에벤타이드|이브닝타이드)(?:\(Eventide\))?/
    raise "Eventide span missing #{key.inspect}" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  end
  [text, false]
end
