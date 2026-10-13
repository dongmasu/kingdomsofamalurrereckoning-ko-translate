#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20078/locatexts_zh_cn.koalocatext_default.csv"
expected = "a1fc60132c9a3c967826e5b801ac5d26ad8ab1af8c5cb34f60f6551dd72fb259"
changes = {
  50195 => ["처음에는 죽음을 숭배했다. 하지만 세월이 흐르자 겨울 페이들은 하우스의 희생을 기려 그들을 숭배하게 됐다.",
            "처음에는 하우스가 죽음을 숭배했다. 하지만 세월이 흐르자 겨울 페이들은 그 희생을 기리며 하우스를 숭배하게 됐다."],
  50196 => ["그가 아픈 동안", "그동안"]
}.transform_values { |pair| pair.map(&:b) }
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
  (50151..50200).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
