#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-200-D5108-D5506-20261012.jsonl"
expected_sha = "56e3ba6ac74d5b21700e8b28076aa6e5a96e877c270ce4be6e8c96b3deefe2af"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19654/locatexts_zh_cn.koalocatext_default.csv"

# [old fragment, replacement, expected occurrence count]
edits = {
  16252 => [["마법사 기사 아니라", "마녀 기사 아니라", 1]],
  16262 => [["완벽한 미타란 결집 손잡이", "흠 없는 미타란 결집 손잡이", 1]],
  16400 => [["아가씨", "친구", 1]],
  16523 => [["완벽한 미타란 신성 리벳", "흠 없는 미타란 신성 리벳", 1]],
  16575 => [["맹세검", "맹세의 칼날", 1]],
  16697 => [["숨은 물체 감지 기술", "숨겨진 물건 찾기 기술", 1]],
  16818 => [["장로들", "엘더스트(The Eldest)", 1]],
  16848 => [["여행자들도", "트래블러들도", 1]],
  16873 => [["비탄과 먼지의 여왕", "비탄과 먼지의 여인", 1]],
  17003 => [["콜로세 농민", "콜로사이 농민", 1]],
  17014 => [["완벽한 미타란 서리 자루", "흠 없는 미타란 서리 자루", 1]],
  17024 => [["여행자를 만났다", "트래블러(Traveler)를 만났다", 1]],
  17028 => [["불려온 자", "부름받은 자", 2]],
  17086 => [["불려온 자", "부름받은 자", 1]],
  17189 => [["그가 집을 떠난 이유", "그가 비탄의 집을 떠난 이유", 1]],
  17248 => [["장어 꽃잎(Eel Petal)", "일 페탈(Eel Petal)", 1]],
  17295 => [["해제 능력", "디스펠 능력", 1]],
  17356 => [["매일 병이 낫지 않으니", "그들은 여전히 앓고 있어", 1]]
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
  seen = changes.to_h do |id, pairs|
    [id, Array.new(pairs.size, 0)]
  end
  current_id = nil
  result = bytes.each_line.map do |line|
    current_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i || current_id
    next line unless changes.key?(current_id)
    changes.fetch(current_id).each_with_index do |(old, replacement, expected_count), index|
      count = line.scan(old).size
      next if count.zero?
      abort "unexpected occurrence count at #{current_id}: #{count}" unless count == expected_count
      seen[current_id][index] += count
      line = line.gsub(old, replacement)
    end
    line
  end.join
  seen.each do |id, counts|
    expected = changes.fetch(id).map(&:last)
    abort "missing edit at #{id}: #{counts.inspect}" unless counts == expected
  end
  result
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
abort "inverse reconstruction mismatch" unless transform(updated, inverse) == source
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
