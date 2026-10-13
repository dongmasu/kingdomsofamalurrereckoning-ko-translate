#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20031/locatexts_zh_cn.koalocatext_default.csv"
expected = "6ba64460f0ea1b9c038988b839d0fd10efee762b24a42eb8655939dc2c94e7b6"
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
    .select { |id| (47801..47850).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47801..47850).map(&:to_s)
end
row = before.match(/^47810;(.*?)(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[1] == "해야 할 일이 아직 많아, 선택받은 자여... 하지만 네 덕분에 이제 길이 보여.\r\n".b
after = before.dup
after[row.begin(1)...row.end(1)] = "해야 할 일이 아직 많아, 부름받은 자여... 하지만 네 덕분에 이제 길이 보여.\r\n".b
inverse = after.dup
new_row = inverse.match(/^47810;(.*?)(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless new_row && new_row[1] == "해야 할 일이 아직 많아, 부름받은 자여... 하지만 네 덕분에 이제 길이 보여.\r\n".b
inverse[new_row.begin(1)...new_row.end(1)] = row[1]
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20031 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=47810 BOM/endings/IDs/locales/inverse=OK"
