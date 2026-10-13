#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19650/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "fe30c288604fd936f30714a772ed04b8687a33f4ce0d49b1dac7a62e6b56c944"
snapshot = "work/zh_cn/audit/uncertain-200-D3747-D4122-20261012.jsonl"
edits = {
  12876 => [["석학 엔가르", "사반트 엔가르"]],
  12905 => [["아가씨", "친구"]],
  12929 => [["비탄의 집(The Sorrows)으로 가는 열쇠",
             "비탄의 힘(Sorrows)으로 통하는 열쇠"]],
  12991 => [["맹세칼 켄트", "맹세의 칼날 켄트"]],
  13031 => [["맹세칼 그윈 안웨이", "맹세의 칼날 그윈 안웨이"]],
  13084 => [["워스워른(Warsworn)", "워스원(Warsworn)"]],
  13201 => [["지속 효과", "패시브"]],
  13207 => [["완벽한 미사루의 서리 결속구",
             "흠 없는 미타란 서리 결속구"]],
  13209 => [["콜로새(Kollossae)", "콜로사이(Kollossae)"]],
  13263 => [["완벽한 미사루의 학살하는 지렛대",
             "흠 없는 미타란 학살 지렛목"]],
  13288 => [["이 전당과 이 집, 그리고",
             "이 전당과 비탄의 집, 그리고"]],
  13305 => [["미사루인 족장", "미타란족 족장"],
             ["들고 다닌 홀이다", "들고 다닌 셉터다"]],
  13312 => [["워스워른(Warsworn)", "워스원(Warsworn)"]],
  13340 => [["탐굴자들은", "탐구자들은"]],
  13348 => [["팔론 신부가", "팔론 수사가"]],
  13405 => [["아가씨", "친구"]],
  13424 => [["완벽한 미사루의 수선용 끈",
             "흠 없는 미타란 수선용 끈"]],
  13458 => [["여행자 별 야영지(Travelers Star Camp)",
             "트래블러의 별 야영지(Travelers Star Camp)"]],
  13618 => [["마치스(Marches)", "변경지(Marches)"]],
  13639 => [["서약방패 페난(Pledgeshield Fenan)",
             "서약방패병 페난(Pledgeshield Fenan)"]],
  13859 => [["최초의 미사루인들이", "최초의 미타란족이"]]
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
