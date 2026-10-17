#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_206
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
candidate_terms = [
  "Anso Attwater", "Deda Eolfred", "Hreid Amlethoe",
  "Louis Manoise", "Medgar Krast"
]
candidate_terms.each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
end

definition_values = [
  ["person:anso-attwater", "Anso Attwater", "person",
   "안소 애트워터(Anso Attwater)", "", "앤소 애트워터|안소 애트워터",
   "D-#{d}|default:19580|default:51604|default:56483|default:61227",
   "confirmed",
   "English identifies the named participant in the antelope race and its quest. Japanese アンソ・アトウォーター and Chinese 安索·阿特沃特 corroborate the Korean form 안소 애트워터. Standardize the four exact full-name occurrences; preserve surrounding dialogue and quest wording."],
  ["person:deda-eolfred", "Deda Eolfred", "person",
   "데다 에올프레드(Deda Eolfred)", "", "데다 에울프레드",
   "D-#{d}|default:25074|default:57498|default:61852",
   "confirmed",
   "English identifies the named shopkeeper. Japanese デーダ・エオルフレッド and Chinese 德达·艾欧弗雷德 corroborate the established Korean spelling 데다 에올프레드. Normalize the inconsistent vowel in one of the three exact occurrences."],
  ["person:hreid-amlethoe", "Hreid Amlethoe", "person",
   "흐레이드 암레소(Hreid Amlethoe)", "", "흐레이드 암레토",
   "D-#{d}|default:2882|default:16440|default:18870|default:21399|default:65120",
   "confirmed",
   "English identifies the same named companion in repeated labels and the Fyragnos journal entry. Japanese フレイド・アムレソー and Chinese 赫雷德·阿梅尔索 corroborate the existing Korean majority form 흐레이드 암레소. Preserve the object's particle and surrounding sentence at default:65120."],
  ["person:louis-manoise", "Louis Manoise", "person",
   "루이 마누아즈(Louis Manoise)", "", "루이 마노이즈",
   "D-#{d}|default:1786|default:28301|default:46599|default:54500",
   "confirmed",
   "English identifies Louis Manoise as the elder Manoise scholar and author. Japanese ルイ・マノイス and Chinese 路易斯·玛诺伊斯 corroborate identity and pronunciation. Reuse the established Manoise rendering 마누아즈, consistent with Carloman Manoise, and label exact full-name mentions without changing other scholars or titles."],
  ["person:medgar-krast", "Medgar Krast", "person",
   "메드가르 크라스트(Medgar Krast)", "", "메드거 크라스트",
   "D-#{d}|base:220:11|default:26414|default:34259|default:46228|default:53413|default:54723",
   "confirmed",
   "English identifies Medgar Krast as Osgar's brother and a Red Legion captain. Japanese メドガー・クラスト and Chinese 麦德加·克拉斯特 corroborate. Reuse the family surname and established Osgar spelling 크라스트; standardize Medgar as 메드가르. The base label is a separately registered complete item title."],
  ["unique item:medgar-krasts-blade", "Medgar Krast's Blade", "unique item",
   "메드가르 크라스트의 칼(Medgar Krast's Blade)", "", "",
   "D-#{d}|base:220:11",
   "confirmed",
   "The English base resource supplies the complete named equipment label. Japanese メドガー・クラストのダガー and Chinese 麦德加·克拉斯特之剑 align; retain the Korean resource's generic weapon term 칼 and pair the complete title atomically, without nesting the person label."]
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
  "person:anso-attwater" => 4,
  "person:deda-eolfred" => 3,
  "person:hreid-amlethoe" => 5,
  "person:louis-manoise" => 4,
  "person:medgar-krast" => 6,
  "unique item:medgar-krasts-blade" => 1
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

changes = {
  ["default", "19580", ""] =>
    ["앤소 애트워터에게", "안소 애트워터(Anso Attwater)에게"],
  ["default", "56483", ""] =>
    ["앤소 애트워터(Anso Attwater)", "안소 애트워터(Anso Attwater)"],
  ["default", "57498", ""] =>
    ["데다 에울프레드(Deda Eolfred)", "데다 에올프레드(Deda Eolfred)"],
  ["default", "16440", ""] =>
    ["흐레이드 암레토(Hreid Amlethoe)", "흐레이드 암레소(Hreid Amlethoe)"],
  ["default", "18870", ""] =>
    ["흐레이드 암레토에", "흐레이드 암레소(Hreid Amlethoe)에"],
  ["default", "21399", ""] =>
    ["흐레이드 암레토(Hreid Amlethoe)", "흐레이드 암레소(Hreid Amlethoe)"],
  ["default", "65120", ""] =>
    ["흐레이드 암레소를", "흐레이드 암레소(Hreid Amlethoe)를"],
  ["default", "28301", ""] =>
    ["루이 마노이즈(Louis Manoise)", "루이 마누아즈(Louis Manoise)"],
  ["default", "46599", ""] =>
    ["저자 루이 마누아즈 말일세.", "저자 루이 마누아즈(Louis Manoise) 말일세."],
  ["base", "220", "11"] =>
    ["메드가르 크라스트(Medgar Krast)의 칼",
     "메드가르 크라스트의 칼(Medgar Krast's Blade)"],
  ["default", "26414", ""] =>
    ["메드가르 크라스트를", "메드가르 크라스트(Medgar Krast)를"],
  ["default", "34259", ""] =>
    ["메드가르 크라스트라는", "메드가르 크라스트(Medgar Krast)라는"],
  ["default", "54723", ""] =>
    ["메드거 크라스트(Medgar Krast)", "메드가르 크라스트(Medgar Krast)"]
}.freeze

evidence = <<~NOTE.strip
  D-#{d} English-anchored proper-name discovery and cross-row review.
  The manifest records exact aligned English, Japanese, Chinese, and Korean
  source cells. Anso Attwater is the antelope-race participant; Deda Eolfred
  is the shopkeeper; Hreid Amlethoe is the companion selected to hold the
  Fyragnos door; Louis Manoise is the elder scholar; and Medgar Krast is
  Osgar's brother and a Red Legion captain. The Japanese readings corroborate
  pronunciation; Chinese is supporting evidence only. Established Korean
  spellings were preferred when already attested in the active files.
  Medgar Krast's Blade is a separate complete item title and is kept atomic.
  Existing terminal matches for Alfar, Holt, Padric, Orieator, Jottun, and
  Fendar were not reopened or counted again. The official Korean manual gives
  broad setting and terminology context but does not enumerate these NPCs or
  their named equipment; no spelling is inferred from its omission.
NOTE

rows_by_key = generated.group_by { |row| m.key(row) }
reviews = rows_by_key.keys.sort_by do |key|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key|
  source = inventory.fetch(key)
  entity_keys = rows_by_key.fetch(key).map { |row| row.fetch("entity_key") }.uniq.sort
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one edit span at #{key.inspect}" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end
  dispositions = entity_keys.to_h do |entity|
    [entity, old == new_text ? "not-an-issue" : "accepted"]
  end
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entity_keys.join("|"),
    "status" => dispositions.value?("accepted") ? "accepted" : "not-an-issue",
    "old" => old,
    "new" => new_text,
    "evidence" => evidence,
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(dispositions)
  }
