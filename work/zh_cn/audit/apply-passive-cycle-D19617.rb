#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-passive-cycle-D19617/locatexts_zh_cn.koalocatext_default.csv"
expected = "0f25fcbe2ccaacb66bc645af43b6c2514bff75806ceea33cbc365a9585e1733d"
replacements = {
  "3731;\"{*1[지속 효과]}" => "3731;\"{*1[패시브]}",
  "3749;거대한 순환(Great Cycle)이" => "3749;위대한 순환(Great Cycle)이"
}

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
updated = original.dup
replacements.each do |before, after|
  raise "target missing or duplicated" unless updated.scan(before.b).length == 1
  updated.sub!(before.b, after.b)
end
restored = updated.dup
replacements.to_a.reverse_each { |before, after| restored.sub!(after.b, before.b) }
raise "inverse mismatch" unless restored == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length ==
  original.count("\n") - original.scan("\r\n").length
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)

File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/endings=OK"
