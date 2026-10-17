#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "place:haxhi", english: "Haxhi", category: "place",
    korean: "하크시(Haxhi)", variants: "핵시|학시|헥시|해크시", count: 38,
    notes: "English base:3572 and default:43493 explicitly label Haxhi; repeated travel, forest, cave and contract contexts identify the region. Japanese ハクシ and Chinese 哈克希 corroborate. Reuse the already paired 하크시 form, normalizing 핵시/학시/헥시/해크시 only at the reviewed name spans. Keep repeated short references concise after an existing annotation within the same cell. Complete Haxhi Stone, Haxhi Dam and Crown of Haxhi phrases are separately indexed labels, not parent-place-only annotations."
  },
  {
    key: "title:haxhi-stone", english: "Haxhi Stone", category: "title",
    korean: "하크시의 돌(Haxhi Stone)", count: 1,
    notes: "English base:248 supplies Haxhi Stone; Japanese ハクシの石 and Chinese 哈克希之石 corroborate. Pair the complete label and standardize its Haxhi component. This lexical title record does not assert a new item function or object biography."
  },
  {
    key: "place:haxhi-dam", english: "Haxhi Dam", category: "place",
    korean: "하크시 댐(Haxhi Dam)", count: 1,
    notes: "English default:63396 labels Haxhi Dam; Japanese ハクシ・ダム and Chinese 哈克希大坝 corroborate the complete named location. Retain 하크시 댐 and add the full English annotation."
  },
  {
    key: "title:crown-of-haxhi", english: "Crown of Haxhi", category: "title",
    korean: "하크시의 왕관(Crown of Haxhi)", count: 2,
    notes: "English default:10429/59397 repeats Crown of Haxhi within Sagrell's Defender epithet; Japanese ハクシの王冠 and Chinese 哈克希之冠 corroborate. Retain the existing 왕관 meaning and pair the exact full phrase. This is a lexical name/title record only: it does not decide whether Crown denotes an object, realm or topographic feature."
  }
]
plain = {
  "380" => "하크시", "2679" => "핵시(Haxhi)", "5463" => "학시(Haxhi)",
  "9974" => "하크시", "11780" => "핵시(Haxhi)", "25655" => "하크시",
  "34219" => "헥시", "37684" => "하크시", "38365" => "핵시",
  "38556" => "핵시", "39164" => "하크시", "40592" => "학시",
  "41337" => "학시", "41367" => "학시", "41670" => "하크시",
  "43493" => "학시", "44861" => "학시", "46670" => "해크시",
  "47119" => "하크시", "47144" => "하크시", "47365" => "하크시",
  "48672" => "하크시", "49543" => "하크시", "51891" => "학시(Haxhi)",
  "58806" => "핵시", "64854" => "학시"
}.freeze
compounds = {
  ["base", "248", "11"] => ["학시(Haxhi)의 돌", "하크시의 돌(Haxhi Stone)"],
  ["default", "63396", ""] => ["하크시 댐", "하크시 댐(Haxhi Dam)"],
  ["default", "10429", ""] => ["하크시 왕관", "하크시의 왕관(Crown of Haxhi)"],
  ["default", "59397", ""] => ["하크시 왕관", "하크시의 왕관(Crown of Haxhi)"]
}.freeze
context = <<~TEXT.strip
  Review all 38 distinct Haxhi source keys, including 42 overlapping entity
  matches across the parent region and three complete compound labels.
  Standardize the observed Korean place-name variants to 하크시, add
  missing bilingual labels, and preserve the already paired eight rows.
  Keep Sagrell, Ozigan, Troll, journal, contract and other adjacent
  decisions outside this spelling scope. Do not infer the physical identity
  of Crown of Haxhi from its epithet alone. Official Korean manual PDF
  pages 1,4,7 provides world/map/quest context, not this region's spelling.
TEXT
ReviewedDiscoverySpecs.run(
  21_342, "Haxhi Region And Complete Compound Labels", specs, context,
  "## D-21340: Benar Trader And Allender's Edge Label"
) do |spec, key, text, source|
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  raise "Japanese Haxhi differs #{key.inspect}" unless japanese.match?(/ハクシ|Haxhi/)
  raise "Chinese Haxhi differs #{key.inspect}" unless source["zh_text"].match?(/哈克希|Haxhi/)
  if spec[:key] == "place:haxhi"
    if compounds.key?(key)
      [text, false]
    elsif key[0] == "default" && (from = plain[key[1]])
      raise "reviewed name differs #{key.inspect}" unless text.scan(from).length == 1
      [text.sub(from, spec.fetch(:korean)), false]
    else
      raise "unexpected unpaired row #{key.inspect}" unless text.include?("하크시(Haxhi)")
      [text, false]
    end
  else
    from, to = compounds.fetch(key)
    raise "compound span differs #{key.inspect}" unless text.scan(from).length == 1
    [text.sub(from, to), false]
  end
end
