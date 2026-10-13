#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19830/locatexts_zh_cn.koalocatext_default.csv"
expected = "80d68f3d28fac04da76f543584828f0be58d926d93c16cb02941e08d9a09f4c6"
changes = {
  35501 => [["고대인 델프릭", "원로 델프릭"]],
  35515 => [["나로스의 송곳니", "나로스의 이빨"]],
  35521 => [["워스워른", "워스원"]],
  35531 => [["워스워른 요새", "워스원 요새"]],
  35533 => [["워스워른은", "워스원은"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
before_shape = shape.call(source)
abort "unexpected ID order/count" unless before_shape[-1] == (0..65134).map(&:to_s)
abort "scope row missing" unless (35451..35550).all? { |id| source.match(/^#{id};/n) }

updated = source.dup
changes.each do |id, pairs|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
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
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
