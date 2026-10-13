#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-travelers-raised-D19614/locatexts_zh_cn.koalocatext_default.csv"
expected = "4f39d3c7454bb6a50affeced5a1bafee022537f4b751c382157591404de5e5e3"
replacements = {
  "3427;여행자들(The Travelers)" => "3427;트래블러(The Travelers)",
  "3456;나로스의 이빨(Teeth of Naros)에서 발견된 콜로세(Kollossae) 지하묘지는 원래 도시의 일부가 될 예정이었지만, 끝내 지상으로 올라오지 못한 구역이야." =>
    "3456;나로스의 이빨(Teeth of Naros)에서 발견된 콜로세(Kollossae) 지하묘지는 원래 도시의 일부가 될 예정이었지만, 끝내 들어 올려지지 않은 구역이야.",
  "3464;그걸 가지고 좁은 바위틈을 지나 북쪽으로 갔어. 이제는 덩굴들에게 먹혔겠지." =>
    "3464;그걸 가지고 좁은 바위틈을 지나 북쪽으로 갔어. 결국 덩굴의 먹이가 됐어."
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
