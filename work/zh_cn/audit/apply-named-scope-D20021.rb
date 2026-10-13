#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20021/locatexts_zh_cn.koalocatext_default.csv"
expected = "d0f65573fb2b8fe21fb0ee3f41168897d7eff7598e8a690e12cf7eb528ce40fc"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected
abort "backup mismatch" unless File.binread(backup) == before

shape = ->(bytes) {
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
}
original_shape = shape.call(before)
abort "original shape mismatch" unless original_shape ==
  [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
    .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
    .select { |id| (47301..47350).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47301..47350).map(&:to_s)
end

row = before.match(/^47325;(.*?)(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[1] == "가문의 문장?\r\n".b
after = before.dup
after[row.begin(1)...row.end(1)] = "가문의 무기?\r\n".b
inverse = after.dup
new_row = inverse.match(/^47325;(.*?)(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless new_row && new_row[1] == "가문의 무기?\r\n".b
inverse[new_row.begin(1)...new_row.end(1)] = row[1]
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20021 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=47325 BOM/endings/IDs/locales/inverse=OK"
