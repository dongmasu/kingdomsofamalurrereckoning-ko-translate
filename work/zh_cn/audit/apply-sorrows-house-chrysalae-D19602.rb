#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-sorrows-house-chrysalae-D19602/locatexts_zh_cn.koalocatext_default.csv"
expected = "080d72648d33837b19a52a8b38aa6200468153a78e477c6f7dfba26a2693d816"
changes = {
  2348 => ["House of Sorrows", "비탄의 집(House of Sorrows)"],
  2352 => ["크리살라이(chrysalae)", "크리살라이 씨앗(chrysalae)"]
}

def replace_ids(bytes, changes)
  seen = []
  output = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    next line unless changes.key?(id)
    raise "duplicate row #{id}" if seen.include?(id)
    old, replacement = changes.fetch(id).map(&:b)
    raise "expected one exact phrase in #{id}" unless line.scan(old).length == 1
    seen << id
    line.sub(old, replacement)
  end.join
  raise "missing target IDs" unless seen.sort == changes.keys.sort
  output
end

original = File.binread(csv)
raise "unexpected pre-edit SHA-256" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original
updated = replace_ids(original, changes)
inverse = changes.transform_values { |old, replacement| [replacement, old] }
raise "inverse mismatch" unless replace_ids(updated, inverse) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] } }
raise "row order/count changed" unless ids.call(updated) == ids.call(original)
File.binwrite(csv, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
