#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20088/locatexts_zh_cn.koalocatext_default.csv"
expected = "4fbd7fe72724fd6c36c2ce630bce9b738dc982814c4eaab1f23d8b533af39ae4"
changes = {
  50677 => ["쉽게 방심시키진 못할 거야.", "쉽게 허를 찌르진 못할 거야."],
  50678 => ["콜로세 제단", "콜로사이 제단"],
  50683 => ["강연할 토론자를 늘 찾고 있다.", "강의를 들을 토론자를 늘 찾고 있다."]
}.transform_values { |p| p.map(&:b) }
source = File.binread(path)
abort "active or backup differs" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
updated = source.dup
changes.each do |id, (old, replacement)|
  m = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row/fragment missing or duplicated #{id}" unless m && m[0].scan(old).length == 1
  updated[m.begin(0)...m.end(0)] = m[0].sub(old, replacement)
end
inverse = updated.dup
changes.each do |id, (old, replacement)|
  m = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse missing #{id}" unless m && m[0].scan(replacement).length == 1
  inverse[m.begin(0)...m.end(0)] = m[0].sub(replacement, old)
end
abort "other bytes changed" unless inverse == source
shape = lambda { |s| [s.start_with?("\xEF\xBB\xBF".b), s.scan("\r\n".b).length,
                       s.scan(/(?<!\r)\n/n).length, s.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "structure differs" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[-1] == (0..65134).map(&:to_s) &&
  (50651..50700).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
