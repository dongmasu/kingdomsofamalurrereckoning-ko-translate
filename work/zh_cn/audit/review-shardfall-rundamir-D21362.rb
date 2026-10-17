#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  { key: "place:shardfall", english: "Shardfall",
    korean: "샤드폴(Shardfall)", category: "place", count: 32,
    notes: "English default:3548 explicitly names a northwest cave where gem shards are harvested; default:56450 describes Erathi ruins and ice magic, and default:14044 mentions its former name Sedeas. Japanese シャードフォール and Chinese 晶瀑 corroborate. Reuse the base spelling 샤드폴 and preserve already-complete Shardfall Cave annotation without nested parentheses. No global Sedeas alias or separate site identity is asserted in this batch." },
  { key: "place:rundamir", english: "Rundamir",
    korean: "룬다미르(Rundamir)", category: "place", count: 17,
    notes: "English default:36893/44529/48824 identifies the largest brownie den/Fae hollow on the edge of the Sidhe; default:9405 describes Rundamir alongside Arduath, and default:57507 records the trapped explorer. Japanese ルンダミア and Chinese 伦达米尔/朗达米尔 corroborate. Reuse base:1636's 룬다미르, preserve the prior title The Brownie Den as a separate scope, and do not infer a global title alias." }
]
context = <<~TEXT.strip
  Review all affix/base/default English matches for two named caves/hollows,
  with aligned Japanese/Chinese context. Add missing bilingual labels
  even on repeated references within the same scholarly journal; keep
  neighboring person/creature/item decisions unchanged. The official
  Korean manual PDF pp. 7-8 supplies quest and gem/crafting context and
  PDF p. 1 world geography, not these exact site names. Preserve every
  original paragraph/verse break and source-qualified full label.
TEXT
ReviewedDiscoverySpecs.run(
  21_362, "Shardfall And Rundamir Cave Names", specs, context,
  "## D-21361: Odarath, Tulan, Uror And Complete Odarath Labels"
) do |spec, key, text, _source|
  if spec.fetch(:english) == "Shardfall"
    raise "Shardfall span missing #{key.inspect}" unless text.include?("샤드폴")
    updated = text.gsub(/샤드폴 동굴\(Shardfall Cave\)|샤드폴(?:\(Shardfall\))?/) do |span|
      span == "샤드폴 동굴(Shardfall Cave)" ? span : spec.fetch(:korean)
    end
    [updated, false]
  else
    raise "Rundamir span missing #{key.inspect}" unless text.match?(/룬다미르(?:\(Rundamir\))?/)
    [text.gsub(/룬다미르(?:\(Rundamir\))?/, spec.fetch(:korean)), false]
  end
end
