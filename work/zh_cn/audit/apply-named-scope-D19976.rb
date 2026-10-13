#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19976/locatexts_zh_cn.koalocatext_default.csv"
expected = "95e3a8205fcf84397877167931344e2eabfe8628f1e134a1a8248140de032804"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45051..45100).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45051..45100).map(&:to_s)
end
row = before.match(/^45064;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan("망자 켈".b).length == 1
after = before.dup
after[row.begin(0)...row.end(0)] = row[0].sub("망자 켈".b, "데드 켈".b)
inverse = after.dup
revised = after.match(/^45064;.*?(?=^\d+;|\z)/nm)
inverse[revised.begin(0)...revised.end(0)] = revised[0].sub("데드 켈".b, "망자 켈".b)
abort "non-target or shape changed" unless inverse == before && shape.call(after) == original
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-19976 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=45064 BOM/endings/IDs/locales/inverse=OK"
