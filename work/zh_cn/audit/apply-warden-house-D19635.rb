#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-warden-house-D19635/locatexts_zh_cn.koalocatext_default.csv"
expected = "1e0b2203afc9a121d00b79eded54b7a663664a99babb148b9c27c5592c50f070"
changes = {
  5160 => ["고어하트(Gorhart)의 간수야. 형편없는 간수지만.".b,
           "고어하트(Gorhart)의 관리관이야. 형편없는 관리관이지만.".b],
  5165 => ["너희 같은 종족이".b, "너희 같은 이들이".b],
  5171 => ["슬픔의 집(House of Sorrows)".b, "비탄의 집(House of Sorrows)".b],
  5195 => ["집안의 고난을".b, "우리 집단이 겪는 고난을".b]
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
    raise "repeated fragment at #{id}" unless count == 1
    seen << id
    line.sub(old, replacement)
  end.join
  raise "missing or repeated IDs #{seen.inspect}" unless seen.sort == changes.keys.sort
  result
end

before = File.binread(path)
abort "unexpected source hash" unless Digest::SHA256.hexdigest(before) == expected
abort "backup differs" unless File.binread(backup) == before
after = replace_ids(before, changes)
abort "inverse differs" unless replace_ids(after, changes.transform_values { |old, replacement| [replacement, old] }) == before
abort "BOM differs" unless before.start_with?("\xEF\xBB\xBF".b) && after.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or row order differ" unless shape.call(before) == shape.call(after)
File.binwrite(path, after)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(after)} endings=[72011,73] inverse/BOM/order=OK"
