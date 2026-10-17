#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  { key: "item:gloamfrost", english: "Gloamfrost", korean: "글룸프로스트(Gloamfrost)",
    category: "unique item", count: 11,
    notes: "English default:2292/6936/7111/33792 establishes one of three legendary Fae staffs, not a location. Japanese グロームフロスト and Chinese 冰雪黄昏 corroborate. Keep base:70 spelling and normalize 글롬프로스트/어스름서리. Its dowel is a component referring to the staff, not a second staff identity." },
  { key: "resource:sweetrose", english: "Sweetrose", korean: "스위트로즈(Sweetrose)",
    category: "resource", count: 3,
    notes: "English default:62263 compares this named plant to Embereyes; Japanese スイートローズ and Chinese 甜蔷薇 corroborate. Use the existing transliteration and add missing English at base:379/default:19615. Do not change the already bilingual botanical comparison." },
  { key: "item:daybreaker", english: "Daybreaker", korean: "데이브레이커(Daybreaker)",
    category: "unique item", count: 2,
    notes: "English default:49358 identifies the named enchanted sword with colored glass resembling prismere. Japanese デイブレーカー and Chinese 破晓者 corroborate. Keep base:64 spelling and annotate the description." }
]
patterns = {
  "Gloamfrost" => /(?:글룸프로스트|글롬프로스트|어스름서리)(?:\(Gloamfrost\))?/,
  "Sweetrose" => /스위트로즈(?:\(Sweetrose\))?/,
  "Daybreaker" => /데이브레이커(?:\(Daybreaker\))?/
}.freeze
context = <<~TEXT.strip
  Review all three resources for each exact English name, distinguishing
  the legendary staff and enchanted sword from the named botanical
  resource. The official Korean manual's equipment/crafting sections
  (PDF pp. 6-8) distinguish staves, swords, and salvage, while its alchemy
  guidance supplies plant/material context; none supplies these exact
  names. Preserve established bilingual neighboring item names and all
  unrelated narrative wording, tokens and line breaks.
TEXT
ReviewedDiscoverySpecs.run(
  21_353, "Gloamfrost, Sweetrose And Daybreaker Items", specs, context,
  "## D-21352: Arduath, Bonnlach And Bristlethorn Sites"
) do |spec, key, text, _source|
  pattern = patterns.fetch(spec.fetch(:english))
  raise "missing reviewed item #{key.inspect}" unless text.match?(pattern)
  [text.gsub(pattern, spec.fetch(:korean)), false]
end
