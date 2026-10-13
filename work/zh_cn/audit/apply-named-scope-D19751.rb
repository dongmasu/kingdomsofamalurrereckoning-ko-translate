#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19751/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

old = "28530;위대한 왕의 아들이자 워스워른(Warsworn)의 시초인 이곤(Eagonn) 왕자는 기록된 역사상 가장 강대한 악마 사냥꾼 중 하나였다.\r\n".b
new_text = "28530;위대한 왕의 아들이자 워스원(Warsworn)의 시초인 이곤(Eagonn) 왕자는 기록된 역사상 가장 강대한 악마 사냥꾼 중 하나였다.\r\n".b
abort "not exactly one target" unless source.scan(old).size == 1
result = source.sub(old, new_text)
abort "inverse mismatch" unless result.sub(new_text, old) == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