end
raise "expected 22 distinct source rows" unless reviews.length == 22
raise "unexpected correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length
raise "change map includes an unreviewed row" unless
  (changes.keys - reviews.map { |row| m.key(row) }).empty?

m.write_table(definition_path, definition_headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])

review_note = <<~TEXT

## Discovery And Cross-Row Standardization

Registered five people and one separately named item, Medgar Krast's Blade.
Reviewed all 22 distinct English-source row keys: four Anso Attwater, three
Deda Eolfred, five Hreid Amlethoe, four Louis Manoise, and six Medgar Krast
keys; the base item row overlaps Medgar's person row. Corrected 13 cells and
retained nine. Canonical forms are 안소 애트워터(Anso Attwater),
데다 에올프레드(Deda Eolfred), 흐레이드 암레소(Hreid Amlethoe),
루이 마누아즈(Louis Manoise), 메드가르 크라스트(Medgar Krast), and
메드가르 크라스트의 칼(Medgar Krast's Blade). Previously terminal Alfar,
Holt, Padric, Orieator, Jottun, and Fendar keys were not reopened or
recounted. The existing Honor Brands item remains a distinct follow-up using
its registered entity, not a duplicate registration.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Five People And Medgar Krast's Blade

Registered five people and the separate equipment label Medgar Krast's Blade.
Reviewed 22 distinct source row keys (13 corrections, nine retained); the
base item row overlaps the person-name key. Existing registered entities and
terminal keys were not duplicated or recounted. See the dated report,
addendum, definitions, and exact source manifest.
TEXT
marker = "## D-#{d - 1}: Registered Candidate Cross-Check"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} distinct source rows across " \
     "#{generated.length} entity occurrences; #{changes.length} corrections, " \
     "#{reviews.length - changes.length} retained; registered #{definitions.length} entities."
