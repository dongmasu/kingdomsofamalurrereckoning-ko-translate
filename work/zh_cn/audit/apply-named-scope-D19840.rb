#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19840/locatexts_zh_cn.koalocatext_default.csv"
expected = "16d033cf3ff4c9a43f02b18cea7920ff0efe79799d60279e19897a999ef909b3"
id = 36524
before = "라시어".b
after = "라시르".b

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
abort "review scope missing" unless (36451..36550).all? { |row_id| source.match(/^#{row_id};/n) }

updated = source.dup
match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "target row missing" unless match
row = match[0]
abort "target text missing or duplicated" unless row.scan(before).length == 1
updated[match.begin(0)...match.end(0)] = row.sub(before, after)

inverse = updated.dup
match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "inverse target row missing" unless match
row = match[0]
abort "inverse target text missing or duplicated" unless row.scan(after).length == 1
inverse[match.begin(0)...match.end(0)] = row.sub(after, before)
abort "other bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/order=OK"
