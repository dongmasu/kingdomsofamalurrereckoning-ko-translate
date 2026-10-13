#!/usr/bin/env ruby
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19753/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs from backup" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)
old_row = "28644;워스워른(Warsworn)의 헌신적인 창설자들…… 에라시(Erathi)의 신비한 마법…… 운명을 받아들이기로 한 선택…… 뭐, 그런 이야기지.\r\n".b
new_row = old_row.sub("워스워른".b, "워스원".b)
abort "expected one record" unless source.scan(old_row).size == 1
result = source.sub(old_row, new_row)
abort "inverse mismatch" unless result.sub(new_row, old_row) == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
