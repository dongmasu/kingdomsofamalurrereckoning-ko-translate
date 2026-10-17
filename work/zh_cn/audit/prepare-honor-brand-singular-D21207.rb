#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "continue-proper-name-reviewed-batches"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_207
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

entity_key = "unique item:honor-brands"
glossary_path = File.join(audit, "proper-name-glossary.tsv")
glossary_table = m.table(glossary_path)
glossary = glossary_table.map(&:to_h)
entry = glossary.find { |row| row.fetch("entity_key") == entity_key }
raise "missing registered entity #{entity_key}" unless entry
raise "unexpected Honor Brands canonical" unless
  entry.fetch("english_canonical") == "Honor Brands" &&
  entry.fetch("korean_canonical") == "아너 브랜드(Honor Brands)"
raise "singular alias already present" if
  entry.fetch("english_aliases").to_s.split("|").include?("Honor Brand")

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
candidate = candidates.find { |row| row["english_candidate"] == "Honor Brand" }
raise "missing Honor Brand candidate" unless candidate
raise "Honor Brand candidate already closed" unless
  candidate.fetch("status") == "heuristic-not-reviewed"
sampled_expected_keys = [
  ["default", "6867", ""],
  ["default", "17481", ""],
  ["default", "45484", ""]
]
sampled_keys = candidate.fetch("sampled_row_keys").split("|").map do |raw|
  parts = raw.split(":", 3)
  [parts.fetch(0), parts.fetch(1), parts.fetch(2).to_s]
end.uniq.sort
raise "unexpected sampled candidate keys #{sampled_keys.inspect}" unless
  sampled_keys == sampled_expected_keys.sort

expected_keys = [
  ["base", "761", "11"],
  ["base", "1630", "11"],
  ["base", "2590", "11"],
  ["base", "3493", "11"],
  ["base", "4632", "11"],
  ["default", "6867", ""],
  ["default", "10779", ""],
  ["default", "17481", ""],
  ["default", "45484", ""]
]
raise "sampled candidate keys missing from full search" unless
  (sampled_keys - expected_keys).empty?

inventory = m.refresh_inventory
entry["english_aliases"] = ([entry["english_aliases"], "Honor Brand"]
  .reject(&:empty?).join("|"))
entry["korean_variants"] = ([entry["korean_variants"], "명예의 낙인", "명예의 표식"]
  .flat_map { |value| value.to_s.split("|") }.reject(&:empty?).uniq.join("|"))
addition = <<~NOTE.strip
  D-#{d} reviewed nine singular Honor Brand source rows as the singular form
  of this existing named Faeblade line, not a separate item. Five are already
  complete Ysa component titles; four are dialogue/quest mentions. Japanese
  オナーブランド corroborates the English name; Chinese localized labels are
  supporting evidence. Standardize singular item labels as 아너 브랜드
  (Honor Brand), distinct from the complete plural line name 아너 브랜드
  (Honor Brands). Do not treat generic honor marks as this item.
NOTE
entry["evidence_ids"] =
  (entry.fetch("evidence_ids").split("|") + ["D-#{d}", *expected_keys.map do |key|
    key.reject(&:empty?).join(":")
  end]).uniq.join("|")
entry["notes"] = [entry.fetch("notes"), addition].reject(&:empty?).join(" ")

generated = build_occurrences(inventory.values, [entry]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated.select! do |row|
  row.fetch("matched_english").split("|").include?("Honor Brand")
end
generated_by_key = generated.to_h { |row| [m.key(row), row] }
raise "unexpected singular source keys #{generated_by_key.keys.inspect}" unless
  generated_by_key.keys.sort == expected_keys.sort

index_path = m::INDEX
index_table = m.table(index_path)
index = index_table.map(&:to_h)
known = index.to_h { |row| [[row.fetch("entity_key"), *m.key(row)], row] }
raise "singular occurrence already indexed" unless expected_keys.all? do |key|
  !known.key?([entity_key, *key])
end

changes = {
  ["default", "6867", ""] =>
    ["명예의 낙인(Honor Brand)이라고", "아너 브랜드(Honor Brand)라고"],
  ["default", "10779", ""] =>
    ["페이(Fae) 명예검", "페이(Fae) 아너 브랜드(Honor Brand)"],
  ["default", "17481", ""] =>
    ["명예의 표식(Honor Brand)은", "아너 브랜드(Honor Brand)는"],
  ["default", "45484", ""] =>
    ["명예의 낙인(Honor Brand)을", "아너 브랜드(Honor Brand)를"]
}.freeze
evidence = <<~NOTE.strip
  D-#{d} cross-row review of the singular form of the already registered
  Honor Brands named Faeblade line; no duplicate entity was created.
  English identifies individual Honor Brand weapons in dialogue and Ysa
  component titles. Japanese オナーブランド corroborates the name; aligned
  Chinese uses localized weapon labels and is supporting evidence only. Use
  아너 브랜드(Honor Brand) for the singular item and preserve the plural
  canonical 아너 브랜드(Honor Brands) for the complete named line. The
  official Korean manual does not enumerate this named equipment; no spelling
  is inferred from its omission.
NOTE

reviews = expected_keys.sort_by { |key| key[1].to_i }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one edit span at #{key.inspect}" unless old.scan(from).length == 1
    new_text.sub!(from, to)
  end
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entity_key,
    "status" => status,
    "old" => old,
    "new" => new_text,
    "evidence" => evidence,
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(entity_key => status)
  }
end
raise "unexpected correction count" unless reviews.count { |row| row["old"] != row["new"] } == 4

new_index_rows = generated.map do |row|
  row.merge(
    "evidence" => "D-#{d}: #{evidence}",
    "status" => "needs-context"
  )
end
index.concat(new_index_rows)
candidate["status"] = "registered-reviewed"
m.write_table(glossary_path, glossary_table.headers, glossary)
m.write_table(index_path, index_table.headers, index)
m.write_table(candidate_path, candidate_table.headers, candidates)

review_path = "/private/tmp/proper-name-edits-D#{d}-proposal.tsv"
m.write_table(review_path, m::HEADERS.take(12), reviews)
m.run(review_path, d, nil)

review_note = <<~TEXT

## Existing Named-Item Singular Form

Reviewed nine exact singular `Honor Brand` source rows under the already
registered `unique item:honor-brands` key: five complete Ysa component labels
and four dialogue/quest mentions. The five complete Ysa titles were already
bilingual and remain unchanged. Corrected the four dialogue rows, including
the Fae-qualified singular item and the particle at default:45484. The plural
line canonical `아너 브랜드(Honor Brands)` remains unchanged. No entity was
duplicated; prior Ysa decisions were preserved under their existing entity.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Honor Brand Singular Item Labels

Reviewed nine singular `Honor Brand` rows through the existing
`unique item:honor-brands` registration: four corrections and five already
complete bilingual Ysa component labels. The plural named line remains
`아너 브랜드(Honor Brands)`. No duplicate entity was created. See the dated
report, addendum, and exact source manifest.
TEXT
marker = "## D-21206: Five People And Medgar Krast's Blade"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} existing-entity rows; " \
     "#{reviews.count { |row| row['old'] != row['new'] }} corrections; " \
     "registered no duplicate entity."
