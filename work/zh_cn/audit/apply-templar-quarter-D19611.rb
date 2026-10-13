#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-templar-quarter-D19611/locatexts_zh_cn.koalocatext_default.csv"
expected = "f1dec8e3c98993eef3f55cf5b9385462f4683f9d8f0fd48ebbb67809d8009128"
replacements = {
  "3131;나는 템플러의 권위를 등에 업고 말해. 필요하다면 내 의심만으로도 법을 움직일 수 있지. 그러니 알아내려는 게 있다면 침묵해야 해." =>
    "3131;나는 템플러의 권위로 말해. 필요하다면 내 의심을 곧 법으로 만들 수도 있지. 그러니 알아내려는 게 있다면 침묵해야 해.",
  "3167;운명의 뜻은 절대적이야. 이리온(Irion)은 대사제(Hierophant)의 축복을 받아 이끌고, 반역자는 누구도 용납하지 않아." =>
    "3167;운명의 뜻은 절대적이야. 이리온(Irion)은 대사제(Hierophant)의 축복을 받아 이끌고, 반역자에게는 자비를 베풀지 않아."
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
