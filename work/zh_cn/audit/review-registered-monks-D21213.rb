#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_213
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
candidate_path = File.join(__dir__, "proper-name-variant-discovery-candidates-20261015.tsv")
candidates = m.table(candidate_path)
terms = {"Brother Holt" => "person:holt", "Brother Padric" => "person:padric"}
targets = Hash.new { |h, k| h[k] = [] }
terms.each do |term, entity|
  candidate = candidates.find { |r| r["english_candidate"] == term }
  raise "missing pending #{term}" unless candidate && candidate["status"] == "heuristic-not-reviewed"
  inventory.each do |key, row|
    next unless JSON.parse(row["en_texts_json"]).compact.any? { |s| s.include?(term) }
    prior = index.find { |r| r["entity_key"] == entity && m.key(r) == key }
    raise "missing terminal occurrence #{key}" unless prior && %w[accepted not-an-issue].include?(prior["status"])
    targets[key] << entity
  end
end
raise "expected 20 distinct monk keys" unless targets.length == 20
evidence = "English-led registered-name residual review: Brother Holt and Brother Padric are monks, not biological brothers. Default:48357 explicitly says Monk's life; Japanese 修道士 and Chinese 修士 corroborate. Standardize the complete titled forms to 홀트 수사(Brother Holt) and 패드릭 수사(Brother Padric), retaining bare Holt where English uses Holt. The overlapping Wulf title at default:32752 follows the already established 울프 수사(Brother Wulf) from D-21204. Official Korean manual PDF pages 1-2 provide the religious setting and 미사루 terminology, not an exhaustive NPC roster. Existing terminal keys are updated in place; no new entity, occurrence, or global total."
reviews = targets.keys.sort_by { |k| [m::RESOURCES.index(k[0]), k[1].to_i, k[2]] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  targets[key].each do |entity|
    name, english = entity == "person:holt" ? ["홀트", "Holt"] : ["패드릭", "Padric"]
    new_text.gsub!(/브라더 #{name}\(#{english}\)/, "#{name} 수사(Brother #{english})")
    new_text.gsub!(/#{name}\(#{english}\) (?:수도사|수사|형제)/, "#{name} 수사(Brother #{english})")
    new_text.gsub!(/#{name} (?:수도사|수사|형제)\(Brother #{english}\)/, "#{name} 수사(Brother #{english})")
  end
  if key == ["default", "32752", ""]
    prior = index.find { |r| r["entity_key"] == "person:wulf" && m.key(r) == key }
    raise "missing terminal Wulf" unless prior && %w[accepted not-an-issue].include?(prior["status"])
    targets[key] << "person:wulf"
    new_text.sub!("울프(Wulf) 형제", "울프 수사(Brother Wulf)")
  end
  entities = targets[key].uniq.sort
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => entities.join("|"), "status" => status,
    "old" => old, "new" => new_text, "evidence" => evidence,
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entities.to_h { |e| [e, status] })
  }
end
proposal = File.join(__dir__, "proper-name-monks-D21213.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
terms.each_key do |term|
  candidates.find { |r| r["english_candidate"] == term }["status"] = "registered-reviewed"
end
m.write_table(candidate_path, candidates.headers, candidates)
glossary_path = File.join(__dir__, "proper-name-glossary.tsv")
glossary = m.table(glossary_path)
terms.each do |term, entity|
  entry = glossary.find { |r| r["entity_key"] == entity }
  raise "missing glossary #{entity}" unless entry
  entry["notes"] += " D-#{d}: compared all exact #{term} source rows across affix/base/default; use #{term == 'Brother Holt' ? '홀트 수사(Brother Holt)' : '패드릭 수사(Brother Padric)'} for the titled form and preserve bare source names. No duplicate occurrence registration."
  entry["evidence_ids"] = (entry["evidence_ids"].split("|") + ["D-#{d}"]).uniq.join("|")
end
m.write_table(glossary_path, glossary.headers, glossary)
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
note = <<~TEXT

## D-#{d}: Registered Monk Title Consistency

Reviewed all 20 distinct source row keys for Brother Holt (10) and Brother
Padric (14), with four overlapping keys counted once. The Wulf title in the
shared default:32752 row was checked against D-21204 as well. Standardized
religious titles to 수사 and complete bilingual titled forms, preserving
bare Holt where the English drops Brother. This updates existing terminal
keys only, without adding entities, occurrences, or global cumulative totals.
#{reviews.count { |r| r["old"] != r["new"] }} cells corrected;
#{reviews.count { |r| r["old"] == r["new"] }} rows retained.
English, Japanese, Chinese and exact before/after Korean cells are in the manifest.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21212: Shrine Caverns And The Paired Shrines"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
