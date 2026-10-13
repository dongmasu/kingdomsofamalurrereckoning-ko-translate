#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "60a5f8034813625509e6591f74863d8219b703f4002131ff826a17dba9861bc4"
backup = "/private/tmp/ko-translate-backups/20261012/before-four-lore-terms-D19721/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
edits = {
  19047 => ["콜로세족을 돕기 위해", "콜로사이를 돕기 위해"],
  19076 => ["라시르 프라이더리에 있는", "라시르 프라이데리에 있는"],
  19136 => ["미타라 사람들은", "미타란족은"],
  19173 => ["세이블의 서신을 훔칠", "세이블의 서신(Missives of Sable)을 훔칠"]
}
updated = source.dup
original = {}
edits.each do |id, (from, to)|
  row = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless row && source.scan(row).size == 1
  abort "unexpected text #{id}" unless row.scan(from.b).size == 1
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
