#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19834/locatexts_zh_cn.koalocatext_default.csv"
expected = "8863b53c9c7e16d048067581c2cee7f961a17511dbe3f51e823b12737ca567b7"
edits = [
  [35917, "붕대", "포장재"],
  [35921, "제8항", "항목 VIII"],
  [35937, "장례용 수의", "관 덮개"]
].map { |id, before, after| [id, before.b, after.b] }

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
abort "review scope missing" unless (35851..35950).all? { |id| source.match(/^#{id};/n) }

updated = source.dup
edits.each do |id, before, after|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target row missing: #{id}" unless match
  row = match[0]
  abort "target text missing or duplicated: #{id}" unless row.scan(before).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before, after)
end

inverse = updated.dup
edits.reverse_each do |id, before, after|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse target row missing: #{id}" unless match
  row = match[0]
  abort "inverse target text missing or duplicated: #{id}" unless row.scan(after).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after, before)
end
abort "other bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.map(&:first).join(",")} inverse/BOM/endings/order=OK"
