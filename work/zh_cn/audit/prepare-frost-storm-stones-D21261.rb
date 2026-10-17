#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "item:frost-stone", english: "Frost Stone", aliases: "Frost Stones",
   category: "unique item", korean: "서리석(Frost Stone)", count: 12,
   notes: "English default:17516/57528 identifies the magical artifact crafted by the possessed Cadoc Reen in Shardfall, and default:24490 delivers it to Engar. Japanese 霜氷石/霧氷石 and Chinese 冰霜石 corroborate. Normalize 서리 얼음석/서리 돌/서리의 돌/서리석 to the repeated quest stem 서리석. English coordinated plural Frost stones at default:7472 and Frost Stones at default:27929 are source-local forms of the same named artifact in the Sun/Storm/Frost set, not generic frost rocks; keep those annotation forms. The elided Frost in default:37217 needs a separate row-scoped supplement rather than a global Frost alias."},
  {key: "item:storm-stone", english: "Storm Stone", category: "unique item",
   korean: "폭풍석(Storm Stone)", count: 8,
   notes: "English default:7472 explicitly identifies the lightning artifact found on Aethan Engar's corpse and default:24292 its making atop Skycrown. Japanese 雷嵐石 and Chinese 风暴石 corroborate. Normalize 폭풍의 돌/폭풍석 to the repeated base and quest stem 폭풍석. Preserve source-lowercase Storm stone at default:37217. In coordinated Sun/Storm/Frost lists within these already explicit artifact rows, expansion of the elided Storm to the established full artifact label does not introduce another item. Do not edit the other artifacts through this spec."}
]
context = "Exact English-led artifact discovery across affix/base/default with aligned Japanese/Chinese reviews 17 distinct rows and 20 entity matches. Manual PDF pages 5/7/9 establish magic, equipment and world context, not these specific quest artifacts. Keep the existing Sun Stone entity and all characters/places/quest wording/tokens/paragraph breaks intact. Contextual ellipses outside these lexical matches are to be handled separately and not silently counted as covered. Existing 28 indexed holds and separate Hreid relationship are unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_261, "Frost Stone And Storm Stone Artifacts", specs, context,
  "## D-21260: Existing Full Names Without Duplicate People") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  case spec[:key]
  when "item:frost-stone"
    label = if english.include?("Frost stones")
              "서리석(Frost stones)"
            elsif english.include?("Frost Stones")
              "서리석(Frost Stones)"
            else
              spec[:korean]
            end
    pattern = /(?:서리 얼음석|서리의 돌|서리 돌|서리석)(?:\(Frost [Ss]tones?\))?/
    raise "Frost artifact span missing" unless text.match?(pattern)
    text.gsub!(pattern, label)
  when "item:storm-stone"
    label = english.include?("Storm stone") ? "폭풍석(Storm stone)" : spec[:korean]
    pattern = /(?:폭풍의 돌|폭풍석)(?:\(Storm [Ss]tone\))?/
    raise "Storm artifact span missing" unless text.match?(pattern)
    text.gsub!(pattern, label)
  end
  [text, false]
end
