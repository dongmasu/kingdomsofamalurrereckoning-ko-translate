#!/usr/bin/env ruby

require_relative "continue-proper-name-reviewed-batches"

m = ReviewedNameBatches
d = 21_211
key = ["default", "51240", ""]
inventory = m.refresh_inventory
source = inventory.fetch(key)
expected_old =
  "가자. 하이페리언(Hyperian)을 열려면 대기의 성소(Air Shrine)이 필요하다면, 가야 해."
raise "unexpected active text at #{key.inspect}" unless
  source.fetch("work_text") == expected_old

review_path = File.join(m::AUDIT, "proper-name-correction-D#{d}.tsv")
raise "D-#{d} correction manifest already exists" if File.exist?(review_path)
review = {
  "resource" => key[0],
  "ID_Linha" => key[1],
  "Tipo_Variante" => key[2],
  "entity_key" => "place:air-shrine",
  "status" => "accepted",
  "old" => expected_old,
  "new" =>
    "가자. 하이페리언(Hyperian)을 열려면 대기의 성소(Air Shrine)가 필요하다면, 가야 해.",
  "evidence" =>
    "D-#{d} corrective proper-name particle review. The Korean noun 성소 ends in a vowel, so the subject particle after its English parenthetical is 가, not 이. The English 'If we need the Air Shrine' and aligned Japanese/Chinese both support the shrine as the needed subject. This corrects D-21210's accepted label without changing its entity disposition or any global tally."
}
m.write_table(review_path, m::HEADERS.take(12), [review])
m.run(review_path, d, nil, review_states: ["accepted"])

detail = <<~TEXT

## D-#{d}: Air Shrine Particle Corrigendum

Corrected the subject particle at `default:51240` from `이` to `가` after
`대기의 성소(Air Shrine)`. This is a grammatical corrigendum to the already
accepted Air Shrine key from D-21210; it adds no entity or occurrence and
does not alter focused/global disposition totals. The English clause and
aligned Japanese/Chinese confirm that the shrine is the subject needed to
unlock the Hyperian.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(m::AUDIT, filename), "a") { |file| file.write(detail) }
end

summary = <<~TEXT

## D-#{d}: Air Shrine Particle Corrigendum

Corrected the particle in the accepted Air Shrine label at `default:51240`
from `이` to `가`. This is a one-cell grammar correction, not a new entity
occurrence or disposition count. See the dated report, addendum, and exact
correction manifest.
TEXT
marker = "## D-21210: Waterhall Down And The Elemental Shrines"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(m::AUDIT, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: corrected default 51240 particle; no new occurrence or disposition count."
