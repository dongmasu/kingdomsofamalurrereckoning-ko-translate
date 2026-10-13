#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20155/locatexts_zh_cn.koalocatext_default.csv"
expected = "9f8bec88ede95e8d673e0c404de1abef8de21731cb9ec8f495577420cb9490a5"
changes = {
  54011 => ["상업 기술이 일시적으로", "상술 스킬이 일시적으로"],
  54023 => ["선택받은 자여.", "부름받은 자여."],
  54028 => ["아르카나 학회(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"],
  54035 => ["일어난 뒤로 계속 참아 왔거든. 아니, 일어나서부터 계속 술을 마셨지.", "일어난 뒤로 쭉 준비해 왔거든. 계속 술을 마셨다는 말이야."]
}.transform_values { |old, new_text| [old.b, new_text.b] }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
updated = source.dup
changes.each do |id, (old, replacement)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "fragment missing or duplicated #{id}" unless row.scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old, replacement)
end
inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(replacement, old)
end
abort "other bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count/order differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "range differs" unless (54001..54050).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
