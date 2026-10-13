#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-faction-terms-D19639/locatexts_zh_cn.koalocatext_default.csv"
expected = "0fc9315c91bc6e7b9f9fd8748796f5ef2cb3d4134cf2714d62126fecbda74052"
changes = {
  5357 => ["별 야영지(Star Camp)의 여행자".b, "별 야영지(Star Camp)의 트래블러".b],
  5379 => ["간택받은 자여.".b, "부름받은 자여.".b],
  5389 => ["계시자의 성소".b, "대사제의 성소".b]
}

def replace_ids(bytes, changes)
  seen = []
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    old, replacement = changes.fetch(id)
    count = line.scan(old).size
    next line if count.zero?
    raise "duplicate at #{id}" unless count == 1
    seen << id
    line.sub(old, replacement)
  end.join
  raise "missing or repeated IDs #{seen.inspect}" unless seen.sort == changes.keys.sort
  result
end

original = File.binread(path)
abort "unexpected hash" unless Digest::SHA256.hexdigest(original) == expected
abort "backup differs" unless File.binread(backup) == original
updated = replace_ids(original, changes)
abort "inverse differs" unless replace_ids(updated, changes.transform_values { |a, b| [b, a] }) == original
abort "BOM differs" unless original.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or ordered IDs differ" unless shape.call(original) == shape.call(updated)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
