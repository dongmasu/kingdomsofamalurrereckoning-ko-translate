#!/usr/bin/env ruby

require_relative "continue-proper-name-reviewed-batches"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_228
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

glossary_path = File.join(__dir__, "proper-name-glossary.tsv")
candidate_path = File.join(__dir__, "proper-name-variant-discovery-candidates-20261015.tsv")
glossary_table = m.table(glossary_path)
glossary = glossary_table.map(&:to_h)
updates = {
  "person:hreid-amlethoe" => {
    alias: "Hreid Amelthoe",
    variants: ["흐레이드 아멜소", "흐레이드 아멜토", "헤리드 아멜토", "흐레이드 아멜토에"],
    evidence: "default:6476|default:9024|default:12826|default:21069|default:30835",
    note: "D-21228 reviewed the English source spelling alias Hreid Amelthoe in the same Galette Tunnels companion quest; Japanese フレイド・アメルソー and Chinese 赫雷德·阿梅尔索 identify the same previously registered person. Normalize the Korean name to 흐레이드 암레소 while preserving the source-local English spelling."
  },
  "person:nuala-ignas" => {
    alias: "Nuala Ignus",
    variants: ["누알라 이그너스", "누알라 이그누스"],
    evidence: "default:5189|default:61266",
    note: "D-21228 reviewed the English source spelling variant Nuala Ignus in the Aodh/Sun Stone quest; Japanese ヌアラ・イグナス and Chinese 努阿拉·伊格纳斯 match the existing Nuala Ignas person. Normalize the Korean name to 누알라 이그나스 while preserving the source-local English spelling."
  }
}

updates.each do |entity, update|
  row = glossary.find { |entry| entry.fetch("entity_key") == entity }
  raise "missing existing entity #{entity}" unless row
  aliases = row["english_aliases"].to_s.split("|").reject(&:empty?)
  aliases << update.fetch(:alias) unless aliases.include?(update.fetch(:alias))
  row["english_aliases"] = aliases.join("|")
  variants = row["korean_variants"].to_s.split("|").reject(&:empty?)
  update.fetch(:variants).each { |variant| variants << variant unless variants.include?(variant) }
  row["korean_variants"] = variants.join("|")
  evidence = row["evidence_ids"].to_s.split("|").reject(&:empty?)
  evidence.concat(["D-#{d}", *update.fetch(:evidence).split("|")])
  row["evidence_ids"] = evidence.uniq.join("|")
  unless row["notes"].to_s.include?(update.fetch(:note))
    row["notes"] = [row["notes"], update.fetch(:note)].reject(&:empty?).join(" ")
  end
end

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, glossary).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
old_index_table = m.table(m::INDEX)
old_index = old_index_table.map(&:to_h)
old_by_key = old_index.to_h do |row|
  [[row.fetch("entity_key"), *m.key(row)], row]
end
raise "duplicate old occurrence key" unless old_by_key.length == old_index.length
new_by_key = generated.to_h { |row| [[row.fetch("entity_key"), *m.key(row)], row] }
raise "duplicate generated occurrence key" unless new_by_key.length == generated.length
missing_old = old_by_key.keys - new_by_key.keys
generated.each do |row|
  previous = old_by_key[[row.fetch("entity_key"), *m.key(row)]]
  next unless previous
  row["status"] = previous.fetch("status")
  row["evidence"] = previous.fetch("evidence")
end
missing_old.each do |key|
  row = old_by_key.fetch(key).dup
  row["korean_current"] = inventory.fetch(m.key(row)).fetch("work_text")
  generated << row
end
generated.sort_by! do |row|
  [m::RESOURCES.index(row.fetch("resource")), row.fetch("ID_Linha").to_i,
   row.fetch("Tipo_Variante").to_s, row.fetch("entity_key")]
end

expected = {
  ["person:hreid-amlethoe", "default", "6476", ""] => "흐레이드 아멜소(Hreid Amelthoe)",
  ["person:hreid-amlethoe", "default", "9024", ""] => "흐레이드 아멜소",
  ["person:hreid-amlethoe", "default", "12826", ""] => "흐레이드 아멜토(Hreid Amelthoe)",
  ["person:hreid-amlethoe", "default", "21069", ""] => "헤리드 아멜토와 함께 갈레트 터널에 도착했다. 그가 있다고 주장하는 보물을 찾기 위해서다. 곳곳에 시체가 널려 있고 동굴은 코볼트(Kobold)에게 점령당했다. 헤리드를 도와 코볼트(Kobold) 떼를 몰아내야겠다.",
  ["person:hreid-amlethoe", "default", "30835", ""] => "레드 마치스(Red Marches)에 야영 중인 용병 흐레이드 아멜토에가 갈레트 아래 동굴에 숨겨진 보물을 찾는 일을 도와 달라고 했다. 동료들은 보물을 차지하려고 그를 버리고 떠났고, 그는 그들보다 먼저 보물을 찾으려 한다.",
  ["person:nuala-ignas", "default", "5189", ""] => "누알라 이그너스(Nuala Ignus)",
  ["person:nuala-ignas", "default", "61266", ""] => "누알라 이그누스(Nuala Ignus)"
}
target_rows = generated.select do |row|
  expected.key?([row.fetch("entity_key"), *m.key(row)])
