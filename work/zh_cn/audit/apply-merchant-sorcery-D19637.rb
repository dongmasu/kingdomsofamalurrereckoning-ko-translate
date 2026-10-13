#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-merchant-sorcery-D19637/locatexts_zh_cn.koalocatext_default.csv"
expected = "900b05a1d84b53b6737be974192f1596ea811b05e2a3b062d72fca97dd3eef6c"
changes = {
  5279 => ["의자 상인".b, "상인 대표".b],
  5285 => ["계시자(Hierophant)를 권좌에서 끌어내려 여행자들(Travelers)을".b,
           "대사제(Hierophant)를 권좌에서 끌어내려 트래블러(Travelers)를".b],
  5287 => ["주술 능력".b, "마법 능력".b]
}

def replace_ids(bytes, changes)
  found = []
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    before, after = changes.fetch(id)
    count = line.scan(before).size
    next line if count.zero?
    raise "duplicate at #{id}" unless count == 1
    found << id
    line.sub(before, after)
  end.join
  raise "missing/repeated target #{found.inspect}" unless found.sort == changes.keys.sort
  result
end

original = File.binread(path)
abort "unexpected source hash" unless Digest::SHA256.hexdigest(original) == expected
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
