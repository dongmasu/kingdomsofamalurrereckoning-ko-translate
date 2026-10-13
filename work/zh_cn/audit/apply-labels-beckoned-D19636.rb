#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-labels-beckoned-D19636/locatexts_zh_cn.koalocatext_default.csv"
expected = "889fe639b3635291585e158b3a482e529149fad9a6fd1aecb339f77e8688f0df"
changes = {
  5246 => ["골동품상이라고도 불리는".b, "유물 수집가라고도 불리는".b],
  5247 => ["세 번째 다리".b, "세 번째 구간".b],
  5251 => ["간택받은 자와 사이퍼를".b, "부름받은 자와 사이퍼를".b]
}

def replace_ids(bytes, changes)
  found = []
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    old, replacement = changes.fetch(id)
    count = line.scan(old).size
    next line if count.zero?
    raise "duplicate fragment at #{id}" unless count == 1
    found << id
    line.sub(old, replacement)
  end.join
  raise "missing or repeated IDs #{found.inspect}" unless found.sort == changes.keys.sort
  result
end

original = File.binread(path)
abort "unexpected pre-edit hash" unless Digest::SHA256.hexdigest(original) == expected
abort "backup differs" unless File.binread(backup) == original
updated = replace_ids(original, changes)
abort "inverse differs" unless replace_ids(updated, changes.transform_values { |a, b| [b, a] }) == original
abort "BOM differs" unless original.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "endings or ID order differ" unless shape.call(original) == shape.call(updated)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
