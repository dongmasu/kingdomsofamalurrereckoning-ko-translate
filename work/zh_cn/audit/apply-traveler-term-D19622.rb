#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-traveler-term-D19622/locatexts_zh_cn.koalocatext_default.csv"
expected = "95513ebe605f01ce19062bb0d2e3e3bd074887c7897ab4deec45d7ed4b7f171b"
before = "4209;우리 트래블러스(Travelers)는"
after = "4209;우리 트래블러(Travelers)는"

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
raise "target missing or duplicated" unless original.scan(before.b).length == 1

updated = original.sub(before.b, after.b)
raise "inverse mismatch" unless updated.sub(after.b, before.b) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length ==
  original.count("\n") - original.scan("\r\n").length
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)

File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/endings=OK"
