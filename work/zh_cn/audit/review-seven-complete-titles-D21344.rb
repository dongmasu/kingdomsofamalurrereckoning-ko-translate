#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["title:reizarfs-guidance", "Rei'zarf's Guidance", "레이자르프의 인도(Rei'zarf's Guidance)", 1, "Japanese レイツァルフの導き and Chinese 雷扎夫的指引 corroborate the source-local complete label."],
  ["title:mauns-triple-key", "Maun's Triple Key", "마운의 삼중 열쇠(Maun's Triple Key)", 1, "Japanese マウンの三重鍵 and Chinese 莫恩的三重钥匙 corroborate the complete key label."],
  ["title:chernobogs-eye", "Chernobog's Eye", "체르노보그의 눈(Chernobog's Eye)", 2, "Japanese チェルノボグの眼 and Chinese 切诺博格之眼 corroborate the complete label; default:27058 uses lowercase eye for the claimed prize. Preserve source-local English capitalization in that prose."],
  ["title:faraks-pummelers", "Farak's Pummelers", "파락의 연타자(Farak's Pummelers)", 1, "Japanese ファラクの殴り手 and Chinese 法拉克的连击 corroborate the complete label. Infer no equipment class from Pummelers."],
  ["named work:berenikes-research-notes", "Berenike's Research Notes", "베레니케의 연구 기록(Berenike's Research Notes)", 2, "Japanese ベレニケの研究記録/研究ノート and Chinese 贝列尼可的研究笔记 corroborate the complete document label. Preserve source-local lowercase research notes at default:18004."],
  ["title:chernobogs-offering", "Chernobog's Offering", "체르노보그에게 바치는 제물(Chernobog's Offering)", 1, "Japanese チェルノボグへのささげ物 and Chinese 切诺博格的祭品 corroborate the complete offering label; retain the existing Korean direction of the offering."],
  ["title:kellaracs-sword", "Kellarac's Sword", "켈라락의 검(Kellarac's Sword)", 1, "Japanese retains Kellarac's Sword, while Chinese 克勒拉克之剑 corroborates the name and object. Preserve 켈라락의 검."]
]
specs = data.map do |key, english, korean, count, notes|
  {
    key: key, english: english,
    category: key.start_with?("named work:") ? "named work" : "title",
    korean: korean, count: count,
    notes: "English explicitly supplies #{english}. #{notes} This is a source-local complete label, not evidence to register an inferred possessor as a person, merge identities, or assign rarity/function."
  }
end
changes = {
  ["base", "669", "11"] => ["레이자르프(Rei'zarf)의 인도", "레이자르프의 인도(Rei'zarf's Guidance)"],
  ["base", "725", "11"] => ["마운(Maun)의 삼중 열쇠", "마운의 삼중 열쇠(Maun's Triple Key)"],
  ["base", "2114", "11"] => ["체르노보그(Chernobog)의 눈", "체르노보그의 눈(Chernobog's Eye)"],
  ["base", "2822", "11"] => ["파락(Farak)의 연타자", "파락의 연타자(Farak's Pummelers)"],
  ["base", "3414", "11"] => ["베레니케(Berenike)의 연구 기록", "베레니케의 연구 기록(Berenike's Research Notes)"],
  ["base", "3748", "11"] => ["체르노보그(Chernobog)에게 바치는 제물", "체르노보그에게 바치는 제물(Chernobog's Offering)"],
  ["base", "4225", "11"] => ["켈라락(Kellarac)의 검", "켈라락의 검(Kellarac's Sword)"],
  ["default", "18004", ""] => ["베레니케(Berenike)의 연구 기록", "베레니케의 연구 기록(Berenike's research notes)"],
  ["default", "27058", ""] => ["체르노보그의 눈", "체르노보그의 눈(Chernobog's eye)"]
}.freeze
context = <<~TEXT.strip
  Register seven exact source-local item/work labels across nine distinct
  base/default keys. Preserve the existing Korean wording and replace
  component-only or absent English annotations with each complete label.
  Lowercase English words in the two prose references remain source-local.
  No possessor biography, divine identity, equipment class, item rarity,
  or unproved link between similarly named objects is inferred. Official
  Korean manual PDF pages 6-8 supplies inventory/equipment/crafting context,
  not these exact title translations. Affix has no applicable source keys.
TEXT
ReviewedDiscoverySpecs.run(
  21_344, "Seven Complete Item And Document Labels", specs, context,
  "## D-21343: Glendara Region, Forest, Passage And Named Titles"
) do |_spec, key, text, _source|
  from, to = changes.fetch(key)
  raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
  [text.sub(from, to), false]
end
