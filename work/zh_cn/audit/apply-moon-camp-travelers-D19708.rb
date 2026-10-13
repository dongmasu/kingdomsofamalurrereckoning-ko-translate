#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "68b1cd437e1629bcb914f5c6c3d58e96cd49d7ce7512ee5ad8eb618dbb41de34"
backup = "/private/tmp/ko-translate-backups/20261012/before-moon-camp-travelers-D19708/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
old = "16300;달 야영지(Moon Camp)는 에라셀(Erathell) 평원에 있는 여행자(Traveler)들의 거점이야.".b
replacement = "16300;달 야영지(Moon Camp)는 에라셀(Erathell) 평원에 있는 트래블러(Travelers)의 거점이야.".b
abort "expected single target" unless source.scan(old).size == 1
updated = source.sub(old, replacement)
abort "inverse mismatch" unless updated.sub(replacement, old) == source
abort "BOM mismatch" unless source.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings mismatch" unless endings.call(source) == endings.call(updated)
ids = ->(bytes) { bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten }
abort "row order mismatch" unless ids.call(source) == ids.call(updated)
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup mismatch" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == source
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} endings=#{endings.call(updated)} inverse/order/BOM=OK"
