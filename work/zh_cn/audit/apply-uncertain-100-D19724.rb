#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-100-D6156-D6227-20261012.jsonl"
expected = "c3d08643609571eacaf3fc04e413500f37b21d9a9c004102a3441b702608c363"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19724/locatexts_zh_cn.koalocatext_default.csv"

# [ID, old text, replacement]
edits = [
  [19544, "흠 없는 미사란(Mitharan) 처형자의 지렛점",
    "흠 없는 미타란(Mitharan) 처형자의 지렛목"],
  [19560, "서약검(Oathblade)이시여!", "맹세의 칼날(Oathblade)이시여!"],
  [19635, "로살파르 마법사 오파님은 Scholia Arcana 수련생 시절",
    "료스알브 마법사 오파님은 스콜리아 아르카나(Scholia Arcana) 수련생 시절"],
  [19641, "선택받은 자여.", "부름받은 자여."],
  [19763, "하이페리온의 비극", "하이페리언의 비극"],
  [19797, "근위병 오르시니안 페이지", "프레토리안 오르시니안 페이지"],
  [19875, "여행자단의 맏이", "트래블러(Travelers) 집안의 맏이"],
  [19891, "하이페리온의 봉인을 푸는", "하이페리언의 봉인을 푸는"]
].freeze

def records_by_id(bytes)
  records = {}
  id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      records[id] = record if id
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  records[id] = record if id
  records
end

def text_cell(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"),
    col_sep: ";", row_sep: :auto).fetch(1)
rescue CSV::MalformedCSVError
  raw = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  raw.force_encoding("UTF-8")
end

original = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(original) == expected
entries = File.readlines(snapshot).map { |line| JSON.parse(line) }
abort "snapshot count/IDs invalid" unless entries.size == 100 &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == 100

source_paths = {
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => path
}
source_paths.each do |locale, source_path|
  row_records = records_by_id(File.binread(source_path))
  entries.each do |entry|
    record = row_records.fetch(entry.fetch("id"))
    abort "#{locale} source-key mismatch at #{entry.fetch("id")}" unless
      text_cell(record) == entry.fetch(locale)
  end
end

before_rows = records_by_id(original)
updated = original.dup
edits.each do |id, old, replacement|
  row = before_rows.fetch(id)
  abort "source text mismatch at #{id}" unless text_cell(row).include?(old)
  changed = row.sub(old.b, replacement.b)
  abort "replacement count mismatch at #{id}" if changed == row || row.scan(old.b).size != 1
  abort "row is not unique at #{id}" unless updated.scan(row).size == 1
  updated.sub!(row, changed)
end

after_rows = records_by_id(updated)
abort "keys or row order changed" unless before_rows.keys == after_rows.keys
abort "non-target rows changed" unless (before_rows.keys - edits.map(&:first)).all? do |id|
  before_rows[id] == after_rows[id]
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBFID_Linha;Texto\r\n".b)
shape = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings changed" unless shape.call(original) == shape.call(updated)

inverse = updated.dup
edits.each do |id, old, replacement|
  changed_row = after_rows.fetch(id)
  abort "replacement is ambiguous at #{id}" unless changed_row.scan(replacement.b).size == 1
  inverse.sub!(changed_row, changed_row.sub(replacement.b, old.b))
end
abort "inverse reconstruction failed" unless inverse == original

FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != original
File.binwrite(backup, original) unless File.exist?(backup)
abort "backup is not byte-identical" unless File.binread(backup) == original
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)}"
puts "accepted_ids=#{edits.map(&:first).join(",")} reviewed=100 backup=#{backup}"
puts "four-locale exact/row-order/BOM/mixed-endings/non-target-bytes/inverse=OK"
