#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19987/locatexts_zh_cn.koalocatext_default.csv"
expected = "2435b38213162fd1231c1f69d24ed3cffeb136cc0fe262de74a062412fca1ff5"
edits = {
  45615 => ["라시어를", "라시르를"],
  45616 => ["‘선택받은 자’", "‘부름받은 자’"],
  45621 => ["갈로우스 엔드", "갤로우즈 엔드"],
  45623 => ["라시어(Rathir)", "라시르(Rathir)"]
}
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45601..45650).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45601..45650).map(&:to_s)
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
puts "D-19987 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
