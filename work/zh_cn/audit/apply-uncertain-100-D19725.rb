#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-100-D6227-D6308-20261012.jsonl"
expected = "770628912160604ed616702d8fccba11c9f384d6e5350dfb137564a19136ea74"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19725/locatexts_zh_cn.koalocatext_default.csv"
edits = [
  [19939, "라시어의 아르카나 대학", "라시어의 스콜리아 아르카나(Scholia Arcana)"],
  [19942, "하이페리온", "하이페리언"],
  [19969, "갤로우스 엔드", "갤로스 엔드"],
  [20007, "탐굴자의 기술", "탐구자들의 기술"],
  [20018, "에메어 마을", "에마이어 마을"],
  [20115, "콜로세", "콜로사이"],
  [20130, "여행자에게", "트래블러(Travelers)에게"],
  [20194, "베렌의 테스타먼트 창병", "벨렌의 테스타먼트 창병"]
].freeze

def records_by_id(bytes)
  result = {}
  id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      result[id] = record if id
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  result[id] = record if id
  result
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
{
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => path
}.each do |locale, source_path|
  source_rows = records_by_id(File.binread(source_path))
  entries.each do |entry|
    abort "#{locale} source-key mismatch at #{entry.fetch("id")}" unless
      text_cell(source_rows.fetch(entry.fetch("id"))) == entry.fetch(locale)
  end
end
before_rows = records_by_id(original)
updated = original.dup
edits.each do |id, old, replacement|
  row = before_rows.fetch(id)
  abort "source text mismatch at #{id}" unless row.scan(old.b).size == 1
  changed = row.sub(old.b, replacement.b)
  abort "row not unique at #{id}" unless updated.scan(row).size == 1
  updated.sub!(row, changed)
end
after_rows = records_by_id(updated)
abort "keys/order changed" unless before_rows.keys == after_rows.keys
abort "non-target rows changed" unless (before_rows.keys - edits.map(&:first)).all? do |id|
  before_rows[id] == after_rows[id]
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBFID_Linha;Texto\r\n".b)
endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings changed" unless endings.call(original) == endings.call(updated)
inverse = updated.dup
edits.each do |id, old, replacement|
  row = after_rows.fetch(id)
  abort "replacement ambiguous at #{id}" unless row.scan(replacement.b).size == 1
  inverse.sub!(row, row.sub(replacement.b, old.b))
end
abort "inverse mismatch" unless inverse == original
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != original
File.binwrite(backup, original) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == original
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)}"
puts "accepted_ids=#{edits.map(&:first).join(",")} reviewed=100 backup=#{backup}"
puts "four-locale exact/row-order/BOM/mixed-endings/non-target-bytes/inverse=OK"
