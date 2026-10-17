#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_212
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

definition_values = [
  ["place:air-shrine-caverns", "Air Shrine Caverns", "place",
   "대기의 성소 동굴(Air Shrine Caverns)", "", "대기의 성소(Air Shrine) 동굴",
   "D-#{d}|default:39096",
   "confirmed",
   "English identifies the complete cavern location label. Japanese 大気の聖堂の洞窟 and Chinese 空气神殿洞穴 corroborate the shrine-and-cavern compound. Use one complete bilingual place name, not nested parentheses around Air Shrine."],
  ["place:earth-shrine-caverns", "Earth Shrine Caverns", "place",
   "대지의 성소 동굴(Earth Shrine Caverns)", "", "대지의 성소(Earth Shrine) 동굴",
   "D-#{d}|default:64142",
   "confirmed",
   "English identifies the complete cavern location label. Japanese 大地の聖堂の洞窟 and Chinese 大地神殿洞穴 corroborate the shrine-and-cavern compound. Use one complete bilingual place name, not nested parentheses around Earth Shrine."],
  ["lore term:air-and-earth-shrines", "Air and Earth Shrines", "lore term",
   "대기와 대지의 성소들(Air and Earth Shrines)",
   "Earth and Air Shrines|Shrines of Earth and Air", "",
   "D-#{d}|default:4051|default:8969|default:17781|default:26601|default:34215|default:36232|default:53205|default:54820",
   "confirmed",
   "This is a recurring collective reference to the individually registered Air Shrine and Earth Shrine, not a third physical location or an identity merge. English uses three coordinated forms: Air and Earth Shrines, Earth and Air Shrines, and Shrines of Earth and Air. Japanese 大気と大地の聖堂 / 大地と大気の聖堂 and Chinese 空气神殿与大地神殿 corroborate the two-landmark grouping. Pair each complete source phrase with Korean and preserve source order in the English annotation."]
].freeze

definition_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definition_path, review_path].any? { |path| File.exist?(path) }
definition_headers = m.table(File.join(audit, "proper-name-glossary.tsv")).headers
definitions = definition_values.map { |values| definition_headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_counts = {
  "place:air-shrine-caverns" => 1,
  "place:earth-shrine-caverns" => 1,
  "lore term:air-and-earth-shrines" => 8
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

replacements = {
  ["default", "4051", ""] =>
    ["공기와 대지의 성소를 이용해",
     "대기와 대지의 성소들(Air and Earth Shrines)을 이용해"],
  ["default", "17781", ""] =>
    ["공기와 대지의 성소를 이용해",
     "대기와 대지의 성소들(Air and Earth Shrines)을 이용해"],
  ["default", "26601", ""] =>
    ["공기와 대지의 성소의 힘을 다뤄",
     "대기와 대지의 성소들(Air and Earth shrines)의 힘을 다뤄"],
  ["default", "34215", ""] =>
    ["대지와 대기의 성소에서",
     "대지와 대기의 성소들(Shrines of Earth and Air)에서"],
  ["default", "36232", ""] =>
    ["대지의 신전과 대기의 신전이라 불렸지",
     "대지와 대기의 성소들(Shrines of Earth and Air)이라 불렸지"],
  ["default", "39096", ""] =>
    ["대기의 성소(Air Shrine) 동굴",
     "대기의 성소 동굴(Air Shrine Caverns)"],
  ["default", "53205", ""] =>
    ["대지와 공기의 성소에 꼭 가 달라고",
     "대지와 대기의 성소들(Shrines of Earth and Air)에 꼭 가 달라고"],
  ["default", "54820", ""] =>
    ["대지와 대기의 성소(Shrines of Earth and Air)에서",
     "대지와 대기의 성소들(Shrines of Earth and Air)에서"],
  ["default", "64142", ""] =>
    ["대지의 성소(Earth Shrine) 동굴",
     "대지의 성소 동굴(Earth Shrine Caverns)"]
}.freeze

rows_by_key = generated.group_by { |row| m.key(row) }
reviews = rows_by_key.keys.sort_by do |key|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key|
  source = inventory.fetch(key)
  entities = rows_by_key.fetch(key).map { |row| row.fetch("entity_key") }.uniq.sort
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = replacements[key])
    from, to = change
    raise "expected one reviewed span at #{key.inspect}" unless
      new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entities.join("|"),
    "status" => old == new_text ? "not-an-issue" : "accepted",
    "old" => old,
    "new" => new_text,
    "evidence" =>
      "D-#{d} English-led place/collective-name review. Exact aligned English, Japanese, Chinese, and Korean source cells are recorded here. The two cavern labels are complete location names; paired Air/Earth references denote the two individually registered shrines together, not a third site. Preserve dialogue, particles, paragraph structure, and unrelated names. The non-exhaustive official Korean manual has no direct entry for these DLC locations.",
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(
      entities.to_h { |entity| [entity, old == new_text ? "not-an-issue" : "accepted"] }
    )
  }
end
raise "expected ten distinct source rows" unless reviews.length == 10
raise "unmapped proposed row" unless
  (replacements.keys - reviews.map { |row| m.key(row) }).empty?

m.write_table(definition_path, definition_headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])

review_note = <<~TEXT

## D-#{d}: Shrine Caverns And The Paired Shrines

Registered Air Shrine Caverns and Earth Shrine Caverns as complete places,
and the recurring collective term Air and Earth Shrines as a lore term for
the two individually registered shrines, not a third site. Reviewed ten
distinct default row keys and ten entity matches: eight paired-shrine
references plus one row for each cavern label. Corrected eight cells and
retained two already-complete references. English source order is preserved
in paired English annotations; Japanese and Chinese corroborate both
elemental shrines and their cavern locations.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Shrine Caverns And The Paired Shrines

Registered Air/Earth Shrine Caverns as complete places and the recurring
paired-shrine phrase as a collective lore term, not a third site. Reviewed
ten distinct source row keys (nine corrections, one retained); the paired
shrine entity matches are counted once per CSV key. See the dated report,
addendum, definitions, and exact source manifest.
TEXT
marker = "## D-21211: Air Shrine Particle Corrigendum"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} distinct source rows and " \
     "#{generated.length} entity matches; " \
     "#{reviews.count { |row| row['old'] != row['new'] }} corrections, " \
     "#{reviews.count { |row| row['old'] == row['new'] }} retained."
