#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-dove-vocative-D19621/locatexts_zh_cn.koalocatext_default.csv"
expected = "7a77d760fce7f83161119e763f88ab3d4265c07545b3bd4dce4941e5c97a20a2"
before = "4084;자, 여보. 이제 서둘러 가야 해. 세이블의 서신(Missives of Sable)을 되찾을 준비는 됐어?"
after = "4084;자, 친구. 이제 서둘러 가야 해. 세이블의 서신(Missives of Sable)을 되찾을 준비는 됐어?"

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
