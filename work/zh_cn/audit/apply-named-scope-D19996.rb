#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19996/locatexts_zh_cn.koalocatext_default.csv"
expected = "f1b71b5af399c08768b3917bf48521f0a80cea2c3b733652705db65c20d66a9e"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]

%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (46051..46100).cover?(id.to_i) }
  abort "locale misalignment: #{locale}" unless ids == (46051..46100).map(&:to_s)
end

row = before.match(/^46051;.*?(?=^\d+;|\z)/nm)
old_text = "라시어의 통치 평의회".b
new_text = "라시르의 통치 평의회".b
abort "target mismatch" unless row && row[0].scan(old_text).length == 1

after = before.dup
after[row.begin(0)...row.end(0)] = row[0].sub(old_text, new_text)
inverse = after.dup
revised = inverse.match(/^46051;.*?(?=^\d+;|\z)/nm)
abort "inverse target mismatch" unless revised && revised[0].scan(new_text).length == 1
inverse[revised.begin(0)...revised.end(0)] = revised[0].sub(new_text, old_text)
abort "non-target bytes or shape changed" unless inverse == before && shape.call(after) == original

File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-19996 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=46051 BOM/endings/IDs/locales/inverse=OK"
