#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_231
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
path = ReviewedProperNameDiscovery::GLOSSARY
glossary = m.table(path)
entry = glossary.find { |r| r["entity_key"] == "person:faitir-scaith" }
raise "missing full-name entity" unless entry
raise "alias already registered" if entry["english_aliases"].to_s.split("|").include?("Faitir")
raise "alias collision" if glossary.any? { |r| r["entity_key"] != entry["entity_key"] &&
  [r["english_canonical"], *r["english_aliases"].to_s.split("|")].any? { |term| term.casecmp("Faitir").zero? } }
entry["english_aliases"] = [entry["english_aliases"], "Faitir"].reject { |s| s.to_s.empty? }.join("|")
entry["korean_variants"] = [entry["korean_variants"], "페이티르", "파이티르", "페이티어"].reject { |s| s.to_s.empty? }.join("|")
entry["evidence_ids"] += "|D-#{d}"
note = "D-21231 directly reviewed all 32 short-only Faitir rows across the Scaith banishment quest, matching Japanese フェイティル/フェイティア and Chinese 费提尔/法提尔, the same talisman, ritual and Codex interactions. This focused evidence supersedes D-21227's instruction not to infer a bare alias before review: Faitir is now an explicit reviewed alias of this existing person. Keep full-name rows unchanged, use source-short 페이티르(Faitir), and do not alias First Scaith, the First, or generic Scaith army/family references."
entry["notes"] += " " + note
inventory = m.refresh_inventory
index = m.table(m::INDEX)
existing = index.map { |r| [r["entity_key"], *m.key(r)] }.to_set
generated = build_occurrences(inventory.values, [entry.to_h]).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
new_rows = generated.reject { |r| existing.include?([r["entity_key"], *m.key(r)]) }
expected_ids = %w[2762 5873 6447 10651 16682 17377 17883 20376 22419 24060 27202 28043 28626 28851 31318 33114 34047 36517 39183 41026 41664 41821 45358 47467 50781 54221 57817 58035 58970 61327 64130 64833]
raise "new short-name coverage mismatch" unless new_rows.map { |r| m.key(r) }.sort ==
  expected_ids.map { |id| ["default", id, ""] }.sort
reviews = new_rows.sort_by { |r| r["ID_Linha"].to_i }.map do |row|
  source = inventory.fetch(m.key(row))
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  raise "unexpected full-name row" if english.include?("Faitir Scaith")
  old = source.fetch("work_text")
  text = old.gsub(/(?:페이티르|파이티르|페이티어)(?:\(Faitir\))?/, "페이티르(Faitir)")
  status = old == text ? "not-an-issue" : "accepted"
  {
    "resource" => row["resource"], "ID_Linha" => row["ID_Linha"],
    "Tipo_Variante" => row["Tipo_Variante"], "entity_key" => entry["entity_key"],
    "status" => status, "old" => old, "new" => text,
    "evidence" => note + " Preserve all source-local pronouns and unrelated ritual/book/person terms. Official Korean manual PDF pages 7-8 provides quest/dialogue context, not an exhaustive DLC name list. Existing full-name keys and historical global totals are not recounted.",
    "english" => english,
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entry["entity_key"] => status)
  }
end
proposal = File.join(__dir__, "proper-name-short-alias-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(path, glossary.headers, glossary)
merged = index.map(&:to_h) + new_rows
merged.sort_by! { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"].to_s, r["entity_key"]] }
m.write_table(m::INDEX, index.headers, merged)
m.run(proposal, d, nil)
summary = <<~TEXT

## D-#{d}: Reviewed Faitir Short-Name Alias

Linked all 32 short-only Faitir rows to the existing Faitir Scaith person
after a focused English/Japanese/Chinese quest-context review. Corrected
#{reviews.count { |r| r["old"] != r["new"] }} cells and retained
#{reviews.count { |r| r["old"] == r["new"] }} already canonical cells.
Source-short names remain 페이티르(Faitir), without inventing the surname.
This explicitly supersedes the earlier restriction on inferring a short
alias before review. The three full-name keys, First Scaith and other
entities remain unchanged; no duplicate person or historical global count.
Full proper-name discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  target = File.join(__dir__, filename)
  text = File.read(target)
  marker = "## D-21230: Dverga Royal Voyage Names And Books"
  raise "missing summary marker" unless text.include?(marker)
  File.write(target, text.sub(marker, summary + "\n" + marker))
end
puts summary
