#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_332
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

entity = "person:fontleroy"
definition_headers = m.table(File.join(audit, "proper-name-glossary.tsv")).headers
definition = definition_headers.zip([
  entity,
  "Fontleroy",
  "person",
  "폰틀로이(Fontleroy)",
  "",
  "폰틀러로이",
  "D-#{d}|base:256:11|base:938:11|base:1861:11|base:2392:11|base:3117:11|base:3774:11|base:4605:11",
  "confirmed",
  "Seven English base labels identify pages of Fontleroy's Journal. Japanese フォンテルロイ and Chinese 方特勒罗伊 consistently corroborate the name. The active Korean corpus uses 폰틀로이(Fontleroy) in five labels and 폰틀러로이(Fontleroy) in two; standardize only those two name spans. The source supports a personal name associated with the journal, but no additional biography or identity relation is inferred."
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_keys = [
  ["base", "256", "11"],
  ["base", "938", "11"],
  ["base", "1861", "11"],
  ["base", "2392", "11"],
  ["base", "3117", "11"],
  ["base", "3774", "11"],
  ["base", "4605", "11"]
]
actual_keys = generated.map { |row| m.key(row) }.sort
raise "unexpected Fontleroy source coverage #{actual_keys.inspect}" unless
  actual_keys == expected_keys.sort

expected_sources = {
  ["base", "256", "11"] => ["Fontleroy's Journal, pg. 5", "폰틀로이(Fontleroy)의 일지 5쪽"],
  ["base", "938", "11"] => ["Fontleroy's Journal pg. 1", "폰틀로이(Fontleroy)의 일지 1쪽"],
  ["base", "1861", "11"] => ["Fontleroy's Journal, pg. 6", "폰틀로이(Fontleroy)의 일지 6쪽"],
  ["base", "2392", "11"] => ["Fontleroy's Journal, pg. 2", "폰틀러로이(Fontleroy)의 일지 2쪽"],
  ["base", "3117", "11"] => ["Fontleroy's Journal, pg. 4", "폰틀러로이(Fontleroy)의 일지 4쪽"],
  ["base", "3774", "11"] => ["Fontleroy's Journal, pg. 7", "폰틀로이(Fontleroy)의 일지, 7쪽"],
  ["base", "4605", "11"] => ["Fontleroy's Journal pg. 3", "폰틀로이(Fontleroy)의 일지 3쪽"]
}.freeze

changes = {
  ["base", "2392", "11"] =>
    ["폰틀러로이(Fontleroy)", "폰틀로이(Fontleroy)"],
  ["base", "3117", "11"] =>
    ["폰틀러로이(Fontleroy)", "폰틀로이(Fontleroy)"]
}.freeze

evidence = <<~NOTE.strip
  D-#{d} English-anchored personal-name discovery for Fontleroy. All seven
  matching source rows are pages of Fontleroy's Journal; aligned Japanese
  フォンテルロイ and Chinese 方特勒罗伊 consistently corroborate the name.
  The active Korean corpus uses 폰틀로이(Fontleroy) in five labels and
  폰틀러로이(Fontleroy) in two. Standardize only those two name spans to the
  repeated form. No biography, separate journal identity, or relation beyond
  the source's possessive name is inferred. The official Korean manual is
  non-exhaustive and does not identify this journal author.
NOTE

reviews = expected_keys.map do |key|
  source = inventory.fetch(key)
  expected_english, expected_korean = expected_sources.fetch(key)
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  raise "English source changed for #{key.inspect}" unless english == expected_english
  raise "Korean source changed for #{key.inspect}" unless source.fetch("work_text") == expected_korean
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n")
  raise "Japanese source mismatch for #{key.inspect}" unless japanese == "フォンテルロイの日誌、#{expected_english[/pg\.\s*(\d+)/, 1] || expected_english[/,\s*pg\.\s*(\d+)/, 1]}ページ"
  raise "Chinese source mismatch for #{key.inspect}" unless
    source.fetch("zh_text") == "方特勒罗伊的日记第#{expected_english[/pg\.\s*(\d+)/, 1] || expected_english[/,\s*pg\.\s*(\d+)/, 1]}页"

  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one Fontleroy span for #{key.inspect}" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entity,
    "status" => old == new_text ? "not-an-issue" : "accepted",
    "old" => old,
    "new" => new_text,
    "evidence" => evidence,
    "english" => english,
    "japanese" => japanese,
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(entity => (old == new_text ? "not-an-issue" : "accepted"))
  }
end
raise "unexpected Fontleroy correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length

definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} discovery artifacts already exist" if
  [definitions_path, review_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, definition_headers, [definition])
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definitions_path, review_path, d.to_s])

details = <<~TEXT

## D-#{d}: Fontleroy Journal Name

Registered `Fontleroy` as a personal-name entry scoped to seven pages of
Fontleroy's Journal (`base:256`, `938`, `1861`, `2392`, `3117`, `3774`, and
`4605`, all variant `11`). English supplies the repeated possessive name;
Japanese フォンテルロイ and Chinese 方特勒罗伊 corroborate it. Standardized
the two `폰틀러로이(Fontleroy)` cells at `base:2392:11` and `base:3117:11` to
the repeated `폰틀로이(Fontleroy)` form; the other five cells were already
consistent. No biography or identity relation beyond the journal's named
possessor is inferred. Exact aligned source cells are in the D-#{d} manifest.
TEXT

%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(details) }
end

puts "D-#{d}: reviewed #{reviews.length} Fontleroy rows; " \
     "#{changes.length} spelling corrections, #{reviews.length - changes.length} unchanged."
