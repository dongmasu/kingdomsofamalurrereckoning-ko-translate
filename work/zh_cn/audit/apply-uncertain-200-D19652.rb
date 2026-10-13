#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19652/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "544f212767bbe8088823222ca45fb0bf775bddc29003959fdf3939dc4df79f0f"
snapshot = "work/zh_cn/audit/uncertain-200-D4411-D4745-20261012.jsonl"
edits = {
  14565 => [["수문 닫기", "관문 닫기"]],
  14578 => [["상업 기술을 일시적으로 높이는",
             "상술 스킬을 일시적으로 높이는"]],
  14637 => [["봉인 해제 기술이 일시적으로 3 상승합니다.",
             "디스펠 스킬이 일시적으로 3 상승합니다."]],
  14744 => [["은신 감지 훈련사", "숨겨진 물건 찾기 훈련사"]],
  14823 => [["전쟁의 맹세자들 이야기는", "워스원 이야기는"]],
  14824 => [["숄리아 아르카나", "스콜리아 아르카나"]],
  14898 => [["숄리아 아르카나", "스콜리아 아르카나"]],
  14916 => [["완벽한 미사란 감염 핵심석",
             "흠 없는 미타란 감염 지렛목"]],
  14991 => [["발라드 가문에", "발라드의 집에"]],
  15016 => [["현대의 전쟁의 맹세자를 대표하는 빛나는 본보기",
             "현대 워스원(Warsworn)의 빛나는 본보기"]],
  15047 => [["숄리아 아르카나", "스콜리아 아르카나"]],
  15095 => [["귀염둥이.", "친구."],
             ["훌륭한 여행자답게", "훌륭한 트래블러답게"]],
  15108 => [["'이야기'를", "전승(The Telling)을"]],
  15188 => [["완벽한 미사란 화염 핵심석",
             "흠 없는 미타란 화염 지렛목"]],
  15201 => [["완벽한 미사란 감염 자루",
             "흠 없는 미타란 감염 자루"]],
  15238 => [["콜로세 약탈자", "콜로사이 약탈자"]],
  15253 => [["여행자들", "트래블러"]],
  15442 => [["콜로세의 곤경", "콜로사이의 곤경"],
             ["콜로세의 힘", "콜로사이의 힘"],
             ["선택받은 자는", "부름받은 자는"]]
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
