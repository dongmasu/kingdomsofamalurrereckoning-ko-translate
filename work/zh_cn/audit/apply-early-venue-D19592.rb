#!/usr/bin/env ruby

require "digest"

csv = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-venue-D19592/locatexts_zh_cn.koalocatext_default.csv"
expected = "eb03fa86f5d193a5659f9e3ff35c2d1f12d05d201cfa40fa93f8a33bfc0bce3a"
changes = {
  1374 => ["우리의 소박한 수도원을 보라.", "우리의 소박한 선교단을 보라."],
  1379 => ["하얀 비둘기 여관에서는", "하얀 비둘기에서는"]
}

original = File.binread(csv)
raise "unexpected active CSV" unless Digest::SHA256.hexdigest(original) == expected
raise "backup differs" unless File.binread(backup) == original

def change_rows(bytes, changes)
  found = []
  output = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i
    next line unless changes.key?(id)

    raise "duplicate ID #{id}" if found.include?(id)
    old, replacement = changes.fetch(id).map(&:b)
    raise "missing/duplicate phrase at #{id}" unless line.scan(old).length == 1
    found << id
    line.sub(old, replacement)
  end.join
  raise "missing IDs" unless found.sort == changes.keys.sort
  output
end

updated = change_rows(original, changes)
inverse = changes.transform_values { |old, replacement| [replacement, old] }
raise "inverse differs" unless change_rows(updated, inverse) == original
raise "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
raise "CRLF changed" unless updated.scan("\r\n").length == original.scan("\r\n").length
raise "bare LF changed" unless updated.count("\n") - updated.scan("\r\n").length == original.count("\n") - original.scan("\r\n").length
raise "row order/count changed" unless updated.lines.map { |line| line[/\A(\d+);/n, 1] } == original.lines.map { |line| line[/\A(\d+);/n, 1] }

File.binwrite(csv, updated)
puts "pre=#{Digest::SHA256.hexdigest(original)} post=#{Digest::SHA256.hexdigest(updated)} CRLF=#{updated.scan("\r\n").length} bareLF=#{updated.count("\n") - updated.scan("\r\n").length} inverse/BOM/order=OK"
