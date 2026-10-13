#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-maid-name-D19615/locatexts_zh_cn.koalocatext_default.csv"
expected = "885f6ae87af640587380baf93f7951fd41c71ad3aa8076925a0116a8906fe41d"
before = "3570;윈더미어(Windemere)의 시녀(Maid)".b
after = "3570;윈더미어의 시녀(Maid of Windemere)".b

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
raise "target missing or duplicated" unless original.scan(before).length == 1
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
