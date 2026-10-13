#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20043/locatexts_zh_cn.koalocatext_default.csv"
expected = "b443b44f2ee911220cf117fed2c0391151b5f9e1a1b251f0a9159791c9f5ae11"
changes = {
  48444 => [["숨은 것 감지", "숨겨진 물건 찾기"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

record_match = lambda do |bytes, id|
  bytes.match(/^(?:\xEF\xBB\xBF)?#{id};.*?(?=^\d+;|\z)/mn)
end

updated = source.dup
changes.each do |id, pairs|
  match = record_match.call(updated, id)
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
  match = record_match.call(inverse, id)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "target scope differs" unless (48401..48450).all? { |id| record_match.call(updated, id) }

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
