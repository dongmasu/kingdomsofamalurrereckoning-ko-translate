#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20025/locatexts_zh_cn.koalocatext_default.csv"
expected = "5b639b6142ed656a28eb1f24999c5e0be0eb379f5a2776a60b5252bbfad6427d"
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
    .select { |id| (47501..47550).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (47501..47550).map(&:to_s)
end
edits = {
  47518 => ["발러 투기장".b, "용맹 투기장".b],
  47526 => [
    "아름다운 옛 도시 라시르에서, 아무것도 변하지 않을 거라 믿는 바보인 척하며 지냈어.".b,
    "아름다운 옛 도시 라시어에서, 바보처럼 아무것도 변하지 않을 거라 믿으며 지냈어.".b
  ],
  47531 => ["라시르".b, "라시어".b],
  47542 => ["멜 센시르에서 휴가를 보내고 라시르로 돌아가던 중".b,
            "멜 센시르에서 휴가를 보내고 라시어로 돌아가던 중".b]
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
puts "D-20025 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
