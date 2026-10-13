#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-names-D19754/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "28657" => ["비탄의 가문(House of Sorrows)", "비탄의 집(House of Sorrows)"],
  "28666" => ["워스워른(Warsworn)", "워스원(Warsworn)"],
  "28680" => ["선 캠프(Sun Camp)", "태양 야영지(Sun Camp)"],
  "28686" => ["발라드 가문(House of Ballads)", "발라드의 집(House of Ballads)"],
  "28699" => ["28699;워스워른\r\n", "28699;워스원\r\n"]
}
result = source.dup
changes.each do |id, (before, after)|
  row = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n)
  abort "expected one row #{id}" unless row.size == 1
  old = row.fetch(0)
  abort "expected one phrase #{id}" unless old.scan(before.b).size == 1
  replacement = old.sub(before.b, after.b)
  abort "unexpected repeated row #{id}" unless result.scan(old).size == 1
  result = result.sub(old, replacement)
end
inverse = result.dup
changes.each do |id, (before, after)|
  old = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n).fetch(0)
  inverse = inverse.sub(old.sub(before.b, after.b), old)
end
abort "other bytes changed" unless inverse == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "line breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                  [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
