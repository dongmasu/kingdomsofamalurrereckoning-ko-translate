#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20059/locatexts_zh_cn.koalocatext_default.csv"
expected = "a2aa5c7e063a84d0f8667071d81ef4846c1e0db2e6692c0f282d587df69fa8ea"
changes = {
  49205 => ["발가락이 없어 군대에서", "발가락 몇 개가 없어서 군대에서"],
  49210 => ["프리모스트 관저는", "프리모스트 구역은"],
  49222 => ["식물과 재료를", "식물과 연금술 재료를"]
}.transform_values { |old, replacement| [old.b, replacement.b] }
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
record = ->(bytes, id) { bytes.match(/^#{id};.*?(?=^\d+;|\z)/mn) }
updated = source.dup
changes.each do |id, (old, replacement)|
  match = record.call(updated, id)
  abort "row missing #{id}" unless match && match[0].scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
end
inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = record.call(inverse, id)
  abort "inverse row missing #{id}" unless match && match[0].scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
end
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (49201..49250).all? { |id| record.call(updated, id) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
