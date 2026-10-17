#!/usr/bin/env ruby

require "json"
require "set"
require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_334
entity = "person:cach-cranwyn"
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
existing = index.map { |row| [row["entity_key"], *m.key(row)] }.to_set
changes = {
  "1150" => ["캐시는", "카슈(Cach)는"],
  "12812" => ["캐크(Cach)", "카슈(Cach)"],
  "18500" => ["캐시(Cach)", "카슈(Cach)"],
  "18788" => ["캐시가", "카슈(Cach)가"],
  "21663" => ["캐시(Cach)", "카슈(Cach)"],
  "32598" => ["카흐와", "카슈(Cach)와"],
  "45496" => ["캐치(Cach)", "카슈(Cach)"],
  "50959" => ["캐시(Cach)", "카슈(Cach)"],
  "51335" => ["카크(Cach)", "카슈(Cach)"],
  "53323" => ["카쉬(Cach)", "카슈(Cach)"]
}.freeze
candidates = inventory.values.select do |row|
  english = JSON.parse(row.fetch("en_texts_json")).compact.join("\n")
  english.match?(/\bCach\b/) && !existing.include?([entity, *m.key(row)])
end.sort_by { |row| [m::RESOURCES.index(row["resource"]), row["ID_Linha"].to_i] }
raise "unexpected short-name coverage" unless
  candidates.map { |row| m.key(row) }.sort ==
    changes.keys.map { |id| ["default", id, ""] }.sort

evidence = <<~TEXT.strip
  Row-scoped short personal name, not a global surname/family alias.
  English default:5064 explicitly gives Cach Cranwyn as the expedition mage
  and later calls him Cach alongside Sveri; default:32598 also links the
  Cranwyn mage with Cach. Japanese カシュ and Chinese 察赫 corroborate the
  short name in each scoped row. Reuse the existing full-name entry's
  카슈(Cach), correcting 캐시/캐크/캐치/카크/카쉬/카흐 and supplying a missing
  English annotation. Do not change references to Cranwyn nobility or the
  surname-only battle cry default:26572, whose precise referent is not
  established by the short-name scope. Retain all 12 already-indexed
  full-name rows and D-21333's Denric edits. Official Korean manual PDF
  pages 1-3 supplies Dokkalfar/Faelands context, not this personal name.
TEXT

reviews = candidates.map do |source|
  key = m.key(source)
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n")
  raise "Japanese corroboration missing" unless japanese.include?("カシュ")
  raise "Chinese corroboration missing" unless source["zh_text"].include?("察赫")
  from, to = changes.fetch(key[1])
  old = source.fetch("work_text")
  raise "reviewed span differs #{key.inspect}" unless old.scan(from).length == 1
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entity, "status" => "accepted",
    "old" => old, "new" => old.sub(from, to), "evidence" => evidence,
    "english" => english, "japanese" => japanese, "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => "accepted")
  }
end
additions = candidates.map do |source|
  {
    "entity_key" => entity, "resource" => source["resource"],
    "ID_Linha" => source["ID_Linha"], "Tipo_Variante" => source["Tipo_Variante"],
    "matched_english" => "Cach [row-scoped given name; no global alias]",
    "english_source" => JSON.parse(source["en_texts_json"]).compact.join("\n---\n"),
    "korean_current" => source["work_text"], "status" => "needs-context",
    "evidence" => "Newly discovered exact expedition-mage short-name occurrence."
  }
end
path = File.join(__dir__, "proper-name-scoped-review-D#{d}.tsv")
raise "review already exists" if File.exist?(path)
m.write_table(path, m::HEADERS.take(12), reviews)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + additions)
m.run(path, d, nil)
