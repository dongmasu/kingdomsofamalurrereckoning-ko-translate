#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_247
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
targets = {
  "26529" => ["place:shattertier-mine",
    "English, Japanese and Chinese all contain only the untranslated standalone Shattertier fallback. No independent translated or dialogue context establishes that this label is specifically Shattertier Mine. Preserve 섀터티어(Shattertier) and the existing uncertain mine-identity relationship; this is not a Tearscotter destination reference."],
  "48270" => ["place:tearscotter-mines",
    "English On to Tearscotter with you identifies a travel destination; Japanese ティアスコッターへ出発 and Chinese 去提尔斯科特 corroborate travel. None names a mine rather than the separately registered estate. Preserve 티어스코터(Tearscotter) and the existing uncertain mine-identity relationship."],
  "61410" => ["place:tearscotter-mines",
    "English Where is Tearscotter, again? is a location question, not a journey or destination instruction. Japanese ティアスコッターの場所 and Chinese 提尔斯科特在哪里 corroborate the question. None identifies a mine rather than the separately registered estate. Preserve 티어스코터(Tearscotter) and the existing uncertain mine-identity relationship."]
}
reviews = targets.map do |id, (entity, evidence)|
  key = ["default", id, ""]
  source = inventory.fetch(key)
  prior = index.find { |row| row["entity_key"] == entity && m.key(row) == key }
  raise "unexpected prior hold #{id}" unless prior && prior["status"] == "uncertain"
  {
    "resource" => "default", "ID_Linha" => id, "Tipo_Variante" => "",
    "entity_key" => entity, "status" => "uncertain",
    "old" => source["work_text"], "new" => source["work_text"],
    "evidence" => "D-#{d} evidence-only clarification of D-21243, not a new substantive identity decision. #{evidence} The original shared wording incorrectly called both Tearscotter rows destinations and repeated it for Shattertier. No CSV edit, new hold, occurrence key, or historical global tally; preserve all 28 indexed holds and the separate Hreid relationship.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => "uncertain")
  }
end
glossary_path = ReviewedProperNameDiscovery::GLOSSARY
glossary = m.table(glossary_path)
entry = glossary.find { |row| row["entity_key"] == "place:tearscotter-mines" }
old_note = "default:48270 and default:61410 establish a destination but not specifically this mine"
new_note = "default:48270 identifies a travel destination and default:61410 asks for a location, but neither identifies specifically this mine"
raise "prior glossary wording missing" unless entry["notes"].include?(old_note)
entry["notes"] = entry["notes"].sub(old_note, new_note)
entry["notes"] += " D-21247 corrects that evidence description only; the D-21243 uncertain dispositions and Korean labels are unchanged."
entry["evidence_ids"] += "|D-#{d}"
proposal = File.join(__dir__, "proper-name-site-hold-evidence-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))
m.run(proposal, d, nil, review_states: ["uncertain"])
summary = <<~TEXT

## D-#{d}: Row-Specific Site Hold Evidence Clarification

Corrected only the evidence descriptions of three existing indexed holds.
default:26529 is an untranslated standalone Shattertier fallback;
default:48270 is a Tearscotter travel destination instruction;
default:61410 is a Tearscotter location question. None establishes the
indexed mine identity rather than another place. The original shared
D-21243 wording is superseded by the exact row-specific evidence here.
The glossary's matching note now distinguishes the instruction and question.
All three uncertain statuses and all Korean cells remain unchanged.
These are documentation corrections, not three new holds or a reopening
of the substantive identity decisions. The same 28 indexed holds and
separate Hreid relationship remain; no historical global tally changes.
Full proper-name discovery remains incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  marker = "## D-21246: Dregshore And Plural Obsidian Isles"
  text = File.read(path)
  raise "previous batch summary missing" unless text.include?(marker)
  File.write(path, text.sub(marker, summary + "\n" + marker))
end
%w[named-scope-review-D21243-20261016.md named-scope-edit-addendum-D21243-20261016.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + "\n## Subsequent Evidence Clarification\n\nD-21247 replaces the shared uncertainty evidence with row-specific descriptions: default:26529 is a fallback, default:48270 a travel instruction, and default:61410 a location question. Their existing uncertain mine relationships and Korean cells remain unchanged. Use the D-21247 manifest and current occurrence evidence for the operative descriptions.\n")
end
puts summary
