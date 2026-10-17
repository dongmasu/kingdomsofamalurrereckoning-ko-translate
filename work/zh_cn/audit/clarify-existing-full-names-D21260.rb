#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_260
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
glossary_path = ReviewedProperNameDiscovery::GLOSSARY
glossary = m.table(glossary_path)
index = m.table(m::INDEX)
updates = {
  "person:kildeen" => ["Kildeen", "Rey Kildeen", "레이 킬딘(Rey Kildeen)",
    "English default:45713 self-introduces Rey Kildeen, and default:2620/63130 are the same full-name source labels already owned by this key. Japanese レイ・キルディーン and Chinese 雷伊·基尔迪恩 corroborate. Retain short Kildeen as an alias; do not register another person."],
  "person:emundas" => ["Emundas", "Wane Emundas", "웨인 에문다스(Wane Emundas)",
    "English default:28562 explicitly says Name's Emundas. Wane Emundas, establishing the short/full relationship directly. All full-name matches are already owned by this key. Japanese ウェイン・エムンダス and Chinese 韦恩·埃蒙达斯 corroborate. Retain short and abbreviated source-local labels; do not register another person."],
  "person:anjar" => ["Anjar", "Bor Anjar", "보르 안자르(Bor Anjar)",
    "The existing occurrence evidence explicitly identifies Anjar or Bor Anjar and already owns all seven full-name matches. English default:54132/64413 self-introduces Bor Anjar as master architect; Japanese ボア・アンジャー and Chinese 博尔·安贾尔 corroborate. Preserve the existing short alias and all already correct Korean cells. This is a canonical metadata clarification, not a new identity merger or a re-review of the Bor Anjar rows."]
}
definitions = updates.map do |entity, (short, full, korean, note)|
  entry = glossary.find { |row| row["entity_key"] == entity }
  raise "unexpected old canonical #{entity}" unless entry && entry["english_canonical"] == short
  aliases = entry["english_aliases"].to_s.split("|").reject(&:empty?)
  aliases << short unless aliases.include?(short)
  entry["english_canonical"] = full
  entry["korean_canonical"] = korean
  entry["english_aliases"] = aliases.reject { |term| term == full }.join("|")
  entry["evidence_ids"] += "|D-#{d}"
  entry["notes"] += " D-#{d}: #{note} Full-name annotation is used only when the English source spells out the full name; the existing short-name judgments remain in force."
  entry.to_h
end
generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
expected = index.select { |row| updates.key?(row["entity_key"]) }.map { |row| [row["entity_key"], *m.key(row)] }.sort
actual = generated.map { |row| [row["entity_key"], *m.key(row)] }.sort
raise "canonical metadata changes source/occurrence keys" unless expected == actual
targets = {
  "39165" => ["person:emundas", "웨인 에문다스(Emundas)", "웨인 에문다스(Wane Emundas)"],
  "44619" => ["person:emundas", "웨인 에문다스(Emundas)", "웨인 에문다스(Wane Emundas)"],
  "45713" => ["person:kildeen", "레이 킬딘(Kildeen)", "레이 킬딘(Rey Kildeen)"],
  "63130" => ["person:kildeen", "레이 킬딘(Kildeen)", "레이 킬딘(Rey Kildeen)"]
}
reviews = targets.map do |id, (entity, old_span, new_span)|
  key = ["default", id, ""]
  source = inventory.fetch(key)
  prior = index.find { |row| row["entity_key"] == entity && m.key(row) == key }
  raise "unexpected prior full-name row #{id}" unless prior && prior["status"] == "accepted"
  old = source["work_text"]
  raise "full-name span differs #{id}" unless old.scan(old_span).length == 1
  {
    "resource" => "default", "ID_Linha" => id, "Tipo_Variante" => "",
    "entity_key" => entity, "status" => "accepted", "old" => old,
    "new" => old.sub(old_span, new_span),
    "evidence" => "D-#{d} complete-name annotation correction on an existing accepted occurrence, not a new person/key or renewed global decision. English explicitly gives #{updates.fetch(entity)[1]}; the old Korean already includes the full name but its English annotation omits the given name. #{updates.fetch(entity)[3]} Correct only the English annotation and retain every Korean character, other term, particle, token and line break. No historical global tally.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => "accepted")
  }
end
proposal = File.join(__dir__, "proper-name-existing-full-names-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))
m.run(proposal, d, nil, review_states: ["accepted"])
summary = <<~TEXT

## D-#{d}: Existing Full Names Without Duplicate People

Promoted the existing stable Kildeen, Emundas and Anjar glossary keys to
the full English canonical names Rey Kildeen, Wane Emundas and Bor Anjar,
retaining their short aliases and every existing occurrence key/status.
All full-name source matches were already owned by these keys; generated
source coverage is identical before and after the metadata update.
Corrected only four incomplete English annotations: default:39165/44619
and default:45713/63130. Their accepted dispositions stay accepted.
No Korean character, other cell, person entity, occurrence key or global
count was added or changed. Bor Anjar's already correct rows and all
short-name row judgments were not re-reviewed or recounted. All reviewed
holds and the separate Hreid relationship are unchanged.
Full proper-name discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  marker = "## D-21259: Dessidyn Jock MacNelly And Nard Caloss"
  text = File.read(path)
  raise "previous batch summary missing" unless text.include?(marker)
  File.write(path, text.sub(marker, summary + "\n" + marker))
end
puts summary
