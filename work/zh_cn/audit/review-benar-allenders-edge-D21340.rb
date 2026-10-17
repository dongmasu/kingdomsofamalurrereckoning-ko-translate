#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "person:benar", english: "Benar", category: "person",
    korean: "베나르(Benar)", variants: "베너", count: 4,
    notes: "English default:8720/14560/49184 explicitly identifies the trader/fence Benar; default:52558 supplies the standalone name. Japanese ベナール/ベナー and Chinese 本纳尔 corroborate. Reuse the predominant 베나르 form and normalize 베너, adding the missing annotations. Keep the existing stolen-goods/장물 wording, not a separate trade-mechanics judgment. The debug-style standalone row keeps Benar unchanged in both supporting locales."
  },
  {
    key: "unique item:allenders-edge", english: "Allender's Edge",
    category: "unique item", korean: "앨런더의 칼날(Allender's Edge)", count: 1,
    notes: "English base:4031 labels Allender's Edge; Japanese アレンダーの刃 and Chinese 阿连德之刃 corroborate. Preserve 앨런더의 칼날 and pair the complete item title rather than the Allender component only. Do not infer an Allender person, a specific weapon class, rarity, or extra item biography from this label."
  }
]
changes = {
  ["default", "8720", ""] => ["베나르는", "베나르(Benar)는"],
  ["default", "14560", ""] => ["베너(Benar)를", "베나르(Benar)를"],
  ["default", "49184", ""] => ["베나르를", "베나르(Benar)를"],
  ["base", "4031", "11"] => ["앨런더(Allender)의 칼날", "앨런더의 칼날(Allender's Edge)"]
}.freeze
context = <<~TEXT.strip
  Register two previously unindexed source-local names after checking
  affix/base/default and all three source locales. English anchors meaning;
  Japanese and Chinese corroborate the trader name and the complete named
  item. Correct only the four explicit spelling/annotation spans and retain
  the already canonical standalone Benar label. Official Korean manual PDF
  pages 6-7 and 9-10 supplies item/trading context, not these individual
  names; no existing entity decision or historical global tally is reopened.
TEXT
ReviewedDiscoverySpecs.run(
  21_340, "Benar Trader And Allender's Edge Label", specs, context,
  "## D-21339: Morfen Carth And Stone Shadows Work Title"
) do |spec, key, text, source|
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  if spec[:key] == "person:benar"
    raise "Japanese name differs" unless japanese.match?(/ベナール|ベナー|Benar/)
    raise "Chinese name differs" unless source["zh_text"].match?(/本纳尔|Benar/)
  else
    raise "item source differs" unless japanese == "アレンダーの刃" &&
      source["zh_text"] == "阿连德之刃"
  end
  if (change = changes[key])
    from, to = change
    raise "reviewed span differs #{key.inspect}" unless text.scan(from).length == 1
    text = text.sub(from, to)
  else
    raise "unexpected unchanged row" unless key == ["default", "52558", ""] &&
      text == "베나르(Benar)"
  end
  [text, false]
end
