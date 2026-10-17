#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_209
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
candidate_terms = [
  "Syllareta Vauner", "Tarrick Smith", "Valeryia Dunbert",
  "Warlord Whenery", "Wren Penderghast"
]
candidate_terms.each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
end

definition_values = [
  ["person:syllareta-vauner", "Syllareta Vauner", "person",
   "실라리타 바우너(Syllareta Vauner)", "",
   "실라레타 바우너|실라리타 보너|실라레타 보너",
   "D-#{d}|default:27833|default:39925|default:42598|default:52873|default:57491",
   "confirmed",
   "English identifies the Canneroc village medic and antidote quest contact. Japanese シラリータ・ボーナ and Chinese 希拉里塔·沃纳尔 corroborate the given name and surname. Follow the cross-language reading 실라리타 바우너 and standardize all five exact occurrences."],
  ["person:tarrick-smith", "Tarrick Smith", "person",
   "타릭 스미스(Tarrick Smith)", "", "태릭 스미스",
   "D-#{d}|default:1441|default:2081|default:10277|default:21254|default:25027|default:52020|default:59783|default:63329",
   "confirmed",
   "English identifies the same armorer, smith, and arena challenger. Japanese タリック・スミス and Chinese 塔瑞克·史密斯 corroborate the name; the active Korean majority and cross-language reading support 타릭 스미스. Preserve role descriptions and standardize the eight exact full-name occurrences."],
  ["person:valeryia-dunbert", "Valeryia Dunbert", "person",
   "발레리아 던버트(Valeryia Dunbert)", "", "발레리야 던버트",
   "D-#{d}|base:210:11|default:11467|default:22437",
   "confirmed",
   "English identifies the deceased poet, daughter, and mother named in the grave labels. Japanese ヴァレリア・ダンバート and Chinese 瓦勒伊亚·顿伯特 corroborate; use the established Korean spelling 발레리아 던버트. The base grave title is already correctly bilingual."],
  ["person:whenery", "Whenery", "person",
   "웨너리(Whenery)", "Warlord Whenery|Lady Whenery", "웨네리|위너리",
   "D-#{d}|default:6958|default:7495|default:12708|default:18373|default:29481|default:30647|default:33896|default:35665|default:47756|default:53636|default:56065|default:63440|default:63750|default:65046",
   "confirmed",
   "English identifies the same female Warlord and political leader, also addressed as Lady Whenery. Japanese ウェネリー将軍 / レディー・ウェネリー and Chinese 战争领主韦纳里 / 韦纳里夫人 corroborate the name and titles. Use 웨너리, pair Warlord Whenery as 전쟁군주 웨너리(Warlord Whenery), and Lady Whenery as 웨너리 부인(Lady Whenery)."],
  ["person:wren-penderghast", "Wren Penderghast", "person",
   "렌 펜더가스트(Wren Penderghast)", "", "렌 펜더개스트",
   "D-#{d}|default:28554|default:30756|default:54082|default:64224|default:64400",
   "confirmed",
   "English identifies the Scholia Arcana mage and Savant at Rathir. Japanese ウレン・ペンダーガースト and Chinese 乌伦·彭德格斯特 corroborate. Reuse the Korean majority rendering 렌 펜더가스트; preserve Savant as a separate title in the complete Savant Wren Penderghast label."]
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
  "person:syllareta-vauner" => 5,
  "person:tarrick-smith" => 8,
  "person:valeryia-dunbert" => 3,
  "person:whenery" => 14,
  "person:wren-penderghast" => 5
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

changes = {
  ["default", "27833", ""] =>
    ["실라레타 바우너(Syllareta Vauner)", "실라리타 바우너(Syllareta Vauner)"],
  ["default", "39925", ""] =>
    ["실라레타 바우너야", "실라리타 바우너(Syllareta Vauner)야"],
  ["default", "42598", ""] =>
    ["실라리타 보너가", "실라리타 바우너(Syllareta Vauner)가"],
  ["default", "57491", ""] =>
    ["실라레타 보너(Syllareta Vauner)", "실라리타 바우너(Syllareta Vauner)"],
  ["default", "1441", ""] =>
    ["태릭 스미스(Tarrick Smith)", "타릭 스미스(Tarrick Smith)"],
  ["default", "10277", ""] =>
    ["타릭 스미스,", "타릭 스미스(Tarrick Smith),"],
  ["default", "21254", ""] =>
    ["타릭 스미스 처치", "타릭 스미스(Tarrick Smith) 처치"],
  ["default", "25027", ""] =>
    ["타릭 스미스야.", "타릭 스미스(Tarrick Smith)야."],
  ["default", "52020", ""] =>
    ["태릭 스미스(Tarrick Smith)", "타릭 스미스(Tarrick Smith)"],
  ["default", "59783", ""] =>
    ["태릭 스미스야.", "타릭 스미스(Tarrick Smith)야."],
  ["default", "63329", ""] =>
    ["타릭 스미스가", "타릭 스미스(Tarrick Smith)가"],
  ["default", "22437", ""] =>
    ["발레리야 던버트(Valeryia Dunbert)",
     "발레리아 던버트(Valeryia Dunbert)"],
  ["default", "7495", ""] =>
    ["워로드 웨너리(Warlord Whenery)", "전쟁군주 웨너리(Warlord Whenery)"],
  ["default", "12708", ""] =>
    ["웨네리(Whenery) 장군", "전쟁군주 웨너리(Warlord Whenery)"],
  ["default", "18373", ""] =>
    ["워로드 웨너리(Warlord Whenery)", "전쟁군주 웨너리(Warlord Whenery)"],
  ["default", "29481", ""] =>
    ["군벌 웨너리다", "전쟁군주 웨너리(Warlord Whenery)다"],
  ["default", "33896", ""] =>
    ["군벌 웨너리 뒤에", "전쟁군주 웨너리(Warlord Whenery) 뒤에"],
  ["default", "30647", ""] =>
    ["웨너리 부인", "웨너리 부인(Lady Whenery)"],
  ["default", "35665", ""] =>
    ["레이디 웨너리보다", "웨너리 부인(Lady Whenery)보다"],
  ["default", "47756", ""] =>
    ["전쟁군주 웨너리다", "전쟁군주 웨너리(Warlord Whenery)다"],
  ["default", "63440", ""] =>
    ["군벌 위너리", "전쟁군주 웨너리(Warlord Whenery)"],
  ["default", "63750", ""] =>
    ["전쟁군주 위너리(Warlord Whenery)",
     "전쟁군주 웨너리(Warlord Whenery)"],
  ["default", "65046", ""] =>
    ["웨너리 부인을 봤어?", "웨너리 부인(Lady Whenery)을 봤어?"],
  ["default", "28554", ""] =>
    ["렌 펜더개스트(Wren Penderghast)", "렌 펜더가스트(Wren Penderghast)"],
  ["default", "30756", ""] =>
    ["렌 펜더가스트", "렌 펜더가스트(Wren Penderghast)"],
  ["default", "54082", ""] =>
    ["렌 펜더개스트(Wren Penderghast)", "렌 펜더가스트(Wren Penderghast)"]
}.freeze

evidence = <<~NOTE.strip
  D-#{d} English-anchored proper-name discovery and cross-row review.
  Exact aligned English, Japanese, Chinese, and Korean source cells are in
  this manifest. Syllareta Vauner is the Canneroc medic; Tarrick Smith is the
  armorer/challenger; Valeryia Dunbert is identified by repeated grave
  labels; Whenery is the female Warlord; and Wren Penderghast is the Rathir
  Scholia Arcana mage. Japanese pronunciation/register and Chinese supporting
  labels were compared. Existing Korean forms were standardized without
  merging separate titles, people, or locations. The official Korean manual
  provides broad setting context but does not enumerate these NPCs.
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

Registered five people and reviewed all 35 exact source row keys: five
Syllareta Vauner, eight Tarrick Smith, three Valeryia Dunbert, fourteen
Whenery, and five Wren Penderghast. Corrected 26 cells and retained nine. Canonical
spellings are 실라리타 바우너(Syllareta Vauner), 타릭 스미스(Tarrick Smith),
발레리아 던버트(Valeryia Dunbert), 웨너리(Whenery), and 렌 펜더가스트
(Wren Penderghast). Whenery's title is consistently 전쟁군주; Wren's Savant
rank remains separate.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Five People

Registered five people and reviewed 35 distinct source rows (26 corrections,
nine retained). Standardized the Canneroc medic, Tarrick Smith, Valeryia
Dunbert, Warlord Whenery, and Wren Penderghast using English-led identity
checks with aligned Japanese and Chinese support. The Warlord and Lady
Whenery appellations were kept distinct. See the dated report,
addendum, definitions, and exact source manifest.
TEXT
marker = "## D-21208: Two People And Snaketail River"
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
