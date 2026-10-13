#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19651/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "a83130a7664a70bbf2ea3490faab3aebce8c7f290683e6b7f4240052a5882301"
snapshot = "work/zh_cn/audit/uncertain-200-D4123-D4409-20261012.jsonl"
edits = {
  13911 => [["학자 엔가르(Savant Engar)", "사반트 엔가르(Savant Engar)"]],
  13917 => [["일 펫틀(2)", "일 페탈(2)"]],
  13945 => [["여행자들의 본거지", "트래블러의 본거지"]],
  13988 => [["패런 형제(Brother Fallon)", "패런 수사(Brother Fallon)"]],
  14034 => [["콜로세(Kollossae)", "콜로사이(Kollossae)"]],
  14097 => [["홀", "셉터"]],
  14134 => [["오스블레이드 켄트(Oathblade Kent)",
             "맹세의 칼날 켄트(Oathblade Kent)"]],
  14154 => [["콜로세조차", "콜로사이조차"],
             ["불려온 자여", "부름받은 자여"]],
  14155 => [["오스블레이드(Oathblade)들은",
             "맹세의 칼날(Oathblade)들은"]],
  14159 => [["불려온 자여", "부름받은 자여"]],
  14202 => [["탐굴자는", "탐구자는"]],
  14219 => [["탐굴자", "탐구자"]],
  14251 => [["불려온 자여", "부름받은 자여"]],
  14384 => [["불려온 자여", "부름받은 자여"]],
  14458 => [["여행자들", "트래블러"]],
  14484 => [["불려온 자가", "부름받은 자가"]],
  14555 => [["완벽한 미타란(Mitharan) 도살자의 자루",
             "흠 없는 미타란(Mitharan) 도살자의 자루"]],
  14557 => [["완벽한 미타란 약탈자의 손잡이",
             "흠 없는 미타란 약탈자의 손잡이"]]
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
