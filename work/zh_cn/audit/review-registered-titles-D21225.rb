#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_225
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
terms = {"Captain Trav" => "person:trav", "Master Straton" => "person:straton",
         "Priestess Aurela" => "person:aurela", "Warden Rask" => "person:rask"}
inventory = m.refresh_inventory
index = m.table(m::INDEX)
reviews = []
terms.each do |term, entity|
  inventory.each do |key, source|
    next unless JSON.parse(source["en_texts_json"]).compact.any? { |s| s.include?(term) }
    entities = [entity]
    entities << "person:aurela-corelon" if key == ["default", "14335", ""]
    entities.each do |e|
      prior = index.find { |r| r["entity_key"] == e && m.key(r) == key }
      raise "missing terminal occurrence #{e} #{key}" unless prior && %w[accepted not-an-issue].include?(prior["status"])
    end
    old = source.fetch("work_text")
    text = old.dup
    case term
    when "Captain Trav"
      text.gsub!(/(?:트라브\(Trav\) 대위|트라브 (?:대장|대위)(?:\(Captain Trav\))?)/, "트라브 대위(Captain Trav)")
      text.sub!("트라브 대위(Captain Trav)을", "트라브 대위(Captain Trav)를")
    when "Master Straton"
      text.gsub!(/스트라톤 (?:선생|사부)(?:\(Master Straton\))?/, "스트라톤 선생(Master Straton)")
      text.sub!("스트라톤 선생(Master Straton)가", "스트라톤 선생(Master Straton)이")
    when "Priestess Aurela"
      if key[1] == "14335"
        text.sub!("여사제 아우렐라 코렐론(Priestess Aurela Corelon)", "아우렐라 코렐론 여사제(Priestess Aurela Corelon)")
        text.sub!("여사제 아우렐라 코렐론(Aurela Corelon)은", "아우렐라 코렐론 여사제(Priestess Aurela Corelon)는")
      else
        text.gsub!(/(?:여사제 (?:아우렐라|오렐라)(?:\(Priestess Aurela\))?|아우렐라\(Aurela\) (?:여사제|사제))/, "아우렐라 여사제(Priestess Aurela)")
      end
    when "Warden Rask"
      text.gsub!(/(?:라스크\(Rask\) (?:교도관|감시관)|(?:교도관|감시관|관리인|워든|관리관) 라스크(?:\(Warden Rask\)|\(Rask\))?)/, "라스크 감시관(Warden Rask)")
      text.sub!("라스크 감시관(Warden Rask)가", "라스크 감시관(Warden Rask)이")
    end
    status = old == text ? "not-an-issue" : "accepted"
    reviews << {
      "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
      "entity_key" => entities.sort.join("|"), "status" => status, "old" => old, "new" => text,
      "evidence" => "D-21225 intentional titled-name consistency pass on existing terminal occurrences. English Captain Trav's military rank, Master Straton's plays, Priestess Aurela's religious office and Warden Rask's Crownhold crime investigation/bounties establish role context; Japanese トラブ隊長, マスター・ストラトン, 神官オーレラ・コレロン, 衛士ラスク and aligned Chinese corroborate. Use 트라브 대위, 스트라톤 선생, 아우렐라 여사제, 라스크 감시관 with complete source English. Preserve both full Priestess Aurela Corelon mentions at default:14335 and correct only directly affected particles. This deliberately revises the older Rask note that left title variants untouched, based on this cross-row civic-officer review; no unrelated bounty names, entity identity, old global tally or prior reviewed holds are reopened. Manual PDF pages 1/8 provide setting/dialogue context, not these ranks' personal names.",
      "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
      "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
      "chinese" => source["zh_text"],
      "entity_dispositions_json" => JSON.generate(entities.to_h { |e| [e, status] })
    }
  end
end
raise "expected 20 distinct title keys" unless reviews.length == 20 && reviews.map { |r| m.key(r) }.uniq.length == 20
reviews.sort_by! { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }
proposal = File.join(__dir__, "proper-name-title-residuals-D#{d}.tsv")
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
  entry["notes"] += " D-#{d}: exact #{term} title references were cross-checked and standardized to complete bilingual labels. For Rask this explicitly supersedes the older instruction to preserve differing Korean warden titles: civic crime/bounty context and Japanese 衛士 support 감시관. No new occurrence key."
end
m.write_table(glossary_path, glossary.headers, glossary)
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
note = <<~TEXT

## D-#{d}: Four Registered Title Consistency Groups

Reviewed 20 existing terminal row keys for Captain Trav, Master Straton,
Priestess Aurela and Warden Rask; corrected
#{reviews.count { |r| r["old"] != r["new"] }} cells and retained
#{reviews.count { |r| r["old"] == r["new"] }}. Keep full Aurela Corelon
mentions intact. This intentionally replaces the earlier Rask title-variant
preservation with evidence-backed 감시관 consistency; no identity or
global tally is reopened. Existing entity/row keys are updated in place,
including both already indexed Aurela entities at default:14335.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21224: Collective And Titled Names"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
