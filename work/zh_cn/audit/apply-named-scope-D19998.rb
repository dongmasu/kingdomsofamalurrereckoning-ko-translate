#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19998/locatexts_zh_cn.koalocatext_default.csv"
expected = "0dc0de91daadf4d8d87e6a548b08282d0db3f57c6047bafa6cf5466c36e7ffca"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]

%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (46151..46200).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (46151..46200).map(&:to_s)
end

edits = {
  46160 => ["테스타먼트(Testament)".b, "벨렌의 테스타먼트(Testament)".b],
  46185 => ["아르카나 학술원에서".b, "스콜리아 아르카나에서".b]
}

after = before.dup
edits.each do |id, (old_text, new_text)|
  row = after.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing or duplicate row #{id}" unless row && row[0].scan(old_text).length == 1
  after[row.begin(0)...row.end(0)] = row[0].sub(old_text, new_text)
end

inverse = after.dup
edits.each do |id, (old_text, new_text)|
  row = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse target mismatch #{id}" unless row && row[0].scan(new_text).length == 1
  inverse[row.begin(0)...row.end(0)] = row[0].sub(new_text, old_text)
end
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original

File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-19998 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
