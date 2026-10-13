#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-passive-telling-D19612/locatexts_zh_cn.koalocatext_default.csv"
expected = "0a29c6ab0bba93d59326a5e8ea5ae7dfea9bcbbb6f470179827e42dd1c5fccd7"
replacements = {
  "3205;\"{*1[Passive]}" => "3205;\"{*1[패시브]}",
  "3212;병동 구역" => "3212;병원 구역",
  "3237;난 시녀(The Maid)에게 완전히 짓밟혔어. 구전(Telling)의" =>
    "3237;난 시녀(The Maid)에게 완전히 짓밟혔어. 전승(Telling)의",
  "3297;내 이름은 펜리 켈(Penri Kell)이야. 직업은 여행자지." =>
    "3297;내 이름은 펜리 켈(Penri Kell)이야. 직업은 트래블러(Traveler)지."
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
