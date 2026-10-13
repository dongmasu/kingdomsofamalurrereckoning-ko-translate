#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19908/locatexts_zh_cn.koalocatext_default.csv"
expected = "6b4e866f45ea12f49c58e71fbe328d3138667caa50a88750faf0193120e0cea2"
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41651..41700).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41651..41700).map(&:to_s)
end
from = "발로어의 챔피언이 된다.".b
to = "용맹의 챔피언이 된다.".b
row = source.match(/^41700;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan(from).size == 1
updated = source.dup
updated[row.begin(0)...row.end(0)] = row[0].sub(from, to)
abort "non-target bytes changed" unless updated.sub(to, from) == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=41700 inverse/BOM/endings/order/locale=OK"
