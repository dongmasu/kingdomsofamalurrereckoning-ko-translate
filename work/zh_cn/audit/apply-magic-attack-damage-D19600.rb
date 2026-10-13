#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-magic-attack-damage-D19600/locatexts_zh_cn.koalocatext_default.csv"
expected = "a8614bed8514527a9565d3627c650dd65893ba2a2337d3d121e61f7597e0d451"
old = "마법 공격 대미지".b
replacement = "마법 공격 피해".b

original = File.binread(csv)
raise "unexpected source hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup is not byte-identical" unless File.binread(backup) == original
lines = original.lines
rows = lines.select { |line| line.start_with?("2147;".b) }
raise "missing/duplicate target" unless rows.length == 1 && rows[0].scan(old).length == 1
updated = lines.map { |line| line.start_with?("2147;".b) ? line.sub(old, replacement) : line }.join
raise "inverse mismatch" unless updated.sub(replacement, old) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
raise "row order/count changed" unless updated.lines.map { |line| line[/\A(\d+);/n, 1] } == lines.map { |line| line[/\A(\d+);/n, 1] }
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
