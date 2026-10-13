#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-longlegs-D19606/locatexts_zh_cn.koalocatext_default.csv"
expected = "a617b932d74caf037c60ace5aa61f64da934978830fb8ce2a02e52598b3e0cd1"
before = "2648;죽어라, 롱레그(longlegs)!".b
after = "2648;죽어라, 다리 긴 녀석!".b

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
