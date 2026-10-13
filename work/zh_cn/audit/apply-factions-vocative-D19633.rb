#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-factions-vocative-D19633/locatexts_zh_cn.koalocatext_default.csv"
expected = "5518aebc659c60587524d6296a3e0b55a521f8f3d94e7f08c952c71467e717ac"
changes = {
  5015 => ["잡담할 시간 없어, 아가씨!".b, "잡담할 시간 없어, 친구!".b],
  5074 => ["살아남은 여행자들은".b, "살아남은 트래블러(Travelers)는".b],
  5075 => ["서약방패가 된 이제야".b, "서약방패병이 된 이제야".b]
}

def replace_ids(bytes, changes)
  seen = []
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    old, new_text = changes.fetch(id)
    count = line.scan(old).length
    next line if count.zero?
    raise "multiple matches for #{id}" unless count == 1
    seen << id
    line.sub(old, new_text)
  end.join
  raise "missing or repeated rows: #{seen.inspect}" unless seen.sort == changes.keys.sort
  result
end

source = File.binread(path)
abort "pre-edit hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
result = replace_ids(source, changes)
abort "inverse differs" unless replace_ids(result, changes.transform_values { |a, b| [b, a] }) == source
abort "BOM differs" unless source.start_with?("\xEF\xBB\xBF".b) && result.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or ordered IDs differ" unless shape.call(result) == shape.call(source)
File.binwrite(path, result)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(result)} endings=[72011,73] inverse/BOM/order=OK"
