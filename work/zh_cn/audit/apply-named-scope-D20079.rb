#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20079/locatexts_zh_cn.koalocatext_default.csv"
expected = "1184e4350e0f562ead2972b269f8215e32ce8b222af7fcb5a6c89cd788c48cd4"
old, replacement = ["이젠 나도 다른 노동자처럼 살지.", "이젠 나도 여느 꾀죄죄한 노동자처럼 살지."].map(&:b)
source = File.binread(path)
abort "active or backup differs" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
m = source.match(/^50228;.*?(?=^\d+;|\z)/nm)
abort "row/fragment missing or duplicated" unless m && m[0].scan(old).length == 1
updated = source.dup
updated[m.begin(0)...m.end(0)] = m[0].sub(old, replacement)
back = updated.match(/^50228;.*?(?=^\d+;|\z)/nm)
abort "other bytes changed" unless back && back[0].scan(replacement).length == 1 &&
  updated.dup.tap { |s| s[back.begin(0)...back.end(0)] = back[0].sub(replacement, old) } == source
shape = lambda { |s| [s.start_with?("\xEF\xBB\xBF".b), s.scan("\r\n".b).length,
                       s.scan(/(?<!\r)\n/n).length, s.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "structure differs" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[-1] == (0..65134).map(&:to_s) &&
  (50201..50250).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=50228 inverse/BOM/endings/order=OK"
