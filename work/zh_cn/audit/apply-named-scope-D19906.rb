#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19906/locatexts_zh_cn.koalocatext_default.csv"
expected = "df62dde322976ae9d4a98d16fd3677509ea37326af59531526de5da2e455fd1d"
edits = {
  41563 => ["에이단 엥가르 처치".b, "에이선 엥가르 처치".b],
  41573 => ["여행자단".b, "트래블러".b],
  41574 => ["금·구리 합금 반지다.".b, "금과 구리로 만든 반지다.".b],
  41577 => ["콜로새의 프리모스다.".b, "콜로세의 프리모스다.".b],
  41585 => ["그 자손은 훔친 칭호를".b, "그 사이온은 훔친 칭호를".b],
  41593 => ["손대지 않은 계급.".b, "불가촉 계급.".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41551..41600).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41551..41600).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41551..41600).map(&:to_s)
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
