#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-lore-terms-D19634/locatexts_zh_cn.koalocatext_default.csv"
expected = "4536ca47838182a666da6c496089df3332775e327b0e874eb8b96e93ee96d5a6"
changes = {
  5098 => ["간택받은 자".b, "부름받은 자".b, 2],
  5111 => ["난 자선을 구걸할 처지는 아니지만".b, "난 자선을 받을 생각은 없지만".b, 1],
  5136 => ["스키온(Scion)".b, "사이온(Scion)".b, 1],
  5145 => ["여행자들".b, "트래블러(Travelers)".b, 1]
}

def replace_ids(bytes, changes)
  counts = Hash.new(0)
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)

    before, after, = changes.fetch(id)
    matches = line.scan(before).size
    counts[id] += matches
    line.gsub(before, after)
  end.join
  expected_counts = changes.transform_values { |_, _, count| count }
  raise "unexpected target counts #{counts.inspect}" unless counts == expected_counts
  result
end

original = File.binread(path)
abort "source hash differs" unless Digest::SHA256.hexdigest(original) == expected
abort "backup differs" unless File.binread(backup) == original
updated = replace_ids(original, changes)
reverse = changes.transform_values { |a, b, count| [b, a, count] }
abort "inverse differs" unless replace_ids(updated, reverse) == original
abort "BOM differs" unless original.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or ID order differs" unless shape.call(updated) == shape.call(original)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
