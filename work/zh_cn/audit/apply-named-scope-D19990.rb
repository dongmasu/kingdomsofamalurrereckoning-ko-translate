#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19990/locatexts_zh_cn.koalocatext_default.csv"
expected = "2bc82db8fbefb9e2dc89a1519bf7c55517dbb7028a818d60d0ec1319bb8bbd00"
edits = {
  45761 => ["현지 상인들에게 네 물건값을 깎아 주라고 해 둘게.", "현지 상인들이 네게 할인을 해 주도록 해 둘게."],
  45789 => ["다음 경기가 시작되기 전까지 살 시간이 얼마 없는데", "다음 경기가 시작되기까지 시간이 얼마 없는데"]
}
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45751..45800).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45751..45800).map(&:to_s)
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
puts "D-19990 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
