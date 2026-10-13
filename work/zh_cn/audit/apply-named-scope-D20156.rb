#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20156/locatexts_zh_cn.koalocatext_default.csv"
expected = "b0a772bea441df2779c96fc2bfb7ef0dcb2615952112ee5e167e5ec204c623a7"
changes = {
  54082 => [
    ["아르카나 학회(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"],
    ["교단에 들어가려면 이사(Ysa)로 가서 사반트 에이선 엔가르(Savant Aethan Engar)를 찾으라고 했다.", "스콜리아 아르카나에 가입하려면 이사(Ysa)로 가서 사반트 에이선 엔가르(Savant Aethan Engar)를 찾아 이야기하라고 했다."]
  ],
  54098 => [["선택받은 자여?", "부름받은 자여?"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
updated = source.dup
changes.each do |id, pairs|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  pairs.each do |old, replacement|
    abort "fragment missing or duplicated #{id}" unless row.scan(old).length == 1
    row = row.sub(old, replacement)
  end
  updated[match.begin(0)...match.end(0)] = row
end
inverse = updated.dup
changes.each do |id, pairs|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count/order differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "range differs" unless (54051..54100).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
