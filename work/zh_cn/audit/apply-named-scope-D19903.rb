#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19903/locatexts_zh_cn.koalocatext_default.csv"
expected = "2237a60420c86af33aff5f07d0cc36113c39b20c81cd316cacda8ab4a52bef47"
edits = {
  41412 => ["콜로새".b, "콜로세".b, 2],
  41432 => ["교훈은, 원하는 대가를 조심해서 흥정하라는 거야.".b, "교훈은, 거래로 얻으려는 것을 조심하라는 거야.".b, 1],
  41439 => ["아가씨의 군대".b, "시녀의 군대".b, 1]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41401..41450).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41401..41450).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41401..41450).map(&:to_s)
end
replace = lambda do |bytes, id, from, to, count|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless match && match[0].scan(from).size == count
  bytes[match.begin(0)...match.end(0)] = match[0].gsub(from, to)
end
updated = source.dup
edits.each { |id, (from, to, count)| replace.call(updated, id, from, to, count) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to, count)| replace.call(inverse, id, to, from, count) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
