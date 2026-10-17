#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_208
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
inventory = m.refresh_inventory
index = m.table(m::INDEX).map(&:to_h)

existing_candidates = {
  "Priestess Corelon" => "person:corelon",
  "Priestess Seranon" => "person:abelyra-seranon"
}
existing_candidates.each do |term, entity|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
  pattern = Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])", Regexp::IGNORECASE)
  matches = inventory.values.select do |row|
    JSON.parse(row.fetch("en_texts_json")).compact.any? { |text| text.match?(pattern) }
  end
  expected_count = term == "Priestess Corelon" ? 15 : 12
  raise "unexpected #{term} source match count #{matches.length}" unless
    matches.length == expected_count
  matches.each do |source|
    occurrence = index.find do |row|
      row.fetch("entity_key") == entity && m.key(row) == m.key(source)
    end
    raise "missing terminal #{entity} match at #{m.key(source).inspect}" unless
      occurrence && %w[accepted not-an-issue excluded].include?(occurrence.fetch("status"))
  end
  candidate["status"] = "registered-reviewed"
end

candidate_terms = ["Private Cornall", "Private Sterling", "Snaketail River"]
candidate_terms.each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
end

definition_values = [
  ["person:private-cornall", "Private Cornall", "person",
   "코널 일병(Private Cornall)", "", "콘널 일병|코널(Cornall) 일병|코널 일병",
   "D-#{d}|default:1032|default:5561|default:21515|default:28430|default:29095|default:29455|default:30298|default:59921",
   "confirmed",
   "English identifies the same Alfar soldier throughout the Caeled Coast command succession. Japanese 兵卒コーナル and Chinese 列兵科纳尔 corroborate; existing Korean rows support 코널 rather than 콘널. Standardize the complete rank/name label as 코널 일병(Private Cornall), retaining the natural particle and title order in each sentence."],
  ["person:private-sterling", "Private Sterling", "person",
   "스털링 일병(Private Sterling)", "", "이등병 스털링|스털링 이병|스털링 이등병",
   "D-#{d}|default:7512|default:9452|default:23702|default:36605|default:38652|default:42667|default:44907|default:45290|default:49007|default:63887",
   "confirmed",
   "English identifies the woman soldier at the Mithros border checkpoint and in the Border Permit quest. Japanese 兵卒スターリング and Chinese 列兵斯特林 corroborate the name and rank. The active Korean majority supports 스털링 일병; normalize inconsistent 이병/이등병 wording and add one complete bilingual label."],
  ["place:snaketail-river", "Snaketail River", "place",
   "스네이크테일 강(Snaketail River)", "", "스네크테일강|스네이크테일강|스네이크테일 강",
   "D-#{d}|default:12758|default:15752|default:26783|default:49509|default:53656|default:59973",
   "confirmed",
   "English identifies the river, its trench, and its role as a regional water source. Japanese スネークテイル川 and Chinese 蛇尾河 corroborate the referent. Reuse the active Korean majority spelling 스네이크테일 강 and add the bilingual label in the exact name-bearing rows."]
].freeze

