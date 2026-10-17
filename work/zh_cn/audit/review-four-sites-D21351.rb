#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["brunuath", "Brunuath", "브루누아스(Brunuath)", 9,
   "Japanese ブルヌアス and Chinese 布鲁诺斯 corroborate the Fae hollow where Osduin performs The Flowering. Retain the existing bilingual base spelling."],
  ["ghennig", "Ghennig", "게니그(Ghennig)", 16,
   "English default:14608/21938/26929 identifies a keep on a hill, corroborated by Japanese ゲンニグ and Chinese 格尼格. Normalize 게닉/그헤니그 to 게니그 and correct the person-directed 에게 at default:17659 to location-directed 에."],
  ["gloamthicket", "Gloamthicket", "글룸시킷(Gloamthicket)", 13,
   "English default:42351 identifies a Fae hollow in Acatha visited by Scholia Arcana initiates; Japanese 繁茂の洞窟 and Chinese 黄昏密林 corroborate. Reuse base:155's spelling rather than mixing 글룸씨켓/글룸시켓/글룸시케트/글룸티켓/글룸시커릿/황혼 덤불숲."],
  ["mull-rane", "Mull-Rane", "멀레인(Mull-Rane)", 8,
   "English default:39641/50270/57248 identifies ruins on the pilgrim's route, corroborated by Japanese ムル＝レイン/ムル・レイン and Chinese 穆尔莱恩. Reuse base:191's spelling without introducing another spacing/hyphen variant."]
]

specs = data.map do |slug, english, korean, count, notes|
  { key: "place:#{slug}", english: english, korean: korean,
    category: "place", count: count, notes: notes }
end

patterns = {
  "Brunuath" => /브루누아스(?:\(Brunuath\))?/,
  "Ghennig" => /(?:그헤니그|게니그|게닉)(?:\(Ghennig\))?/,
  "Gloamthicket" => /(?:글룸시커릿|글룸시케트|글룸시킷|글룸씨켓|글룸시켓|글룸티켓|황혼 덤불숲)(?:\(Gloamthicket\))?/,
  "Mull-Rane" => /(?:멀-레인|멀 레인|멀레인|물레인)(?:\(Mull-Rane\))?/
}.freeze

context = <<~TEXT.strip
  Cross-check all affix/base/default source rows for four independently
  named places, using English for identity and Japanese/Chinese to
  corroborate the scene. Normalize only the reviewed place-name spans;
  preserve unrelated people, quests, and creature wording. The official
  Korean manual's opening setting and quest sections provide world and
  exploration context, not exact spellings for these four local sites.
  Apply bilingual canonical forms and repair only directly affected
  location/directional particles. No PAK-derived evidence is used.
TEXT

ReviewedDiscoverySpecs.run(
  21_351, "Brunuath, Ghennig, Gloamthicket And Mull-Rane Sites",
  specs, context, "## D-21350: St. Eadric Mission Name And Site Labels"
) do |spec, key, text, _source|
  pattern = patterns.fetch(spec.fetch(:english))
  raise "missing reviewed name #{key.inspect}" unless text.match?(pattern)
  updated = text.gsub(pattern, spec.fetch(:korean))
  if key == ["default", "17659", ""]
    raise "location particle changed" unless updated.include?("게니그(Ghennig)에게")
    updated = updated.sub("게니그(Ghennig)에게", "게니그(Ghennig)에")
  end
  if key == ["default", "16052", ""]
    raise "directional particle changed" unless updated.include?("글룸시킷(Gloamthicket)로")
    updated = updated.sub("글룸시킷(Gloamthicket)로", "글룸시킷(Gloamthicket)으로")
  end
  [updated, false]
end
