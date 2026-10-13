#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19979/locatexts_zh_cn.koalocatext_default.csv"
expected = "9bf2027fcd77bb4053cd5cc83407d62ec3398cb0aba2dfb91f455dd9b5205ff2"
edits = {
  45201 => ["마을 사람들은 내가 몇 달 전에 이 섬에 왔다고 하더군... 이 성가신 혹 때문인가 봐.",
            "마을 사람들 말로는 내가 몇 달 전에 이 섬에 왔다더군... 머리에 난 이 고약한 혹 때문에 기억이 나지 않아."],
  45237 => ["제대로 찾아왔군, 노움!", "제대로 된 노움을 찾아왔군!"]
}
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45201..45250).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45201..45250).map(&:to_s)
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
puts "D-19979 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
