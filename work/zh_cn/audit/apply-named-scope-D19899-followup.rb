#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19899-followup/locatexts_zh_cn.koalocatext_default.csv"
expected = "b74c7cd3864606e0355c1a7e84ebc83b9b44f552758fac191a47c77fa8225884"
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
before = "이사께 감사하라, 살아남았구나.".b
after = "이사께 감사해야겠군, 살아남았구나.".b
row = source.match(/^41210;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan(before).size == 1
updated = source.dup
updated[row.begin(0)...row.end(0)] = row[0].sub(before, after)
abort "non-target bytes changed" unless updated.sub(after, before) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "shape changed" unless shape.call(source) == shape.call(updated) && shape.call(updated).last == (0..65134).map(&:to_s)
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} inverse/BOM/endings/order=OK"
