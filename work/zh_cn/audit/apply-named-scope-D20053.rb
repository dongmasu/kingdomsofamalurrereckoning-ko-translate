#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20053/locatexts_zh_cn.koalocatext_default.csv"
expected = "2edb915874fb114972cd2ed4787ef9019c0bb3d386c031249cbfc74de7a3e564"
old = "난 가야겠어. 가서 앉아 쉬어.".b
replacement = "난 가서 앉아 좀 쉬어야겠어.".b
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
match = source.match(/^48903;.*?(?=^\d+;|\z)/mn)
abort "row missing or fragment duplicated" unless match && match[0].scan(old).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
inverse = updated.dup
match = inverse.match(/^48903;.*?(?=^\d+;|\z)/mn)
abort "inverse target missing" unless match && match[0].scan(replacement).length == 1
inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (48901..48950).all? { |id| updated.match(/^#{id};/n) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=48903 inverse/BOM/endings/order=OK"
