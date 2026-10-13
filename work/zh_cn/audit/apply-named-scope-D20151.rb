#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20151/locatexts_zh_cn.koalocatext_default.csv"
expected = "ff5bae2d5d4559075cb45ea07cb0fa9428e6d1fe3887e5f820b7b0cf056f1ae9"
changes = {
  53808 => ["우리 교단의 참된 역사", "우리 조직의 참된 역사"],
  53814 => ["그노스트라 대성당(Basilica Gnostra)에서 연설할 기회가 생길지도 몰라!", "그노스트라 대성당(Basilica Gnostra)에서 말할 기회가 생길지도 몰라!"],
  53823 => ["실드 링 요새(Shield Ring Keep)", "실드 요새(Shield Keep)"],
  53845 => ["가끔... 정신이 흐려지는 순간을 겪지만", "가끔... 이해하기 어려운 순간을 겪지만"]
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
abort "range differs" unless (53801..53850).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
