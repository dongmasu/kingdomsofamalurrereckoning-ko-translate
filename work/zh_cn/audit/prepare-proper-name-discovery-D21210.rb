#!/usr/bin/env ruby

require "json"
require_relative "apply-reviewed-proper-name-discovery"
require_relative "build-proper-name-occurrences"

m = ReviewedNameBatches
d = 21_210
audit = __dir__
ReviewedProperNameDiscovery.ensure_unused_batch!(d)

candidate_path = File.join(audit, "proper-name-variant-discovery-candidates-20261015.tsv")
candidate_table = m.table(candidate_path)
candidates = candidate_table.map(&:to_h)
["Waterhall Down", "Air Shrine"].each do |term|
  candidate = candidates.find { |row| row["english_candidate"] == term }
  raise "missing heuristic candidate #{term}" unless candidate
  raise "candidate already closed #{term}" unless
    candidate.fetch("status") == "heuristic-not-reviewed"
end

definition_values = [
  ["place:waterhall-down", "Waterhall Down", "place",
   "워터홀 다운(Waterhall Down)", "", "와터홀 다운",
   "D-#{d}|default:3683|default:5009|default:9856|default:31452|default:31700|default:34523|default:45212|default:47273|default:49165|default:60876",
   "confirmed",
   "English identifies the named location in Apotyre. Japanese commonly renders it as 滝つぼの洞窟 and Chinese as 水流大厅·下, both contextual localizations rather than competing English identities. The active Korean corpus most often uses 워터홀 다운; standardize all ten exact English occurrences to 워터홀 다운(Waterhall Down), preserving the surrounding cavern wording."],
  ["place:air-shrine", "Air Shrine", "place",
   "대기의 성소(Air Shrine)", "", "바람의 성소|공기의 성소|공기 신전|대기의 신전",
   "D-#{d}|base:2427:11|default:9253|default:19266|default:32499|default:33117|default:34244|default:34979|default:39096|default:39609|default:48365|default:51240|default:56176|default:8969",
   "confirmed",
   "English identifies the named elemental shrine in the Teeth of Naros. Japanese 大気の聖堂 and Chinese 空气神龛 corroborate the atmospheric Air reading rather than ordinary wind. The active Korean cells vary among 바람의 성소, 공기의 성소, 공기 신전, and 대기의 신전; standardize exact Air Shrine references to 대기의 성소(Air Shrine). The standalone base label and shrine-cavern component are included."],
  ["place:earth-shrine", "Earth Shrine", "place",
   "대지의 성소(Earth Shrine)", "", "대지 신전",
   "D-#{d}|base:3453:11|default:6679|default:8185|default:8969|default:22865|default:35717|default:37410|default:40244|default:49774|default:53001|default:54842|default:55505|default:56176|default:64142",
   "confirmed",
   "English identifies the named elemental shrine in the Teeth of Naros. Japanese 大地の聖堂 and Chinese 大地神龛 corroborate the earth reading. The active Korean cells use 대지의 성소 or 대지 신전; standardize exact Earth Shrine references to 대지의 성소(Earth Shrine). The standalone base label and shrine-cavern component are included."]
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
  "place:waterhall-down" => 10,
  "place:air-shrine" => 13,
  "place:earth-shrine" => 14
}
actual_counts = generated.group_by { |row| row.fetch("entity_key") }
  .transform_values(&:length)
raise "unexpected generated occurrence counts #{actual_counts.inspect}" unless
  actual_counts == expected_counts

normalize_air = lambda do |text|
  text.gsub(
    /(?:바람의 성소|공기의 성소|공기 신전|대기의 성소|대기의 신전)(?:\(Air Shrine\))?/,
    "대기의 성소(Air Shrine)"
  )
end
normalize_earth = lambda do |text|
  text.gsub(
    /(?:대지의 성소|대지 신전)(?:\(Earth Shrine\))?/,
    "대지의 성소(Earth Shrine)"
  )
end

