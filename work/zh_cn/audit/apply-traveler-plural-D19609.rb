#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-traveler-plural-D19609/locatexts_zh_cn.koalocatext_default.csv"
expected = "7a87cc4e4fa8e679b9ebb988f531f1037986bd7aab26c0a1a736d198e857f198"
replacements = {
  "2991;그래? 풋내기 꼬맹이가 아닌 사람을 만나 반갑군. 달 야영지(Moon Camp)는 트래블러스(Travelers) 캠프인 동시에 광대극 무대나 다름없어." =>
    "2991;그래? 풋내기 꼬맹이가 아닌 사람을 만나 반갑군. 달 야영지(Moon Camp)는 트래블러(Travelers) 캠프인 동시에 광대극 무대나 다름없어.",
  "3000;트래블러스(Travelers)는 네가 무슨 말을 들었든 노상강도가 아니야. 우린 가족이자 한 공동체야. 서로 뭉쳐 다니지." =>
    "3000;트래블러(Travelers)는 네가 무슨 말을 들었든 노상강도가 아니야. 우린 가족이자 한 공동체야. 서로 뭉쳐 다니지."
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
