#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_217
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
values = [
  ["place:black-odeon", "Black Odeon", "place", "블랙 오데온(Black Odeon)", "", "검은 오데온", "D-21217|default:50709|default:45524|default:65093", "confirmed", "English identifies the Unbound temple as Black Odeon. Japanese 黒のオデオン and Chinese 黑色殿堂 corroborate the same site. Reuse the explicit standalone Korean label at default:50709, 블랙 오데온, rather than alternating phonetic and literal Black. The official manual does not enumerate this DLC temple."],
  ["place:fallen-hall", "Fallen Hall", "place", "폴른 홀(Fallen Hall)", "", "몰락의 전당|쓰러진 전당|몰락한 전당|타락한 전당", "D-21217|base:2055:11|default:62197|default:9794", "confirmed", "English establishes Fallen Hall as the fortified location in the House of Sorrows quest; Japanese フォーレン要塞/死者の祠 and Chinese 倒戈大殿/陨落大厅 corroborate identity, not competing Korean names. Reuse base:2055 폴른 홀 and preserve its complete The Fallen Hall annotation; normalize the various literal Fallen variants elsewhere. Manual page 1 provides Fae/war setting, not an exhaustive place list."],
  ["place:embassy-hall", "Embassy Hall", "place", "대사관 홀(Embassy Hall)", "", "사절의 전당|대사관 전당|대사관 회관", "D-21217|base:1690:11|default:61466", "confirmed", "English names Embassy Hall, supported by Japanese 大使館庁舎 and Chinese 使臣大厅. Reuse the Korean base:1690 name 대사관 홀, already paired at default:61466, across the standalone labels and dialogue. Do not rename unrelated generic embassies or halls."]
]
definitions = values.map { |v| headers.zip(v).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
expected = {"place:black-odeon" => 7, "place:fallen-hall" => 13, "place:embassy-hall" => 9}
raise "unexpected venue coverage" unless generated.group_by { |r| r["entity_key"] }.transform_values(&:length) == expected
reviews = generated.sort_by { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }.map do |r|
  key = m.key(r)
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  case r["entity_key"]
  when "place:black-odeon"
    new_text.gsub!(/(?:블랙|검은) 오데온(?:\(Black Odeon\))?/, "블랙 오데온(Black Odeon)")
  when "place:fallen-hall"
    unless key == ["base", "2055", "11"]
      new_text.gsub!(/(?:폴른 홀|몰락의 전당|쓰러진 전당|몰락한 전당|타락한 전당)(?:\(Fallen Hall\))?(으로)?/) do
        "폴른 홀(Fallen Hall)#{$1 ? '로' : ''}"
      end
    end
  when "place:embassy-hall"
    new_text.gsub!(/(?:대사관 (?:홀|전당|회관)|사절의 전당|대사관)(?:\(Embassy Hall\))?/, "대사관 홀(Embassy Hall)")
  end
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => r["entity_key"], "status" => status, "old" => old, "new" => new_text,
    "evidence" => "D-21217 English-led named-place consistency review across affix/base/default. Japanese and Chinese corroborate each place identity. Reuse the established base labels 폴른 홀 and 대사관 홀, and the standalone Black Odeon label 블랙 오데온; retain base:2055's full The Fallen Hall annotation. Preserve unrelated personal names and all narrative/register/line-break structure. Manual PDF page 1 supplies the war/Fae setting, not a complete geographic roster.",
    "english" => JSON.parse(source["en_texts_json"]).compact.join("\n"),
    "japanese" => JSON.parse(source["ja_texts_json"]).compact.join("\n---\n"),
    "chinese" => source["zh_text"],
    "entity_dispositions_json" => JSON.generate(r["entity_key"] => status)
  }
end
definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise "existing discovery files" if [definition_path, review_path].any? { |p| File.exist?(p) }
m.write_table(definition_path, headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])
note = <<~TEXT

## D-#{d}: Black Odeon, Fallen Hall And Embassy Hall

Reviewed all 29 source row keys for the three distinct places across base
and default. Corrected #{reviews.count { |r| r["old"] != r["new"] }} cells;
retained #{reviews.count { |r| r["old"] == r["new"] }}. Canonical forms are
블랙 오데온(Black Odeon), 폴른 홀(Fallen Hall), and 대사관 홀(Embassy Hall).
Base:2055 keeps its full The Fallen Hall annotation. English meaning,
Japanese/Chinese identity, and in-corpus labels were compared before the
scoped changes; no generic hall, unrelated name or historical tally was edited.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21216: Three Named Monks"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
