#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19995/locatexts_zh_cn.koalocatext_default.csv"
expected = "a8ab3e69bb68482d2540579bd45ecb4711f5e968d6da9574627c7e0b825f15d5"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]

%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (46001..46050).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (46001..46050).map(&:to_s)
end

edits = {
  46005 => ["코리아리아 스케이스".b, "코리알리아 스케이스".b],
  46008 => ["라시어 지부".b, "라시르 지부".b],
  46013 => ["빅토리 게임 이번 라운드".b, "빅토리 게임의 이번 라운드".b],
  46018 => ["위오드가 이 말돌".b, "웨오드가 이 발화석".b],
  46027 => ["물건을 거두러 왔어".b, "거두러 왔어".b],
  46036 => ["선택받은 자여".b, "부름받은 자여".b]
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
puts "D-19995 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
