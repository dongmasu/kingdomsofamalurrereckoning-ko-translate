#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-dove-address-D19606/locatexts_zh_cn.koalocatext_default.csv"
expected = "0b9c7bfa4c3c087f5956a9233cf299f0af6704fc2a17ef66335b4d4537749fc6"
first_old = "도브(Dove)".b
second_old = "말해 봐, 도브.".b

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
lines = original.lines
targets = lines.select { |line| line.start_with?("2632;".b) }
raise "target row missing or duplicated" unless targets.length == 1 &&
  targets[0].scan(first_old).length == 1 && targets[0].scan(second_old).length == 1
updated = lines.map do |line|
  if line.start_with?("2632;".b)
    line.sub(first_old, "친구".b).sub(second_old, "말해 봐, 친구.".b)
  else
    line
  end
end.join
inverse = updated.sub("친구. 우연히".b, "도브(Dove). 우연히".b)
  .sub("말해 봐, 친구.".b, "말해 봐, 도브.".b)
raise "inverse mismatch" unless inverse == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
