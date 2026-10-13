#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19845/locatexts_zh_cn.koalocatext_default.csv"
expected = "ac7a388338969aaf0dcae17c1e036a56318cd23084491c69f2b95061732709f5"
id = 36958
before = "에센".b
after = "에테네".b

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
before_shape = shape.call(source)
abort "unexpected IDs" unless before_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (36951..37050).all? { |row_id| source.match(/^#{row_id};/n) }

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

match = source.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "target row missing" unless match
row = match[0]
abort "target not unique" unless row.scan(before).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = row.sub(before, after)
match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "inverse mismatch" unless match && match[0].scan(after).length == 1
inverse = updated.dup
inverse[match.begin(0)...match.end(0)] = match[0].sub(after, before)
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/IDs changed" unless shape.call(updated) == before_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/IDs=OK"
