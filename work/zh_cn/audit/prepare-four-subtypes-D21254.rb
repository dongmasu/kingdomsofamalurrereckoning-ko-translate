#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "monster:pestilent-brownie", english: "Pestilent Brownie",
   category: "monster", korean: "역병 브라우니(Pestilent Brownie)", count: 1,
   notes: "English default:36203 is the exact creature subtype Pestilent Brownie, Japanese イビル・ブラウニー and Chinese 致命棕矮妖 corroborate a Brownie subtype while differing on the modifier. English governs the existing 역병 브라우니. Pair the complete compound without nesting a species label."},
  {key: "monster:sprite-storm-champion", english: "Sprite Storm Champion",
   category: "monster", korean: "스프라이트 폭풍 챔피언(Sprite Storm Champion)", count: 1,
   notes: "English default:3729 labels Sprite Storm Champion, Japanese スプライト・ストームチャンピオン and Chinese 妖精风暴冠军 corroborate the elemental sprite subtype. Retain the existing Korean compound and pair it completely."},
  {key: "monster:sprite-frost-champion", english: "Sprite Frost Champion",
   category: "monster", korean: "스프라이트 서리 챔피언(Sprite Frost Champion)", count: 1,
   notes: "English default:7877 labels Sprite Frost Champion, Japanese スプライト・フロストチャンピオン and Chinese 妖精冰霜冠军 corroborate. Replace the generic 요정 in this exact creature compound with the established species stem 스프라이트, preserving 서리 챔피언 and adding the complete English label."},
  {key: "monster:sprite-flame-champion", english: "Sprite Flame Champion",
   category: "monster", korean: "스프라이트 화염 챔피언(Sprite Flame Champion)", count: 1,
   notes: "English default:53426 labels Sprite Flame Champion, Japanese スプライト・フレイムチャンピオン and Chinese 妖精烈焰冠军 corroborate. Retain existing 스프라이트 화염 챔피언 with complete annotation. Do not infer that the separately reviewed Fire Sprite Champion or Primal Sprite Champion is the same subtype."}
]
context = "Independent bounded subtype discovery across affix/base/default found four previously unregistered exact labels, each in one default row. English default:25208 establishes elemental sprite champions as a creature group; it is context only, not an additional reviewed row. Manual PDF pages 5/9 establish combat/world context but do not individually name these subtypes. Preserve all earlier species/entity judgments and reviewed holds, including other Champion forms, with no historical global tally or nested annotation."
ReviewedDiscoverySpecs.run(21_254, "Four Exact Creature Subtype Labels", specs, context,
  "## D-21253: Skycrown Mountain Alias And Separate Cave Labels") do |spec, key, text, source|
  old = {
    "monster:pestilent-brownie" => "역병 브라우니",
    "monster:sprite-storm-champion" => "스프라이트 폭풍 챔피언",
    "monster:sprite-frost-champion" => "요정 서리 챔피언",
    "monster:sprite-flame-champion" => "스프라이트 화염 챔피언"
  }.fetch(spec[:key])
  raise "unexpected subtype label #{key.inspect}" unless text == old
  [spec[:korean], false]
end
