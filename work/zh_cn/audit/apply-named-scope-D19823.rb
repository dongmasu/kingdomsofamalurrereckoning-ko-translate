#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19823/locatexts_zh_cn.koalocatext_default.csv"
expected = "d50f34bc99f0aa6e8069a82ed30a0c7829a17d802be2421f7a6019be27c5a9f7"
old = "가드플로가 그 성스러운 곳를 더럽혔을 거야.".b
replacement = "가드플로가 그 성스러운 곳을 더럽혔을 거야.".b
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
match = source.match(/^34817;.*?(?=^\d+;|\z)/nm)
abort "row 34817 missing" unless match
row = match[0]
abort "fragment missing or duplicated" unless row.scan(old).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = row.sub(old, replacement)
abort "other bytes changed" unless updated.sub(replacement, old) == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length, bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=34817 inverse/BOM/endings/order=OK"
