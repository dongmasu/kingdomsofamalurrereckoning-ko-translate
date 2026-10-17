#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_333
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

entity = "person:denric"
definition_headers = m.table(File.join(audit, "proper-name-glossary.tsv")).headers
definition = definition_headers.zip([
  entity,
  "Denric",
  "person",
  "덴릭(Denric)",
  "Denric the Crazed|Denric the Monastic",
  "데릭|데니릭|덴리크|광인 덴릭|미친 덴릭|미치광이 덴릭|수도사 덴릭",
  "D-#{d}|base:516:11|base:1158:11|base:2857:11|base:3097:11|base:3116:11|base:4776:11|default:80",
  "confirmed",
  "English identifies Denric as an Almain monk/missionary sent south to spread Mitharu's word; default:31888 is his self-introduction, and default:32598 explicitly discusses his journal and voyage. Japanese デンリック and Chinese 德里克 corroborate the identity. Use 덴릭(Denric); preserve the source-qualified forms Denric the Crazed and Denric the Monastic as complete bilingual names when explicitly present. Normalize observed Korean name variants without changing the journal narrator's repeated short references."
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_keys = [
  ["base", "516", "11"],
  ["base", "1158", "11"],
  ["base", "2857", "11"],
  ["base", "3097", "11"],
  ["base", "3116", "11"],
  ["base", "4776", "11"],
  ["default", "80", ""],
  ["default", "4131", ""],
  ["default", "12803", ""],
  ["default", "23932", ""],
  ["default", "31888", ""],
  ["default", "32598", ""],
  ["default", "35840", ""],
  ["default", "35984", ""],
  ["default", "38125", ""],
  ["default", "45966", ""],
  ["default", "48549", ""],
  ["default", "49563", ""],
  ["default", "55200", ""]
].freeze
actual_keys = generated.map { |row| m.key(row) }.sort
raise "unexpected Denric source coverage #{actual_keys.inspect}" unless
  actual_keys == expected_keys.sort

changes = {
  ["default", "4131", ""] =>
    ["미치광이 덴릭(Denric)", "미치광이 덴릭(Denric the Crazed)"],
  ["default", "12803", ""] =>
    ["미치광이 데릭(Denric the Crazed)", "미치광이 덴릭(Denric the Crazed)"],
  ["default", "23932", ""] =>
    ["미치광이 덴릭(Denric)", "미치광이 덴릭(Denric the Crazed)"],
  ["default", "31888", ""] =>
    ["덴릭이야", "덴릭(Denric)이야"],
  ["default", "32598", ""] =>
    ["미친 덴릭(Denric)", "미치광이 덴릭(Denric the Crazed)"],
  ["default", "35840", ""] =>
    ["덴릭은", "덴릭(Denric)은"],
  ["default", "35984", ""] =>
    ["수도사 덴릭의 일지", "수도사 덴릭(Denric the Monastic)의 일지"],
  ["default", "38125", ""] =>
    ["데릭은 미쳤지만", "덴릭(Denric)은 미쳤지만"],
  ["default", "45966", ""] =>
    ["선교사 데릭 한 명뿐이야", "선교사 덴릭(Denric) 한 명뿐이야"],
  ["default", "48549", ""] =>
    ["한때 내 이름은 덴릭이었지", "한때 내 이름은 덴릭(Denric)이었지"],
  ["default", "49563", ""] =>
    ["데니릭은 재물 말고도", "덴릭(Denric)은 재물 말고도"],
  ["default", "55200", ""] =>
    ["광인 덴릭(Denric)", "미치광이 덴릭(Denric the Crazed)"]
}.freeze

evidence = <<~NOTE.strip
  D-#{d} English-anchored personal-name discovery and cross-row standardization
  for Denric. English identifies him as an Almain monk/missionary who traveled
  south to spread Mitharu's word; default:31888 is his self-introduction and
  default:32598 explicitly discusses his journal and voyage. Japanese
  デンリック and Chinese 德里克 corroborate the identity. Standardize the
  Korean personal name to 덴릭(Denric), and use complete bilingual forms for
  explicit source-qualified names Denric the Crazed and Denric the Monastic.
  Preserve short repeated references after the identity is established within
  the long default:32598 journal cell. No journal identity or unsupported
  additional biography is inferred.
  Official Korean manual PDF pages 1-2 supplies the established Almain
  and Mitharu setting and terminology; it does not name Denric himself.
NOTE

reviews = expected_keys.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  japanese = JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n")
  raise "Japanese Denric reading missing for #{key.inspect}" unless japanese.include?("デンリック")
  raise "Chinese Denric reading missing for #{key.inspect}" unless source.fetch("zh_text").include?("德里克")

  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one reviewed Denric span for #{key.inspect}" unless new_text.include?(from)
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
raise "unexpected Denric correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length

definitions_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} discovery artifacts already exist" if
  [definitions_path, review_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, definition_headers, [definition])
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definitions_path, review_path, d.to_s])

details = <<~TEXT

## D-#{d}: Denric and His Explicit Epithets

Registered `Denric` as a person across six base labels and 13 `default` rows.
English identifies him as an Almain monk/missionary; Japanese デンリック and
Chinese 德里克 corroborate. Standardized Korean variants to `덴릭(Denric)`,
and retained complete source epithets as `미치광이 덴릭(Denric the Crazed)` and
`수도사 덴릭(Denric the Monastic)` where English spells them out. Corrected
12 cells and retained seven; repeated short mentions in the long journal cell
remain concise after the name is established. No previous entity or
historical total was reopened. See the D-#{d} report, addendum, and manifest.
TEXT

%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(details) }
end

puts "D-#{d}: reviewed #{reviews.length} Denric rows; " \
     "#{changes.length} corrections, #{reviews.length - changes.length} unchanged."
