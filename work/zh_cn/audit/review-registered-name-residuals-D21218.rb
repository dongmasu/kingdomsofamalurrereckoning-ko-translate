#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_218
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
terms = {"General Orieator" => "person:orieator", "Alabon Llyrgryf" => "person:alabon", "Nag Fendar" => "person:fendar"}
inventory = m.refresh_inventory
index = m.table(m::INDEX)
reviews = []
terms.each do |term, entity|
  inventory.each do |key, source|
    next unless JSON.parse(source["en_texts_json"]).compact.any? { |s| s.include?(term) }
    prior = index.find { |r| r["entity_key"] == entity && m.key(r) == key }
    raise "missing terminal key #{entity} #{key}" unless prior && %w[accepted not-an-issue].include?(prior["status"])
    old = source.fetch("work_text")
    new_text = old.dup
    case term
    when "General Orieator"
      new_text.gsub!(/(?:장군 오리에이터\(General Orieator\)|오리에이터\(Orieator\) 장군)/, "오리에이터 장군(General Orieator)")
    when "Alabon Llyrgryf"
      new_text.sub!("알라본 리르그리프(Alabon Llyrgryf)", "알라본 리리그리프(Alabon Llyrgryf)")
    when "Nag Fendar"
      new_text.sub!("낵 펜더(Nag Fendar)", "나그 펜다르(Nag Fendar)")
    end
    status = old == new_text ? "not-an-issue" : "accepted"
    reviews << {
      "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
      "entity_key" => entity, "status" => status, "old" => old, "new" => new_text,
      "evidence" => "D-21218 existing-key candidate consistency review. English General Orieator, Alabon Llyrgryf and Nag Fendar identify the exact source forms. Japanese オリエーター将軍 / アラボン・リリアグリフ / ナグ・フェンダー and Chinese 奥瑞亚特将军 / 阿拉彭·里尔格里夫 / 那格·芬达尔 corroborate identity. Keep existing 오리에이터, 알라본, 펜다르 glossary forms; standardize complete title order and use default:6313 and default:10199 as full-name comparators. All keys, including person:alabon/default:51273, already exist and are updated in place; no new occurrence is registered. Manual PDF page 1 supplies war-setting context, not a name list.",
      "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
      "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
      "chinese" => source["zh_text"],
      "entity_dispositions_json" => JSON.generate(entity => status)
    }
  end
end
raise "expected 11 distinct rows" unless reviews.length == 11 && reviews.map { |r| m.key(r) }.uniq.length == 11
reviews.sort_by! { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }
proposal = File.join(__dir__, "proper-name-registered-residuals-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
candidate_path = File.join(__dir__, "proper-name-variant-discovery-candidates-20261015.tsv")
candidates = m.table(candidate_path)
terms.each_key do |term|
  candidate = candidates.find { |r| r["english_candidate"] == term }
  raise "missing pending candidate #{term}" unless candidate && candidate["status"] == "heuristic-not-reviewed"
  candidate["status"] = "registered-reviewed"
end
m.write_table(candidate_path, candidates.headers, candidates)
glossary_path = File.join(__dir__, "proper-name-glossary.tsv")
glossary = m.table(glossary_path)
terms.each do |term, entity|
  entry = glossary.find { |r| r["entity_key"] == entity }
  entry["evidence_ids"] = (entry["evidence_ids"].split("|") + ["D-#{d}"]).uniq.join("|")
  annotation = {"General Orieator" => "오리에이터 장군(General Orieator)", "Alabon Llyrgryf" => "알라본 리리그리프(Alabon Llyrgryf)", "Nag Fendar" => "나그 펜다르(Nag Fendar)"}.fetch(term)
  entry["notes"] += " D-#{d}: all exact #{term} source rows were compared; use #{annotation} for that source form. Existing short-name entity and terminal occurrence keys retained without duplication."
end
m.write_table(glossary_path, glossary.headers, glossary)
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
note = <<~TEXT

## D-#{d}: Three Registered Full-Name And Title Candidates

Reviewed 11 existing terminal row keys for General Orieator (6), Alabon
Llyrgryf (2), and Nag Fendar (3). Corrected
#{reviews.count { |r| r["old"] != r["new"] }} cells; retained
#{reviews.count { |r| r["old"] == r["new"] }}. Standard forms are 오리에이터
장군(General Orieator), 알라본 리리그리프(Alabon Llyrgryf), and 나그
펜다르(Nag Fendar). The already-present Alabon/default:51273 index entry
was verified directly; it was not missing and was not added again.
No new entity, occurrence, reviewed hold, or global cumulative total.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21217: Black Odeon, Fallen Hall And Embassy Hall"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