rows_by_key = generated.group_by { |row| m.key(row) }
reviews = rows_by_key.keys.sort_by do |key|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key|
  source = inventory.fetch(key)
  entities = rows_by_key.fetch(key).map { |row| row.fetch("entity_key") }.uniq.sort
  old = source.fetch("work_text")
  new_text = old.dup

  if entities.include?("place:waterhall-down")
    new_text.gsub!(
      /(?:와터홀|워터홀) 다운(?:\(Waterhall Down\))?/,
      "워터홀 다운(Waterhall Down)"
    )
  end

  # ID 8969 refers to the two shrines jointly in three clauses. Keep those
  # paired references intact while also normalizing the separate names below.
  if key == ["default", "8969", ""]
    replacements = {
      "대지와 대기의 성소를 방문했었다" =>
        "대지와 대기의 성소들(Shrines of Earth and Air)을 방문했었다",
      "대지와 대기의 성소가 지닌 힘" =>
        "대지의 성소(Earth Shrine)와 대기의 성소(Air Shrine)가 지닌 힘",
      "대지와 대기의 성소를 찾아 나섰다" =>
        "대기와 대지의 성소들(Air and Earth Shrines)을 찾아 나섰다"
    }
    replacements.each do |from, to|
      raise "expected one joint-shrine phrase #{from.inspect}" unless
        new_text.scan(from).length == 1
      new_text.sub!(from, to)
    end
  else
    new_text = normalize_air.call(new_text) if entities.include?("place:air-shrine")
    new_text = normalize_earth.call(new_text) if entities.include?("place:earth-shrine")
  end

  if entities.include?("place:waterhall-down")
    raise "unpaired Waterhall Down at #{key.inspect}" if
      new_text.match?(/(?:와터홀|워터홀) 다운(?!\(Waterhall Down\))/)
  end
  if entities.include?("place:air-shrine") && key != ["default", "8969", ""]
    raise "unpaired Air Shrine variant at #{key.inspect}" if
      new_text.match?(/(?:바람의 성소|공기의 성소|공기 신전|대기의 신전)/)
  end
  if entities.include?("place:earth-shrine") && key != ["default", "8969", ""]
    raise "unpaired Earth Shrine variant at #{key.inspect}" if
      new_text.match?(/대지 신전/)
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
    "evidence" => "D-#{d} English-led location-name review. Exact aligned English, Japanese, Chinese, and Korean cells are recorded here. English establishes Waterhall Down and the two elemental shrines as named places; Japanese and Chinese support pronunciation/elemental context. Korean candidates were checked across the active corpus, and the non-exhaustive official Korean manual has no direct entry for these locations. Preserve dialogue, objectives, particles, markup, and unrelated proper names.",
    "english" => JSON.parse(source.fetch("en_texts_json")).compact.join("\n"),
    "japanese" => JSON.parse(source.fetch("ja_texts_json")).compact.join("\n---\n"),
    "chinese" => source.fetch("zh_text"),
    "entity_dispositions_json" => JSON.generate(dispositions)
  }
end
raise "expected 35 distinct source rows" unless reviews.length == 35

m.write_table(definition_path, definition_headers, definitions)
m.write_table(review_path, m::HEADERS.take(12), reviews)
ReviewedProperNameDiscovery.run([definition_path, review_path, d.to_s])

review_note = <<~TEXT

## D-#{d}: Waterhall Down And The Elemental Shrines

Registered Waterhall Down, Air Shrine, and Earth Shrine. Reviewed all 35
distinct source row keys across the three names (37 entity matches, with
overlapping rows counted once per CSV key); canonical labels are 워터홀 다운
(Waterhall Down), 대기의 성소(Air Shrine), and 대지의 성소(Earth Shrine).
Japanese and Chinese corroborate the location and elemental readings. Default
8969's jointly named shrine references were kept as complete bilingual
phrases; existing decisions for unrelated entities on overlapping rows were
not reopened or recounted. Air/Earth Shrine Caverns remain represented here
by their shrine components, not registered as separate cavern entities.
TEXT
%W[
  named-scope-review-D#{d}-#{m::RUN_DATE_COMPACT}.md
  named-scope-edit-addendum-D#{d}-#{m::RUN_DATE_COMPACT}.md
].each do |filename|
  File.open(File.join(audit, filename), "a") { |file| file.write(review_note) }
end

summary = <<~TEXT

## D-#{d}: Waterhall Down And The Elemental Shrines

Registered Waterhall Down, Air Shrine, and Earth Shrine; reviewed 35 distinct
source row keys (entity overlaps counted once) and standardized their Korean
labels. Default 8969's paired shrine references were kept bilingual.
Air/Earth Shrine Caverns are not registered as separate places in this batch.
See the dated report, addendum, definitions, and exact source manifest.
TEXT
marker = "## D-21209: Five People"
%w[README.md decision-register-20261009.md].each do |filename|
  path = File.join(audit, filename)
  text = File.read(path)
  raise "missing insertion marker in #{filename}" unless text.include?(marker)
  raise "D-#{d} entry already exists in #{filename}" if text.include?("## D-#{d}:")
  text.sub!(marker, summary + "\n" + marker)
  File.write(path, text)
end

puts "D-#{d}: reviewed #{reviews.length} distinct source rows and " \
     "#{generated.length} entity matches; " \
     "#{reviews.count { |row| row['old'] != row['new'] }} corrections, " \
     "#{reviews.count { |row| row['old'] == row['new'] }} retained."
