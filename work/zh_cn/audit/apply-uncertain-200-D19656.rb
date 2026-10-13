#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-200-D5966-D6460-20261012.jsonl"
expected_sha = "a6f4c329ec4a7ad3757f96c6033f4f04ea6fd6606595e6eeb1d91945448d23ee"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19656/locatexts_zh_cn.koalocatext_default.csv"

# [old fragment, replacement, expected occurrence count]
edits = {
  18902 => [["근위대원 페이지", "프레토리안 페이지", 1]],
  18921 => [["콜로세족", "콜로사이족", 3],
            ["불려온 자", "부름받은 자", 5],
            ["머리장식", "서클릿", 5],
            ["페트릭스", "프테릭스", 2]],
  18956 => [["불려온 자", "부름받은 자", 1]],
  19071 => [["더 높은 눈이 나온 사람이 이기는 거야.",
             "두 주사위의 눈 합이 더 높은 사람이 이기는 거야.", 1]],
  19219 => [["서약검", "맹세의 칼날", 1]],
  19234 => [["비탄의 집", "비탄의 힘", 1]],
  19266 => [["불려온 자", "부름받은 자", 1]],
  19333 => [["아르카나 대학", "스콜리아 아르카나(Scholia Arcana)", 1]],
  19510 => [["그 힘을 주겠다고", "선물을 주겠다고", 1]],
  19711 => [["홀을 장착하면", "셉터를 장착하면", 1]],
  19714 => [["요툰 전쟁 사제", "에틴 전쟁 사제", 1]],
  20038 => [["여보", "친구", 1]],
  20512 => [["전쟁맹세단의 서약검 키르비(Kirby)",
             "워스원(Warsworn)의 맹세의 칼날(Oathblade) 키르비(Kirby)", 1]],
  20622 => [["틴더트윅(Tindertwig)", "틴더트위그(Tindertwig)", 1]],
  20813 => [["발라드 가문", "발라드의 집", 1]],
  20820 => [["여행자들은", "트래블러들은", 1]],
  20824 => [["콜로세는", "콜로사이족은", 1]]
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

  prefix + records.map do |row_id, row|
    next row unless changes.key?(row_id)
    changes.fetch(row_id).each do |old, replacement, expected_count|
      count = row.scan(old).size
      abort "unexpected occurrence count at #{row_id}: #{count}" unless count == expected_count
      row = row.gsub(old, replacement)
    end
    row
  end.join
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
abort "inverse reconstruction failed" unless transform(updated, inverse) == source
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
