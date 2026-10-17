#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_241
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
updates = {
  "place:shattertier-mine" => ["Shattertier",
    "D-21241 directly reviewed the shortened Shattertier hunter dialogue and matching fallback label. English default:20829, Japanese シャタティア and Chinese 碎层矿 tie the destination to the Deadeye mine reviewed at D-21240. The fallback at default:26529 has no independent translated JA/ZH evidence, so keep only its already established phonetic Korean plus source-short English, not an invented Mine expansion."],
  "place:thorins-apothecary" => ["Thorin's Alchemical Apothecary",
    "D-21241 reviewed the expanded alchemical-shop label: English Thorin's Alchemical Apothecary, Japanese ソリン錬金薬店 and Chinese 索林炼金药房 agree on shop-name stem and alchemy qualifier. Preserve 연금술 and the complete source English, standardize 소린 and 약국; no personal identity or shop-owner alias is inferred."]
}
updated = updates.map do |entity, (alias_term, evidence)|
  entry = glossary.find { |r| r["entity_key"] == entity }
  raise "missing existing place #{entity}" unless entry
  raise "alias collision" if glossary.any? { |r| r["entity_key"] != entity &&
    [r["english_canonical"], *r["english_aliases"].to_s.split("|")].any? { |term| term.casecmp(alias_term).zero? } }
  raise "already registered alias" if entry["english_aliases"].to_s.split("|").include?(alias_term)
  entry["english_aliases"] = [entry["english_aliases"], alias_term].reject { |s| s.to_s.empty? }.join("|")
  entry["evidence_ids"] += "|D-#{d}"
  entry["notes"] += " " + evidence
  entry.to_h
end
index = m.table(m::INDEX)
existing = index.map { |r| [r["entity_key"], *m.key(r)] }.to_set
generated = build_occurrences(inventory.values, updated).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
new_rows = generated.reject { |r| existing.include?([r["entity_key"], *m.key(r)]) }
mine_entity = "place:tearscotter-mines"
mine_entry = glossary.find { |r| r["entity_key"] == mine_entity }
raise "missing mine entity" unless mine_entry
mine_note = "D-21241 exact row-scoped Tearscotter short form: default:28142 names the Kobolds in the same Ragnarr/Paige operation as full-mine rows default:412/43112; default:48270 directs travel there; default:61410 asks its location, supported by Japanese ティアスコッターの場所. Keep source-short 티어스코터(Tearscotter). This does not create a global Tearscotter alias: Cecil Tearscotter and Tearscotter Estates remain distinct, untouched referents."
mine_entry["notes"] += " " + mine_note
mine_entry["evidence_ids"] += "|D-#{d}"
%w[28142 48270 61410].each do |id|
  source = inventory.fetch(["default", id, ""])
  raise "scoped key already exists" if existing.include?([mine_entity, "default", id, ""])
  new_rows << OCCURRENCE_HEADERS.zip([
    mine_entity, "default", id, "", "Tearscotter",
    JSON.parse(source["en_texts_json"]).compact.join("\n---\n"), source["work_text"],
    "needs-context", mine_note
  ]).to_h
end
expected = {
  "20829" => "place:shattertier-mine", "26529" => "place:shattertier-mine",
  "43754" => "place:thorins-apothecary", "28142" => mine_entity,
  "48270" => mine_entity, "61410" => mine_entity
}
raise "unexpected new alias/scoped coverage" unless new_rows.to_h { |r| [r["ID_Linha"], r["entity_key"]] } == expected &&
  new_rows.length == 6 && new_rows.all? { |r| r["resource"] == "default" }
reviews = new_rows.sort_by { |r| r["ID_Linha"].to_i }.map do |row|
  source = inventory.fetch(m.key(row))
  old = source["work_text"]
  text = case row["entity_key"]
         when "place:shattertier-mine"
           raise "missing source-short span" unless old.scan(/섀터티어/).length == 1
           old.sub(/섀터티어(?:\(Shattertier\))?/, "섀터티어(Shattertier)")
         when "place:thorins-apothecary"
           raise "expanded shop label changed" unless old == "토린의 연금술 약방"
           "소린의 연금술 약국(Thorin's Alchemical Apothecary)"
         when mine_entity
           raise "missing source-short span" unless old.scan(/티어스코터/).length == 1
           old.sub(/티어스코터(?:\(Tearscotter\))?/, "티어스코터(Tearscotter)")
         end
  status = old == text ? "not-an-issue" : "accepted"
  evidence = row["entity_key"] == mine_entity ? mine_note : updates.fetch(row["entity_key"]).last
  {
    "resource" => row["resource"], "ID_Linha" => row["ID_Linha"], "Tipo_Variante" => "",
    "entity_key" => row["entity_key"], "status" => status, "old" => old, "new" => text,
    "evidence" => evidence + " Aligned English/Japanese/Chinese checked; preserve all other names, particles, tokens and line breaks. Official manual PDF pages 4/7/9 supplies map, quest and facility context. No old occurrence or historical global total is recounted.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(row["entity_key"] => status)
  }
end
proposal = File.join(__dir__, "proper-name-short-sites-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h))
merged = index.map(&:to_h) + new_rows
merged.sort_by! { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"].to_s, r["entity_key"]] }
m.write_table(m::INDEX, index.headers, merged)
m.run(proposal, d, nil)
summary = <<~TEXT

## D-#{d}: Source-Short Mines And Expanded Apothecary

Reviewed six new source-form row keys on existing place entities: two
Shattertier labels, three strictly row-scoped Tearscotter mine references,
and Thorin's expanded alchemical shop label. Corrected four cells, retained
two. Do not infer a global Tearscotter alias or a personal Thorin identity.
Preserve the fallback Shattertier label's short source form, without claiming
independent JA/ZH translation support there. Existing reviewed holds and the
separate unresolved Hreid identity relation remain unchanged. Full discovery
remains incomplete; no historical global count.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  target = File.join(__dir__, filename)
  text = File.read(target)
  marker = "## D-21240: Five Mines Apothecary And Inn"
  raise "missing summary marker" unless text.include?(marker)
  File.write(target, text.sub(marker, summary + "\n" + marker))
end
puts summary
