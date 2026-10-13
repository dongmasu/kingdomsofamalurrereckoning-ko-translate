#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19833/locatexts_zh_cn.koalocatext_default.csv"
expected = "8863b53c9c7e16d048067581c2cee7f961a17511dbe3f51e823b12737ca567b7"
id = 35836
before = "형기 집행".b
after = "복역하기".b

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
expected_ids = (0..65134).map(&:to_s)
abort "unexpected ID order/count" unless before_shape[-1] == expected_ids
abort "review scope missing" unless (35751..35850).all? { |row_id| source.match(/^#{row_id};/n) }

match = source.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "target row missing" unless match
row = match[0]
abort "target text missing or duplicated" unless row.scan(before).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = row.sub(before, after)

inverse = updated.dup
inverse_match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "inverse target row missing" unless inverse_match
inverse_row = inverse_match[0]
abort "inverse target text missing or duplicated" unless inverse_row.scan(after).length == 1
inverse[inverse_match.begin(0)...inverse_match.end(0)] = inverse_row.sub(after, before)
abort "other bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/order=OK"
