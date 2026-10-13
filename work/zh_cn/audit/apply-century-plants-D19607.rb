#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-century-plants-D19607/locatexts_zh_cn.koalocatext_default.csv"
expected = "ad91c0246dd9c1be556bb086609878bba9c6e124496f4fd5564906932aa62ea2"
replacements = {
  "29528;나는 직접 나설 수 없어. 우리 신념에 얽매여 있으니까. 하지만 변화를 가져올 존재가 세기의 꽃을 피워 이 상처를 지져 아물게 할 수는 있어." =>
    "29528;나는 직접 나설 수 없어. 우리 신념에 얽매여 있으니까. 하지만 변화를 가져올 존재가 백년초의 꽃을 피워 이 상처를 지져 아물게 할 수는 있어.",
  "61507;칼로바르(Calovar)가 죽어서 세기초(Century Plants)를 꽃피운 대가를 물어볼 수 없게 됐어." =>
    "61507;칼로바르(Calovar)가 죽어서 백년초(Century Plants)를 꽃피운 대가를 물어볼 수 없게 됐어.",
  "63622;센추리 플랜츠(Century Plants)" =>
    "63622;백년초(Century Plants)"
}

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
updated = original.dup
replacements.each do |before, after|
  before, after = before.b, after.b
  raise "target row missing or duplicated: #{before[0, 8]}" unless updated.scan(before).length == 1
  updated.sub!(before, after)
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
