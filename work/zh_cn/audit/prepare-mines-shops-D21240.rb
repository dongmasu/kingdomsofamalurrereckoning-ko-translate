#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:seven-widow-mine", english: "Seven Widow Mine", category: "place",
   korean: "세븐 위도우 광산(Seven Widow Mine)", count: 2,
   notes: "English full labels, Japanese セブン・ウィドウ鉱山 and Chinese 七寡妇矿场/矿区 identify the named mine. Reuse base 세븐 위도우 rather than alternate 일곱 과부; do not register a bare Widow alias."},
  {key: "place:shattertier-mine", english: "Shattertier Mine", category: "place",
   korean: "섀터티어 광산(Shattertier Mine)", aliases: "Shattertier Mines", count: 5,
   notes: "English labels and the Deadeye hunt identify the mine, with singular/plural source forms. Japanese シャタティア鉱山 and Chinese 碎层矿场/破碎矿洞/沙特迪尔矿井 corroborate. Reuse base 섀터티어, correcting 샤터티어/섀터타이어, and preserve source-local Mine/Mines. Bare Shattertier references require a separate contextual review; they are not globally inferred here."},
  {key: "place:tearscotter-mines", english: "Tearscotter Mines", category: "place",
   korean: "티어스코터 광산(Tearscotter Mines)", aliases: "Tearscotter Mine", count: 9,
   notes: "English ties the mine to southeastern Menetyre, Kobolds and the Clan Totem, and separately records its collapse. Japanese ティアスコッター鉱山 and Chinese 提尔斯科特矿场 corroborate. Keep the repeated 티어스코터 stem and each source-local singular/plural/case. Cecil Tearscotter and Tearscotter Estates are different referents; do not alias bare Tearscotter."},
  {key: "place:thorins-apothecary", english: "Thorin's Apothecary", category: "place",
   korean: "소린의 약국(Thorin's Apothecary)", count: 2,
   notes: "English full shop labels, Japanese ソリン薬局/薬店 and Chinese 索林药房 corroborate the apothecary. Reuse base 소린 and 약국 rather than alternate 약방. Do not infer either registered Askel Thorin or Sigra Thorin is the shop's namesake; the separate Alchemical Apothecary source wording is outside this exact matcher."},
  {key: "place:stonecandle-mines", english: "Stonecandle Mines", category: "place",
   korean: "스톤캔들 광산(Stonecandle Mines)", aliases: "Stonecandle Mine", count: 4,
   notes: "English names the mine supplying the Well's Prismere and gives its establishment in the mining log. Japanese ストーンキャンドル鉱山 and Chinese 石烛矿场/矿山 corroborate. Reuse 스톤캔들 and source-local Mine/Mines; preserve the separately named Stonecandle Caves in the same default:54560 log."},
  {key: "place:golden-plains-inn", english: "The Golden Plains Inn", category: "place",
   korean: "황금 평원 여관(The Golden Plains Inn)", aliases: "Golden Plains Inn", count: 3,
   notes: "English labels and guest/drinks dialogue name the inn. Japanese 黄金平原亭 and Chinese 金原旅馆 corroborate the base literal 황금 평원 rather than variable 골든 플레인/플레인스. Preserve The in the base title, without inventing it in the two prose source forms."},
  {key: "place:valjean-mine", english: "Valjean Mine", category: "place",
   korean: "발지언 광산(Valjean Mine)", count: 3,
   notes: "English exact mine labels and key description, Japanese ヴァルジアン鉱山 and Chinese 瓦尔津矿井 identify the site. Reuse base 발지언 instead of 발지안/발장. At default:36537 preserve the key relation and final period; the key is not an alias of the mine."}
]
context = "Read-only full-name comparison across affix/base/default and aligned English/Japanese/Chinese distinguishes five mines, one apothecary and one inn. Official Korean manual PDF pages 4, 7 and 9 provides map, quest-objective and world-facility context, not these individual names. Keep each source-local English singular/plural/case/article in complete atomic bilingual place labels, and preserve unrelated characters, caves, estates, quest items, particles, tokens and line breaks. No prior identity hold or historical global tally is reopened."
ReviewedDiscoverySpecs.run(21_240, "Five Mines Apothecary And Inn", specs, context,
  "## D-21239: Leechwood Tree Registration Gap") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  pattern, korean = case spec[:key]
                    when "place:seven-widow-mine"
                      [/(?:세븐 위도우(?:\(Seven Widow\))?|일곱 과부) 광산(?:\(Seven Widow Mine\))?/, "세븐 위도우 광산"]
                    when "place:shattertier-mine"
                      [/(?:섀터티어|샤터티어|섀터타이어)(?:\(Shattertier\))? 광산(?:\(Shattertier Mines?\))?/, "섀터티어 광산"]
                    when "place:tearscotter-mines"
                      [/티어스코터(?:\(Tearscotter\))? 광산(?:\(Tearscotter Mines?\))?/, "티어스코터 광산"]
                    when "place:thorins-apothecary"
                      [/소린(?:\(Thorin\))?의 (?:약국|약방)(?:\(Thorin's Apothecary\))?/, "소린의 약국"]
                    when "place:stonecandle-mines"
                      [/스톤캔들(?:\(Stonecandle\))? 광산(?:\(Stonecandle Mines?\))?/, "스톤캔들 광산"]
                    when "place:golden-plains-inn"
                      [/(?:황금 평원|골든 플레인|골든 플레인스) 여관(?: ?\(The Golden Plains Inn\))?/, "황금 평원 여관"]
                    when "place:valjean-mine"
                      [/(?:발지언(?:\(Valjean\))?|발지안|발장) 광산(?:\(Valjean Mine\))?/, "발지언 광산"]
                    end
  terms = [spec[:english], *spec.fetch(:aliases, "").split("|")].sort_by { |term| -term.length }
  term_pattern = Regexp.new("(?<![A-Za-z])(?:#{terms.map { |term| Regexp.escape(term) }.join('|')})(?![A-Za-z])", Regexp::IGNORECASE)
  labels = english.scan(term_pattern)
  raise "expected one source and Korean place span #{key}" unless labels.length == 1 && text.scan(pattern).length == 1
  [text.sub(pattern, "#{korean}(#{labels.first})"), false]
end
