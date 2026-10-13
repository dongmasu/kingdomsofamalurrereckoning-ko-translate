#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19988/locatexts_zh_cn.koalocatext_default.csv"
expected = "f511239bcd45a8fa03043d9b58b7223d7dbf39edd337460fded03b7402ecf5cb"
edits = { 45682 => ["갓플로가", "가드플로가"], 45698 => ["티레라 장군", "틸레라 장군"] }
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45651..45700).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45651..45700).map(&:to_s)
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
puts "D-19988 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
