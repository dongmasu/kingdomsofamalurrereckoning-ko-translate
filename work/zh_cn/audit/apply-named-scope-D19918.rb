#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "0bd6d2ce7f66c8fa439c4ea9789a516ee0c5012a19b9c45a086bdfef1fa5b15c"
edits = {
  42151 => ["라시어 감옥에서도", "라시르 감옥에서도"],
  42159 => ["라시어 리리아 사원의", "라시르 리리아 사원의"],
  42171 => ["애더사의 경계 안에서", "아데사의 경계 안에서"],
  42177 => ["보급관이 자기 부하들한테 투덜대는 소리나", "보급관이 자기 처지를 한탄하는 소리나"],
  42187 => ["아포티어도 다시 살아날 거야.", "아포타이어도 다시 살아날 거야."],
  42194 => ["아가씨는 기묘한 수정으로", "윈더미어의 시녀는 기묘한 수정으로"]
}
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order" unless original.last == (0..65134).map(&:to_s)
abort "scope mismatch" unless edits.keys.all? { |id| (42151..42200).cover?(id) }
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (42151..42200).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (42151..42200).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19918/locatexts_zh_cn.koalocatext_default.csv"
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
puts "D-19918 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
