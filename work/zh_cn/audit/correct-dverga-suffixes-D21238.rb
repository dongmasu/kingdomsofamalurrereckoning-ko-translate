#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"

m = ReviewedNameBatches
d = 21_238
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
inventory = m.refresh_inventory
index = m.table(m::INDEX)
edits = {
  "54495" => ["드베르간(Dvergan)어", "드베르간어(Dvergan)"],
  "47369" => ["드베르가(Dverga)인들은", "드베르가인(Dverga)들은"],
  "47542" => ["드베르가(Dverga)인들이", "드베르가인(Dverga)들이"]
}
reviews = edits.sort_by { |id, _| id.to_i }.map do |id, (before, after)|
  key = ["default", id, ""]
  source = inventory.fetch(key)
  prior = index.find { |r| r["entity_key"] == "people:dverga" && m.key(r) == key }
  raise "missing terminal people key" unless prior && %w[accepted not-an-issue].include?(prior["status"])
  old = source["work_text"]
  raise "expected one suffix span" unless old.scan(before).length == 1
  {
    "resource" => "default", "ID_Linha" => id, "Tipo_Variante" => "",
    "entity_key" => "people:dverga", "status" => "accepted",
    "old" => old, "new" => old.sub(before, after),
    "evidence" => "D-21238 independent post-review of Dverga/Dvergan suffix placement. English Dvergan in the Day14 language essay and Dverga inhabitants in the other two rows are supported by Japanese ドゥバーガ語/ドゥバーガ and Chinese 迪维尔干. Move the existing annotation after the complete Korean language/person suffix: 드베르간어(Dvergan), 드베르가인(Dverga). This does not change identity, source English labels, particles, tokens, line breaks, other entities or prior holds. Existing people occurrence keys updated in place; no new key or historical global total.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate("people:dverga" => "accepted")
  }
end
proposal = File.join(__dir__, "proper-name-suffix-corrections-D#{d}.tsv")
m.write_table(proposal, m::HEADERS.take(12), reviews)
m.run(proposal, d, nil, review_states: %w[accepted not-an-issue])
summary = <<~TEXT

## D-#{d}: Atomic People And Language Suffix Labels

Independent verification found one remaining language annotation before 어
at default:54495. Corrected it to 드베르간어(Dvergan) and standardized
the two people-인 forms at default:47369/47542 to 드베르가인(Dverga).
Three existing row keys corrected in place; no new entity, occurrence,
source meaning, prior hold or historical global total. The unresolved
Hreid identity relationship remains as recorded at D-21232.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  target = File.join(__dir__, filename)
  File.write(target, File.read(target) + summary)
end
%w[README.md decision-register-20261009.md].each do |filename|
  target = File.join(__dir__, filename)
  text = File.read(target)
  marker = "## D-21237: Five Inns Tavern And Mine"
  raise "missing summary marker" unless text.include?(marker)
  File.write(target, text.sub(marker, summary + "\n" + marker))
end
puts summary
