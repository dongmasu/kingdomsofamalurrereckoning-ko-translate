#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-titles-D19632/locatexts_zh_cn.koalocatext_default.csv"
expected = "a2f3b3121a8f70d8b659a2553a74cc88f1afeaab985cbb303691222bdf385100"
changes = {
  4930 => ["서약 방패.".b, "서약방패병.".b],
  4934 => ["굴착자들(Delvers)".b, "탐구자들(Delvers)".b],
  4980 => ["세 바람 협곡의 재앙(Bane of Three Winds Crutch)".b,
           "세 바람의 갈림길의 재앙(Bane of Three Winds Crutch)".b]
}

def replace_ids(bytes, changes)
  found = []
  current_id = nil
  result = bytes.lines.map do |line|
    current_id = line[/\A(\d+);/n, 1]&.to_i || current_id
    next line unless changes.key?(current_id)

    before, after = changes.fetch(current_id)
    matches = line.scan(before).length
    next line if matches.zero?
    raise "duplicate target at #{current_id}" unless matches == 1

    found << current_id
    line.sub(before, after)
  end.join
  raise "missing or repeated target: #{found.inspect}" unless found.sort == changes.keys.sort
  result
end

original = File.binread(path)
abort "unexpected source hash" unless Digest::SHA256.hexdigest(original) == expected
abort "backup differs" unless File.binread(backup) == original
updated = replace_ids(original, changes)
inverse = changes.transform_values { |before, after| [after, before] }
abort "inverse differs" unless replace_ids(updated, inverse) == original
abort "BOM differs" unless original.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings differ" unless endings.call(updated) == endings.call(original)
ids = ->(bytes) { bytes.lines.map { |line| line[/\A(\d+);/n, 1] }.compact }
abort "row order differs" unless ids.call(updated) == ids.call(original)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=#{endings.call(updated).inspect} inverse/BOM/order=OK"
