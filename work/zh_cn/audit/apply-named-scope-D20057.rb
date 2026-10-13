#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20057/locatexts_zh_cn.koalocatext_default.csv"
expected = "b392e55f4f3bdfbdf89aa32ff18f9d091af00822339bb0214188787352c0534b"
changes = {
  49146 => [
    ["여행자들에 들어오라고", "트래블러에 들어오라고"],
    ["여행자들은 대도적이라는", "트래블러는 대도적이라는"]
  ],
  49150 => [["알파르의 퍼스트 소드에게", "알파르의 제일검에게"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
record = ->(bytes, id) { bytes.match(/^#{id};.*?(?=^\d+;|\z)/mn) }
updated = source.dup
changes.each do |id, pairs|
  match = record.call(updated, id)
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
  match = record.call(inverse, id)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (49101..49150).all? { |id| record.call(updated, id) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
