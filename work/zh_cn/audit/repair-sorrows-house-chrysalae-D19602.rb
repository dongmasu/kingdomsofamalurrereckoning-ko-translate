#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-sorrows-house-chrysalae-D19602/locatexts_zh_cn.koalocatext_default.csv"
expected = "4671984cc826b4eae5136ee00948959a02d8ebb728f1519f8a37d76185377e19"
changes = {
  2348 => ["비탄의 집(비탄의 집(House of Sorrows))", "비탄의 집(House of Sorrows)"],
  2352 => ["크리살라이 씨앗(chrysalae)를", "크리살라이 씨앗(chrysalae)을"]
}

def replace_ids(bytes, changes)
  seen = []
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    next line unless changes.key?(id)
    raise "duplicate row #{id}" if seen.include?(id)
    old, replacement = changes.fetch(id).map(&:b)
    raise "expected unique phrase missing at #{id}" unless line.scan(old).length == 1
    seen << id
    line.sub(old, replacement)
  end.join
  raise "missing target" unless seen.sort == changes.keys.sort
  result
end

original = File.binread(csv)
raise "unexpected active hash" unless Digest::SHA256.hexdigest(original) == expected
updated = replace_ids(original, changes)
inverse = changes.transform_values { |old, replacement| [replacement, old] }
raise "repair inverse mismatch" unless replace_ids(updated, inverse) == original
raise "backup row 2348 does not match corrected text" unless File.binread(backup).lines.find { |line| line.start_with?("2348;".b) }.include?("비탄의 집(House of Sorrows)".b)
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
get_ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless get_ids.call(updated) == get_ids.call(original)
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