definition_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definition_path, review_path].any? { |path| File.exist?(path) }
definition_headers = m.table(File.join(audit, "proper-name-glossary.tsv")).headers
definitions = definition_values.map { |values| definition_headers.zip(values).to_h }
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_counts = {
  "person:private-cornall" => 8,
  "person:private-sterling" => 10,
  "place:snaketail-river" => 6
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

changes = {
  ["default", "1032", ""] =>
    ["코널(Cornall) 일병", "코널 일병(Private Cornall)"],
  ["default", "5561", ""] =>
    ["콘널 일병(Private Cornall)", "코널 일병(Private Cornall)"],
  ["default", "21515", ""] =>
    ["코널(Cornall) 일병 설득하기", "코널 일병(Private Cornall) 설득하기"],
  ["default", "28430", ""] =>
    ["코널(Cornall) 일병이라는", "코널 일병(Private Cornall)이라는"],
  ["default", "29095", ""] =>
    ["코널(Cornall) 일병과", "코널 일병(Private Cornall)과"],
  ["default", "29455", ""] =>
    ["콘널 일병을", "코널 일병(Private Cornall)을"],
  ["default", "9452", ""] =>
    ["스털링 이등병은", "스털링 일병(Private Sterling)은"],
  ["default", "23702", ""] =>
    ["스털링 이병(Private Sterling)에게", "스털링 일병(Private Sterling)에게"],
  ["default", "36605", ""] =>
    ["스털링 이병이", "스털링 일병(Private Sterling)이"],
  ["default", "38652", ""] =>
    ["스털링 이등병이다", "스털링 일병(Private Sterling)이다"],
  ["default", "42667", ""] =>
    ["이병 스털링에게", "스털링 일병(Private Sterling)에게"],
  ["default", "44907", ""] =>
    ["스털링 일병이", "스털링 일병(Private Sterling)이"],
  ["default", "45290", ""] =>
    ["스털링 일병에게", "스털링 일병(Private Sterling)에게"],
  ["default", "49007", ""] =>
    ["이등병 스털링", "스털링 일병(Private Sterling)"],
  ["default", "12758", ""] =>
    ["스네크테일강(Snaketail River)", "스네이크테일 강(Snaketail River)"],
  ["default", "26783", ""] =>
    ["스네이크테일 강의 전망대", "스네이크테일 강(Snaketail River)의 전망대"],
  ["default", "49509", ""] =>
    ["독이 든 스네이크테일 강의 희생자",
     "독이 든 스네이크테일 강(Snaketail River)의 희생자"],
  ["default", "53656", ""] =>
    ["스네이크테일 강으로", "스네이크테일 강(Snaketail River)으로"]
}.freeze

evidence = <<~NOTE.strip
  D-#{d} English-anchored proper-name discovery and cross-row review.
  The manifest records the exact aligned English, Japanese, Chinese, and
  Korean rows. Private Cornall is the Caeled Coast soldier selected to take
  command from Erion Odi; Private Sterling is the Mithros checkpoint soldier;
  Snaketail River is the river and water source in Apotyre. Japanese informs
  pronunciation/register and Chinese is supporting evidence. Established
  Korean forms were preferred; Private Sterling's rank is standardized to
  일병 based on repeated active Korean usage and aligned generic soldier-rank
  references. Priestess Corelon and Priestess Seranon candidates were checked
  against their existing terminal person keys and were not reopened or
  recounted. The official Korean manual provides broad setting context but
  does not enumerate these NPCs or this river.
NOTE

rows_by_key = generated.group_by { |row| m.key(row) }
reviews = rows_by_key.keys.sort_by do |key|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key|
  source = inventory.fetch(key)
  entities = rows_by_key.fetch(key).map { |row| row.fetch("entity_key") }.uniq.sort
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one edit span at #{key.inspect}" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end
  dispositions = entities.to_h do |entity|
    [entity, old == new_text ? "not-an-issue" : "accepted"]
  end
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entities.join("|"),
    "status" => dispositions.value?("accepted") ? "accepted" : "not-an-issue",
    "old" => old,
    "new" => new_text,
    "evidence" => evidence,
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(dispositions)
  }
end
raise "expected 24 distinct source rows" unless reviews.length == 24
raise "unexpected correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length
raise "change map includes an unreviewed row" unless
  (changes.keys - reviews.map { |row| m.key(row) }).empty?

m.write_table(definition_path, definition_headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
m.write_table(candidate_path, candidate_table.headers, candidates)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])

review_note = <<~TEXT

## Discovery And Cross-Row Standardization

Registered Private Cornall, Private Sterling, and Snaketail River. Reviewed
all 24 distinct source row keys: eight Cornall, ten Sterling, and six river
rows. Corrected 18 cells and retained six. Canonical forms are 코널 일병
(Private Cornall), 스털링 일병(Private Sterling), and 스네이크테일 강
(Snaketail River). This normalizes Cornall's consonant variant, Sterling's
rank and bilingual labeling, and the river's spelling/English annotation.
Priestess Corelon and Priestess Seranon were already terminal under their
registered person keys; those existing keys were not reopened or counted.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Two People And Snaketail River

Registered Private Cornall, Private Sterling, and Snaketail River. Reviewed
24 distinct source keys (18 corrections, six retained). Existing terminal
Priestess Corelon/Seranon occurrences were not reopened or recounted. See the
dated report, addendum, definitions, and exact source manifest.
TEXT
marker = "## D-21207: Honor Brand Singular Item Labels"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} distinct source rows across " \
     "#{generated.length} entity occurrences; #{changes.length} corrections, " \
     "#{reviews.length - changes.length} retained; registered #{definitions.length} entities."
