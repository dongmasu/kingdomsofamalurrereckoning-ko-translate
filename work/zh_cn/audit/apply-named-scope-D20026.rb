#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20026/locatexts_zh_cn.koalocatext_default.csv"
expected = "e539f1141a7f89bfe1e2e3a85b31f6beb0f3a5ec6c20d24209656ede659b33e4"
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
    .select { |id| (47551..47600).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47551..47600).map(&:to_s)
end
edits = {
  47552 => ["달렌타스에서 전쟁을 일으키려는 거야?".b, "전쟁을 달렌타스로 끌어오려는 거야?".b],
  47565 => ["울음의 협곡".b, "위핑 협곡".b],
  47584 => ["티레라".b, "틸레라".b]
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
puts "D-20026 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
