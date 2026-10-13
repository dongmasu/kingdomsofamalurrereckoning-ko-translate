#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-context-D19758/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "28806" => ["추종자들을 흥분시키고 있어", "추종자들을 광분하게 만들고 있어"],
  "28808" => ["게다가 숫자도 너무 적지", "게다가 너희에겐 장점도 별로 없지"],
  "28839" => ["스승을 잃은 견습공", "스승 없는 견습공"],
  "28841" => ["섬세한 홀", "섬세한 셉터"],
  "28842" => ["요즘 잘나간다는 신참이 너냐", "요즘 잘나간다는 풋내기가 너냐"],
  "28849" => ["성에서 보이는 곳까지 왔을 뿐인데", "성이 눈에 들어오자마자"]
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
