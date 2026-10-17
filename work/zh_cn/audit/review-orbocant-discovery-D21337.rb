#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [{
  key: "organization:orbocant", english: "Orbocant", category: "organization",
  korean: "오르보칸트(Orbocant)", count: 38,
  notes: "English default:3538 explicitly defines the Orbocant as Rathir's ruling council; 8997/36939 records its history, and 53452 contrasts the council's governing role with the Elund's speaking role. Japanese オーボカント and Chinese 奥博坎议会 corroborate. Preserve the established 오르보칸트 form. The source also uses the institution's name for its halls and seat; retain that contextual use, without inventing a distinct building identity or forcing the word council into those sentences."
}]
ids = %w[
  5397 8997 14933 26860 30776 31730 33484 36939 42202 43087 43510
  43725 43807 46606 48633
].freeze
context = <<~TEXT.strip
  Review every English Orbocant match across affix/base/default, preserving
  the distinction between a ruling body and contextual references to its
  premises. Add the missing 오르보칸트(Orbocant) annotation at the 15 exact
  default keys; annotate only the first occurrence in each long lore cell.
  The other 23 keys are already paired. Preserve D-21336's historical-name
  changes and all unrelated personal-name and title decisions. Official
  Korean manual PDF pages 1 and 7 provides world/faction/quest context,
  but does not list this council.
TEXT
ReviewedDiscoverySpecs.run(
  21_337, "Orbocant Council And Contextual Seat References", specs, context,
  "## D-21336: Dwynian Tale, Named Individuals And Book Title"
) do |_spec, key, text, source|
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n")
  raise "Japanese source differs" unless japanese.match?(/オーボカント|Orbocant/)
  raise "Chinese source differs" unless source["zh_text"].match?(/奥博坎|Orbocant/)
  if key[0] == "default" && ids.include?(key[1])
    raise "unexpected existing annotation #{key.inspect}" if text.include?("(Orbocant)")
    raise "missing reviewed name #{key.inspect}" unless text.include?("오르보칸트")
    text = text.sub("오르보칸트", "오르보칸트(Orbocant)")
  else
    raise "unexpected unpaired row #{key.inspect}" unless text.include?("오르보칸트(Orbocant)")
  end
  [text, false]
end
