#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "c71a8293fd7d14a013e97df2b141da35b7dc2e2bd8c03ae0342c38c485df3b9b"
edits = {
  42355 => ["플레지실드라고?", "서약방패병이라고?"],
  42373 => ["하우스 오브 시즌스에", "계절의 집에"],
  42375 => ["아포티어를 장악하는", "아포타이어를 장악하는"],
  42377 => ["용병 렌디그를 찾아.", "고용병 렌디그를 찾아."],
  42383 => ["플레지실드 이상을 위한", "서약방패병 이상을 위한"],
  42388 => ["조툰과 콜로새 사이에", "조툰과 콜로세 사이에"],
  42399 => ["42399;대 콜로새", "42399;대 콜로세"]
}
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order" unless original.last == (0..65134).map(&:to_s)
abort "scope mismatch" unless edits.keys.all? { |id| (42351..42400).cover?(id) }
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (42351..42400).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (42351..42400).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19922/locatexts_zh_cn.koalocatext_default.csv"
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
puts "D-19922 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
