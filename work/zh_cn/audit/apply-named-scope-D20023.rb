#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20023/locatexts_zh_cn.koalocatext_default.csv"
expected = "5572185cd25c357887dc44fde4af7b4d28a23c605d9cec2a27536db66a9ee3ff"
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
    .select { |id| (47401..47450).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47401..47450).map(&:to_s)
end

# Cross-scope follow-up triggered by the Star Camp form at ID 47407.
row = before.match(/^47330;(.*?)(?=^\d+;|\z)/nm)
abort "follow-up target mismatch" unless row && row[1] == "스타 야영지\r\n".b
after = before.dup
after[row.begin(1)...row.end(1)] = "별 야영지\r\n".b
inverse = after.dup
new_row = inverse.match(/^47330;(.*?)(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless new_row && new_row[1] == "별 야영지\r\n".b
inverse[new_row.begin(1)...new_row.end(1)] = row[1]
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20023 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} followup=47330 BOM/endings/IDs/locales/inverse=OK"
