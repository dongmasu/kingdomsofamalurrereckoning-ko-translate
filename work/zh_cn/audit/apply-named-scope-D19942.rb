#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "b2b0eed7a29b540f7838d70d3603aa62c7bb28b24ce63345db9605ac9315e717"
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "BOM/ID order" unless original[0] && original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (43351..43400).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (43351..43400).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19942/locatexts_zh_cn.koalocatext_default.csv"
FileUtils.mkdir_p(File.dirname(backup))
File.binwrite(backup, source)
abort "backup mismatch" unless File.binread(backup) == source
replace = ->(b, from, to) {
  m = b.match(/^43395;.*?(?=^\d+;|\z)/nm)
  abort "target mismatch" unless m && m[0].scan(from.b).size == 1
  b[m.begin(0)...m.end(0)] = m[0].sub(from.b, to.b)
}
updated = source.dup
replace.call(updated, "이 멸망한 미사란 도시는", "이 멸망한 미타란 도시는")
inverse = updated.dup
replace.call(inverse, "이 멸망한 미타란 도시는", "이 멸망한 미사란 도시는")
abort "non-target/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "D-19942 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=43395 BOM/endings/IDs/locales/inverse=OK"
