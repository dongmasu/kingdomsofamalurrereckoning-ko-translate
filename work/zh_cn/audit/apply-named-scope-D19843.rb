#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19843/locatexts_zh_cn.koalocatext_default.csv"
expected = "5bc06ff8239fc7a679bd9ce8c1b152a0d2086a8fa2ed021589e05987a4f2cb14"
edits = {36751 => ["라시어", "라시르"],
         36763 => ["갤로우즈 엔드", "갤로우스 엔드"],
         36778 => ["갤로스 엔드", "갤로우스 엔드"]}

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
before_shape = shape.call(source)
abort "unexpected IDs" unless before_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (36751..36850).all? { |id| source.match(/^#{id};/n) }

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, (before, after)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "text not unique #{id}" unless row.scan(before.b).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end

inverse = updated.dup
edits.each do |id, (before, after)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text not unique #{id}" unless row.scan(after.b).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/IDs changed" unless shape.call(updated) == before_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/IDs=OK"
