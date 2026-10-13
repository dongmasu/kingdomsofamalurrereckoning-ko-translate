#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20081/locatexts_zh_cn.koalocatext_default.csv"
expected = "813ad066f4aedb09bbf0dc23d5f076637d5f26091146517b3db6027efeda8983"
changes = {50309 => ["베렌의 유언", "벨렌의 유언"],
           50340 => ["라티르로 출두하라는", "라시르로 출두하라는"]}.transform_values { |p| p.map(&:b) }
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
  (50301..50350).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
