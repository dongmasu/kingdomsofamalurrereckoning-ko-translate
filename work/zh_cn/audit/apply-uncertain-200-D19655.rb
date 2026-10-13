#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-200-D5507-D5965-20261012.jsonl"
expected_sha = "e6bddf41b83aa8533948eafec2dde2c2f88de7054f2ba5f2e0d0579b64e58348"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19655/locatexts_zh_cn.koalocatext_default.csv"

# [old fragment, replacement, expected occurrence count]
edits = {
  17398 => [["콜로세 선교사", "콜로사이 선교사", 1]],
  17446 => [["기묘함", "홀수", 1]],
  17515 => [["비탄의 집", "비탄의 힘", 1]],
  17517 => [["콜로세", "콜로사이", 2], ["불려온 자", "부름받은 자", 2]],
  17651 => [["완벽한 미사란", "흠 없는 미타란", 1]],
  17654 => [["아르카나 대학(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)", 1]],
  17745 => [["콜로세(Kollossae)", "콜로사이(Kollossae)", 1]],
  17781 => [["암호(Cipher)", "사이퍼(Cipher)", 1],
            ["불려온 자", "부름받은 자", 3],
            ["하이페리언", "하이페리온", 4],
            ["콜로세", "콜로사이", 3]],
  17847 => [["서약검(Oathblade)", "맹세의 칼날(Oathblade)", 1]],
  17875 => [["콜로세(Kollossae)", "콜로사이(Kollossae)", 1]],
  18093 => [["탐굴꾼들(Delvers)", "탐구자들(Delvers)", 1]],
  18145 => [["불려온 자", "부름받은 자", 1]],
  18151 => [["콜로세(Kollossae)", "콜로사이(Kollossae)", 1]],
  18347 => [["현자 에이선 엥거(Savant Aethan Engar)",
             "사반트 에이선 엥가르(Savant Aethan Engar)", 1]],
  18493 => [["가장 오래된 자(The Eldest)", "엘더스트(The Eldest)", 1]],
  18589 => [["홀(Sceptre)", "셉터(Sceptre)", 1]],
  18591 => [["아르카나 대학", "스콜리아 아르카나", 2],
            ["현자(Savant)", "사반트(Savant)", 1]],
  18611 => [["동료 현자 테오넨(Theonen)", "동료 사반트 테오넨(Theonen)", 1]],
  18787 => [["아르카나 대학", "스콜리아 아르카나", 1]],
  18789 => [["여행자단", "트래블러들", 1]],
  18798 => [["아르카나 대학", "스콜리아 아르카나", 1]]
}.transform_values do |pairs|
  pairs.map { |old, replacement, count| [old.b, replacement.b, count] }
end

def text_cell(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"),
    col_sep: ";", row_sep: :auto).fetch(1)
rescue CSV::MalformedCSVError
  raw = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  raw.force_encoding("UTF-8")
end

def records_by_id(bytes)
  records = {}
  current_id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      records[current_id] = record if current_id
      current_id = row_id
      record = line.dup
    elsif current_id
      record << line
    end
  end
  records[current_id] = record if current_id
  records
end

def transform(bytes, changes)
  records = []
  prefix = +"".b
  current_id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      records << [current_id, record] if current_id
      current_id = row_id
      record = line.dup
    elsif current_id
      record << line
    else
      prefix << line
    end
  end
  records << [current_id, record] if current_id

  transformed_records = records.map do |row_id, row|
    next row unless changes.key?(row_id)
    changes.fetch(row_id).each do |old, replacement, expected_count|
      count = row.scan(old).size
      abort "unexpected occurrence count at #{row_id}: #{count}" unless count == expected_count
      row = row.gsub(old, replacement)
    end
    row
  end.join
  prefix + transformed_records
end

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected_sha
entries = File.foreach(snapshot).map { |line| JSON.parse(line) }
abort "snapshot is not 200 distinct rows" unless entries.size == 200 &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == 200
abort "edit outside snapshot" unless (edits.keys - entries.map { |entry| entry.fetch("id") }).empty?

source_paths = {
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => path
}
source_paths.each do |locale, source_path|
  row_records = records_by_id(File.binread(source_path))
  mismatches = entries.reject do |entry|
    record = row_records[entry.fetch("id")]
    record && text_cell(record) == entry.fetch(locale)
  end
  abort "#{locale} source-key mismatch: #{mismatches.first&.fetch("id")}" unless mismatches.empty?
end

FileUtils.mkdir_p(File.dirname(backup))
if File.exist?(backup)
  abort "existing backup differs" unless File.binread(backup) == source
else
  File.binwrite(backup, source)
end
abort "backup is not byte-identical" unless File.binread(backup) == source

updated = transform(source, edits)
inverse = edits.transform_values do |pairs|
  pairs.map { |old, replacement, count| [replacement, old, count] }
end
restored = transform(updated, inverse)
unless restored == source
  original_records = records_by_id(source)
  restored_records = records_by_id(restored)
  mismatch = original_records.keys.find do |id|
    original_records.fetch(id) != restored_records.fetch(id)
  end
  first_byte = (0...[source.bytesize, restored.bytesize].min).find do |index|
    source.getbyte(index) != restored.getbyte(index)
  end
  abort "inverse reconstruction mismatch at #{mismatch}; keys=#{original_records.size}/#{restored_records.size}; bytes=#{source.bytesize}/#{restored.bytesize}; first_byte=#{first_byte}"
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)

shape = lambda do |bytes|
  [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size,
   records_by_id(bytes).keys]
end
abort "line endings, row order, or keys changed" unless shape.call(source) == shape.call(updated)

before_rows = records_by_id(source)
after_rows = records_by_id(updated)
entries_by_id = entries.to_h { |entry| [entry.fetch("id"), entry] }
edits.each_key do |id|
  abort "snapshot cell mismatch at #{id}" unless text_cell(before_rows.fetch(id)) == entries_by_id.fetch(id).fetch("ko")
  expected_record = transform(before_rows.fetch(id), { id => edits.fetch(id) })
  abort "unexpected non-Texto change at #{id}" unless expected_record == after_rows.fetch(id)
end
(before_rows.keys - edits.keys).each do |id|
  abort "unapproved row changed at #{id}" unless before_rows.fetch(id) == after_rows.fetch(id)
end

File.binwrite(path, updated)
puts "accepted=#{edits.size} checked=200 backup=#{backup}"
puts "pre=#{expected_sha} post=#{Digest::SHA256.hexdigest(updated)}"
puts "en/ja/zh/ko exact=200 each; inverse/BOM/mixed-endings/order/keys/unapproved-bytes=OK"
