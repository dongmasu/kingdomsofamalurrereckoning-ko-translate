#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "abe79778c10c70aa427f29505aff05bad5bd46c23d7fbc83a7faa515f5383cc1"
backup = "/private/tmp/ko-translate-backups/20261012/before-skoria-speaker-D19717/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
old = "16990;다크바리와 시엔릭, 중가르 놈들은 불길에 던져 버려라. 스코리아인들처럼 그들도 자기 길을 택했다.".b
replacement = "16990;다크바리와 시엔릭, 중가르 놈들은 불길에 던져 버려라. 그들도 자기 길을 택했다. 우리 스코리아인들처럼.".b
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
