#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-100-D19727-20261012.jsonl"
expected = "189c79bdf0302e2ddb0a325276f9bdcd219158566a149069239a96bc6aaca725"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-92-D19727/locatexts_zh_cn.koalocatext_default.csv"
previously_closed = [26354, 26367, 26369, 26371, 26372, 26381, 26391, 26393].freeze
edits = [
  [26422, "교차점", "크로싱(Crossing)"],
  [28556, "맹세의 방패들", "서약방패병들"],
  [28730, "브레이코르", "브래코르"],
  [35253, "시드헤", "시드(Sidhe)"],
  [35265, "여행자", "트래블러(Travelers)"],
  [35290, "완벽한", "흠 없는"],
  [35379, "세이블의 서신들을 찾았다.", "세이블의 서신(Missives of Sable)을 찾았다."],
  [35480, "워스워른", "워스원(Warsworn)"],
  [35652, "오드윅과 이드릭, 그리고 우리 임무지마다 미타루의 특별한 제단이 하나씩 있어.",
   "오드윅의 선교원과 이드릭의 선교원, 그리고 우리 선교원마다 미사루를 모시는 특별한 제단이 하나씩 있어."],
  [35717, "하이페리안의 봉인을 풀고 아노카토스를 막을 방법이 나로스의 송곳니에 있는 두 성소",
   "하이페리언의 봉인을 풀고 아노카토스를 막을 방법이 나로스의 이빨에 있는 두 성소"]
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
open_entries = entries.reject { |entry| previously_closed.include?(entry.fetch("id")) }
abort "open manifest mismatch" unless open_entries.size == 92
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
puts "accepted_ids=#{edits.map(&:first).join(",")} reviewed=#{open_entries.size} backup=#{backup}"
puts "four-locale exact/row-order/BOM/mixed-endings/non-target-bytes/inverse=OK"
