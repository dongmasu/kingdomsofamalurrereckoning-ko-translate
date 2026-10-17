#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:emberdeep", english: "Emberdeep", category: "place",
   korean: "엠버딥(Emberdeep)", count: 18,
   notes: "English default:48137 explicitly calls Emberdeep a Dverga city on Obsidian Isle, and the diplomatic options/capital list identify the same city. Japanese エンバーディープ and Chinese 深烬城 corroborate. Reuse the consistent 엠버딥 stem and pair every explicit Korean occurrence. Preserve the complete already bilingual Emberdeep War Bear label at default:18382 rather than nesting a city annotation inside a creature title."},
  {key: "place:hrenloc", english: "Hrenloc", category: "place",
   korean: "흐렌록(Hrenloc)", count: 13,
   notes: "English diplomacy rows and default:42027 identify Hrenloc as an outpost in Icebrine Coast; default:56579 includes it in the capital-city list. Preserve those source-local descriptions without resolving settlement rank by inference. Japanese predominantly フレンロック (one フレロック) and Chinese 赫伦洛克 corroborate. Reuse repeated 흐렌록 rather than 헨록/렌록; do not merge the city with Sunhilda Lorelle or other inhabitants."}
]
context = "English-led comparison of the diplomatic city/outpost references across affix/base/default, with aligned Japanese and Chinese support. The two entities overlap at the capital-city list and are counted once per CSV row. Fort Olghorn is already registered and reviewed, so is deliberately excluded from this new-entity batch and not recounted. The initial duplicate-definition gate stopped before glossary/index/CSV changes. Official Korean manual PDF pages 1-3/4/9 establish peoples, map and world context, not this DLC settlement list. Keep metonymic alliance/war references, creature labels, character names, local ranks, particles, tokens and paragraph breaks intact. Existing 28 indexed holds and the separate unresolved Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_245, "Two Diplomatic Cities And Outposts", specs, context,
  "## D-21244: Six Named Inns Shops Mine Keep And Caves") do |spec, key, text, source|
  case spec[:key]
  when "place:emberdeep"
    if key == ["default", "18382", ""]
      raise "atomic war bear label changed" unless text == "엠버딥 전투곰(Emberdeep War Bear)"
    else
      raise "city stem missing" unless text.include?("엠버딥")
      text.gsub!(/엠버딥(?:\(Emberdeep\))?/, spec[:korean])
    end
  when "place:hrenloc"
    raise "outpost stem missing" unless text.match?(/(?:흐렌록|헨록|렌록)/)
    text.gsub!(/(?:흐렌록|헨록|렌록)(?:\(Hrenloc\))?/, spec[:korean])
  end
  [text, false]
end
