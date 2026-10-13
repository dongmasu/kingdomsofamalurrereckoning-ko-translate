#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-early-places-D19640/locatexts_zh_cn.koalocatext_default.csv"
expected = "aa11ed1620ca93b988f839c8daa83c6b57fa66561935a47f076ae22118c7ccdc"
before = File.binread(path)
abort "unexpected source" unless Digest::SHA256.hexdigest(before) == expected
abort "backup differs" unless File.binread(backup) == before
id = nil
count = 0
after = before.lines.map do |line|
  id = line[/\A(\d+);/n, 1]&.to_i || id
  next line unless id == 5450
  old = "간택받은 자여,".b
  found = line.scan(old).size
  count += found
  line.sub(old, "부름받은 자여,".b)
end.join
abort "wrong target count" unless count == 1
reverse_id = nil
reversed = after.lines.map do |line|
  reverse_id = line[/\A(\d+);/n, 1]&.to_i || reverse_id
  reverse_id == 5450 ? line.sub("부름받은 자여,".b, "간택받은 자여,".b) : line
end.join
abort "inverse differs" unless reversed == before
abort "BOM differs" unless before.start_with?("\xEF\xBB\xBF".b) && after.start_with?("\xEF\xBB\xBF".b)
shape = ->(data) {
  [data.scan("\r\n".b).size, data.scan(/(?<!\r)\n/n).size,
   data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or row order differ" unless shape.call(before) == shape.call(after)
File.binwrite(path, after)
puts "before=#{expected} after=#{Digest::SHA256.hexdigest(after)} endings=[72011,73] inverse/BOM/order=OK"
