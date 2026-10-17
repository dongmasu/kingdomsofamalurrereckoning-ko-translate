#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["arduath", "Arduath", "아르두아스(Arduath)", 25,
   "English default:8649/9405/56974/58154 identifies Ametair's Fae hollow in the Sidhe. Japanese アーデュアス and Chinese 阿度阿斯 corroborate; preserve the base spelling. Totem labels refer to this place and are not people."],
  ["bonnlach", "Bonnlach", "본라흐(Bonnlach)", 20,
   "English default:24970/44613/47211 identifies the castle from which Ariel Perien retrieves an artifact, corroborated by Japanese ボンラッチ/ボンラック and Chinese 彭拉赫. Reuse base:606 and normalize 본라크/본락."],
  ["bristlethorn", "Bristlethorn", "브리슬손(Bristlethorn)", 3,
   "English default:6269 is the meeting place with Cydan, with Japanese ブリスルソーン and Chinese 鬃棘洞穴 corroborating the location. Reuse base:453 and normalize the two default 브리슬쏜 spellings."]
]
specs = data.map do |slug, english, korean, count, notes|
  { key: "place:#{slug}", english: english, korean: korean,
    category: "place", count: count, notes: notes }
end
patterns = {
  "Arduath" => /아르두아스(?:\(Arduath\))?/,
  "Bonnlach" => /(?:본라흐|본라크|본락)(?:\(Bonnlach\))?/,
  "Bristlethorn" => /(?:브리슬손|브리슬쏜)(?:\(Bristlethorn\))?/
}.freeze
context = <<~TEXT.strip
  Review all affix/base/default English matches for three named sites with
  aligned Japanese and Chinese, including both Arduath occurrences in the
  long Aodh history at default:9405. Limit edits to name spans and retain
  unrelated narrative judgments. The official Korean manual's opening
  setting and exploration/quest guidance is relevant background; it gives
  no direct spelling for these sites. Existing complete bilingual labels
  remain unchanged. Full-name discovery remains incomplete.
TEXT
ReviewedDiscoverySpecs.run(
  21_352, "Arduath, Bonnlach And Bristlethorn Sites", specs, context,
  "## D-21351: Brunuath, Ghennig, Gloamthicket And Mull-Rane Sites"
) do |spec, key, text, _source|
  pattern = patterns.fetch(spec.fetch(:english))
  raise "missing reviewed name #{key.inspect}" unless text.match?(pattern)
  [text.gsub(pattern, spec.fetch(:korean)), false]
end
