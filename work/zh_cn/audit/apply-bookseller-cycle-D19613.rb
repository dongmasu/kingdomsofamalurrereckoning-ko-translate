#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-bookseller-cycle-D19613/locatexts_zh_cn.koalocatext_default.csv"
expected = "276417d7e2c64c346c9d78af5b7525eebc82bd37f18492f30f9c298b5ac81b5a"
replacements = {
  "3325;어서 오게, 친구. 루미너리 리프에 온 걸 환영하네. 이보다 훌륭한 서점은 없지." =>
    "3325;어서 오게, 친구. 루미너리 리프에 온 걸 환영하네. 내가 바로 일류 서적상이지.",
  "3332;초대받은 자여, 처음엔 화가 났다는 걸 인정하마." =>
    "3332;부름받은 자여, 처음엔 화가 났다는 걸 인정하마.",
  "3341;거대한 순환" => "3341;위대한 순환",
  "3345;다음 일은 특별해. 내 동족 중 한 명, 사냥의 군주 아메테어(Ametair)의 물건을 훔쳐야 하거든. 그는 타락해 여름 궁정(Court of Summer)에서 쫓겨난 자야." =>
    "3345;다음 일은 특별해. 내 동족 중 한 명, 사냥의 군주 아메테어(Ametair)의 물건을 훔쳐야 하거든. 그는 여름 궁정(Court of Summer)에서 몰락한 자야."
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
