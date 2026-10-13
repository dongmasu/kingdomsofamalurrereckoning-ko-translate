#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20033/locatexts_zh_cn.koalocatext_default.csv"
expected = "6dc54bd935826b443133ff6b633fb5b971f73298ce0083dcdeea543e293ed2af"
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
    .select { |id| (47901..47950).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47901..47950).map(&:to_s)
end
row = before.match(/^47937;(.*?)(?=^\d+;|\z)/nm)
old_text = "선택받은 자라고? 내 선입견이... 틀렸던 모양이군. 하지만 여전히 그대의 신성한 도움이 필요하오. 역병이 퍼지고 있소!".b
new_text = "부름받은 자라고? 내 선입견이... 틀렸던 모양이군. 하지만 여전히 그대의 신성한 도움이 필요하오. 역병이 퍼지고 있소!".b
abort "target mismatch" unless row && row[1] == old_text + "\r\n".b
after = before.dup
after[row.begin(1)...row.end(1)] = new_text + "\r\n".b
inverse = after.dup
new_row = inverse.match(/^47937;(.*?)(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless new_row && new_row[1] == new_text + "\r\n".b
inverse[new_row.begin(1)...new_row.end(1)] = old_text + "\r\n".b
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20033 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=47937 BOM/endings/IDs/locales/inverse=OK"
