#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19848/locatexts_zh_cn.koalocatext_default.csv"
expected = "de82409e28958906892fba968c0e40e6ccb6cba90cb3f7a85db92a623a51d637"
edits = {37273 => ["발라드의 전당", "발라드의 집"],
         37274 => ["라시어 성문", "라시르 성문"],
         37306 => ["여행자 한 명", "트래블러 한 명"],
         37309 => ["라시어를 통치", "라시르를 통치"],
         37323 => ["마법 해제 기술", "디스펠 기술"],
         37332 => ["여행자를 처음", "트래블러를 처음"],
         37345 => ["완벽한 미타란", "흠 없는 미타란"]}

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
before_shape = shape.call(source)
abort "unexpected ID order" unless before_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (37251..37350).all? { |id| source.match(/^#{id};/n) }

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, (before, after)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "text not unique #{id}" unless row.scan(before.b).size == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end
inverse = updated.dup
edits.each do |id, (before, after)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text not unique #{id}" unless row.scan(after.b).size == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/order=OK"
