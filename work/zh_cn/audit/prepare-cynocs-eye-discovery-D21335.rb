#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_335
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
entity = "unique item:cynocs-eye"
canonical = "사이녹의 눈(Cynoc's Eye)"
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
definition = headers.zip([
  entity, "Cynoc's Eye", "unique item", canonical, "Cynoc‘s Eye",
  "시녹의 눈|시노크의 눈|시녹(Cynoc)의 눈|시노크(Cynoc)의 눈(Eye of Cynoc)",
  "D-#{d}|affix:176:11|base:2675:11|default:18072|default:26913|default:65074",
  "confirmed",
  "English default:18072 names an ancient Sagecrafting tool and default:26913 calls it an enchanted gem or relic; 42991/48525/50880 describe its altar-upgrade use. Japanese サイノックの瞳 and Chinese 赛诺克之眼 corroborate. Standardize the observed 사이녹/시녹/시노크 variation to the existing 사이녹 form and pair the complete named object, not an inferred person Cynoc. Typographic left apostrophes are source aliases; use an ASCII apostrophe in the displayed English annotation. Do not infer an identity, biography, rarity or equipment class beyond these source statements."
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
changes = {
  ["affix", "176", "11"] => ["사이녹의 눈", canonical],
  ["base", "2675", "11"] => ["시녹(Cynoc)의 눈", canonical],
  ["default", "3102", ""] => ["사이녹(Cynoc)의 눈", canonical],
  ["default", "8968", ""] => ["시노크의 눈", canonical],
  ["default", "19011", ""] => ["시녹의 눈", canonical],
  ["default", "26913", ""] => ["시노크의 눈", canonical],
  ["default", "34725", ""] => ["시녹의 눈", canonical],
  ["default", "42991", ""] => ["사이녹의 눈", canonical],
  ["default", "45700", ""] => ["사이녹의 눈", canonical],
  ["default", "48525", ""] => ["시노크의 눈", canonical],
  ["default", "50880", ""] => ["시노크(Cynoc)의 눈(Eye of Cynoc)", canonical],
  ["default", "53050", ""] => ["시녹(Cynoc)의 눈", canonical],
  ["default", "53813", ""] => ["시녹의 눈(Cynoc's Eye)", canonical],
  ["default", "55047", ""] => ["시녹의 눈(Cynoc's Eye)", canonical],
  ["default", "57110", ""] => ["시노크의 눈", canonical],
  ["default", "59489", ""] => ["사이녹의 눈", canonical],
  ["default", "64517", ""] => ["사이녹의 눈", canonical],
  ["default", "65074", ""] => ["사이녹의 눈", canonical]
}.freeze
unchanged = %w[18072 18544].map { |id| ["default", id, ""] }
raise "unexpected source coverage" unless
  generated.map { |row| m.key(row) }.sort == (changes.keys + unchanged).sort
evidence = <<~TEXT.strip
  English-anchored named-artifact discovery. English default:18072 explicitly
  calls Cynoc's Eye an ancient Sagecrafting tool; 26913 describes an enchanted
  gem or relic, and 42991/48525/50880 describe its use on Sagecraft Altars.
  Japanese サイノックの瞳 and Chinese 赛诺克之眼 corroborate the exact object.
  Reuse 사이녹 from the already complete paired labels at default:18072/18544,
  normalize 시녹/시노크 and supply the complete 사이녹의 눈(Cynoc's Eye).
  Correct default:50880's unsupported English rewording Eye of Cynoc.
  The left-apostrophe English source spelling Cynoc‘s Eye is an explicit
  orthographic alias, displayed with the canonical ASCII apostrophe.
  Official Korean manual PDF pages 4 and 8 establishes 마법물품 제작,
  마법물품 제작 제단 and gem/socket context, not the individual artifact.
  Preserve surrounding skill/gem/portal terminology, opaque tokens, source
  quantities and line breaks; infer no separately attested person Cynoc.
TEXT
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n")
  raise "missing Japanese name #{key.inspect}" unless japanese.include?("サイノックの瞳")
  raise "missing Chinese name #{key.inspect}" unless source["zh_text"].include?("赛诺克之眼")
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "unexpected reviewed span #{key.inspect}" unless old.scan(from).length == 1
    new_text.sub!(from, to)
  else
    raise "unchanged canonical missing" unless old.include?(canonical)
  end
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entity, "status" => status, "old" => old, "new" => new_text,
    "evidence" => evidence, "english" => english, "japanese" => japanese,
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise "discovery already prepared" if [definitions_path, review_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, headers, [definition])
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definitions_path, review_path, d.to_s])
