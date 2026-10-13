#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "46fcf4cc52ca2efaeab632198665bbb5c2c301eddf7861ef0693e23e2de21e9c"
backup = "/private/tmp/ko-translate-backups/20261012/before-lore-terms-D19709/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected

edits = {
  16337 => ["불꽃의 결절점", "화염 집중 지대"],
  16339 => ["갤로우스 엔드(Gallows End)", "갤로스 엔드(Gallows End)"],
  16349 => ["베렌", "벨렌"],
  16371 => ["여행자들", "트래블러"]
}
rows = source.scan(/^(?:\xEF\xBB\xBF)?\d+;.*?(?=^(?:\xEF\xBB\xBF)?\d+;|\z)/nm)
abort "row count changed in source" unless rows.size == 65_135
updated = source.dup
edits.each do |id, (from, to)|
  matches = rows.select { |row| row.start_with?("#{id};".b) }
  abort "missing or duplicate ID #{id}" unless matches.size == 1
  row = matches.first
  count = id == 16349 ? 2 : 1
  abort "unexpected occurrence count #{id}" unless row.scan(from.b).size == count
  target = row.gsub(from.b, to.b)
  abort "unexpected row substitution #{id}" unless updated.scan(row).size == 1
  updated = updated.sub(row, target)
end
reversed = updated.dup
edits.to_a.reverse_each do |id, (from, to)|
  old = rows.find { |row| row.start_with?("#{id};".b) }
  reversed = reversed.sub(old.gsub(from.b, to.b), old)
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
