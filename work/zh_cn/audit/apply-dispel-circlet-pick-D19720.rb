#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "297d6fb273ac75ae456f62df80a1369d0cc8ae8e4911d8fe7c4cb2c73842f074"
backup = "/private/tmp/ko-translate-backups/20261012/before-dispel-circlet-pick-D19720/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
edits = {
  18736 => [["해제술은 아르카나 대학", "디스펠은 스콜리아 아르카나"]],
  18964 => [["아르케스의 관", "아르케스의 서클릿"]],
  18969 => [["'장인의 자물쇠 따개'", "'달인의 자물쇠따개(Master's Pick)'"]]
}
updated = source.dup
original = {}
edits.each do |id, replacements|
  row = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless row && source.scan(row).size == 1
  original[id] = row
  new_row = row.dup
  replacements.each do |from, to|
    abort "unexpected text #{id}" unless new_row.scan(from.b).size == 1
    new_row = new_row.sub(from.b, to.b)
  end
  updated = updated.sub(row, new_row)
end
reversed = updated.dup
edits.to_a.reverse_each do |id, replacements|
  row = original.fetch(id)
  new_row = replacements.reduce(row) { |s, (from, to)| s.sub(from.b, to.b) }
  reversed = reversed.sub(new_row, row)
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
