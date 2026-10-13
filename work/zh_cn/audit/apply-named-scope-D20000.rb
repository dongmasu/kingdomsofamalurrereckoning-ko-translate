#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20000/locatexts_zh_cn.koalocatext_default.csv"
expected = "a276c95015d4b98855a0e5354d077dba16eea5a63ed58868216f6a447ba0d070"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (46251..46300).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (46251..46300).map(&:to_s)
end
edits = { 46276 => ["점술가는 널 신경 쓰지 않아.".b, "오거는 널 신경 쓰지 않아.".b] }
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
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-20000 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
