#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20080/locatexts_zh_cn.koalocatext_default.csv"
expected = "e051a1e0044bb4d0428f853fea0555da90f87e5c81d7de334255b17c9080a846"
changes = {
  50280 => ["장궁", "롱보우"],
  50294 => ["하우스 오브 소로우가 폐허가 되어 있었다. 타이브리어는 하우스가",
            "비탄의 집(House of Sorrows)이 폐허가 되어 있었다. 타이브리어는 그 집이"]
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
  (50251..50300).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
