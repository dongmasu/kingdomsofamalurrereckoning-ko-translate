#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "27cb13f3c6d4a047c560f9774c95fc01db40608d70bf8e1196144d3e7605c8d8"
backup = "/private/tmp/ko-translate-backups/20261012/before-rathir-shaft-sorrows-D19718/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(path)
abort "hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
edits = {
  17831 => [["라시어(Rathir)", "라시르(Rathir)"], ["라시어에", "라시르에"]],
  17908 => [["완벽한 미사란 탐욕의 샤프트", "흠 없는 미타란 탐식의 축"]],
  17966 => [["비탄의 집(House of Sorrows) 열쇠", "비탄의 힘(Sorrows)의 열쇠"]],
  18078 => [["미사루 신도들", "미타란족"]]
}
updated = source.dup
original = {}
edits.each do |id, replacements|
  row = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless row && source.scan(row).size == 1
  original[id] = row
  new_row = row.dup
  replacements.each do |from, to|
    abort "unexpected text #{id}: #{from}" unless new_row.scan(from.b).size == 1
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
