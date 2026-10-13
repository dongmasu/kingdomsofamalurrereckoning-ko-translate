#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-traveler-name-D19606/locatexts_zh_cn.koalocatext_default.csv"
expected = "bd7da1166002cd0f11cf6e1918d19fe40cdf11d731f9228b554bdb4d91aa5925"
before = "2632;여기는 별 야영지(Star Camp), 트래블러스(Travelers)의 본거지야, 친구. 우연히 온 건 아닐 테지. 말해 봐, 친구. 우리와 함께하고 싶다고.".b
after = "2632;여기는 별 야영지(Star Camp), 트래블러(Travelers)의 본거지야, 친구. 우연히 온 건 아닐 테지. 말해 봐, 친구. 우리와 함께하고 싶다고.".b

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
