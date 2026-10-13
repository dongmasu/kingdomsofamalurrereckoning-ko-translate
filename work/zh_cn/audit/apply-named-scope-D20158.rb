#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20158/locatexts_zh_cn.koalocatext_default.csv"
expected = "937b53b00a9338e094814feddfaabfbad95d3526db4fe68b355df7ef9cb798aa"
changes = {
  54161 => ["선택받은 자여.", "부름받은 자여."],
  54174 => ["동전 몇 푼 받고 늙은 넬(Nell)의 노래를 들으러", "동전 몇 푼 내고 늙은 넬(Nell)의 노래를 들으러"],
  54177 => ["그녀를 다른 포로들과 함께 팔라고 했대.", "팔기 전에 그녀를 다른 포로들과 합류시키라고 했대."],
  54199 => ["워스워른(Warsworn)", "워스원(Warsworn)"]
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
abort "range differs" unless (54151..54200).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
