#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20032/locatexts_zh_cn.koalocatext_default.csv"
expected = "1e4dc24f1dbd39766555d8d724b78fbb4bc78c8ac72c8b59e51c7c78435d662f"
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
    .select { |id| (47851..47900).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47851..47900).map(&:to_s)
end
row = before.match(/^47857;(.*?)(?=^\d+;|\z)/nm)
old_text = "이딜라에 온 걸 환영해요, 선택받은 자여. 저희가 느끼는 것처럼 이곳이 당신에게도 눈부시게 아름답길 바랍니다.".b
new_text = "이딜라에 온 걸 환영해요, 부름받은 자여. 저희가 느끼는 것처럼 이곳이 당신에게도 눈부시게 아름답길 바랍니다.".b
abort "target mismatch" unless row && row[1] == old_text + "\r\n".b
after = before.dup
after[row.begin(1)...row.end(1)] = new_text + "\r\n".b
inverse = after.dup
new_row = inverse.match(/^47857;(.*?)(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless new_row && new_row[1] == new_text + "\r\n".b
inverse[new_row.begin(1)...new_row.end(1)] = old_text + "\r\n".b
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20032 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=47857 BOM/endings/IDs/locales/inverse=OK"
