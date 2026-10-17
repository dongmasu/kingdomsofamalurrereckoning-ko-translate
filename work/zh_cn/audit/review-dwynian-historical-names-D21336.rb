#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {
    key: "person:dwynian", english: "Dwynian", category: "person",
    korean: "드위니안(Dwynian)", variants: "드위니언", count: 6,
    notes: "English default:49996 explicitly names Dwynian, the mage and Anathon's pupil, as the tale's protagonist. Japanese ドウィニアン and Chinese 德雯妮安 corroborate. Reuse 드위니안 from base:699 and the standalone default:56288; normalize 드위니언 in the book title. The title's complete bilingual form also covers its embedded person name."
  },
  {
    key: "person:anathon", english: "Anathon", category: "person",
    korean: "아나톤(Anathon)", count: 5,
    notes: "English default:2224/36939 identifies Anathon as the mage associated with Rathir's founding and the Orbocant; default:49996 makes him Dwynian's teacher. Japanese アナトン and Chinese 阿纳森 corroborate. Reuse the complete existing paired form at default:2224/55953, adding annotation only to the first mention in each remaining prose cell."
  },
  {
    key: "person:caethra", english: "Caethra", category: "person",
    korean: "카에트라(Caethra)", count: 1,
    notes: "English default:36939 explicitly identifies the poet Caethra, who speaks to the people as the Elund. Japanese ケイスラ and Chinese 凯瑟拉 corroborate the name/role. Retain the existing Korean 카에트라 and annotate its first mention, without equating the historical individual with contemporary Elund Carth."
  },
  {
    key: "person:ranu", english: "Ranu", category: "person",
    korean: "라누(Ranu)", count: 1,
    notes: "English default:49996 explicitly names Ranu as the guard loved by Dwynian. Japanese ラヌー and Chinese 兰鲁 corroborate. Retain 라누 and annotate the explicit first introduction; later mentions in this same tale remain concise."
  },
  {
    key: "person:ailoc", english: "Ailoc", category: "person",
    korean: "아이록(Ailoc)", count: 1,
    notes: "English default:49996 explicitly names Ailoc as the individual antagonist fought by Dwynian. Japanese アイロック and Chinese 爱洛克 corroborate. Retain 아이록 and annotate the first mention. Person is an individual-name index category only; do not infer a species or a separate NPC identity."
  },
  {
    key: "named work:the-fall-of-dwynian", english: "The Fall of Dwynian",
    category: "named work", korean: "드위니안의 몰락(The Fall of Dwynian)",
    aliases: "Fall of Dwynian", variants: "드위니언의 몰락", count: 4,
    notes: "English base:699/default:64950 supplies the exact book title; default:21611 quotes its opening lines, and 36939 calls it a tale. Japanese ドウィニアンの没落 and Chinese 德雯妮安的陨落/德文尼安的衰落 corroborate. Preserve the complete paired title and existing spacing at base:699. At default:36939 retain the local article-less English Fall of Dwynian rather than inventing The."
  }
]
changes = {
  ["person:dwynian", "49996"] => ["드위니안의 이야기", "드위니안(Dwynian)의 이야기"],
  ["person:anathon", "8997"] => ["아나톤 시대부터", "아나톤(Anathon) 시대부터"],
  ["person:anathon", "36939"] => ["아나톤의 강력한 마법", "아나톤(Anathon)의 강력한 마법"],
  ["person:anathon", "49996"] => ["아나톤은 첨탑 꼭대기에서", "아나톤(Anathon)은 첨탑 꼭대기에서"],
  ["person:caethra", "36939"] => ["시인 카에트라가", "시인 카에트라(Caethra)가"],
  ["person:ranu", "49996"] => ["이름은 라누.", "이름은 라누(Ranu)."],
  ["person:ailoc", "49996"] => ["아이록이 나타났어", "아이록(Ailoc)이 나타났어"],
  ["named work:the-fall-of-dwynian", "36939"] =>
    ["드위니안의 몰락이다", "드위니안의 몰락(Fall of Dwynian)이다"],
  ["named work:the-fall-of-dwynian", "64950"] =>
    ["드위니언의 몰락", "드위니안의 몰락(The Fall of Dwynian)"]
}.freeze
readings = {
  "person:dwynian" => [/ドウィニアン|Dwynian/, /德雯妮安|德文尼安|Dwynian/],
  "person:anathon" => [/アナトン/, /阿纳森/],
  "person:caethra" => [/ケイスラ/, /凯瑟拉/],
  "person:ranu" => [/ラヌー/, /兰鲁/],
  "person:ailoc" => [/アイロック/, /爱洛克/],
  "named work:the-fall-of-dwynian" => [/ドウィニアンの没落/, /德雯妮安|德文尼安/]
}.freeze
context = <<~TEXT.strip
  Register five explicitly named historical/story individuals and the separate
  book title, anchored to English default:2224/36939/49996 and the source
  labels. Japanese/Chinese corroboration is recorded per row. Preserve the
  already established Korean readings, correct the isolated 드위니언 title
  variant, and add complete bilingual labels or first-mention annotations.
  Keep subsequent names concise within each long cell, and leave unrelated
  historical, council, title and creature terminology unchanged. Official
  Korean manual PDF pages 1-2 provides Fate, Lyria and setting context, and
  page 7 provides quest/faction context, not these individual biographies.
  A shared row across multiple newly registered scopes is counted once.
TEXT
ReviewedDiscoverySpecs.run(
  21_336, "Dwynian Tale, Named Individuals And Book Title", specs, context,
  "## D-21332: Fontleroy Journal Name"
) do |spec, key, text, source|
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  ja, zh = readings.fetch(spec[:key])
  raise "missing source corroboration #{spec[:key]} #{key.inspect}" unless
    japanese.match?(ja) && source["zh_text"].match?(zh)
  change = key[0] == "default" && changes[[spec[:key], key[1]]]
  if change
    from, to = change
    raise "reviewed span differs #{key.inspect}" unless text.scan(from).length == 1
    text = text.sub(from, to)
  end
  [text, false]
end
