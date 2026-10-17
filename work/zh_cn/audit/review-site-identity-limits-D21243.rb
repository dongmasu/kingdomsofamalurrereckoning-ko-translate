#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_243
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
entry = glossary.find { |r| r["entity_key"] == "place:shattertier-mine" }
raise "short alias missing" unless entry["english_aliases"].split("|").include?("Shattertier")
entry["english_aliases"] = entry["english_aliases"].split("|").reject { |term| term == "Shattertier" }.join("|")
entry["notes"] += " D-21243 narrows D-21241: remove the global bare Shattertier alias. Only default:20829 is confirmed by the hunter dialogue and Chinese mine wording; keep it row-scoped. The standalone untranslated EN/JA/ZH fallback at default:26529 is an uncertain mine-identity candidate, not a confirmed alias. Its phonetic Korean label remains valid and unchanged."
entry["evidence_ids"] += "|D-#{d}"
tear_entry = glossary.find { |r| r["entity_key"] == "place:tearscotter-mines" }
tear_entry["notes"] += " D-21243 narrows the D-21241 row-scoped links: default:28142 is supported by the Kobold/Paige quest match; default:48270 and default:61410 establish a destination but not specifically this mine, so their mine-identity candidates are uncertain. Do not conflate the separately registered estate or Cecil. Korean short labels remain unchanged."
tear_entry["evidence_ids"] += "|D-#{d}"
targets = {
  "20829" => ["place:shattertier-mine", "not-an-issue"],
  "26529" => ["place:shattertier-mine", "uncertain"],
  "48270" => ["place:tearscotter-mines", "uncertain"],
  "61410" => ["place:tearscotter-mines", "uncertain"],
  "58292" => ["place:golden-plains-inn", "accepted"],
  "59062" => ["place:golden-plains-inn", "accepted"]
}
reviews = targets.sort_by { |id, _| id.to_i }.map do |id, (entity, status)|
  source = inventory.fetch(["default", id, ""])
  prior = index.find { |r| r["entity_key"] == entity && m.key(r) == ["default", id, ""] }
  raise "missing terminal site key" unless prior && %w[accepted not-an-issue].include?(prior["status"])
  old = source["work_text"]
  text = old.dup
  if status == "accepted"
    raise "expected grammatical article label" unless text.include?("(the Golden Plains Inn)")
    text.sub!("(the Golden Plains Inn)", "(Golden Plains Inn)")
  end
  evidence = if entity == "place:golden-plains-inn"
               "D-21243 independent title-scope verification: English prose has the grammatical lower-case article before Golden Plains Inn, unlike the capitalized The in the base title. Japanese 黄金平原亭 and Chinese 金原旅馆 identify the inn. Annotate the proper-name span Golden Plains Inn in these prose rows; preserve the complete capitalized base title and all Korean wording."
             elsif status == "uncertain"
               "D-21243 independent identity-scope verification narrows D-21241. The exact English/Japanese/Chinese source does not establish that this short name is specifically the indexed mine: Shattertier fallback has no independent translated context; the two Tearscotter destination references do not exclude the separate estate. Keep the source-supported phonetic Korean/English label unchanged, but mark the candidate mine relationship uncertain. Do not infer a global bare-name alias or a physical-place identity from the existing Korean. The original25 holds are not reopened; these are3 newly reviewed identity limits."
             else
               "D-21243 preserves only this exact row-scoped Shattertier mine connection: English hunter-entry dialogue, Japanese シャタティア and Chinese 碎层矿 corroborate the source-short destination. Remove the global alias rather than treating every fallback label as confirmed. Keep the Korean cell unchanged."
             end
  {
    "resource" => "default", "ID_Linha" => id, "Tipo_Variante" => "",
    "entity_key" => entity, "status" => status, "old" => old, "new" => text,
    "evidence" => evidence + " No historical global total changes. Preserve other names, particles, tokens and line breaks.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(entity => status)
  }
end
proposal = File.join(__dir__, "proper-name-site-identity-limits-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h))
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
summary = <<~TEXT

## D-#{d}: Site Identity Limits And Grammatical Articles

Removed the global Shattertier short alias; default:20829 remains an exact
row-scoped confirmed mine reference. The fallback at default:26529 and
Tearscotter destination rows default:48270/61410 do not establish the mine
identity, so their existing candidates are now uncertain, without changing
their valid source-short Korean labels. This adds three newly recognized
identity holds to the original 25 occurrence holds: 28 indexed holds total,
plus the separate unresolved Hreid glossary relationship from D-21232.
Corrected only two CSV cells, removing grammatical lowercase the from the
Golden Plains Inn prose annotations; the base title retains capitalized The.
No new occurrence or historical global tally. Full discovery is incomplete.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  target = File.join(__dir__, filename)
  text = File.read(target)
  marker = "## D-21242: Cecil Tearscotter And Separate Estates"
  raise "missing summary marker" unless text.include?(marker)
  File.write(target, text.sub(marker, summary + "\n" + marker))
end
%w[named-scope-review-D21241-20261016.md named-scope-edit-addendum-D21241-20261016.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + "\n## Subsequent Identity-Scope Correction\n\nD-21243 removes the global Shattertier alias and narrows three mine-identity candidates (default:26529/48270/61410) to uncertain. The source-short Korean labels remain supported and unchanged; only the earlier claim of confirmed mine membership is withdrawn. Use the current occurrence index and D-21243 report for operative status.\n")
end
puts summary
