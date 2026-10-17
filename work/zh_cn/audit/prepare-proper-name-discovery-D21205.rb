#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_205
audit = __dir__
candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
candidate_terms = [
  "Spinning Tom", "Favian Tyrn", "King Reynor", "Ram Leodwald",
  "Ruhnir Wesnon", "Agarth Ulfrik"
]
candidate_terms.each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
end

definition_values = [
  ["person:spinning-tom", "Spinning Tom", "person", "빙글이 톰(Spinning Tom)", "",
   "스피닝 톰|빙글빙글 톰", "D-#{d}|base:1629:11|base:3407:11|default:935|default:6470|default:37486|default:61361",
   "confirmed",
   "English identifies the historical Traveler Spinning Tom, whose legend is described in dialogue and item text. Japanese 早回しのトム and Chinese 旋转汤姆 corroborate the sobriquet. Use the established Korean nickname form 빙글이 톰 and preserve Spinning Tom in parentheses."],
  ["person:favian-tyrn", "Favian Tyrn", "person", "파비안 티른(Favian Tyrn)", "",
   "파비안 턴|페이비언 턴", "D-#{d}|default:6516|default:12353|default:18125|default:19360|default:32269|default:49477|default:51847",
   "confirmed",
   "English identifies Favian Tyrn as a Rathir City Watch member. Japanese ファビアン・ティアン and Chinese 法维安·提恩 corroborate identity and name rendering. Standardize to 파비안 티른(Favian Tyrn)."],
  ["person:reynor", "Reynor", "person", "레이너(Reynor)", "King Reynor",
   "레이노르|레이너", "D-#{d}|base:3045:11|base:3911:11|default:8421|default:16808|default:19285|default:23376|default:33206|default:63532",
   "confirmed",
   "English identifies Reynor as the deposed Mitharan king of Crownhold. Japanese レイノー and Chinese 莱诺 corroborate the identity; the active Korean majority supports 레이너 over 레이노르. King Reynor is a title-inclusive alias; surname/title wording remains natural to each sentence."],
  ["person:ram-leodwald", "Ram Leodwald", "person", "램 레오드월드(Ram Leodwald)", "",
   "람 레오드월드|램 레오드월드", "D-#{d}|base:2682|default:472|default:15875|default:29080|default:37597|default:38390|default:57533",
   "confirmed",
   "English identifies Ram Leodwald in repeated death notices and correspondence. Japanese ラム・レオドワルド and Chinese 拉姆·利奥多德 corroborate identity and surname. Standardize the prevailing Korean forms to 램 레오드월드(Ram Leodwald); the surname-only salutation at default:38390 is not expanded."],
  ["person:ruhnir-wesnon", "Ruhnir Wesnon", "person", "루니르 웨스논(Ruhnir Wesnon)", "",
   "루니르 웨스넌|루니르 웨스논", "D-#{d}|default:822|default:21755|default:30490|default:37358",
   "confirmed",
   "English identifies Ruhnir Wesnon as the named recipient of cards and a conscription notice. Japanese ルーニア・ウェスノン and Chinese 鲁赫尼尔·维斯农 corroborate identity. Retain the English-led given-name rendering 루니르 and standardize the prevalent surname 웨스논."],
  ["person:agarth-ulfrik", "Agarth Ulfrik", "person", "아가스 울프릭(Agarth Ulfrik)", "",
   "아가스 울프리크|아가스 울프릭", "D-#{d}|default:371|default:30378|default:56010",
   "confirmed",
   "English identifies the legendary warrior and Fateweaver Agarth Ulfrik. Japanese アガース・ウルフリク and Chinese 阿加斯·乌尔弗里克 corroborate the identity and spelling. Reuse the prevailing Korean form 아가스 울프릭(Agarth Ulfrik)."],
  ["unique item:spinning-tom-blades", "Spinning Tom's Blades", "unique item",
   "빙글이 톰의 칼날(Spinning Tom's Blades)", "", "스피닝 톰의 칼날",
   "D-#{d}|base:1629:11",
   "confirmed",
   "The base resource labels a distinct named equipment item. English Spinning Tom's Blades, Japanese 早回しのトムのナイフ, and Chinese 旋转汤姆之刃 align. Pair the complete Korean item title with the complete English title, not a nested person-name annotation."],
  ["unique item:spinning-tom-anvil", "Spinning Tom's Anvil", "unique item",
   "빙글이 톰의 모루(Spinning Tom's Anvil)", "", "스피닝 톰의 모루",
   "D-#{d}|base:3407:11",
   "confirmed",
   "The base resource labels a distinct named equipment item. English Spinning Tom's Anvil, Japanese 早回しのトムの金槌, and Chinese 旋转汤姆的铁砧 align. Pair the complete Korean item title with the complete English title, not a nested person-name annotation."]
].freeze

