#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19653/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "48c602334e9bec5320d37886362d5cc9fcf707ccd37eac82954d8b4a83c050b9"
snapshot = "work/zh_cn/audit/uncertain-200-D4747-D5107-20261012.jsonl"
edits = {
  15585 => [["콜로세", "콜로사이"]],
  15590 => [["완벽한 미사란 확장 안감",
             "흠 없는 미타란 확장 안감"]],
  15671 => [["마스터 미타루 면역 문자열",
             "마스터 미타란 면역 실"]],
  15713 => [["발라드 가문", "발라드의 집"]],
  15739 => [["콜로세(Kollossae)", "콜로사이(Kollossae)"]],
  15774 => [["여행자(Traveler)의 웃음마저",
             "트래블러(Traveler)의 웃음마저"]],
  15789 => [["초대받은 자(The Beckoned)",
             "부름받은 자(The Beckoned)"]],
  15930 => [["탐험가들", "탐구자들"]],
  15950 => [["미타란 프리즘미어 미트",
             "미타란 프리즘미어 장갑"]],
  15951 => [["여행자(Traveler)는", "트래블러(Travelers)는"]],
  15994 => [["우리 가문의 탐험가들(Delvers)",
             "우리 가문의 탐구자들(Delvers)"]],
  16200 => [["갤로우스 엔드(Gallows End)",
             "갤로스 엔드(Gallows End)"]],
  16242 => [["완벽한 미타란 비전 구속구",
             "흠 없는 미타란 비전 구속구"]]
}.transform_values { |pairs| pairs.map { |old, new_text| [old.b, new_text.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected_sha
abort "backup differs" unless File.binread(backup) == source
entries = File.foreach(snapshot).map { |line| JSON.parse(line) }
abort "snapshot not 200 distinct keys" unless entries.size == 200 &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == 200
indexed = entries.to_h { |entry| [entry.fetch("id"), entry] }
abort "unlisted edit" unless (edits.keys - indexed.keys).empty?

def transform(bytes, changes)
  seen = changes.to_h { |id, pairs| [id, Array.new(pairs.size, 0)] }
  id = nil
  data = bytes.lines.map do |line|
    id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    changes.fetch(id).each_with_index do |(old, new_text), index|
      count = line.scan(old).size
      abort "duplicate fragment at #{id}" if count > 1
      next if count.zero?
      seen[id][index] += count
      line = line.sub(old, new_text)
    end
    line
  end.join
  seen.each do |row_id, counts|
    abort "missing or repeated change #{row_id}: #{counts.inspect}" unless
      counts.all? { |count| count == 1 }
  end
  data
end

updated = transform(source, edits)
inverse = edits.transform_values { |pairs| pairs.map { |old, new_text| [new_text, old] } }
abort "inverse mismatch" unless transform(updated, inverse) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
shape = lambda do |bytes|
  [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size,
   bytes.lines.map { |line| line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1] }.compact]
end
abort "line endings or order changed" unless shape.call(source) == shape.call(updated)

edits.each do |id, pairs|
  record = source[/^(?:\xEF\xBB\xBF)?#{id};.*?(?=^(?:\xEF\xBB\xBF)?\d+;|\z)/nm]
  abort "missing row #{id}" unless record
  old_text = indexed.fetch(id).fetch("ko").b
  abort "snapshot Korean cell differs at #{id}" unless record.include?(old_text)
  expected_record = record.dup
  pairs.each do |old, new_text|
    abort "absent fragment at #{id}" unless expected_record.scan(old).size == 1
    expected_record = expected_record.sub(old, new_text)
  end
  new_record = updated[/^(?:\xEF\xBB\xBF)?#{id};.*?(?=^(?:\xEF\xBB\xBF)?\d+;|\z)/nm]
  abort "unexpected other-cell or record edit at #{id}" unless expected_record == new_record
end

File.binwrite(path, updated)
puts "edited=#{edits.size} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/endings/order/other-bytes=OK"
