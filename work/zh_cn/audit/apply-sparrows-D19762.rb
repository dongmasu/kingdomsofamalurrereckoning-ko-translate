#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-sparrows-D19762/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
old_row = "29022;라프(Raf)도 죽었다고? 오, 루날라(Lunala)여. 참새들(Sparrows)이 하나씩 살해당할 셈인가?\r\n".b
new_row = old_row.sub("참새들(Sparrows)".b, "참새단(Sparrows)".b)
abort "expected one exact row" unless source.scan(old_row).size == 1
result = source.sub(old_row, new_row)
abort "inverse mismatch" unless result.sub(new_row, old_row) == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "break counts changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                   [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
