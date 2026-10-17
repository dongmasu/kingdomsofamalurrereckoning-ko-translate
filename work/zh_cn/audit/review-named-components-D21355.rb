#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  { key: "item:arduath-totem", english: "Arduath Totem",
    korean: "아르두아스의 토템(Arduath Totem)", category: "unique item", count: 2,
    notes: "English base:17/default:62090 is the complete item label; Japanese アーデュアスのトーテム and Chinese 阿度阿斯图腾 corroborate. Default:21126 and 31794 explain the emotionally charged totem from the Arduath hollow; these descriptive rows do not contain the full item label and are not newly indexed here. Keep the place entity distinct from this object." },
  { key: "item:ghennig-tower-key", english: "Ghennig Tower Key",
    korean: "게니그 탑 열쇠(Ghennig Tower Key)", category: "unique item", count: 1,
    notes: "English base:3875, Japanese ゲンニグ塔の鍵, and Chinese 格尼格高塔钥匙 identify the complete key label. Default:18853 corroborates a key opening something in Ghennig but is not an exact full-name match. Keep the place entity and key distinct." },
  { key: "item:gloamfrost-dowel", english: "Gloamfrost dowel",
    korean: "글룸프로스트 막대(Gloamfrost dowel)", category: "unique item", count: 1,
    notes: "English base:700, Japanese グロームフロストのダウエル, and Chinese 冰雪黄昏榫 identify a component of the named staff. English default:6936/7111 explains salvaging/rebuilding the three staffs; do not conflate the dowel with the completed weapon. Preserve lowercase source dowel." }
]
changes = {
  ["base", "17", "11"] => ["아르두아스(Arduath)의 토템", "아르두아스의 토템(Arduath Totem)"],
  ["default", "62090", ""] => ["아르두아스(Arduath)의 토템", "아르두아스의 토템(Arduath Totem)"],
  ["base", "3875", "11"] => ["게니그(Ghennig) 탑 열쇠", "게니그 탑 열쇠(Ghennig Tower Key)"],
  ["base", "700", "11"] => ["글룸프로스트(Gloamfrost) 막대", "글룸프로스트 막대(Gloamfrost dowel)"]
}.freeze
context = <<~TEXT.strip
  Follow up the reviewed site/staff names with their complete object labels,
  checking all affix/base/default English matches and aligned Japanese and
  Chinese. Use a single full-label bilingual parenthesis instead of nested
  component parentheses. These are three new object scopes on four already
  visited CSV row keys, not four additional previously untouched rows.
  Existing site/staff dispositions remain terminal and are not reopened.
  The manual's PDF pp. 7-8 distinguishes quest items, equipment, and
  salvageable crafting components; it supplies no exact object names.
TEXT
ReviewedDiscoverySpecs.run(
  21_355, "Arduath Totem, Ghennig Key And Gloamfrost Component",
  specs, context, "## D-21353: Gloamfrost, Sweetrose And Daybreaker Items"
) do |_spec, key, text, _source|
  from, to = changes.fetch(key)
  raise "reviewed object label differs #{key.inspect}" unless text == from
  [to, false]
end
