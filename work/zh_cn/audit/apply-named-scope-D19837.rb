#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19837/locatexts_zh_cn.koalocatext_default.csv"
expected = "5eeb1daae48ef8483e0b1e435546bc4ff9db1207cb8b4536fc2c391ce2b6125d"
edits = [
  [
    36157,
    "성 이드릭에서는 들짐승과 정원의 푸성귀처럼 권능자가 내린 자연의 선물을 기리지.",
    "성 이드릭에서는 들짐승과 정원의 푸성귀 같은 권능(Authority)께서 내리신 자연의 선물을 기리지."
  ],
  [36189, "라시어", "라시르"]
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
abort "review scope missing" unless (36151..36250).all? { |id| source.match(/^#{id};/n) }

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
