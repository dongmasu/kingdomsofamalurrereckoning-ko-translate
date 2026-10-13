#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-sorrows-hierophant-D19641/locatexts_zh_cn.koalocatext_default.csv"
expected = "415e925983ef2ea66ef1641eb7b51cbd03bd80ed296b87ca1612234a60881c35"
changes = {
  5491 => ["슬픔의 집(Sorrows)".b, "비탄의 힘(Sorrows)".b],
  5519 => ["계시자(Hierophant)".b, "대사제(Hierophant)".b]
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
  raise "missing/repeated IDs #{seen.inspect}" unless seen.sort == changes.keys.sort
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
abort "line endings or ID order differ" unless shape.call(original) == shape.call(updated)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
