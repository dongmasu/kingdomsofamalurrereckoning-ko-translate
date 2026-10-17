#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_360
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
glossary_path = File.join(__dir__, "proper-name-glossary.tsv")
glossary = m.table(glossary_path)
index = m.table(m::INDEX)
definitions = [
  {
    "entity_key" => "source-form:lycium-grove", "english_canonical" => "",
    "category" => "place", "korean_canonical" => "리시움 숲(Lycium Grove)",
    "english_aliases" => "", "korean_variants" => "리시움(Lycium) 숲",
    "evidence_ids" => "D-21360|base:1554:11", "status" => "unresolved",
    "notes" => "Source-form only at base:1554:11. English and Japanese say Lycium Grove, with untranslated Japanese and botanical Chinese 枸杞林. They do not establish identity with the registered Lyceum Grove. Retain the existing Korean 리시움 and pair the complete local English source label; neither assert a second physical grove nor merge it with Lyceum. Blank entity English canonical and aliases prevent global matching. The relation remains unresolved independently of the accepted row-local orthographic disposition."
  },
  {
    "entity_key" => "source-form:amman-name", "english_canonical" => "",
    "category" => "person", "korean_canonical" => "아만(Amman)",
    "english_aliases" => "", "korean_variants" => "아만",
    "evidence_ids" => "D-21360|default:9392", "status" => "unresolved",
    "notes" => "Source-form only at default:9392. English 'Amman is a good name. Not as good as Casmaran, though.' and Japanese アマン/Chinese 安曼 establish the literal name but not its referent. Add only 아만(Amman); do not identify it as, merge it with, or distinguish it from Amman the Clever. Preserve D-21357's excluded person occurrence. Blank entity English canonical and aliases prevent generic matching; identity remains unresolved independently of the accepted row-local name annotation."
  }
]
definitions.each do |definition|
  raise "scoped entity already registered" if glossary.any? { |r| r["entity_key"] == definition["entity_key"] }
end
lyceum = glossary.find { |r| r["entity_key"] == "place:lyceum-grove" }
raise "Lyceum canonical/alias changed" unless lyceum &&
  lyceum["korean_canonical"] == "리세움 숲(Lyceum Grove)" &&
  !lyceum["english_aliases"].to_s.include?("Lycium")
root_context = inventory.fetch(["default", "29173", ""])
flow_context = inventory.fetch(["default", "35789", ""])
raise "Lyceum root/flow bridge changed" unless
  JSON.parse(root_context["en_texts_json"]).join.include?("roots can be opened") &&
  JSON.parse(flow_context["en_texts_json"]).join.include?("open the root system")

data = [
  ["base", "1554", "11", "source-form:lycium-grove",
   "리시움(Lycium) 숲", "리시움 숲(Lycium Grove)", "Lycium Grove",
   definitions[0].fetch("notes")],
  ["default", "9392", "", "source-form:amman-name",
   "아만은 좋은 이름이지. 그래도 카스마란(Casmaran)만큼은 아니야.",
   "아만(Amman)은 좋은 이름이지. 그래도 카스마란(Casmaran)만큼은 아니야.",
   "Amman", definitions[1].fetch("notes")],
  ["default", "32878", "", "place:lyceum-grove",
   "이 기묘한 마법 다이얼은 라이시움 숲속의 여러 뿌리와 연결된 듯하다. 하지만 어떤 종류의 물 계열 마법에 잠겨 있어 사용할 수 없다.",
   "이 기묘한 마법 다이얼은 리세움 숲(Lycium Grove) 안의 여러 뿌리와 연결된 듯하다. 하지만 어떤 종류의 물 계열 마법에 잠겨 있어 사용할 수 없다.",
   "Lycium Grove [row-scoped source spelling]",
   "English default:32878 says Lycium Grove but describes the magic dial, roots and water enchantment; default:29173 and 35789 explicitly place the matching roots/Font-flow mechanism at Lyceum Grove. Japanese リセウム・グローブ and Chinese 学术林 match the established Lyceum site. Treat this one row as the same site using canonical Korean 리세움 숲, but retain its literal local English (Lycium Grove). Register no global Lycium alias and do not include base:1554, whose Japanese is untranslated and Chinese is botanical. This is row-scoped source-spelling evidence, not a global identity merge."]
]
reviews = []
additions = []
data.each do |resource, id, variant, entity, old, new_text, matched, evidence|
  key = [resource, id, variant]
  source = inventory.fetch(key)
  raise "scoped source snapshot differs #{key.inspect}" unless source["work_text"] == old
  raise "already indexed scoped key" if index.any? { |r| r["entity_key"] == entity && m.key(r) == key }
  english = JSON.parse(source.fetch("en_texts_json")).compact.join("\n")
  evidence += " The official Korean manual's setting/quest context does not supply these exact names. Accepted here concerns row-local spelling/annotation only; preserve all other wording, prior dispositions, tokens and line breaks."
  reviews << {
    "resource" => resource, "ID_Linha" => id, "Tipo_Variante" => variant,
    "entity_key" => entity, "status" => "accepted", "old" => old,
    "new" => new_text, "evidence" => evidence, "english" => english,
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(entity => "accepted")
  }
  additions << OCCURRENCE_HEADERS.zip(
    [entity, resource, id, variant, matched, english, old, "needs-context", evidence]
  ).to_h
end
definition_path = File.join(__dir__, "proper-name-scoped-definitions-D#{d}.tsv")
review_path = File.join(__dir__, "proper-name-scoped-review-D#{d}.tsv")
raise "scoped manifests already exist" if [definition_path, review_path].any? { |p| File.exist?(p) }
m.write_table(definition_path, glossary.headers, definitions)
m.write_table(review_path, m::HEADERS, reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + additions)
m.run(review_path, d, nil)
note = <<~TEXT

  ## D-21360: Row-Scoped Lycium And Amman Source Forms

  Reviewed three distinct row keys with three accepted annotation edits.
  Default:32878 is linked to the existing Lyceum Grove only through its
  roots/Font-flow mechanism and matching Japanese/Chinese place name;
  preserve its local English spelling (Lycium Grove). No global alias.
  Base:1554 remains an unresolved source-form, not a confirmed distinct
  place or a merged Lyceum occurrence. Default:9392 is annotated only as
  the source-local name Amman, retaining the separate excluded person
  finding from D-21357. Both provisional glossary identities remain
  unresolved separately from the unchanged 30 indexed occurrence holds.
  Blank English canonicals/aliases prevent global matching for the two
  source-form records. These exact scopes and source evidence are in the
  manifest. Full discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |name|
  path = File.join(__dir__, name)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |name|
  path = File.join(__dir__, name)
  text = File.read(path)
  marker = "## D-21359: Amman Seasonal Keys, Statues And Magical Effect Labels"
  raise "missing latest narrative marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
