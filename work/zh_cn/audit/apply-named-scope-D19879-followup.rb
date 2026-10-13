#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19879-followup/locatexts_zh_cn.koalocatext_default.csv"
expected = "61de4d7fc9674fcab0cb53ab6874c566bab499b4aeaa03dbbf4763c38c94c4f3"
id = 40246
abort "outside D-19879" unless (40201..40250).cover?(id)
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
FileUtils.mkdir_p(File.dirname(backup))
abort "backup differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source
match = source.match(/^#{id};.*?(?=^\d+;|\z)/nm)
before = "비탄의 집의 유배된 왕자".b
after = "비탄의 집에서 추방된 왕자".b
abort "nonunique text" unless match && match[0].scan(before).size == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] = match[0].sub(before, after)
inverse = updated.dup
inverse_match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
inverse[inverse_match.begin(0)...inverse_match.end(0)] = inverse_match[0].sub(after, before)
abort "non-target bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "shape changed" unless shape.call(source) == shape.call(updated)
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/order=OK"
