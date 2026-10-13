#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-lith-traffic-D19610/locatexts_zh_cn.koalocatext_default.csv"
expected = "0fe40e19c466aaf1e3f76e64fdccf4f13a44c0019ff1d240115e49e4245cf5c0"
replacements = {
  "3087;역사학자 대부분은 이 지역의 인상적인 석판이 미사란(Mitharan)족의 작품이라고 믿지만, 난 다른 이론이 있어." =>
    "3087;역사학자 대부분은 이 지역의 인상적인 석조물이 미사란(Mitharan)족의 작품이라고 믿지만, 난 다른 이론이 있어.",
  "3111;이제 사람들 흐름이 좀 풀리면 좋겠군. 혼돈은 아무에게도 득이 안 됐어." =>
    "3111;이제 통행이 좀 원활해지면 좋겠군. 혼돈은 아무에게도 득이 안 됐어."
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
