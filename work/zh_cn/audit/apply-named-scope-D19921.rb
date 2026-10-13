#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "510a4653366c82a11747a5f7ebeaeee32c90332c1adce7a849e3d1be87fb67c9"
edits = {
  42308 => ["이딜라가 이보다 더 경이로워질 수는 없다고 생각했어. 하지만 하이페리온이", "이디라가 이보다 더 경이로워질 수는 없다고 생각했어. 하지만 히페리안이"],
  42330 => ["동쪽의 라시어로 계속 가는 게", "동쪽의 라시르로 계속 가는 게"]
}
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order" unless original.last == (0..65134).map(&:to_s)
abort "scope mismatch" unless edits.keys.all? { |id| (42301..42350).cover?(id) }
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (42301..42350).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (42301..42350).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19921/locatexts_zh_cn.koalocatext_default.csv"
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
puts "D-19921 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
