#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "place:glendara", english: "Glendara", category: "place",
    korean: "글렌다라(Glendara)", count: 31,
    notes: "English base:1285 and travel/lore text explicitly identifies the Glendara region; Japanese グレンダーラ and Chinese 格伦达拉 corroborate. Retain the consistent 글렌다라 spelling and supply missing bilingual annotations. Its lexical appearances in the separately registered Wood/Passage/Stone/work labels are paired as complete compounds, not nested annotations or claims that all such labels denote the same physical place."
  },
  {
    key: "place:glendara-wood", english: "Glendara Wood", category: "place",
    korean: "글렌다라 숲(Glendara Wood)", count: 12,
    notes: "English travel, reagent and Brother Fallon objectives repeatedly name Glendara Wood, sometimes with lowercase wood; Japanese グレンダーラの森 and Chinese 格伦达拉森林 corroborate the forest name. Reuse the complete existing bilingual labels at default:8159/16063/18131 and annotate the nine remaining forest-name spans. Preserve northern as an ordinary direction outside the full name."
  },
  {
    key: "title:glendara-stone", english: "Glendara Stone", category: "title",
    korean: "글렌다라의 돌(Glendara Stone)", count: 1,
    notes: "English base:3955 labels Glendara Stone; Japanese グレンダーラの石 and Chinese 格伦达拉之石 corroborate. Pair the complete name instead of its place component only; no unproved stone function or object identity."
  },
  {
    key: "place:glendara-passage", english: "Glendara Passage", category: "place",
    korean: "글렌다라 통로(Glendara Passage)", count: 1,
    notes: "English default:60183 names Glendara Passage; Japanese グレンダーラの通路 and Chinese 格伦达拉通道 corroborate. The Korean is already complete and unchanged. Keep distinct from the region and forest; no alias merge."
  },
  {
    key: "named work:high-lady-of-glendara", english: "High Lady of Glendara",
    category: "named work", korean: "글렌다라의 귀부인(High Lady of Glendara)", count: 1,
    notes: "English default:16384 explicitly names the ballad anthology High Lady of Glendara; Japanese グレンダーラの淑女 and Chinese 格伦达拉贵妇 corroborate. Preserve the existing complete title and book brackets. This is a work title, not an independently identified person or ruler."
  }
]
plain_ids = %w[14704 32399 33273 39296 39632 42063 47144].freeze
wood_ids = %w[4523 4867 18996 33076 37543 46365 50439 54169 59678].freeze
compound_keys = [
  ["base", "3955", "11"], ["default", "16384", ""],
  ["default", "60183", ""]
].freeze
context = <<~TEXT.strip
  Review 31 distinct source keys with 46 overlapping name matches, keeping
  the region, forest, named passage, stone label and anthology separate.
  Retain the already consistent Korean readings and complete paired rows;
  add annotations only to seven region references, nine forest references,
  and the one component-only stone label. Preserve adjacent Fallon,
  Plagueshield, reagent, mission and historical-name decisions. Official
  Korean manual PDF pages 1,4,7 provides world/map/quest context, not a
  gazetteer of these locations. No physical identity merge is inferred
  merely from a shared Glendara component.
TEXT
ReviewedDiscoverySpecs.run(
  21_343, "Glendara Region, Forest, Passage And Named Titles", specs, context,
  "## D-21342: Haxhi Region And Complete Compound Labels"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  raise "Japanese place differs" unless japanese.match?(/グレンダーラ|Glendara/)
  raise "Chinese place differs" unless source["zh_text"].match?(/格伦达拉|Glendara/)
  if spec[:key] == "place:glendara"
    if english.match?(/\bGlendara Wood\b/i) || compound_keys.include?(key)
      [text, false]
    elsif key[0] == "default" && plain_ids.include?(key[1])
      raise "unexpected existing region annotation" if text.include?("(Glendara)")
      raise "missing region name" unless text.scan("글렌다라").length == 1
      [text.sub("글렌다라", spec.fetch(:korean)), false]
    else
      raise "unexpected unpaired region" unless text.include?("글렌다라(Glendara)")
      [text, false]
    end
  elsif spec[:key] == "place:glendara-wood" && wood_ids.include?(key[1])
    raise "forest span differs" unless text.scan("글렌다라 숲").length == 1 &&
      !text.include?("(Glendara Wood)")
    [text.sub("글렌다라 숲", spec.fetch(:korean)), false]
  elsif spec[:key] == "title:glendara-stone"
    raise "stone label differs" unless text == "글렌다라(Glendara)의 돌"
    [spec.fetch(:korean), false]
  else
    raise "unexpected unpaired compound" unless text.include?(spec.fetch(:korean))
    [text, false]
  end
end
