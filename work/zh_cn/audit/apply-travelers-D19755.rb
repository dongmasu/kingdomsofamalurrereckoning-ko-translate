#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-travelers-D19755/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
changes = {
  "28702" => ["여행자들(Travelers)", "트래블러(Travelers)"],
  "28709" => [
    "여행자들의 본거지, 선 캠프(Sun Camp)",
    "트래블러의 본거지, 태양 야영지(Sun Camp)",
    "장인의 곡괭이(Master's Pick)",
    "달인의 자물쇠따개(Master's Pick)"
  ],
  "28739" => ["밀서(Missives)", "세이블 서신(Missives)"]
}
result = source.dup
changes.each do |id, pairs|
  rows = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n)
  abort "expected one row #{id}" unless rows.size == 1
  old_row = rows.fetch(0)
  new_row = old_row.dup
  pairs.each_slice(2) do |from, to|
    abort "wrong phrase count #{id}" unless new_row.scan(from.b).size == 1
    new_row = new_row.sub(from.b, to.b)
  end
  abort "repeated target row #{id}" unless result.scan(old_row).size == 1
  result = result.sub(old_row, new_row)
end
inverse = result.dup
changes.each do |id, pairs|
  old_row = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n).fetch(0)
  new_row = old_row.dup
  pairs.each_slice(2) { |from, to| new_row = new_row.sub(from.b, to.b) }
  inverse = inverse.sub(new_row, old_row)
end
abort "other bytes changed" unless inverse == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "line breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                  [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
