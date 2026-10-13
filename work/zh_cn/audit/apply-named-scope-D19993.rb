#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19993/locatexts_zh_cn.koalocatext_default.csv"
expected = "caf7261d7d767a44bb4747f83924e7cc54797e9417e158980656ddbdd3fe6055"
edits = {
  45938 => ["첫 맹세자들의 전당", "첫서약자 전당"],
  45944 => ["어두운 라시어에서", "어두운 라시르에서"],
  45947 => ["히에로판트", "대사제"]
}
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45901..45950).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45901..45950).map(&:to_s)
end
change = ->(bytes, id, from, to) {
  row = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless row && row[0].scan(from.b).length == 1
  bytes[row.begin(0)...row.end(0)] = row[0].sub(from.b, to.b)
}
after = before.dup
edits.each { |id, (from, to)| change.call(after, id, from, to) }
inverse = after.dup
edits.to_a.reverse_each { |id, (from, to)| change.call(inverse, id, to, from) }
abort "non-target or shape changed" unless inverse == before && shape.call(after) == original
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-19993 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
