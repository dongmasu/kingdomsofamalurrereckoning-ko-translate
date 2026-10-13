#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19902/locatexts_zh_cn.koalocatext_default.csv"
expected = "552a1bd1c84319e8f5b11b50dd5c61c80dde4f7af4c7aa19543789cae22eedd4"
edits = {
  41363 => ["선택받은 자여.".b, "부름받은 자여.".b],
  41364 => ["선택받은 자로군.".b, "부름받은 자로군.".b],
  41375 => ["에이단 엥가르가".b, "에이선 엥가르가".b],
  41380 => ["여행자단의 일원이 된 순간".b, "트래블러의 일원이 된 순간".b],
  41396 => ["콜로새".b, "콜로세".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41351..41400).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41351..41400).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41351..41400).map(&:to_s)
end
replace = lambda do |bytes, id, from, to|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless match && match[0].scan(from).size == 1
  bytes[match.begin(0)...match.end(0)] = match[0].sub(from, to)
end
updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
