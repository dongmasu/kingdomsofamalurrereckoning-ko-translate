#!/usr/bin/env ruby

require "csv"
require "json"

ROOT = File.expand_path("../../..", __dir__)
REPORT = File.join(__dir__, "clergy-title-consistency-20261103.json")
PAIRINGS = {
  "Father Etair" => [
    "에테어", "Etair", "신부",
    %w[9488 9828 13702 14157 15157 17593 21289 25680 28964 30886 31210
       34405 34907 37887 40271 41196 41369 41489 43473 45193 45579 47890
       48417 57043 57122 59619 62752]
  ],
  "Father Dynwel" => [
    "딘웰", "Dynwel", "신부",
    %w[4990 12769 15547 16582 18186 19448 25868 30884 41033 42070 44623
       44854 45181 59782]
  ],
  "Brother Wulf" => [
    "울프", "Wulf", "(?:수사|형제)",
    %w[25468 41367 41489 45193 48417 49413]
  ],
  "Brother Geoff" => ["제프", "Geoff", "수사", %w[49524]]
}.freeze

EDITS = {
  "1533" => [["사제는", "신부는"], ["사제를", "신부를"]],
  "7483" => [["형제 몇 명을", "수사 몇 명을"]],
  "9488" => [["형제들 가운데", "수사들 가운데"]],
  "9805" => [[
    "미사루 교단의 형제들이 모두 배우는 미사루(Mitharu)의 필체로 쓰여 있다.",
    "미사루 교단(Order of Mitharu)의 모든 수사가 배우는 미사루(Mitharu) 문자로 쓰여 있다."
  ]],
  "16993" => [
    ["옥티엔 수사(Brother Octienne)라고?", "옥티엔 형제(Brother Octienne)라고?"],
    ["무슨 혐의로 왔어?", "고발 내용은 뭐야?"]
  ],
  "19302" => [["리리아(Lyria)의 형제자매에게만", "리리아(Lyria)의 수사와 수녀에게만"]],
  "24681" => [["선교원 형제 중 한 사람이야.", "선교원 수사 중 한 사람이야."]],
  "25468" => [[
    "온종일 수정만 바라보거나 휘파람을 불며 그것을 연주하고, 그러면 소용돌이치는 붉은 표면이 번쩍인다.",
    "온종일 수정만 바라보거나 수정을 향해 피리를 불어 소용돌이치는 붉은 표면을 번쩍이게 한다."
  ]],
  "30034" => [["확인해 보겠습니다, 형제님.", "확인해 보겠습니다, 수사님."]],
  "30452" => [["형제 수도자들에게", "수사들에게"]],
  "33567" => [["눅 수사입니다.", "눅 수사(Brother Nuk)입니다."]],
  "34405" => [[
    "형제들과 나는 권위회의 명령에 따라 에테어 신부(Father Etair)의 마지막 의식을 준비하고 있어.",
    "수사들과 나는 권능자(Authority)의 뜻에 따라 에테어 신부(Father Etair)의 장례 의식을 준비하고 있어."
  ]],
  "37374" => [["선교회의 형제들이", "선교회의 수사들이"]],
  "37543" => [["마시 신부가", "마시 신부(Father Marsh)가"]],
  "39687" => [["리리아(Lyria)의 형제자매라", "리리아(Lyria)의 수녀와 수사라"]],
  "47103" => [["형제의 죽음은", "동료 수사의 죽음은"]],
  "47881" => [["형제여, 무슨 생각을 하고 있나?", "수사님, 무슨 생각을 하고 계신가요?"]],
  "47890" => [["에테어라면", "에테어(Etair)라면"]],
  "49313" => [["형제들 사이로", "수사들 사이로"]],
  "53444" => [["틸(Til)의 분실된 책을", "틸 수사(Brother Til)의 분실된 책을"]],
  "54922" => [["형제들도 날", "수사들도 날"]],
  "63356" => [[
    "다른 형제들이 질문하게 둘 순 없어. 다시 한번 고맙다.",
    "다른 수사들이 캐묻게 해선 안 되거든. 다시 한번 고마워."
  ]]
}.freeze

