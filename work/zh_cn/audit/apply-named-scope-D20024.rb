#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20024/locatexts_zh_cn.koalocatext_default.csv"
expected = "adbc41905d25590f6d7b84aa1383746b86fc47ade39d0bfa526454967ff29900"
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
    .select { |id| (47451..47500).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47451..47500).map(&:to_s)
end
edits = {
  47451 => ["페이들이 숲을 평온하게 다스리던 때는".b, "페이들이 숲을 평온하게 만들었을 때는".b],
  47455 => ["한동안 여자 꽁무니 쫓기를 멈추고".b, "한동안 추파를 던지던 것도 멈추고".b],
  47469 => ["하지만 난 가지 않을 거야.".b, "하지만 나라면 거긴 가지 않겠어.".b],
  47493 => ["지금까지 워스원은 아무것도 하지 않았어.".b, "지금까지 워스원은 손 하나 까딱하지 않았어.".b]
}
after = before.dup
edits.each do |id, (old_text, new_text)|
  row = after.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless row && row[0].scan(old_text).length == 1
  after[row.begin(0)...row.end(0)] = row[0].sub(old_text, new_text)
end
inverse = after.dup
edits.each do |id, (old_text, new_text)|
  row = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse target mismatch #{id}" unless row && row[0].scan(new_text).length == 1
  inverse[row.begin(0)...row.end(0)] = row[0].sub(new_text, old_text)
end
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original_shape
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20024 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
