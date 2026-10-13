#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19846/locatexts_zh_cn.koalocatext_default.csv"
expected = "6c7d7447bf7a5ee0d8699881c0df5730c2e6d8b192229ac4ab5273a08b42d1fa"
edits = {
  37063 => [
    "산사태로 산이 무너져 내린 뒤 발견된 이 섬뜩한 물체를 구조대원들은",
    "이 섬뜩한 물체는 거대한 산사태가 일어난 뒤 발견되었다. 구조대원들은"
  ],
  37076 => ["미타루께", "미사루께"],
  37123 => ["라시어 지부", "라시르 지부"],
  37124 => ["라시어의", "라시르의"]
}

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
abort "scope missing" unless (37051..37150).all? { |id| source.match(/^#{id};/n) }

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
