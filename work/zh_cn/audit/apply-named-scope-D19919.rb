#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "f4600269dcc4db5af14b499a0dc2b6cbcd1c371d4ed710d1610d68f20cfd8178"
edits = {
  42216 => ["로살파르와 함께", "료스알브와 함께"],
  42223 => ["그 늙은 운명술사가", "그 늙은 페이트위버가"],
  42227 => ["여행자들이 운영하는 곳이야.", "트래블러가 운영하는 곳이야."],
  42234 => ["미사란 흑단 화염 장부", "미타란 흑단 화염 장부"],
  42238 => ["42238;보기트 격투장", "42238;보가트 격투장"]
}
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order" unless original.last == (0..65134).map(&:to_s)
abort "scope mismatch" unless edits.keys.all? { |id| (42201..42250).cover?(id) }
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (42201..42250).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (42201..42250).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19919/locatexts_zh_cn.koalocatext_default.csv"
FileUtils.mkdir_p(File.dirname(backup))
File.binwrite(backup, source)
abort "backup mismatch" unless File.binread(backup) == source
replace = ->(b, id, from, to) {
  m = b.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless m && m[0].scan(from.b).size == 1
  b[m.begin(0)...m.end(0)] = m[0].sub(from.b, to.b)
}
updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "D-19919 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
