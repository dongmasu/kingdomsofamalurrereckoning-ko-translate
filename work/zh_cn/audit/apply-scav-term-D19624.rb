#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-scav-term-D19624/locatexts_zh_cn.koalocatext_default.csv"
expected = "2992e494d1a0974ff3c56c553bfe7d591823df8c35ec15c9f0a838d074eb32b6"
replacements = {
  "9757;청소부들이 오기 전에" => "9757;스캐브들이 오기 전에",
  "14809;그런 건 난생처음 봤어. 청소부들…" =>
    "14809;그런 건 난생처음 봤어. 사체를 뒤지는 짐승들…",
  "28670;청소부들" => "28670;폐품 수집꾼들",
  "38815;안뜰의 약탈자들을 모두 처치했고" =>
    "38815;안뜰의 스캐브들을 모두 처치했고",
  "51324;벤윅 아델름(Benwick Athelm)이 준 마법 물감 한 병. 약탈자(Scav)" =>
    "51324;벤윅 아델름(Benwick Athelm)이 준 마법 물감 한 병. 스캐브(Scav)"
}

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original

updated = original.dup
replacements.each do |before, after|
  raise "target missing or duplicated: #{before}" unless updated.scan(before.b).length == 1
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
