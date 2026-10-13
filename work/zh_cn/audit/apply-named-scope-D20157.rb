#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20157/locatexts_zh_cn.koalocatext_default.csv"
expected = "709e30bd254d36633a4046aafe4e337394e795369bf84a8622a87fe0c7c1452f"
changes = {
  54101 => ["선택받은 자여.", "부름받은 자여."],
  54104 => ["선택받은 자여.", "부름받은 자여."],
  54123 => ["적을 띄우는 투사체를 발사합니다.", "투사체를 발사합니다."],
  54132 => ["모투스 광산(Motus Mining)", "모투스 광업(Motus Mining)"],
  54137 => ["스네이크테일 해구(Snaketail Trench)", "스네이크테일 참호(Snaketail Trench)"],
  54148 => ["예정된 자들(Preordained) 추종자들에게", "그를 따르는 예정된 자들(Preordained)에게"]
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
abort "range differs" unless (54101..54150).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
