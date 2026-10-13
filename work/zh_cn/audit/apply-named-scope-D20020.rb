#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20020/locatexts_zh_cn.koalocatext_default.csv"
expected = "bab39bae1fac7460263397497338ec580f26d2ca6e0ad008d1477f7ce41e1d27"
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
    .select { |id| (47251..47300).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47251..47300).map(&:to_s)
end

edits = {
  47278 => ["티레라 장군".b, "틸레라 장군".b],
  47280 => [
    "여기 탈라레인에 남은 건 나와 동생 니암뿐이야.".b,
    "여기 탈라레인에 남은 건 나와 형제인 니암뿐이야.".b
  ],
  47294 => ["선택받은 자여".b, "부름받은 자여".b]
}
after = before.dup
edits.each do |id, (old_text, new_text)|
  row = after.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing or duplicate target #{id}" unless row && row[0].scan(old_text).length == 1
  after[row.begin(0)...row.end(0)] = row[0].sub(old_text, new_text)
end

inverse = after.dup
edits.each do |id, (old_text, new_text)|
  row = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse mismatch #{id}" unless row && row[0].scan(new_text).length == 1
  inverse[row.begin(0)...row.end(0)] = row[0].sub(new_text, old_text)
end
abort "non-target bytes or shape changed" unless
  inverse == before && shape.call(after) == original_shape

File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20020 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} " \
  "backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