definition_path = File.join(audit, "proper-name-discovery-definitions-D#{d}.tsv")
review_path = File.join(audit, "proper-name-discovery-D#{d}.tsv")
raise "D-#{d} artifacts already exist" if
  [definition_path, review_path].any? { |path| File.exist?(path) }
definition_headers = m.table(File.join(audit, "proper-name-glossary.tsv")).headers
definitions = definition_values.map { |values| definition_headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_counts = {
  "person:spinning-tom" => 6,
  "person:favian-tyrn" => 7,
  "person:reynor" => 8,
  "person:ram-leodwald" => 7,
  "person:ruhnir-wesnon" => 4,
  "person:agarth-ulfrik" => 3,
  "unique item:spinning-tom-blades" => 1,
  "unique item:spinning-tom-anvil" => 1
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

generated_by_entity_key = generated.to_h do |row|
  [[row.fetch("entity_key"), *m.key(row)], row]
end
candidate_terms.each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  entity = case term
           when "Spinning Tom" then "person:spinning-tom"
           when "Favian Tyrn" then "person:favian-tyrn"
           when "King Reynor" then "person:reynor"
           when "Ram Leodwald" then "person:ram-leodwald"
           when "Ruhnir Wesnon" then "person:ruhnir-wesnon"
           when "Agarth Ulfrik" then "person:agarth-ulfrik"
           end
  candidate.fetch("sampled_row_keys").split("|").uniq.each do |raw_key|
    parts = raw_key.split(":", 3)
    key = [parts.fetch(0), parts.fetch(1), parts.fetch(2).to_s]
    raise "candidate row has no #{entity} occurrence: #{key.inspect}" unless
      generated_by_entity_key.key?([entity, *key])
  end
end

changes = {
  ["base", "1629", "11"] =>
    ["빙글이 톰(Spinning Tom)의 칼날", "빙글이 톰의 칼날(Spinning Tom's Blades)"],
  ["base", "3407", "11"] =>
    ["빙글이 톰(Spinning Tom)의 모루", "빙글이 톰의 모루(Spinning Tom's Anvil)"],
  ["default", "935", ""] =>
    ["스피닝 톰(Spinning Tom)", "빙글이 톰(Spinning Tom)"],
  ["default", "37486", ""] =>
    ["빙글빙글 톰", "빙글이 톰(Spinning Tom)"],
  ["default", "61361", ""] =>
    ["스피닝 톰(Spinning Tom)", "빙글이 톰(Spinning Tom)"],
  ["default", "12353", ""] =>
    ["파비안 턴(Favian Tyrn)", "파비안 티른(Favian Tyrn)"],
  ["default", "19360", ""] =>
    ["페이비언 턴", "파비안 티른(Favian Tyrn)"],
  ["default", "32269", ""] =>
    ["파비안 티른", "파비안 티른(Favian Tyrn)"],
  ["default", "49477", ""] =>
    ["파비안 티른", "파비안 티른(Favian Tyrn)"],
  ["base", "3911", "11"] =>
    ["레이노르 왕(King Reynor)", "레이너 왕(King Reynor)"],
  ["default", "16808", ""] =>
    ["레이너(Reynor) 왕", "레이너 왕(King Reynor)"],
  ["default", "19285", ""] =>
    ["폐위된 크라운홀드(Crownhold)의 왕 레이너", "폐위된 크라운홀드(Crownhold)의 왕 레이너(King Reynor)"],
  ["default", "33206", ""] =>
    ["레이너 왕", "레이너 왕(King Reynor)"],
  ["default", "29080", ""] =>
    ["람 레오드월드(Ram Leodwald)", "램 레오드월드(Ram Leodwald)"],
  ["default", "37597", ""] =>
    ["람 레오드월드(Leodwald)", "램 레오드월드(Ram Leodwald)"],
  ["default", "38390", ""] =>
    ["램 레오드월드(Leodwald)", "램 레오드월드(Ram Leodwald)"],
  ["default", "57533", ""] =>
    ["람 레오드월드(Leodwald)", "램 레오드월드(Ram Leodwald)"],
  ["default", "822", ""] =>
    ["루니르 웨스넌(Ruhnir Wesnon)", "루니르 웨스논(Ruhnir Wesnon)"],
  ["default", "56010", ""] =>
    ["아가스 울프리크(Agarth Ulfrik)", "아가스 울프릭(Agarth Ulfrik)"]
}.freeze

evidence = <<~NOTE.strip
  D-21205 is an English-anchored proper-name discovery and cross-row review.
  The exact aligned Japanese and Chinese source rows are recorded here.
  Spinning Tom is the historical Traveler; Japanese 早回しのトム and Chinese
  旋转汤姆 corroborate the nickname, standardized as 빙글이 톰. Favian Tyrn
  is identified in City Watch contexts; ファビアン・ティアン / 法维安·提恩
  corroborate 파비안 티른. Reynor is the former Mitharan king of Crownhold;
  レイノー / 莱诺 corroborate the identity, and the prevalent Korean spelling
  is 레이너. Ram Leodwald, Ruhnir Wesnon, and Agarth Ulfrik are each identified
  in their exact English contexts; the manifest records their aligned Japanese
  and Chinese forms and Korean canonical decisions. The two base labels
  Spinning Tom's Blades and Spinning Tom's Anvil are separately registered
  complete named-item titles. No identity is inferred from an unrelated
  surname-only salutation, and no unreviewed compound is closed by implication.
NOTE

rows_by_key = generated.group_by { |row| m.key(row) }
reviews = rows_by_key.keys.sort.map do |key|
  source = inventory.fetch(key)
  entity_keys = rows_by_key.fetch(key).map { |row| row.fetch("entity_key") }.uniq.sort
  old = source.fetch("work_text")
  new_text = old.dup
  if (change = changes[key])
    from, to = change
    raise "expected one edit span at #{key.inspect}" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  end
  dispositions = entity_keys.to_h do |entity|
    [entity, old == new_text ? "not-an-issue" : "accepted"]
  end
  {
    "resource" => key[0],
    "ID_Linha" => key[1],
    "Tipo_Variante" => key[2],
    "entity_key" => entity_keys.join("|"),
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
raise "expected 35 distinct source rows" unless reviews.length == 35
raise "unexpected correction count" unless
  reviews.count { |row| row["old"] != row["new"] } == changes.length
raise "change map includes an unreviewed row" unless
  (changes.keys - reviews.map { |row| m.key(row) }).empty?

m.write_table(definition_path, definition_headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])

review_note = <<~TEXT

## Discovery And Cross-Row Standardization

Registered six people and two named items, then reviewed all 35 distinct
source row keys generated from their English canonical terms and aliases.
This includes 11 additional matching rows beyond the 24 sampled heuristic
candidate rows. Corrected 19 cells and retained 16. The two equipment labels
now use complete bilingual titles: `빙글이 톰의 칼날(Spinning Tom's Blades)`
and `빙글이 톰의 모루(Spinning Tom's Anvil)`. Personal-name canonical forms
are `빙글이 톰(Spinning Tom)`, `파비안 티른(Favian Tyrn)`,
`레이너(Reynor)`, `램 레오드월드(Ram Leodwald)`,
`루니르 웨스논(Ruhnir Wesnon)`, and `아가스 울프릭(Agarth Ulfrik)`.
Existing title wording and sentence structure were retained except where
needed to pair a complete source-supported King Reynor label.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Six People And Two Named Items

Registered six personal names and the distinct equipment labels Spinning
Tom's Blades and Spinning Tom's Anvil. Reviewed all 35 distinct source rows
generated for these entries, including 11 rows beyond the heuristic samples;
19 cells were corrected and 16 retained. Exact source evidence and
before/after text are in the discovery definitions and
[`proper-name-discovery-D#{d}.tsv`](proper-name-discovery-D#{d}.tsv), with the
dated review and addendum. No previous finding was recounted.
TEXT
marker = "## D-#{d - 1}: Registered Candidate Cross-Check"
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
