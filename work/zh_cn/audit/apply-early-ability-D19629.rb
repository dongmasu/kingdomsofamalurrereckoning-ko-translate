#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-ability-D19629/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "569a92d9a7fadd7ae84e4add086f2f0b05453fae9d7b8887e0c3525b064aaad2"
before = "4672;\"{*1[사용 능력]}".b
after = "4672;\"{*1[액티브]}".b

original = File.binread(path)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_before
abort "backup is not byte-identical" unless File.binread(backup) == original
abort "expected exact source record once" unless original.scan(before).length == 1

updated = original.sub(before, after)
abort "BOM missing" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length] ==
  [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length]
abort "unapproved bytes changed" unless updated.sub(after, before) == original

File.binwrite(path, updated)
puts "pre=#{expected_before}"
puts "post=#{Digest::SHA256.hexdigest(updated)}"
puts "crlf=#{updated.scan("\r\n".b).length} bare_lf=#{updated.scan(/(?<!\r)\n/n).length}"
