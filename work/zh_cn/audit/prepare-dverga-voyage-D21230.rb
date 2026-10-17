#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "person:kaleva-maht", english: "Kaleva Maht", category: "person",
   korean: "칼레바 마트(Kaleva Maht)", aliases: "Kaleva", count: 8,
   notes: "English default:42154 explicitly gives Prince Kaleva Maht, identifies King Maht as his father, and uses short Kaleva for the same prince. Japanese カレーヴァ・マハト/カレーヴァ and Chinese 卡勒瓦·马尔特 corroborate; reuse the repeated Korean 칼레바 and 마트 rather than isolated 카레바. Annotate each source-local full/short name. The surname Maht alone is not a global alias for either father or son."},
  {key: "person:king-maht", english: "King Maht", category: "person",
   korean: "마트 왕(King Maht)", count: 2,
   notes: "English explicitly names the father and captain of Naglfar, not his son Kaleva Maht. Japanese マハト王 and Chinese 马特国王/马尔特国王 corroborate. Reuse the active 마트 왕; do not annotate ordinary King/father pronouns or bare shared surname as the full personal title."},
  {key: "lore term:barufakir", english: "Barufakir", category: "lore term",
   korean: "바루파키르호(Barufakir)", count: 6,
   notes: "English identifies the prince's exceptionally fast royal ship, lost in the tempest. Japanese バルファキア号 and Chinese 巴鲁法奇尔号/巴鲁瓦吉尔号 support the same named vessel. Reuse active 바루파키르, keeping the ship suffix inside the Korean label. The eponymous book is separately registered and takes a complete bilingual title."},
  {key: "lore term:naglfar", english: "Naglfar", category: "lore term",
   korean: "나글파르호(Naglfar)", count: 3,
   notes: "English identifies King Maht's royal ship, distinct from the prince's Barufakir; its safe-sea blessing and later transport by golems establish the referent. Japanese ナグルファー号 and Chinese 纳戈法号/纳格尔法号 corroborate. Retain repeated Korean 나글파르호 and annotate each explicit ship name."},
  {key: "creature:heimdallyr", english: "Heimdallyr", category: "creature",
   korean: "하임달리르(Heimdallyr)", count: 1,
   notes: "English default:15086 explicitly says King Maht named the guardian key-golem Heimdallyr. Japanese ハイムダリーア and Chinese 黑姆达利尔 corroborate. Retain the existing Korean 하임달리르; this is a specifically named guardian, not a new generic golem species."},
  {key: "named work:voyage-of-the-barufakir", english: "Voyage of the Barufakir",
   category: "named work", korean: "바루파키르호의 항해(Voyage of the Barufakir)", count: 2,
   notes: "The exact base/default title labels name the book about the royal vessel and prince, supported by Japanese バルファキア号の航海 and Chinese 巴鲁法奇尔号的航行/巴鲁瓦吉尔号的旅程. Use one complete bilingual book title; the nested vessel index match is covered by its complete English title."},
  {key: "named work:prince-kalevas-journal", english: "Prince Kaleva's Journal",
   category: "named work", korean: "칼레바 왕자의 일지(Prince Kaleva's Journal)", count: 2,
   notes: "English base/default title labels and the matching journal description identify Prince Kaleva's personal journal. Japanese カレーヴァ王子の日誌 and Chinese 卡勒瓦王子的日记 corroborate. Use one complete bilingual title, not a person annotation nested inside the title."}
]
context = "Read-only English/Japanese/Chinese comparison of every exact source match across affix/base/default distinguishes the father, son, two vessels, named guardian, and two books. Official Korean manual PDF pages 1 and 7-8 supplies peoples, quest, item and dialogue context but does not list these DLC names. Reuse established in-corpus spellings; preserve all other names, tokens, paragraph breaks, narrator voice and the earlier Obsidian Isle correction. Overlapping matches are counted once per distinct CSV row key; existing decisions and historical global totals are not reopened."
ReviewedDiscoverySpecs.run(21_230, "Dverga Royal Voyage Names And Books", specs, context,
  "## D-21229: Residual Bilingual Labels On Existing Keys") do |spec, key, text, source|
  english = JSON.parse(source.fetch("en_texts_json")).join("\n")
  book_title = {
    "Voyage of the Barufakir" => "바루파키르호의 항해(Voyage of the Barufakir)",
    "Prince Kaleva's Journal" => "칼레바 왕자의 일지(Prince Kaleva's Journal)"
  }[english]
  if book_title
    text = book_title
  else
    case spec[:key]
    when "person:kaleva-maht"
      text.gsub!(/칼레바 마트(?:\(Kaleva Maht\))?/, spec[:korean])
      text.gsub!(/(?:칼레바|카레바)(?:\(Kaleva\))?(?! 마트|\(Kaleva Maht\))/, "칼레바(Kaleva)")
    when "person:king-maht"
      text.gsub!(/마트 왕(?:\(King Maht\))?/, spec[:korean])
    when "lore term:barufakir"
      text.gsub!(/바루파키르(?:\(Barufakir\))?(?: ?호)?/, spec[:korean])
    when "lore term:naglfar"
      text.gsub!(/나글파르(?:\(Naglfar\))?(?: ?호)?/, spec[:korean])
    when "creature:heimdallyr"
      text.gsub!(/하임달리르(?:\(Heimdallyr\))?/, spec[:korean])
    end
  end
  [text, false]
end
