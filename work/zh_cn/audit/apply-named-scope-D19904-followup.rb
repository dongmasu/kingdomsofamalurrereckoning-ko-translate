#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19904-followup/locatexts_zh_cn.koalocatext_default.csv"
expected = "f089b9b20ec723707fbaa9bda398ce3078cedebc54e19c011125991f2657aa3d"
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
from = "우리 가문은 서로 증오했지만".b
to = "우리 두 가문은 서로 증오했지만".b
row = source.match(/^41451;.*?(?=^\d+;|\z)/nm)
abort "target mismatch" unless row && row[0].scan(from).size == 1
updated = source.dup
updated[row.begin(0)...row.end(0)] = row[0].sub(from, to)
abort "non-target bytes changed" unless updated.sub(to, from) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "shape changed" unless shape.call(source) == shape.call(updated) && shape.call(updated).last == (0..65134).map(&:to_s)
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} inverse/BOM/endings/order=OK"
