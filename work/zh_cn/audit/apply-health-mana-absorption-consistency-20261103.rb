#!/usr/bin/env ruby

require "csv"
require "json"

WORK_PATH = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
REPORT_PATH = "work/zh_cn/audit/health-mana-absorption-consistency-20261103.json"

EDITS = {
  "8171" => [
    "체력 흡수 공격의 피해량이 증가합니다.\n\n적중당 흡수 체력 +10",
    "생명력 흡수 공격의 피해량이 증가합니다.\n\n적중당 생명력 흡수량 +10"
  ],
  "35589" => [
    "체력 흡수 공격의 피해량이 증가합니다.\n\n타격당 체력 흡수 +20",
    "생명력 흡수 공격의 피해량이 증가합니다.\n\n적중당 생명력 흡수량 +20"
  ],
  "55951" => [
    "체력 흡수 공격의 피해가 증가합니다.\n\n명중당 체력 흡수 +15",
    "생명력 흡수 공격의 피해량이 증가합니다.\n\n적중당 생명력 흡수량 +15"
  ],
  "41433" => [
    "마나 흡수 공격의 피해가 증가합니다.\n\n타격당 흡수 마나 +15",
    "마나 흡수 공격의 피해량이 증가합니다.\n\n적중당 마나 흡수량 +15"
  ],
  "61555" => [
    "마나 흡수 공격의 피해가 증가합니다.\n\n적중당 마나 흡수 +20",
    "마나 흡수 공격의 피해량이 증가합니다.\n\n적중당 마나 흡수량 +20"
  ],
  "63306" => [
    "마나 흡수 공격의 피해량이 증가합니다.\n\n적중당 흡수하는 마나 +10",
    "마나 흡수 공격의 피해량이 증가합니다.\n\n적중당 마나 흡수량 +10"
  ]
}.freeze

def parse(bytes)
  CSV.parse(bytes.dup.force_encoding("UTF-8").sub(/\A\uFEFF/, "").gsub("\r\n", "\n"),
            headers: true, col_sep: ";", row_sep: "\n").reject { |row| row["ID_Linha"].nil? }
end

def load_texts(locale)
  path = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv"
  parse(File.binread(path)).to_h { |row| [row["ID_Linha"], row["Texto"]] }
end

original = File.binread(WORK_PATH)
rows = parse(original)
by_id = rows.to_h { |row| [row["ID_Linha"], row["Texto"]] }
references = %w[en_us ja_jp zh_cn].to_h { |locale| [locale, load_texts(locale)] }

EDITS.each do |id, (before, after)|
  abort "unexpected Korean source #{id}" unless [before, after].include?(by_id.fetch(id))
  english = references.fetch("en_us").fetch(id)
  japanese = references.fetch("ja_jp").fetch(id)
  chinese = references.fetch("zh_cn").fetch(id)
  resource = %w[8171 35589 55951].include?(id) ? "health" : "mana"
  stat = resource == "health" ? "Health Stolen" : "Mana Stolen"
  abort "English source mismatch #{id}" unless
    english.match?(/#{resource} absorption attacks\.\n\n\+\d+ #{stat} per Hit/i)
  abort "Japanese source mismatch #{id}" unless
    japanese.include?(resource == "health" ? "ライフ吸収攻撃" : "マナ吸収攻撃") &&
    japanese.match?(/\+\d+% 攻撃ヒット毎に/)
  abort "Chinese source mismatch #{id}" unless
    chinese.include?(resource == "health" ? "生命窃取攻击" : "法力窃取攻击") &&
    chinese.match?(/\+\d+\n?\z/)
end

updated = original.split(/(?=^\d+;)/n).map do |record|
  id = record[/\A(\d+);/n, 1]
  next record unless EDITS.key?(id)

  before, after = EDITS.fetch(id)
  next record if by_id.fetch(id) == after

  old_lines = before.split("\n", -1)
  new_lines = after.split("\n", -1)
  abort "line count changed #{id}" unless old_lines.length == new_lines.length
  old_lines.each_with_index do |line, index|
    replacement = new_lines.fetch(index)
    next if line == replacement
    pattern = Regexp.new(Regexp.escape(line.b))
    abort "text occurrence mismatch #{id}" unless record.scan(pattern).length == 1
    record.sub!(pattern, replacement.b)
  end
  record
end.join

after_rows = parse(updated)
after_by_id = after_rows.to_h { |row| [row["ID_Linha"], row["Texto"]] }
abort "row keys/order changed" unless rows.map { |row| row["ID_Linha"] } ==
                                      after_rows.map { |row| row["ID_Linha"] }
abort "BOM changed" unless original.byteslice(0, 3) == updated.b.byteslice(0, 3)
abort "line endings changed" unless original.scan(/\r\n|\n|\r/n) == updated.scan(/\r\n|\n|\r/n)
after_rows.each do |row|
  id = row["ID_Linha"]
  expected = EDITS.key?(id) ? EDITS.fetch(id).last : by_id.fetch(id)
  abort "unexpected text change #{id}" unless row["Texto"] == expected
end

report_rows = EDITS.map do |id, (before, after)|
  {
    id: id,
    before: before,
    after: after,
    en: references.fetch("en_us").fetch(id),
    ja: references.fetch("ja_jp").fetch(id),
    zh: references.fetch("zh_cn").fetch(id),
    note: "English and Chinese give a flat amount; Japanese alone adds a percent sign. Preserve the English/Chinese value."
  }
end

report = {
  date: "2026-11-03",
  standard: {
    "health absorption" => "생명력 흡수",
    "mana absorption" => "마나 흡수",
    "stolen per hit" => "적중당 {자원} 흡수량"
  },
  rows: report_rows
}

File.binwrite(WORK_PATH, updated)
File.write(REPORT_PATH, JSON.pretty_generate(report) + "\n")
puts "updated #{EDITS.length} rows; IDs, order, BOM, line endings, and line counts preserved"
