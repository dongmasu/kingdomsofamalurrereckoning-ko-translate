#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "2bdbbe2e0c57c059ab4ab9f2c89adc7dd5d4d49e57e76b759d8e9edf60eb42ba"
backup = "/private/tmp/ko-translate-backups/20261012/before-sorrows-teeth-gallows-D19714/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
edits = {
  16729 => ["비탄의 집 사람들을 찾아야 해. 다말록(Damalroc)에 사는 페이 둘, 장로들만 그들이 어디 있는지 알아.", "비탄의 힘(Sorrows)을 찾아야 해. 다말록(Damalroc)에 사는 페이 둘, 장로들만 그 힘이 어디 있는지 알아."],
  16730 => ["갈로우스 엔드(Gallows End)", "갤로스 엔드(Gallows End)"],
  16764 => ["이빨 산맥", "나로스의 이빨"]
}
updated = source.dup
original = {}
edits.each do |id, (from, to)|
  row = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless row && source.scan(row).size == 1
  count = id == 16764 ? 2 : 1
  abort "unexpected occurrence count #{id}" unless row.scan(from.b).size == count
  original[id] = row
  updated = updated.sub(row, row.gsub(from.b, to.b))
end
reversed = updated.dup
edits.to_a.reverse_each do |id, (from, to)|
  row = original.fetch(id)
  reversed = reversed.sub(row.gsub(from.b, to.b), row)
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