HELD = {
  "24227" => "Bare Brother; no speaker or clergy-specific support.",
  "45674" => "Duplicate bare Brother line; no speaker or clergy-specific support.",
  "33088" => "A deceased brother is mentioned without a named monk or religious institution.",
  "20762" => "Bawdy book: prayer alone does not establish whether Aedwald is a monk or a sibling.",
  "59722" => "Religious address to dear brothers may include lay believers, not only monks.",
  "344" => "Band of Brother Monks is an item/title scope, not a personal honorific.",
  "59863" => "Band of Brother Monks is an item/title scope, not a personal honorific."
}.freeze

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n").reject { |row| row["ID_Linha"].nil? }
end

def load_table(locale, resource)
  path = if locale == "ko"
           File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv")
         else
           File.join(ROOT, "src/csv/#{locale}/locatexts_#{locale}.koalocatext_#{resource}.csv")
         end
  parse(File.binread(path))
end

def key(row)
  [row["ID_Linha"], row["Tipo_Variante"].to_s]
end

def named_titles(text)
  titles = text.scan(/\b(?:Brother|Father) [A-Z][a-z]+\b/)
  titles << "Brother Til" if text.match?(/\bBrother['‘’]s Til\b/)
  titles.reject { |title| ["Brother Monks", "Brother Brigands"].include?(title) }.uniq
end

def replace_once(record, before, after, id)
  return record if record.include?(after.b)

  pattern = Regexp.new(Regexp.escape(before.b))
  abort "expected exactly one old text at default:#{id}: #{before}" unless record.scan(pattern).length == 1
  record.sub(pattern, after.b)
end

path = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv")
original = File.binread(path)
rows = parse(original)
before_by_id = rows.map { |row| [row["ID_Linha"], row["Texto"]] }.to_h
references = %w[en_us ja_jp zh_cn].map do |locale|
  [locale, load_table(locale, "default").map { |row| [row["ID_Linha"], row["Texto"]] }.to_h]
end.to_h
target_ids = (PAIRINGS.values.flat_map(&:last) + EDITS.keys).uniq
saved_report = JSON.parse(File.read(REPORT)) if File.exist?(REPORT)
downstream_reviews = if File.exist?(File.join(__dir__, "mission-site-consistency-20261103.json"))
  JSON.parse(File.read(File.join(__dir__, "mission-site-consistency-20261103.json")))
    .fetch("site_reviews", []).map { |row| [[row["resource"], row["id"]], row] }.to_h
else
  {}
end
downstream_applied_ids = (saved_report ? saved_report.fetch("changed_rows") : []).each_with_object([]) do |row, ids|
  id = row.fetch("id")
  mission = downstream_reviews[["default", id]]
  if mission && mission.fetch("before") == row.fetch("after") &&
     before_by_id.fetch(id) == mission.fetch("after")
    ids << id
  end
end

updated = original.split(/(?=^\d+;)/n).map do |record|
  id = record[/\A(\d+);/n, 1]
  next record unless target_ids.include?(id)
  next record if downstream_applied_ids.include?(id)

  PAIRINGS.each do |english, (korean, short, role, ids)|
    next unless ids.include?(id)
    abort "English title mismatch at #{id}" unless references.fetch("en_us").fetch(id).include?(english)
    pattern = Regexp.new("#{Regexp.escape(korean)}\\(#{short}\\) (#{role})(님)?".b)
    if record.match?(pattern)
      record = record.sub(pattern) do
        honorific = Regexp.last_match(2).to_s.force_encoding("UTF-8")
        "#{korean} #{english.start_with?('Brother') ? '수사' : '신부'}#{honorific}(#{english})".b
      end
    else
      abort "missing reviewed title at #{id}" unless record.include?("(#{english})".b)
    end
  end
  EDITS.fetch(id, []).each { |before, after| record = replace_once(record, before, after, id) }
  record
end.join

after_rows = parse(updated)
after_by_id = after_rows.map { |row| [row["ID_Linha"], row["Texto"]] }.to_h
abort "headers/IDs/variants/order changed" unless
  rows.map { |row| row.to_h.reject { |field, _| field == "Texto" } } ==
    after_rows.map { |row| row.to_h.reject { |field, _| field == "Texto" } }
abort "BOM changed" unless original.byteslice(0, 3) == updated.byteslice(0, 3)
abort "line endings changed" unless original.scan(/\r\n|\n|\r/n) == updated.scan(/\r\n|\n|\r/n)
changed_ids = before_by_id.keys.select { |id| before_by_id.fetch(id) != after_by_id.fetch(id) }
abort "unreviewed ID changed" unless (changed_ids - target_ids).empty?
abort "newlines changed within a text field" unless target_ids.all? do |id|
  before_by_id.fetch(id).count("\n") == after_by_id.fetch(id).count("\n")
end

inventory = %w[affix base default].flat_map do |resource|
  english = load_table("en_us", resource)
  ko = load_table("ko", resource).map { |row| [key(row), row["Texto"]] }.to_h
  locales = %w[ja_jp zh_cn].map do |locale|
    [locale, load_table(locale, resource).map { |row| [key(row), row["Texto"]] }.to_h]
  end.to_h
  english.map do |row|
    titles = named_titles(row["Texto"].to_s)
    next if titles.empty?

    translated = resource == "default" ? after_by_id.fetch(row["ID_Linha"]) : ko.fetch(key(row))
    titles.each do |title|
      abort "unpaired title #{resource}:#{key(row)}: #{title}" unless translated.include?(title)
      role = title == "Brother Octienne" ? "형제" : title.start_with?("Brother") ? "수사" : "신부"
      abort "wrong Korean role #{resource}:#{key(row)}: #{title}" unless translated.include?(role)
    end
    {
      resource: resource, id: row["ID_Linha"], variant: row["Tipo_Variante"].to_s,
      titles: titles, en: row["Texto"], ja: locales.fetch("ja_jp").fetch(key(row)),
      zh: locales.fetch("zh_cn").fetch(key(row)), ko: translated
    }
  end.compact
end
abort "named title inventory changed unexpectedly" unless inventory.length == 228

report = {
  date: "2026-11-03",
  standard: "이름 수사(Brother Name) / 이름 신부(Father Name); keep 님 in Korean where present.",
  method: "English ID/variant inventory first; Japanese and Chinese are supporting evidence. No reference CSV is edited.",
  exceptions: [
    "Brother Octienne is addressed as a fellow Templar: 형제, not a monk's 수사.",
    "Father Udo and Father Marsh remain as the English source names/titles; do not infer aliases from Japanese.",
    "Brother's Til's at default:53444 is an English typo for Brother Til's, corroborated by the matching quest.",
    "At default:19302 only clergy in the temple change; the later mortal brothers/sisters remain figurative.",
    "Whistle at default:25468 is Wulf's instrument, also called a flute at default:21596."
  ],
  held: HELD,
  changed_rows: target_ids.sort_by(&:to_i).map do |id|
    { id: id, before: before_by_id.fetch(id), after: after_by_id.fetch(id),
      en: references.fetch("en_us").fetch(id), ja: references.fetch("ja_jp").fetch(id),
      zh: references.fetch("zh_cn").fetch(id) }
  end,
  named_title_inventory: inventory
}

if File.exist?(REPORT)
  saved_report.fetch("changed_rows").each do |row|
    current = after_by_id.fetch(row.fetch("id"))
    next if current == row.fetch("after")

    mission = downstream_reviews[["default", row.fetch("id")]]
    abort "saved review is stale at #{row.fetch('id')}" unless
      mission && mission.fetch("before") == row.fetch("after") &&
      mission.fetch("after") == current
  end
else
  File.write(REPORT, JSON.pretty_generate(report) + "\n")
end
File.binwrite(path, updated) unless updated == original
puts "PASS: #{inventory.length} named-title rows checked; #{changed_ids.length} changed rows; IDs, variants, order, BOM and line endings preserved."
