#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "3d23f71fbb5935e465542e1529f72b0d86634aaa349c2a8035a4ca6b97de8411"
backup = "/private/tmp/ko-translate-backups/20261012/before-choice-gnome-eventide-D19710/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
edits = {
  16396 => ["내가 널 고르면 어쩔 건데?", "내가 널 선택한다면?"],
  16432 => ["노움들의 타락", "그 노움의 타락"],
  16459 => ["이브닝타이드(Eventide)", "이븐타이드(Eventide)"]
}
updated = source.dup
original = {}
edits.each do |id, (from, to)|
  row = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless row && source.scan(row).size == 1
  abort "unexpected original text #{id}" unless row.scan(from.b).size == 1
  original[id] = row
  updated = updated.sub(row, row.sub(from.b, to.b))
end
reversed = updated.dup
edits.to_a.reverse_each do |id, (from, to)|
  row = original.fetch(id)
  reversed = reversed.sub(row.sub(from.b, to.b), row)
end
abort "inverse mismatch" unless reversed == source
abort "BOM mismatch" unless source.start_with?("\xEF\xBB\xBF".b) && updated.start_with?("\xEF\xBB\xBF".b)
endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings mismatch" unless endings.call(source) == endings.call(updated)
ids = ->(bytes) { bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten }
abort "row order mismatch" unless ids.call(source) == ids.call(updated)
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup mismatch" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == source
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "ids=#{edits.keys.join(",")} pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} endings=#{endings.call(updated)} inverse/order/BOM=OK"
