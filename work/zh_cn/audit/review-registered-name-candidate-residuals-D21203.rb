#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_203
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
target_terms = {
  "Templar Octienne" => "person:octienne",
  "Templar Jorielle" => "person:jorielle",
  "Pledgeshield Fenan" => "person:livia-fenan",
  "Eriad Talibor" => "person:talibor",
  "Sister Zelda" => "person:zelda"
}
target_entities = target_terms.values.uniq
definitions = m.table(File.join(audit, "proper-name-glossary.tsv"))
  .map(&:to_h).select { |row| target_entities.include?(row.fetch("entity_key")) }
raise "missing existing glossary entities" unless
  definitions.map { |row| row.fetch("entity_key") }.sort == target_entities.sort

candidate_rows = target_terms.to_h do |term, entity|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
  [term, candidate]
end

esklad_candidate = candidates.find { |row| row["english_candidate"] == "Esklad Teiner" }
raise "missing Esklad Teiner candidate" unless esklad_candidate
raise "Esklad Teiner not left open after D-21202" unless
  esklad_candidate.fetch("status") == "heuristic-not-reviewed"

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated_by_entity_key = generated.to_h do |row|
  [[row.fetch("entity_key"), *m.key(row)], row]
end

target_rows = Hash.new { |hash, key| hash[key] = [] }
candidate_rows.each do |term, candidate|
  entity = target_terms.fetch(term)
  candidate.fetch("sampled_row_keys").split("|").uniq.each do |raw_key|
    parts = raw_key.split(":", 3)
    key = [parts.fetch(0), parts.fetch(1), parts.fetch(2).to_s]
    raise "candidate row has no #{entity} occurrence: #{key.inspect}" unless
      generated_by_entity_key.key?([entity, *key])
    target_rows[key] << entity
  end
end

# This already-reviewed row provides the majority Korean label as a direct comparator.
zelda_comparator = ["default", "2880", ""]
raise "missing Zelda comparator occurrence" unless
  generated_by_entity_key.key?(["person:zelda", *zelda_comparator])
target_rows[zelda_comparator] << "person:zelda"
target_rows.each_value(&:uniq!)
expected_rows = target_rows.keys.sort
raise "unexpected residual row count #{expected_rows.length}" unless
  expected_rows.length == 38

index = m.table(m::INDEX).map(&:to_h)
index_by_key = index.to_h { |row| [[row.fetch("entity_key"), *m.key(row)], row] }

evidence = <<~NOTE.strip
  D-21203 candidate cross-check: each English candidate phrase is already
  covered by a confirmed glossary entity (Templar Octienne/Jorielle,
  Livia Fenan, Eriad Talibor, or Zelda). The exact English rows, current
  Korean Texto, and aligned Japanese/Chinese references were compared.
  Earlier heuristic variants for Octienne, Fenan, and Eriad no longer occur
  in the active Korean rows; the present person-name forms match the
  established glossary. Templar rank translations remain row-local and are
  outside this person-name correction. At default:17862, the source-supported
  title Sister was rendered inconsistently as 시스터; align it with the
  established 젤다 수녀(Sister Zelda) form. The Japanese source at
  default:61578 is unrelated to its English text and was not used as
  corroboration. No new entity or occurrence key is registered.
NOTE

reviews = expected_rows.map do |key|
  source = inventory.fetch(key)
  entity_keys = target_rows.fetch(key).sort
  entity_keys.each do |entity|
    prior = index_by_key.fetch([entity, *key]) do
      raise "missing indexed occurrence #{[entity, *key].inspect}"
    end
    raise "non-terminal prior occurrence #{[entity, *key].inspect}" unless
      %w[accepted not-an-issue].include?(prior.fetch("status"))
  end

  old = source.fetch("work_text")
  new_text = old.dup
  if key == ["default", "17862", ""]
    from = "시스터 젤다(Sister Zelda)"
    to = "젤다 수녀(Sister Zelda)"
    raise "expected one Sister Zelda form at 17862" unless new_text.scan(from).length == 1
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
    "chinese" => source.fetch("zh_text")
  }.merge("entity_dispositions_json" => JSON.generate(dispositions))
end
raise "unexpected correction count" unless reviews.count { |row| row["old"] != row["new"] } == 1

candidate_rows.each_value { |candidate| candidate["status"] = "registered-reviewed" }
esklad_candidate["status"] = "registered-reviewed"
m.write_table(candidate_path, candidate_table.headers, candidates)

glossary_path = File.join(audit, "proper-name-glossary.tsv")
glossary_table = m.table(glossary_path)
glossary = glossary_table.map(&:to_h)
zelda = glossary.find { |row| row["entity_key"] == "person:zelda" }
zelda["evidence_ids"] =
  (zelda.fetch("evidence_ids").split("|") + ["D-21203", "default:17862"])
    .uniq.join("|")
zelda["notes"] =
  "D-21203 cross-row comparison of Sister Zelda labels aligns default:17862 to the prevalent, source-supported 젤다 수녀(Sister Zelda). " \
  "Japanese シスター・ゼルダ and Chinese 塞尔达修女 support the title rendering. " \
  "The distinct Crazy Sister Zelda label is preserved."
m.write_table(glossary_path, glossary_table.headers, glossary)

reviews_path = "/private/tmp/proper-name-edits-D#{d}-proposal.tsv"
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
m.run(reviews_path, d, nil, review_states: %w[accepted not-an-issue])

review_note = <<~TEXT

## Registered Candidate Residuals

Cross-checked 37 distinct row keys from the five existing candidate phrases
Templar Octienne, Templar Jorielle, Pledgeshield Fenan, Eriad Talibor, and
Sister Zelda, plus `default:2880` as the established Zelda-label comparator.
The same English candidates are already represented by confirmed glossary
entities, so no duplicate people or occurrence keys were added. The
heuristic Korean variants for Octienne, Fenan, and Eriad were stale relative
to the active CSV after earlier reviewed corrections. Rank wording remains
outside this personal-name scope. The 10 Zelda candidate rows and comparator
share the established `젤다 수녀(Sister Zelda)` form except
`default:17862`, which was corrected from `시스터 젤다(Sister Zelda)`.
The prior D-21202 Esklad Teiner candidate was marked registered-reviewed by
reference to its 15-row cross-check; its rows were not re-reviewed or
recounted here.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

puts "D-#{d}: reviewed #{reviews.length} existing-name candidate row keys; " \
     "1 correction, #{reviews.length - 1} retained; closed 6 candidate terms."
