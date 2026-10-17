#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "person:cecil-tearscotter", english: "Cecil Tearscotter", category: "person",
   korean: "세실 티어스코터(Cecil Tearscotter)", count: 2,
   notes: "English default:13712 explicitly identifies Cecil as the journal writer's male gnome employer and later shortens his surname in the same entry. Japanese セシル・ティアスコッター and Chinese 塞西尔·提尔斯科特 corroborate. Reuse the already bilingual full-name form and annotate the standalone default:49622 label. The later same-entry surname remains source-short 티어스코터(Tearscotter); no global Tearscotter or Cecil alias, mine identity, or estate ownership is inferred."},
  {key: "place:tearscotter-estates", english: "Tearscotter Estates", category: "place",
   korean: "티어스코터 영지(Tearscotter Estates)", count: 1,
   notes: "English base:1110 names estates, supported by Japanese ティアスコッターの土地 and Chinese 提尔斯科特产业. Reuse the existing 티어스코터 영지 and pair the complete English place label. Keep distinct from the mine and person name; this label alone does not establish who owns the estate."}
]
context = "The mine short-name review exposed a separate person and estate sharing the same English surname stem. Search affix/base/default and compare English/Japanese/Chinese full-name rows before registering them separately. Official Korean manual PDF pages 8-10 provides dialogue, world and housing context, not these individual names or an ownership relationship. Keep the mine's three row-scoped references intact; do not broaden the shared surname to a global alias. Preserve journal voice, tokens, paragraph breaks and all unrelated entities; no historical global tally or reviewed hold is reopened."
ReviewedDiscoverySpecs.run(21_242, "Cecil Tearscotter And Separate Estates", specs, context,
  "## D-21241: Source-Short Mines And Expanded Apothecary") do |spec, key, text, source|
  case spec[:key]
  when "person:cecil-tearscotter"
    raise "full person span missing" unless text.scan(/세실 티어스코터/).length == 1
    text.sub!(/세실 티어스코터(?:\(Cecil Tearscotter\))?/, spec[:korean])
    if key == ["default", "13712", ""]
      raise "same-entry surname span missing" unless text.include?("티어스코터의 작은 손아귀")
      text.sub!("티어스코터의 작은 손아귀", "티어스코터(Tearscotter)의 작은 손아귀")
    end
  when "place:tearscotter-estates"
    raise "estate label changed" unless text == "티어스코터(Tearscotter) 영지"
    text = spec[:korean]
  end
  [text, false]
end
