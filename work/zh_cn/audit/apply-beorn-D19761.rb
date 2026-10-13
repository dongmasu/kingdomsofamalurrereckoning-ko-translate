#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-beorn-D19761/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "28981" => ["정말 아름답군!", "정말 멋지군!"],
  "28991" => [
    "여기서 나가기만 하면 스네이크테일(Snaketail)에 있는 비오른(Beorn)을 찾아낼 거야. 날 소매치기한 대가를 치르게 해주지.",
    "여기서 나가기만 하면 사람들이 스네이크테일(Snaketail)에서 비오른(Beorn)을 발견하게 될 거야. 날 붙잡아 가둔 대가를 치르게 해주지."
  ]
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
