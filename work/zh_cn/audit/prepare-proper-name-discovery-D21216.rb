#!/usr/bin/env ruby

require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_216
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
headers = m.table(File.join(__dir__, "proper-name-glossary.tsv")).headers
values = [
  ["person:brother-aedwin", "Brother Aedwin", "person", "에드윈 수사(Brother Aedwin)", "", "브라더 에드윈|에드윈 수사", "D-21216|default:48852|default:51282|default:52510", "confirmed", "English explicitly identifies Brother Aedwin in Father Etair's murder investigation. Japanese ブラザー・イードウィン and Chinese 埃德文修士 corroborate. Retain established 에드윈 and normalize the religious title to 수사. No bare Aedwin alias: Aenric Aedwin is a different full name, and standalone Aedwin is not linked by name alone."],
  ["person:brother-mason", "Brother Mason", "person", "메이슨 수사(Brother Mason)", "", "메이슨 형제|메이슨 수사", "D-21216|default:14086|default:28168|default:30794|default:41263", "confirmed", "English names the mission Alms Master and recurring religious counselor Brother Mason; Japanese ブラザー・メイソン and Chinese 梅森修士 corroborate. Retain established 메이슨 and title 수사. No bare Mason alias: mason and Mason's Hammer are ordinary stoneworking terms, not references to this monk."],
  ["person:brother-udo", "Brother Udo", "person", "우도 수사(Brother Udo)", "Father Udo", "브라더 우도|우도 형제|우도 수도사", "D-21216|default:4867|default:8910|default:10609|default:18300|default:21575|default:21826|default:32080|default:47103|default:61559", "confirmed", "English identifies the monk involved in Fallon's prayer-bead quest, supported by Japanese ブラザー・ウド and Chinese 乌多修士. Preserve the local Father Udo wording at default:21826, corroborated by Japanese ファーザー・ウド; render that source title 우도 신부(Father Udo), not Brother. No automatic bare Udo alias or claim that identical short-name labels establish identity. Official manual PDF page 2 establishes 미사루(Mitharu) in the religious setting but does not enumerate these monks."]
]
definitions = values.map { |v| headers.zip(v).to_h }
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map { |v| OCCURRENCE_HEADERS.zip(v).to_h }
expected = {"person:brother-aedwin" => 3, "person:brother-mason" => 4, "person:brother-udo" => 9}
raise "unexpected monk coverage" unless generated.group_by { |r| r["entity_key"] }.transform_values(&:length) == expected
reviews = generated.sort_by { |r| [m::RESOURCES.index(r["resource"]), r["ID_Linha"].to_i, r["Tipo_Variante"]] }.map do |r|
  key = m.key(r)
  source = inventory.fetch(key)
  old = source.fetch("work_text")
  new_text = old.dup
  case r["entity_key"]
  when "person:brother-aedwin"
    new_text.gsub!(/(?:브라더 에드윈|에드윈 수사)(?:\(Brother Aedwin\))?/, "에드윈 수사(Brother Aedwin)")
  when "person:brother-mason"
    new_text.gsub!(/메이슨 (?:형제|수사)(?:\(Brother Mason\))?/, "메이슨 수사(Brother Mason)")
  when "person:brother-udo"
    if key[1] == "21826"
      new_text.sub!("우도 신부님", "우도 신부님(Father Udo)")
    else
      new_text.gsub!(/(?:브라더 우도|우도(?:\(Udo\))? (?:형제|수사|수도사))(?:\(Brother Udo\))?/, "우도 수사(Brother Udo)")
    end
  end
  status = old == new_text ? "not-an-issue" : "accepted"
  {
    "resource" => key[0], "ID_Linha" => key[1], "Tipo_Variante" => key[2],
    "entity_key" => r["entity_key"], "status" => status, "old" => old, "new" => new_text,
    "evidence" => "D-21216 English-led named-monk review across all three resources; exact Japanese and Chinese references corroborate monk titles and established Korean readings. Use 수사 for Brother, preserving Father Udo as 신부님(Father Udo) at default:21826. Each repeated Brother Mason in default:30794 is annotated. Ordinary mason, the mason's hammer, Aenric Aedwin, and unlinked bare names are outside this narrowly evidenced registration. Official Korean manual PDF pages 1-2 supply religious/미사루 setting context, not an exhaustive NPC list.",
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

## D-#{d}: Three Named Monks

Registered Brother Aedwin, Brother Mason and Brother Udo; reviewed 16 distinct
default keys (3+4+9). Corrected #{reviews.count { |r| r["old"] != r["new"] }}
cells and retained #{reviews.count { |r| r["old"] == r["new"] }}. Religious
Brother titles use 수사; Father Udo retains the local Father title and
existing honorific at default:21826. No bare-name alias was inferred for
Aedwin, Mason, or Udo. Ordinary mason/stoneworking and Aenric Aedwin remain
outside these registrations. Source, byte, token and line-break checks
accompany the manifest. Existing indexed holds and global totals are unchanged.
TEXT
%W[named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
  path = File.join(__dir__, filename)
  File.write(path, File.read(path) + note)
end
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(__dir__, filename)
  text = File.read(path)
  marker = "## D-21215: Alfar Army Organization, Part 2"
  raise "missing summary marker" unless text.include?(marker)
  File.write(path, text.sub(marker, note + "\n" + marker))
end
puts note
