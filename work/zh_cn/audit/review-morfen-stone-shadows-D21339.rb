#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "person:morfen-carth", english: "Morfen Carth", category: "person",
    korean: "모르펜 카스(Morfen Carth)", variants: "모르펜 카르스", count: 1,
    notes: "English default:42202 explicitly introduces Morfen Carth, the Elund and Orbocant's voice. Japanese モーフェン・カース and Chinese 莫芬·卡尔斯 corroborate. Retain 모르펜 and use the established Carth spelling 카스 rather than 카르스, with the complete source name. This record does not equate Morfen Carth with Elund Carth, infer kinship, or globally alias the standalone debug label Morfen at default:32903."
  },
  {
    key: "named work:stone-shadows", english: "Stone Shadows",
    category: "named work", korean: "돌 그림자(Stone Shadows)", count: 4,
    notes: "English base:481/default:18926 labels Stone Shadows and default:21611 explicitly recalls it beside The Fall of Dwynian. Japanese 動かざる石の影 and Chinese 石之阴影/石头阴影/岩石之影 corroborate the work title. Pair the complete labels. Exclude default:55953 from title annotation: its lowercase stone shadows phrases are the poem's repeated imagery, not occurrences of the work's name, and its verse/formatting remains unchanged."
  }
]
context = <<~TEXT.strip
  Register the explicit Morfen Carth self-introduction independently of the
  previously indexed Elund Carth and the newly indexed Elund title. Correct
  only the surname spelling and complete English pairing, preserving the
  D-21337/D-21338 council/title edits. Register the separate Stone Shadows
  work: annotate its two unpaired labels, retain the already complete
  reference, and exclude the poem's lowercase imagery rather than adding
  English parentheticals throughout the verse. Official Korean manual PDF
  pages 1-2 and 7 provides setting/Fate/faction context, not these names.
TEXT
ReviewedDiscoverySpecs.run(
  21_339, "Morfen Carth And Stone Shadows Work Title", specs, context,
  "## D-21338: Elund Formal Role And Complete Ring Label"
) do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  if spec[:key] == "person:morfen-carth"
    raise "source identity differs" unless key == ["default", "42202", ""] &&
      japanese.include?("モーフェン・カース") && source["zh_text"].include?("莫芬·卡尔斯")
    from = "모르펜 카르스"
    raise "reviewed name differs" unless text.scan(from).length == 1
    [text.sub(from, spec.fetch(:korean)), false]
  elsif key == ["default", "55953", ""]
    raise "unexpected capitalized title in poem" if english.include?("Stone Shadows")
    [text, true]
  elsif key == ["base", "481", "11"] || key == ["default", "18926", ""]
    raise "standalone label differs" unless english == "Stone Shadows" && text == "돌 그림자"
    raise "Japanese title differs" unless japanese == "動かざる石の影"
    [spec.fetch(:korean), false]
  else
    raise "unexpected complete reference" unless key == ["default", "21611", ""] &&
      text.include?("돌 그림자(Stone Shadows)")
    [text, false]
  end
end
