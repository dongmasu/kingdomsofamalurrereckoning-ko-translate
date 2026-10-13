#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-names-D19759/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "28878" => ["고대 리안셰(Meathgra)를", "미스그라(Meathgra)라는 고대 리안셰를"],
  "28892" => ["완벽한 미타란 장갑 안감", "흠 없는 미타란 방호 안감"]
}
result = source.dup
changes.each do |id, (from, to)|
  rows = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n)
  abort "expected one row #{id}" unless rows.size == 1
  row = rows.fetch(0)
  abort "expected one phrase #{id}" unless row.scan(from.b).size == 1
  abort "repeated row #{id}" unless result.scan(row).size == 1
  result = result.sub(row, row.sub(from.b, to.b))
end
inverse = result.dup
changes.each do |id, (from, to)|
  row = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n).fetch(0)
  inverse = inverse.sub(row.sub(from.b, to.b), row)
end
abort "other bytes changed" unless inverse == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "break counts changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                   [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