end
actual = target_rows.to_h { |row| [[row.fetch("entity_key"), *m.key(row)], row] }
raise "new alias coverage mismatch: #{actual.keys.inspect}" unless actual.keys.sort == expected.keys.sort

review_path = File.join(__dir__, "proper-name-alias-residual-D#{d}.tsv")
raise "review manifest already exists" if File.exist?(review_path)
reviews = target_rows.sort_by { |row| [m::RESOURCES.index(row["resource"]), row["ID_Linha"].to_i] }.map do |row|
  key = [row.fetch("entity_key"), *m.key(row)]
  source = inventory.fetch(m.key(row))
  old_text = source.fetch("work_text")
  raise "active text differs from expected #{key.inspect}" unless old_text.include?(expected.fetch(key))
  new_text = case key
             when ["person:hreid-amlethoe", "default", "6476", ""]
               old_text.sub("흐레이드 아멜소", "흐레이드 암레소")
             when ["person:hreid-amlethoe", "default", "9024", ""]
               old_text.sub("흐레이드 아멜소", "흐레이드 암레소(Hreid Amelthoe)")
             when ["person:hreid-amlethoe", "default", "12826", ""]
               old_text.sub("흐레이드 아멜토", "흐레이드 암레소")
             when ["person:hreid-amlethoe", "default", "21069", ""]
               old_text.sub("헤리드 아멜토", "흐레이드 암레소(Hreid Amelthoe)")
                       .sub("헤리드를", "흐레이드를")
             when ["person:hreid-amlethoe", "default", "30835", ""]
               old_text.sub("흐레이드 아멜토에", "흐레이드 암레소(Hreid Amelthoe)에")
             when ["person:nuala-ignas", "default", "5189", ""]
               old_text.sub("누알라 이그너스", "누알라 이그나스")
             when ["person:nuala-ignas", "default", "61266", ""]
               old_text.sub("누알라 이그누스", "누알라 이그나스")
             end
  raise "translation span did not change #{key.inspect}" if new_text == old_text
  note = updates.fetch(key.first).fetch(:note)
  {
    "resource" => key[1], "ID_Linha" => key[2], "Tipo_Variante" => key[3],
    "entity_key" => key[0], "status" => "accepted", "old" => old_text, "new" => new_text,
    "evidence" => note,
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(key[0] => "accepted"),
    "previous_status" => JSON.generate(key[0] => "needs-context"),
    "previous_evidence" => JSON.generate(key[0] => "New English alias matched the existing registered entity; focused review required.")
  }
end

raise "unexpected alias review size" unless reviews.length == 7
candidates_table = m.table(candidate_path)
candidates = candidates_table.map(&:to_h)
updates.each_value do |update|
  candidate = candidates.find { |row| row["english_candidate"] == update.fetch(:alias) }
  raise "missing candidate #{update.fetch(:alias)}" unless candidate
  candidate["status"] = "registered-reviewed"
end

m.write_table(glossary_path, glossary_table.headers, glossary)
m.write_table(m::INDEX, old_index_table.headers, generated)
m.write_table(candidate_path, candidates_table.headers, candidates)
m.write_table(review_path, m::HEADERS, reviews)
m.run(review_path, d, 1)

note = <<~TEXT

## D-#{d}: Existing Character Name Aliases

Added source-supported English spelling aliases to the existing
`person:hreid-amlethoe` and `person:nuala-ignas` entries; no duplicate people
were registered. Reviewed all seven newly matched rows across the Galette
Tunnels and Aodh/Sun Stone contexts, correcting the Korean names in each, and
preserved each source-local English spelling in parentheses. Japanese and
Chinese identify the same characters as the existing canonical entries.
The earlier dispositions for other entities on these rows and all historical
global totals remain unchanged.
TEXT

%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21227: Codex Scaith And Faitir Scaith"
  raise "missing summary marker #{marker}" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end

puts note
