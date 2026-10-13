#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-hex-card-D19618/locatexts_zh_cn.koalocatext_default.csv"
expected = "7901fb98349d48eef017c437a329af07635073312702bf716f2d14f821fa6c73"
before = "3869;육각이나 에이스를 맞히면 판돈을 가져가고 승부는 끝이야. 다른 걸 맞히면 두 번째 판으로 넘어가.".b
after = "3869;헥스나 에이스를 맞히면 판돈을 가져가고 승부는 끝이야. 다른 걸 맞히면 두 번째 판으로 넘어가.".b

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
raise "target row missing or duplicated" unless original.scan(before).length == 1
updated = original.sub(before, after)
raise "inverse mismatch" unless updated.sub(after, before) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length ==
  original.count("\n") - original.scan("\r\n").length
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)

File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/endings=OK"
