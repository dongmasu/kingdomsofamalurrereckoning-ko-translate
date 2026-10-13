#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20077/locatexts_zh_cn.koalocatext_default.csv"
expected = "416d64a96eb62a0114e4ff04184f090a906fd6ed502da4dc41ac2a198d22a198"
old, replacement = ["선택받은 자와 암호문을", "선택받은 자와 사이퍼(Cipher)를"].map(&:b)
source = File.binread(path)
abort "active or backup differs" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
m = source.match(/^50144;.*?(?=^\d+;|\z)/nm)
abort "row/fragment missing or duplicated" unless m && m[0].scan(old).length == 1
updated = source.dup
updated[m.begin(0)...m.end(0)] = m[0].sub(old, replacement)
back = updated.match(/^50144;.*?(?=^\d+;|\z)/nm)
abort "other bytes changed" unless back && back[0].scan(replacement).length == 1 &&
  updated.dup.tap { |s| s[back.begin(0)...back.end(0)] = back[0].sub(replacement, old) } == source
shape = lambda { |s| [s.start_with?("\xEF\xBB\xBF".b), s.scan("\r\n".b).length,
                       s.scan(/(?<!\r)\n/n).length, s.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "structure differs" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[-1] == (0..65134).map(&:to_s) &&
  (50101..50150).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=50144 inverse/BOM/endings/order=OK"
