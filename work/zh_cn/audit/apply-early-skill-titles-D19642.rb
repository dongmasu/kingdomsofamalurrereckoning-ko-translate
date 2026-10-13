#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-skill-titles-D19642/locatexts_zh_cn.koalocatext_default.csv"
expected = "67c5c702d1b5064bf60390731f378876f627dcf8a821cc71cdc83a854cd7339f"
changes = {
  5548 => ["바레스(Bareth)의 시련을".b, "바레스(Bareth)의 실험을".b],
  5551 => ["슬픔과 먼지의 여왕".b, "슬픔과 먼지의 여인".b],
  5576 => ["숨겨진 것 탐지 기술에".b, "숨겨진 물건 찾기 기술에".b],
  5577 => ["프라이토리안에게".b, "프레토리안에게".b]
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
    raise "duplicate fragment at #{id}" unless count == 1
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
abort "line endings or ordered IDs differ" unless shape.call(original) == shape.call(updated)
File.binwrite(path, updated)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(updated)} endings=[72011,73] inverse/BOM/order=OK"
