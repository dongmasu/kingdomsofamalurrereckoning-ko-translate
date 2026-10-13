#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "aad8ab120cf28e79cb3eab113877878c1e94a7f16ca59e7d95fa345f2b8133be"
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "BOM/ID order" unless original[0] && original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (43601..43650).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (43601..43650).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19947/locatexts_zh_cn.koalocatext_default.csv"
FileUtils.mkdir_p(File.dirname(backup))
File.binwrite(backup, source)
abort "backup mismatch" unless File.binread(backup) == source
replace = ->(b, from, to) {
  m = b.match(/^43612;.*?(?=^\d+;|\z)/nm)
  abort "target mismatch" unless m && m[0].scan(from.b).size == 1
  b[m.begin(0)...m.end(0)] = m[0].sub(from.b, to.b)
}
updated = source.dup
replace.call(updated, "아름답고 강력한 장궁을", "아름답고 강력한 롱보우를")
inverse = updated.dup
replace.call(inverse, "아름답고 강력한 롱보우를", "아름답고 강력한 장궁을")
abort "non-target/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "D-19947 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=43612 BOM/endings/IDs/locales/inverse=OK"
