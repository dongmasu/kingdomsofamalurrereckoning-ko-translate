#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-hierophant-travelers-D19638/locatexts_zh_cn.koalocatext_default.csv"
expected = "586fe82ef2c206457822f01d2f05772d92172dcec174df60e09272e1589b481f"
changes = {
  5324 => ["여행자들의 익명의 후원자인 계시자(Hierophant)".b,
           "트래블러(Travelers)의 익명의 후원자인 대사제(Hierophant)".b],
  5325 => ["아가씨! 게다가 여행자들을".b,
           "친구! 게다가 트래블러(Travelers)를".b]
}

def replace_ids(bytes, changes)
  found = []
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    old, replacement = changes.fetch(id)
    matches = line.scan(old).size
    next line if matches.zero?
    raise "duplicate fragment at #{id}" unless matches == 1
    found << id
    line.sub(old, replacement)
  end.join
  raise "missing/repeated ID #{found.inspect}" unless found.sort == changes.keys.sort
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
abort "line endings or ID order differ" unless shape.call(original) == shape.call(updated)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
