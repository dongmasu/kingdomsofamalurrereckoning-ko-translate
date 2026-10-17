#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "unique item:masters-pick", english: "Master's Pick",
    korean: "달인의 자물쇠따개(Master's Pick)", category: "unique item",
    count: 26,
    notes: "English default:3520 explicitly calls this a lock pick capable of unlocking any lock; default:3755/8885/59521 corroborate its function, and default:1233/28709 identify the same tool recovered from Eloren's unopenable jewelry box with the Arrivus engine. Japanese consistently names 達人のピック and default:3520 explicitly describes 錠前破りの道具; Chinese 大师开锁器 supports lock pick, not mining pick. Reuse the already-established 달인의 자물쇠따개, retain source-full The Master's Pick on the two exact labels, and do not alter the separate owner, engine, faction or place scopes."
  }
]
context = <<~TEXT.strip
  Review all 26 affix/base/default English-source Master's Pick row keys:
  one base label and 25 default labels, dialogue and quest descriptions.
  Correct 곡괭이 and the inconsistent 장인/명장/명인 forms to the existing
  달인의 자물쇠따개. The two subsequent anaphoric 곡괭이 references in
  default:1233/28709 become 자물쇠따개 without inventing a repeated proper
  name; preserve other anaphors and narration. Preserve exact full-label
  The and short Master's Pick English forms without nested annotations.
  The official Korean manual PDF pp. 4 and 7 distinguishes Lockpicking,
  lock picks and quest items; it does not name this particular tool.
  No affix source key matches. Existing terminal entity/key dispositions,
  unresolved holds and historical global translation totals are unchanged.
TEXT
ReviewedDiscoverySpecs.run(
  21_363, "Master's Pick Lock-Pick Identity And Bilingual Labels",
  specs, context, "## D-21362: Shardfall And Rundamir Cave Names"
) do |_spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  label = english == "The Master's Pick" ?
    "달인의 자물쇠따개(The Master's Pick)" : "달인의 자물쇠따개(Master's Pick)"
  pattern = /(?:달인의|장인의|명장의|명인의) (?:자물쇠 ?따개|곡괭이|따개)(?: ?\((?:The )?Master's Pick\))?/
  raise "reviewed name span missing #{key.inspect}" unless text.match?(pattern)
  updated = text.gsub(pattern, label)
  if [%w[default 1233], %w[default 28709]].include?(key.take(2))
    raise "anaphoric mining-pick error missing" unless updated.scan("곡괭이").length == 1
    updated = updated.sub("곡괭이", "자물쇠따개")
  end
  [updated, false]
end
