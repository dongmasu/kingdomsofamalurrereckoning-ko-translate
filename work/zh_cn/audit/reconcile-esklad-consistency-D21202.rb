#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_202
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

inventory = m.refresh_inventory
glossary = m.table(File.join(audit, "proper-name-glossary.tsv")).map(&:to_h)
entities = glossary.select do |row|
  %w[person:esklad person:teiner].include?(row.fetch("entity_key"))
end
raise "expected both existing person entries" unless entities.length == 2

matches = build_occurrences(inventory.values, entities).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
esklad_matches = matches.select { |row| row.fetch("entity_key") == "person:esklad" }
raise "unexpected Esklad occurrence count #{esklad_matches.length}" unless
  esklad_matches.length == 15

index = m.table(m::INDEX).map(&:to_h)
index_by_key = index.to_h do |row|
  [[row.fetch("entity_key"), *m.key(row)], row]
end
matches_by_row = matches.group_by { |row| m.key(row) }
expected_rows = esklad_matches.map { |row| m.key(row) }.uniq.sort
raise "expected 15 distinct Esklad rows, found #{expected_rows.length}" unless
  expected_rows.length == 15

canonical_esklad = glossary.find { |row| row["entity_key"] == "person:esklad" }
canonical_teiner = glossary.find { |row| row["entity_key"] == "person:teiner" }
raise "unexpected Esklad canonical" unless
  canonical_esklad["korean_canonical"] == "에스클라드(Esklad)"
raise "unexpected Teiner canonical" unless
  canonical_teiner["korean_canonical"] == "타이너(Teiner)"

evidence = <<~NOTE.strip
  D-21202 cross-row review: English identifies the same person in the exact
  Esklad occurrences; aligned Japanese エスクラド / エスクラド・テイナー and
  Chinese 埃斯科拉德 / 埃斯科拉德·泰纳 corroborate the readings. Reuse the
  established component forms 에스클라드(Esklad) and 타이너(Teiner), and retain
  full name labels atomically as 에스클라드 타이너(Esklad Teiner). The
  comparison found two inconsistent first-name spellings at default IDs
  32831 and 35155; correct only those spans. Existing entity keys and
  occurrence records are re-reviewed in place; no new entity or duplicate
  occurrence key is introduced.
NOTE

reviews = expected_rows.map do |key|
  source = inventory.fetch(key)
  row_matches = matches_by_row.fetch(key)
  entity_keys = row_matches.map { |row| row.fetch("entity_key") }.uniq.sort
  raise "unexpected entity overlap at #{key.inspect}" unless
    entity_keys.all? { |entity| %w[person:esklad person:teiner].include?(entity) }

  entity_keys.each do |entity|
    prior = index_by_key.fetch([entity, *key]) do
      raise "missing indexed occurrence #{[entity, *key].inspect}"
    end
    raise "non-terminal prior occurrence #{[entity, *key].inspect}" unless
      %w[accepted not-an-issue].include?(prior.fetch("status"))
  end

  old = source.fetch("work_text")
  new_text = old.dup
  if key == ["default", "32831", ""]
    from = "에스크라드 타이너(Esklad Teiner)"
    to = "에스클라드 타이너(Esklad Teiner)"
    raise "expected one 32831 correction span" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  elsif key == ["default", "35155", ""]
    from = "에스크라드 타이너(Esklad Teiner)"
    to = "에스클라드 타이너(Esklad Teiner)"
    raise "expected one 35155 correction span" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end

  dispositions = entity_keys.to_h do |entity|
    status = if old == new_text
               "not-an-issue"
             elsif entity == "person:esklad"
               "accepted"
             else
               "not-an-issue"
             end
    [entity, status]
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

raise "unexpected edit count" unless reviews.count { |row| row["old"] != row["new"] } == 2
raise "row set differs from exact Esklad matches" unless
  reviews.map { |row| m.key(row) }.sort == expected_rows

glossary_path = File.join(audit, "proper-name-glossary.tsv")
glossary_table = m.table(glossary_path)
canonical_esklad["evidence_ids"] =
  (canonical_esklad["evidence_ids"].split("|") +
   ["D-21202", *expected_rows.map { |resource, id, variant|
     [resource, id, variant].reject(&:empty?).join(":")
   }]).uniq.join("|")
canonical_esklad["notes"] =
  "Canonical form confirmed at D-21202 by comparing all 15 aligned Esklad source rows; two inconsistent first-name spellings corrected. " \
  "English anchors identity; Japanese and Chinese corroborate. " \
  "Earlier registration and single-label evidence is retained."
canonical_teiner["evidence_ids"] =
  (canonical_teiner["evidence_ids"].split("|") +
   ["D-21202", *reviews.select { |row| row["entity_key"].include?("person:teiner") }
      .map { |row| "default:#{row.fetch('ID_Linha')}" }]).uniq.join("|")
canonical_teiner["notes"] =
  "D-21202 compared all seven Esklad Teiner full-name rows against the established Teiner surname form; no Teiner spelling changes were needed. " \
  "English anchors identity; aligned Japanese and Chinese corroborate. " \
  "Earlier surname registration evidence is retained."
m.write_table(glossary_path, glossary_table.headers, glossary)

reviews_path = "/private/tmp/proper-name-edits-D#{d}-proposal.tsv"
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
m.run(reviews_path, d, nil, review_states: %w[accepted not-an-issue])

review_note = <<~TEXT

## Cross-Row Re-review

This batch compares the existing `person:esklad` and `person:teiner`
occurrences without registering a new identity or duplicating occurrence
keys. English identifies the same person across 15 distinct resource/ID/
variant rows; aligned Japanese and Chinese support the established Korean
forms. Two rows had an inconsistent first-name spelling:
`default:32831` and `default:35155` now use
`에스클라드 타이너(Esklad Teiner)`. The other 13 rows are retained.
Overlapping `person:teiner` matches remain separately classified on the
same row keys, and the surname was already canonical in every reviewed cell.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

puts "D-#{d}: re-reviewed #{reviews.length} Esklad row keys; 2 corrections, " \
     "#{reviews.length - 2} retained; no new occurrence keys."
