#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-arne-legacy-D19593/locatexts_zh_cn.koalocatext_default.csv"
expected = "c385f894710f6e7d0d2980524f346396f9b71653f08c41d17443fec1909d5825"
old = "그와 돌브 아른(Dolve Arne)의 나머지 유해와 함께 먼지 속에 버려져 있던 물건이다.".b
replacement = "그는 두 물건도 돌브 아른(Dolve Arne)의 나머지 유산과 함께 먼지 속에서 썩도록 내버려 뒀다.".b

original = File.binread(csv)
raise "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
lines = original.lines
target = lines.select { |line| line.start_with?("1501;".b) }
raise "target missing or duplicated" unless target.length == 1 && target[0].scan(old).length == 1
updated = lines.map { |line| line.start_with?("1501;".b) ? line.sub(old, replacement) : line }.join
raise "inverse differs" unless updated.sub(replacement, old) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
raise "row order/count changed" unless updated.lines.map { |line| line[/\A(\d+);/n, 1] } == lines.map { |line| line[/\A(\d+);/n, 1] }
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
