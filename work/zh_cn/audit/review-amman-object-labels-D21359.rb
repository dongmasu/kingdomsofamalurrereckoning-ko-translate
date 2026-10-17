#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["item:ammans-key-autumn", "Amman's Key - Autumn", "아만의 열쇠 - 가을(Amman's Key - Autumn)", "unique item", 1],
  ["item:ammans-key-winter", "Amman's Key - Winter", "아만의 열쇠 - 겨울(Amman's Key - Winter)", "unique item", 1],
  ["item:ammans-key-summer", "Amman's Key - Summer", "아만의 열쇠 - 여름(Amman's Key - Summer)", "unique item", 1],
  ["item:ammans-key-esharra", "Amman's Key - Esharra", "아만의 열쇠 - 에샤라(Amman's Key - Esharra)", "unique item", 1],
  ["item:ammans-key-spring", "Amman's Key - Spring", "아만의 열쇠 - 봄(Amman's Key - Spring)", "unique item", 1],
  ["item:statue-of-amman-esharra", "Statue of Amman in Esharra", "에샤라의 아만 석상(Statue of Amman in Esharra)", "unique item", 1],
  ["item:statue-of-amman-summer", "Statue of Amman in Summer", "여름의 아만 석상(Statue of Amman in Summer)", "unique item", 1],
  ["item:statue-of-amman-autumn", "Statue of Amman in Autumn", "가을의 아만 석상(Statue of Amman in Autumn)", "unique item", 1],
  ["item:statue-of-amman-winter", "Statue of Amman in Winter", "겨울의 아만 석상(Statue of Amman in Winter)", "unique item", 1],
  ["item:statue-of-amman-spring", "Statue of Amman in Spring", "봄의 아만 석상(Statue of Amman in Spring)", "unique item", 1],
  ["item:statue-of-amman", "Statue of Amman", "아만의 석상(Statue of Amman)", "unique item", 7],
  ["lore:amman-statues", "Amman Statues", "아만의 석상(Amman Statues)", "lore term", 1],
  ["lore:amman-keys", "Amman Keys", "아만의 열쇠(Amman Keys)", "lore term", 1],
  ["lore:ammans-icy-touch", "Amman's Icy Touch", "아만의 얼음 손길(Amman's Icy Touch)", "lore term", 1],
  ["lore:ammans-burning-gaze", "Amman's Burning Gaze", "아만의 불타는 시선(Amman's Burning Gaze)", "lore term", 1],
  ["lore:ammans-thunderous-rage", "Amman's Thunderous Rage", "아만의 천둥치는 분노(Amman's Thunderous Rage)", "lore term", 1]
]
specs = data.map do |key, english, korean, category, count|
  {
    key: key, english: english, korean: korean, category: category, count: count,
    notes: "English-led review of the complete source-local Amman object/effect/topic label with aligned Japanese and Chinese. Seasonal/Esharra keys and statues retain every suffix and remain distinct. The generic Statue of Amman scope denotes the named object type, not one asserted physical statue; full qualified labels cover that type without nested parentheses. Amman Keys/Amman Statues are collective topic labels, not a merge of their members. Icy Touch/Burning Gaze/Thunderous Rage are named magical-effect labels, not an inferred playable skill or new person. English default:24853/59531 explains the five keys and treasure statues; default:55176 explains the elemental artifact curse. The manual's quest/crafting context does not give these exact labels."
  }
end
labels = {
  ["base", "97", "11"] => ["에샤라(Esharra)의 아만(Amman) 석상", "item:statue-of-amman-esharra"],
  ["base", "648", "11"] => ["여름의 아만(Amman) 석상", "item:statue-of-amman-summer"],
  ["base", "849", "11"] => ["가을의 아만(Amman) 석상", "item:statue-of-amman-autumn"],
  ["base", "927", "11"] => ["가을의 아만(Amman) 열쇠", "item:ammans-key-autumn"],
  ["base", "1364", "11"] => ["겨울의 아만(Amman) 석상", "item:statue-of-amman-winter"],
  ["base", "2292", "11"] => ["아만(Amman)의 열쇠 - 겨울", "item:ammans-key-winter"],
  ["base", "2625", "11"] => ["아만(Amman)의 열쇠 - 여름", "item:ammans-key-summer"],
  ["base", "2964", "11"] => ["봄철 아만(Amman)의 조각상", "item:statue-of-amman-spring"],
  ["base", "2988", "11"] => ["아만(Amman)의 열쇠 - 에샤라(Esharra)", "item:ammans-key-esharra"],
  ["base", "3143", "11"] => ["아만(Amman)의 조각상", "item:statue-of-amman"],
  ["base", "4740", "11"] => ["아만(Amman)의 열쇠 - 봄", "item:ammans-key-spring"],
  ["default", "1324", ""] => ["아만(Amman)의 조각상", "item:statue-of-amman"],
  ["default", "12821", ""] => ["아만(Amman)의 석상", "lore:amman-statues"],
  ["default", "23324", ""] => ["아만(Amman)의 얼음 손길", "lore:ammans-icy-touch"],
  ["default", "26516", ""] => ["아만(Amman)의 열쇠", "lore:amman-keys"],
  ["default", "32046", ""] => ["아만(Amman)의 불타는 시선", "lore:ammans-burning-gaze"],
  ["default", "51284", ""] => ["아만(Amman)의 천둥치는 분노", "lore:ammans-thunderous-rage"]
}.freeze
canonicals = specs.to_h { |s| [s.fetch(:key), s.fetch(:korean)] }
context = <<~TEXT.strip
  Complete-label follow-up to D-21357-D-21358. Review the five individually
  qualified keys, five qualified statues, generic statue label, two
  collective topics and three named magical effects across all resources.
  Keep each full bilingual label atomic, normalize 석상/조각상 only in
  these exact statue labels, and preserve all seasonal and Esharra
  distinctions. These are additional entity scopes on 17 already reviewed
  CSV row keys, not 17 newly discovered untouched rows. Earlier person,
  Esharra and object judgments are not reopened or recounted.
TEXT
ReviewedDiscoverySpecs.run(
  21_359, "Amman Seasonal Keys, Statues And Magical Effect Labels",
  specs, context, "## D-21358: Amman The Clever And The Eye Of Amman"
) do |_spec, key, text, _source|
  old, target_entity = labels.fetch(key)
  canonical = canonicals.fetch(target_entity)
  raise "Amman full-label span differs #{key.inspect}" unless text == old || text == canonical
  [canonical, false]
end
