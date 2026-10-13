#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20075/locatexts_zh_cn.koalocatext_default.csv"
expected = "08c5f8e87231b59677cdfc0a7ead76a6865045d1ea14b9955ad29c5164351608"
changes = {
  50001 => ["우리의 전승담은", "우리의 전승(The Telling)은"],
  50004 => ["하이페리온 전실에 틀어박혔어. 암호문도 하이페리온에", "하이페리언 전실에 틀어박혔어. 사이퍼(Cipher)도 하이페리언에"],
  50014 => ["고귀한 분, 네가 도와준다면", "고귀한 분, 도와준다면"]
}.transform_values { |pair| pair.map(&:b) }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
updated = source.dup
changes.each do |id, (old, replacement)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "fragment not unique #{id}" unless row.scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old, replacement)
end
inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match && match[0].scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
end
abort "other bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ID count or scope differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s) &&
  (50001..50050).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
