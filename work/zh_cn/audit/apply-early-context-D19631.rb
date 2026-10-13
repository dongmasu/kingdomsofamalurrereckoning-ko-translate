#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-context-D19631/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "e31bf69d6dc9c48094e42a001b9416339ca0b6d3fcd17defa894d3371f39cd63"

changes = {
  4791 => ["너는 이제 비탄의 일부가 되었으니,".b, "너는 이제 비탄의 힘 중 하나이니,".b],
  4797 => ["서쪽 길".b, "웨스트로드(Westroad)".b],
  4814 => ["프라이토리안 주둔군".b, "프레토리안 주둔군".b]
}

def replace_ids(bytes, changes)
  seen = []
  active_id = nil
  result = bytes.lines.map do |line|
    active_id = line[/\A(\d+);/n, 1]&.to_i || active_id
    next line unless changes.key?(active_id)

    old, replacement = changes.fetch(active_id)
    count = line.scan(old).length
    next line if count.zero?
    raise "duplicate target text at #{active_id}" unless count == 1

    seen << active_id
    line.sub(old, replacement)
  end.join
  raise "missing or duplicate target rows: #{seen.inspect}" unless seen.sort == changes.keys.sort
  result
end

original = File.binread(path)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected_before
abort "backup is not byte-identical" unless File.binread(backup) == original

updated = replace_ids(original, changes)
inverse = changes.transform_values { |old, replacement| [replacement, old] }
abort "exact inverse mismatch" unless replace_ids(updated, inverse) == original
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line endings changed" unless [
  updated.scan("\r\n".b).length,
  updated.scan(/(?<!\r)\n/n).length
] == [
  original.scan("\r\n".b).length,
  original.scan(/(?<!\r)\n/n).length
]
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] }.compact }
abort "row order changed" unless ids.call(updated) == ids.call(original)

File.binwrite(path, updated)
puts "pre=#{expected_before}"
puts "post=#{Digest::SHA256.hexdigest(updated)}"
puts "crlf=#{updated.scan("\r\n".b).length} bare_lf=#{updated.scan(/(?<!\r)\n/n).length} inverse/BOM/order=OK"
