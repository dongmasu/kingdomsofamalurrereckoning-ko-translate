#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-traveler-mitharu-D19765/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "29109" => ["선 캠프(Sun Camp)", "태양 야영지(Sun Camp)"],
  "29112" => ["세인트 오드윅의 영구 선교원", "성 오드윅의 영구 선교원"],
  "29119" => ["여행자들은", "트래블러들은"],
  "29142" => ["워스워른(Warsworn)", "워스원(Warsworn)"],
  "29146" => ["아니면 싸우다 죽든가", "아니면 죽을 때까지 해 보든가"]
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
