#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19907/locatexts_zh_cn.koalocatext_default.csv"
expected = "f286c79efe917d231105c3502d02ac3c9c5ba17c15c58bad8339bafeb8839868"
edits = {
  41625 => ["투아사 장군을 한 명도 놓쳐선 안 돼.".b, "투아사 장군 한 명을 놓쳐선 안 돼.".b],
  41640 => ["무운다운에서 철수하라고".b, "문다운에서 철수하라고".b],
  41641 => ["맹세방패를 수없이 봤어.".b, "서약방패병을 수없이 봤어.".b],
  41650 => ["그 방법으로 자물쇠를 열 수 있다고 생각했지.".b, "그 방법으로 픽을 풀어낼 수 있다고 생각했지.".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41601..41650).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41601..41650).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41601..41650).map(&:to_s)
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
