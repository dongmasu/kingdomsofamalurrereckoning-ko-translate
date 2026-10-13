#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-tirin-journey-D19608/locatexts_zh_cn.koalocatext_default.csv"
expected = "287d12c64ec40c02a3db1fdd88388958d5b9379968df6a528184c43f9c757ab9"
before = "2840;그걸 들고 북쪽에서 머물다 간 여사제 티린(Tirin)이 축복한 세 샘으로 가. 각 샘의 물을 조금씩 암포라에 담아.".b
after = "2840;그걸 들고 북쪽에서 온 여사제 티린(Tirin)이 여정 중 축복한 세 샘으로 가. 각 샘의 물을 조금씩 암포라에 담아.".b

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
