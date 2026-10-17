#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_204
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
target_terms = {
  "Father Dynwel" => "person:dynwel",
  "Avery Egest" => "person:egest",
  "Sister Ceanna" => "person:ceanna",
  "Brother Wulf" => "person:wulf",
  "Scholar Airancourt" => "person:eilaly"
}
target_entities = target_terms.values
glossary_path = File.join(audit, "proper-name-glossary.tsv")
glossary_table = m.table(glossary_path)
glossary = glossary_table.map(&:to_h)
definitions = glossary.select { |row| target_entities.include?(row.fetch("entity_key")) }
raise "missing or duplicate existing glossary entities" unless
  definitions.map { |row| row.fetch("entity_key") }.sort == target_entities.sort

candidate_rows = target_terms.to_h do |term, entity|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
  [term, candidate]
end

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
target_rows.each_value(&:uniq!)
expected_rows = target_rows.keys.sort
raise "expected 29 candidate rows, found #{expected_rows.length}" unless
  expected_rows.length == 29

index = m.table(m::INDEX).map(&:to_h)
index_by_key = index.to_h do |row|
  [[row.fetch("entity_key"), *m.key(row)], row]
end

changes = {
  ["default", "1438", ""] =>
    ["신부 딘웰(Father Dynwel)", "딘웰 신부(Father Dynwel)"],
  ["default", "64240", ""] =>
    ["에이버리 에게스트(Avery Egest)", "에이버리 이게스트(Avery Egest)"],
  ["default", "11927", ""] =>
    ["시스터 세안나(Sister Ceanna)", "세안나 수녀(Sister Ceanna)"],
  ["default", "12933", ""] =>
    ["시스터 세안나(Sister Ceanna)", "세안나 수녀(Sister Ceanna)"],
  ["default", "22406", ""] =>
    ["시스터 세안나(Sister Ceanna)", "세안나 수녀(Sister Ceanna)"],
  ["default", "54247", ""] =>
    ["시스터 세안나(Sister Ceanna)", "세안나 수녀(Sister Ceanna)"],
  ["default", "62078", ""] =>
    ["시스터 세안나(Sister Ceanna)", "세안나 수녀(Sister Ceanna)"],
  ["default", "5744", ""] =>
    ["울프 형제(Brother Wulf)", "울프 수사(Brother Wulf)"],
  ["default", "60091", ""] =>
    ["울프 형제(Brother Wulf)", "울프 수사(Brother Wulf)"],
  ["default", "1240", ""] =>
    ["에어랑쿠르 학자(Scholar Airancourt)", "학자 에어랑쿠르(Scholar Airancourt)"],
  ["default", "60411", ""] =>
    ["에어랑쿠르 학자(Scholar Airancourt)", "학자 에어랑쿠르(Scholar Airancourt)"]
}.freeze

evidence = <<~NOTE.strip
  D-21204 cross-row review of five already-registered English-name candidates.
  English anchors identity and meaning; exact aligned Japanese and Chinese
  rows are recorded in this manifest. Father Dynwel is standardized to the
  established Korean title order 딘웰 신부(Father Dynwel). Avery Egest uses
  the D-20396 canonical surname 이게스트(Egest), supported by Japanese
  イジェスト and Chinese 埃格斯特. Sister Ceanna uses 세안나 수녀(Sister
  Ceanna), supported by the aligned Chinese 修女 and the existing complete
  bilingual comparator at default:55444. Brother Wulf is a Mitharu monk in
  the St. Eadric's Mission context; Chinese 修士 and the established rows
  support 울프 수사(Brother Wulf). Scholar Airancourt follows the existing
  title order 학자 에어랑쿠르(Scholar Airancourt); these surname-only source
  forms do not justify inserting Eilaly. No entity or occurrence key is added.
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
  if (change = changes[key])
    from, to = change
    raise "unexpected source text for #{key.inspect}" unless new_text.scan(from).length == 1
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
raise "unexpected correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length

candidate_rows.each_value { |candidate| candidate["status"] = "registered-reviewed" }
m.write_table(candidate_path, candidate_table.headers, candidates)
glossary.each do |entry|
  next unless target_entities.include?(entry.fetch("entity_key"))
  matching_rows = reviews.select { |row| row.fetch("entity_key").include?(entry.fetch("entity_key")) }
  reviewed_keys = matching_rows.map do |row|
    [row.fetch("resource"), row.fetch("ID_Linha"), row.fetch("Tipo_Variante")]
      .reject(&:empty?).join(":")
  end
  entry["evidence_ids"] =
    (entry.fetch("evidence_ids").split("|") + ["D-#{d}", *reviewed_keys])
      .uniq.join("|")
  addition = case entry.fetch("entity_key")
             when "person:dynwel"
               "D-#{d} compared all seven Father Dynwel candidate rows and standardized the Korean title order to 딘웰 신부(Father Dynwel)."
             when "person:egest"
               "D-#{d} compared all six Avery Egest candidate rows; Japanese イジェスト and Chinese 埃格斯特 support the existing 이게스트(Egest) canonical form."
             when "person:ceanna"
               "D-#{d} compared all six Sister Ceanna candidate rows; Japanese シスター and Chinese 修女 support 세안나 수녀(Sister Ceanna), consistent with default:55444."
             when "person:wulf"
               "D-#{d} compared all five Brother Wulf candidate rows; the Mitharu monk context and Chinese 修士 support 울프 수사(Brother Wulf)."
             when "person:eilaly"
               "D-#{d} compared all five Scholar Airancourt candidate rows; retain the source's surname-only form and standardize title order without inserting Eilaly."
             end
  entry["notes"] = [entry.fetch("notes"), addition].reject(&:empty?).join(" ")
end
m.write_table(glossary_path, glossary_table.headers, glossary)

reviews_path = "/private/tmp/proper-name-edits-D#{d}-proposal.tsv"
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
m.run(reviews_path, d, nil, review_states: %w[accepted not-an-issue])

review_note = <<~TEXT

## Registered Candidate Cross-Check

Cross-checked all 29 distinct row keys sampled for Father Dynwel (7), Avery
Egest (6), Sister Ceanna (6), Brother Wulf (5), and Scholar Airancourt (5).
All five candidates map to existing confirmed glossary entries, and every
matching occurrence key was already terminal in the index; prior keys were
updated in place and not duplicated or counted as new occurrences. Corrected
11 inconsistent cells: default:1438, 64240, 11927, 12933, 22406, 54247,
62078, 5744, 60091, 1240, and 60411. The remaining 18 rows were retained.
Canonical forms use 딘웰 신부(Father Dynwel), 에이버리 이게스트(Avery Egest),
세안나 수녀(Sister Ceanna), 울프 수사(Brother Wulf), and
학자 에어랑쿠르(Scholar Airancourt). No new entity, occurrence key, or
global cumulative total was introduced.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Registered Candidate Cross-Check

Reviewed 29 existing indexed row keys across five registered names; corrected
11 cells and retained 18. All keys were already terminal, so this is a
cross-row consistency re-review, not new occurrence accounting. The exact
English/Japanese/Chinese evidence and before/after Korean text are in
[`proper-name-edits-D#{d}.tsv`](proper-name-edits-D#{d}.tsv); see the dated
review and edit addendum. No new glossary entities or global totals were added.
TEXT
marker = "## D-21163-D-21164: Fyragnos and Related Names"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} existing candidate row keys; " \
     "#{changes.length} corrections, #{reviews.length - changes.length} retained; " \
     "closed #{candidate_rows.length} candidate terms."
