#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-maid-teeth-D19606/locatexts_zh_cn.koalocatext_default.csv"
expected = "fcfc7ff4774b9613dd5d3d6f39096ebfc35b7c12982922f413522feb6a7a4c2f"

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original

replacements = [
  [
    "시녀(The Maid)가 그 자리를 차지하고 있어".b,
    "윈더미어의 시녀(Maid of Windemere)가 그들 대신 자리를 차지하고 있어".b
  ],
  [
    "이게 바로 이빨(The Teeth)...".b,
    "여기가 바로 나로스의 이빨(Teeth of Naros)이군...".b
  ]
]

updated = original.dup
replacements.each do |before, after|
  raise "target text missing or duplicated: #{before}" unless updated.scan(before).length == 1
  updated.sub!(before, after)
end

inverse = updated.dup
replacements.reverse_each do |before, after|
  inverse.sub!(after, before)
end
raise "inverse mismatch" unless inverse == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length ==
  original.count("\n") - original.scan("\r\n").length

ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)

File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/endings=OK"
