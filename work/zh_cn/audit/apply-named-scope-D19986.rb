#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19986/locatexts_zh_cn.koalocatext_default.csv"
expected = "42e578bec7696b6fb4825e72af4be64813eea31a63fbfc62caea51a32aa9af8a"
before = File.binread(path)
abort "pre-edit mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).length,
                 b.scan(/(?<!\r)\n/n).length, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(before)
abort "original shape mismatch" unless original == [true, 72011, 73, (0..65134).map(&:to_s)]
%w[en_us ja_jp zh_cn].each do |locale|
  ids = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
            .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45551..45600).cover?(id.to_i) }
  abort "locale misalignment" unless ids == (45551..45600).map(&:to_s)
end
row = before.match(/^45600;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan("라시어(Rathir)".b).length == 1
after = before.dup
after[row.begin(0)...row.end(0)] = row[0].sub("라시어(Rathir)".b, "라시르(Rathir)".b)
inverse = after.dup
revised = after.match(/^45600;.*?(?=^\d+;|\z)/nm)
inverse[revised.begin(0)...revised.end(0)] = revised[0].sub("라시르(Rathir)".b, "라시어(Rathir)".b)
abort "non-target or shape changed" unless inverse == before && shape.call(after) == original
File.binwrite(path, after)
abort "write mismatch" unless File.binread(path) == after
puts "D-19986 pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} target=45600 BOM/endings/IDs/locales/inverse=OK"
