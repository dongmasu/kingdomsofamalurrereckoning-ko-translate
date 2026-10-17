#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_232
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
old_entity = "person:hreid-amlethoe"
provisional_entity = "person:hreid-amelthoe"
entry = glossary.find { |r| r["entity_key"] == old_entity }
raise "expected unsupported alias" unless entry["english_aliases"] == "Hreid Amelthoe"
raise "provisional entry exists" if glossary.any? { |r| r["entity_key"] == provisional_entity }
ids = %w[6476 9024 12826 21069 30835]
entry["english_aliases"] = ""
entry["korean_variants"] = "흐레이드 암레토"
entry["evidence_ids"] = (entry["evidence_ids"].split("|").reject { |e| ids.any? { |id| e == "default:#{id}" } } + ["D-#{d}"]).uniq.join("|")
entry["notes"] = entry["notes"].sub(/ D-21228 reviewed.*\z/, "") +
  " D-21232 withdraws D-21228's unsupported Hreid Amelthoe alias. The Amlethoe labels and Fyragnos companion journal do not establish identity with the Galette treasure mercenary. Keep the two source forms unlinked pending evidence; this does not prove two distinct people."
identity_note = "D-21232 provisional source-form record only: Hreid Amelthoe may or may not be Hreid Amlethoe; neither same nor distinct identity is established. English Galette/Red Marches treasure rows do not link to the other spelling's Colm/Eathe/Fyragnos companion narrative. Japanese distinguishes フレイド・アメルソー from フレイド・アムレソー; Chinese collapses both to 赫雷德·阿梅尔索 and cannot resolve identity. Use source-local 아멜소 for Amelthoe, not the unsupported 암레소 merge. This unresolved glossary record is not a confirmed additional person; accepted occurrence edits below concern spelling/particle only."
provisional = glossary.headers.zip([
  provisional_entity, "Hreid Amelthoe", "person", "흐레이드 아멜소(Hreid Amelthoe)",
  "", "흐레이드 아멜토|헤리드 아멜토|흐레이드 아멜토에",
  (["D-#{d}"] + ids.map { |id| "default:#{id}" }).join("|"),
  "unresolved", identity_note
]).to_h
index = m.table(m::INDEX)
targets = index.select { |r| r["entity_key"] == old_entity && ids.include?(r["ID_Linha"]) }
raise "expected five existing alias keys" unless targets.length == 5 &&
  targets.all? { |r| r["resource"] == "default" && r["Tipo_Variante"].to_s.empty? }
reviews = targets.sort_by { |r| r["ID_Linha"].to_i }.map do |row|
  source = inventory.fetch(m.key(row))
  old = source["work_text"]
  raise "expected merged source-form span" unless old.include?("흐레이드 암레소(Hreid Amelthoe)")
  text = old.sub("흐레이드 암레소(Hreid Amelthoe)", provisional["korean_canonical"])
  text.sub!("흐레이드 아멜소(Hreid Amelthoe)에가", "흐레이드 아멜소(Hreid Amelthoe)가") if row["ID_Linha"] == "30835"
  row["entity_key"] = provisional_entity
  row["evidence"] += " " + identity_note
  {
    "resource" => row["resource"], "ID_Linha" => row["ID_Linha"], "Tipo_Variante" => "",
    "entity_key" => provisional_entity, "status" => "accepted", "old" => old, "new" => text,
    "evidence" => identity_note + " Fix the concrete subject-particle 에가 at default:30835 to 가. Preserve D-21228's Nuala corrections, the original five Amlethoe rows, every other entity, and historical global totals.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(provisional_entity => "accepted")
  }
end
proposal = File.join(__dir__, "proper-name-identity-correction-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h) + [provisional])
m.write_table(m::INDEX, index.headers, index.map(&:to_h))
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
summary = <<~TEXT

## D-#{d}: Hreid Identity Link Withdrawn

Direct source re-examination invalidated D-21228's claim that Hreid Amelthoe
and Hreid Amlethoe were established aliases. Removed that alias and rekeyed
its five occurrences to a provisional, unresolved source-form glossary
record, not a confirmed second person. Both identity possibilities remain
open. Corrected five Amelthoe spellings to 흐레이드 아멜소(Hreid Amelthoe),
including default:30835's concrete 에가-to-가 subject-particle error.
Accepted here means source-local orthographic correction, not acceptance
of an identity merge or distinction. The five Amlethoe and two Nuala rows
are unchanged. The 25 prior occurrence holds remain unchanged; the separate
Hreid identity relationship is unresolved in the glossary. No duplicate
occurrence key or historical global count. Full discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  target = File.join(__dir__, filename)
  text = File.read(target)
  marker = "## D-21231: Reviewed Faitir Short-Name Alias"
  raise "missing summary marker" unless text.include?(marker)
  File.write(target, text.sub(marker, summary + "\n" + marker))
end
[File.join(m::ROOT, "NEXT-SESSION.md"), File.join(m::ROOT, "work/zh_cn/TRANSLATION_PROGRESS.md")].each do |target|
  text = File.read(target)
  marker = "<!-- current-proper-name-batch:end -->"
  raise "missing checkpoint marker" unless text.include?(marker)
  File.write(target, text.sub(marker, marker + "\n" + summary))
end
%w[named-scope-review-D21228-20261016.md named-scope-edit-addendum-D21228-20261016.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + "\n## Subsequent Correction\n\nD-21232 withdraws this batch's Hreid identity-alias claim and corrects its subject particle at default:30835. The historical manifest is retained; use the D-21232 report and current glossary for operative identity status. Nuala corrections remain valid.\n")
end
puts summary
