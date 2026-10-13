#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19861/locatexts_zh_cn.koalocatext_default.csv"
expected = "51f8e220cd7618b3a15b9aa6a852c7924352a2db006077e6be04da9a5c36ef64"
edits = [
  [38564, "완벽한 미사루의", "흠 없는 미타란"],
  [38596, "전투에서 한 번도 쓰이지 않았다.", "전투에서 한 번도 착용한 적이 없다."],
  [38617, "해제 기술을 일시적으로", "디스펠 기술을 일시적으로"]
]

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
original_shape = shape.call(source)
abort "unexpected ID order" unless original_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (38551..38650).all? { |id| source.match(/^#{id};/n) }

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, before, after|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "text not unique #{id}" unless row.scan(before.b).size == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end
inverse = updated.dup
edits.reverse_each do |id, before, after|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text not unique #{id}" unless row.scan(after.b).size == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.map(&:first).uniq.join(',')} inverse/BOM/endings/order=OK"
