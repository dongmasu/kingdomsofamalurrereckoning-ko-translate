#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-fell-persons-D19594/locatexts_zh_cn.koalocatext_default.csv"
expected = "70494c94940104b196ac20daa9dfb60b190a2a87747add64a02566f743849c26"
old = "너희 페이들은 무지하군.".b
replacement = "너희는 무지하군.".b

original = File.binread(csv)
raise "wrong active CSV" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
lines = original.lines
target = lines.select { |line| line.start_with?("1686;".b) }
raise "target missing/duplicate" unless target.length == 1 && target[0].scan(old).length == 1
updated = lines.map { |line| line.start_with?("1686;".b) ? line.sub(old, replacement) : line }.join
raise "inverse differs" unless updated.sub(replacement, old) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
raise "row order/count changed" unless updated.lines.map { |line| line[/\A(\d+);/n, 1] } == lines.map { |line| line[/\A(\d+);/n, 1] }
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
