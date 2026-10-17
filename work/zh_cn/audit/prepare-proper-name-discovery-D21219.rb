#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_219
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
specs = [
  ["monster:jottun-runelord", "Jottun Runelord", "monster", "요툰 룬 군주(Jottun Runelord)", "요툰 룬로드", "Japanese ジョタン・ルーンロード and Chinese 约坦符文领主 corroborate the named monster type. Reuse 요툰 룬 군주 at default:2211/52262. The complete Naros Jottun Runelord at default:31352 is an already registered distinct qualified label; exclude that substring from the parent-type change."],
  ["title:dark-hunter", "Dark Hunter", "title", "어둠의 사냥꾼(Dark Hunter)", "다크 헌터", "English default:7866 explicitly awards this title; Japanese 闇の狩人 and Chinese 黑暗猎手 corroborate. Reuse the complete Korean semantic title, not an identity for a separate person."],
  ["skill:ethereal-guard", "Ethereal Guard", "skill", "에테르 수호(Ethereal Guard)", "에테르 수호대", "English default:18611 calls Ethereal Guard an abjuration, a protective spell, not an organization. Japanese エセリアル・ガードの防護魔法 and Chinese spell context corroborate. Reuse that row's 에테르 수호 and remove the misleading troop-unit suffix from the standalone label."],
  ["unique item:sun-stone", "Sun Stone", "unique item", "태양석(Sun Stone)", "태양의 돌", "English identifies the magical artifact recovered from Aodh, contrasted with Frost/Storm Stones. Japanese 太陽石 and Chinese 太阳石 corroborate. Reuse both base:414/base:3350 태양석 rather than alternating 태양의 돌, and annotate each explicit named reference, including repeated references in a row."],
  ["resource:prismere-dust", "Prismere Dust", "resource", "프리즘미어 가루(Prismere Dust)", "프리즈미어 가루", "English names the alchemy reagent, supported by Japanese プリスミアの粉末/プリスミアダスト and Chinese 赤晶矿尘. Reuse base:2523's 프리즘미어, keep the complete reagent name atomically annotated. Official Korean manual PDF page 8 describes reagents and quantity-bearing recipes; preserve all recipe quantities and other ingredients."],
  ["place:syl-hollow", "Syl Hollow", "place", "실 할로우(Syl Hollow)", "실 동굴", "English names Syl Hollow, including local lowercase hollow in prose; Japanese シル洞穴 and Chinese 希尔山谷/西尔洞穴 corroborate identity. Reuse the standalone default:7509 form 실 할로우. This is not a generic hollow."]
]
definitions = specs.map do |key, english, category, korean, variants, notes|
  headers.zip([key, english, category, korean, "", variants, "D-#{d}", "confirmed", notes]).to_h
end
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
expected = specs.map(&:first).zip([10, 3, 2, 16, 5, 3]).to_h
raise "unexpected mixed-name coverage" unless generated.group_by { |r| r["entity_key"] }.transform_values(&:length) == expected
reviews = generated.sort_by { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }.map do |r|
  key = m.key(r)
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  excluded = r["entity_key"] == "monster:jottun-runelord" && key[1] == "31352"
  unless excluded
    case r["entity_key"]
    when "monster:jottun-runelord"
      new_text.gsub!(/요툰(?:\(Jottun\))? (?:룬 군주|룬로드)(?:\(Jottun Runelord\)|\(Runelord\))?/, "요툰 룬 군주(Jottun Runelord)")
    when "title:dark-hunter"
      new_text.gsub!(/(?:다크 헌터|어둠의 사냥꾼)(?:\(Dark Hunter\))?/, "어둠의 사냥꾼(Dark Hunter)")
    when "skill:ethereal-guard"
      new_text.gsub!(/에테르 수호대?(?:\(Ethereal Guard\))?/, "에테르 수호(Ethereal Guard)")
    when "unique item:sun-stone"
      new_text.gsub!(/(?:태양석|태양의 돌)(?:\(Sun Stone\))?/, "태양석(Sun Stone)")
    when "resource:prismere-dust"
      new_text.gsub!(/(?:프리즘미어(?:\(Prismere\))?|프리즈미어) 가루(?:\(Prismere Dust\))?/, "프리즘미어 가루(Prismere Dust)")
    when "place:syl-hollow"
      new_text.gsub!(/실 (?:할로우|동굴)(?:\(Syl Hollow\))?/, "실 할로우(Syl Hollow)")
    end
  end
  status = excluded ? "excluded" : old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => r["entity_key"], "status" => status, "old" => old, "new" => new_text,
    "evidence" => "D-21219 English-led six-name review across affix/base/default with exact aligned Japanese/Chinese cells. Distinguish the Jottun monster type, bestowed Dark Hunter title, Ethereal Guard protective spell, Sun Stone artifact, Prismere Dust reagent, and Syl Hollow place. Preserve the already registered Naros Jottun Runelord compound as an excluded parent substring, not a reopened child decision. Reuse established Korean label spellings and retain all particles, quantities, tokens and line breaks. Official Korean manual PDF pages 1/5/8 provide setting, magic ability and reagent/recipe context but do not enumerate these names.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(r["entity_key"] => status)
  }
end
raise "expected 39 distinct keys" unless reviews.length == 39 && reviews.map { |r| m.key(r) }.uniq.length == 39
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise "existing discovery files" if [definition_path, review_path].any? { |p| File.exist?(p) }
m.write_table(definition_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])
note = <<~TEXT

## D-#{d}: Monster, Title, Spell, Artifact, Reagent And Place

Reviewed 39 distinct base/default keys for Jottun Runelord, Dark Hunter,
Ethereal Guard, Sun Stone, Prismere Dust, and Syl Hollow.
Corrected #{reviews.count { |r| r["status"] == "accepted" }} cells, retained
#{reviews.count { |r| r["status"] == "not-an-issue" }}, excluded one
already-registered Naros Jottun Runelord substring without changing that
qualified label. Ethereal Guard is a defensive spell, not a guard unit.
Sun Stone follows both base labels 태양석, and the reagent follows
프리즘미어 가루 with unchanged recipe quantities. Exact trilingual evidence
and byte-preserving edits are in the manifest/addendum. No old global tally
or reviewed uncertainty was reopened.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21218: Three Registered Full-Name And Title Candidates"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
