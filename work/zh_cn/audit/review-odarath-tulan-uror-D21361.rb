#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["place:odarath", "Odarath", "오다라스(Odarath)", "place", 35,
   "English default:20030/39632/62263 identifies a region/forest land, corroborated by Japanese オダラス and Chinese 欧达拉斯. Reuse the existing consistent 오다라스 spelling and pair missing references; do not infer a city or person."],
  ["place:tulan", "Tulan", "툴란(Tulan)", "place", 7,
   "English default:39080/47697/49534 identifies the cave connected to passages beneath Mel Aglir. Japanese テュラン and Chinese 图兰 corroborate. Reuse base:1208 and retain the descriptive 동굴 separately."],
  ["person:uror", "Uror", "우로르(Uror)", "person", 3,
   "English default:32026 explicitly says the depicted woman's name Uror is etched on the statue base. Japanese ウロル and Chinese 乌若尔 corroborate. Register only this name; do not infer that she is a goddess, a living NPC, or any particular race."],
  ["item:odarath-stone", "Odarath Stone", "오다라스의 돌(Odarath Stone)", "unique item", 1,
   "English base:2835, Japanese オダラスの石 and Chinese 欧达拉斯之石 corroborate the complete object label. Keep the named stone distinct from the region."],
  ["place:odarath-jail", "Odarath Jail", "오다라스 감옥(Odarath Jail)", "place", 1,
   "English base:4285, Japanese オダラスの監獄 and Chinese 欧达拉斯监狱 corroborate the complete jail label. Do not merge it with the Odarath region."],
  ["title:secrets-of-odarath", "Secrets of Odarath", "오다라스의 비밀(Secrets of Odarath)", "title", 1,
   "English default:38689 is the complete heading followed by a description of people confiding in Lorestones. Japanese オダラスの秘密 and Chinese 欧达拉斯的秘密 corroborate; register the title, not an inferred book or another physical place."]
]
specs = data.map do |key, english, korean, category, count, notes|
  { key: key, english: english, korean: korean, category: category,
    count: count, notes: notes }
end
patterns = {
  "Odarath" => /오다라스(?:\(Odarath\))?/,
  "Tulan" => /툴란(?:\(Tulan\))?/,
  "Uror" => /우로르(?:\(Uror\))?/
}.freeze
context = <<~TEXT.strip
  Discover unregistered exact English names across all three resources:
  two geographic names, the named woman depicted by a statue, and three
  complete Odarath-based object/place/title labels. Aligned Japanese and
  Chinese corroborate each source-local context, but do not override English.
  Official Korean manual PDF p. 1 supplies forest/region setting and
  PDF pp. 7-8 quest/exploration context, not direct spellings for these
  names. Preserve neighboring named sites/people, including all prior
  Amman annotations in the journal, and count shared entity hits once per
  resource/ID/variant row. No historical global tally is reused.
  At default:31601 retain the exact highlighted token {*1오다라스} and
  append (Odarath) outside its brace; all markup bytes remain unchanged.
TEXT

ReviewedDiscoverySpecs.run(
  21_361, "Odarath, Tulan, Uror And Complete Odarath Labels",
  specs, context, "## D-21360: Row-Scoped Lycium And Amman Source Forms"
) do |spec, key, text, _source|
  english = spec.fetch(:english)
  if key == ["default", "31601", ""]
    raise "styled Odarath span differs" unless text.scan("{*1오다라스}").length == 1
    [text.sub("{*1오다라스}", "{*1오다라스}(Odarath)"), false]
  elsif patterns.key?(english)
    pattern = patterns.fetch(english)
    raise "reviewed name missing #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec.fetch(:korean)), false]
  else
    from = case english
           when "Odarath Stone" then "오다라스(Odarath)의 돌"
           when "Odarath Jail" then "오다라스(Odarath) 감옥"
           when "Secrets of Odarath" then "오다라스(Odarath)의 비밀"
           end
    raise "full source label differs #{key.inspect}" unless from && text.scan(from).length == 1
    [text.sub(from, spec.fetch(:korean)), false]
  end
end
