#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-hospitalis-D19744/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

old = "28207;아데사 인간 상인들에게 병원 구역(Hospitalis Quarters)에 기부하도록 하는 임무를 완수할 수 없었다.\r\n".b
new_text = "28207;아데사 인간 상인들에게 병동 구역(Hospitalis Quarters)에 기부하도록 하는 임무를 완수할 수 없었다.\r\n".b
abort "not exactly one target" unless source.scan(old).length == 1
result = source.sub(old, new_text)
abort "inverse mismatch" unless result.sub(new_text, old) == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
