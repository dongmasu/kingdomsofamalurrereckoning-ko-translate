#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-letter-D19746/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "backup differs" unless source == File.binread(path)
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

start = source.index("28301;\"빈서".b)
stop = source.index(/\r?\n28302;/n, start || 0)
abort "missing target record" unless start && stop
record = source.byteslice(start, stop - start)
old = "아래에는 동료인 마노이즈(Manoise) 학자와 탄세스(Tancese) 성전기사의 지위 덕분에 저지르고도 용서받은 죄를 시간순으로 적었어요.".b
new_text = "아래에는 동료인 마노이즈(Manoise) 학자들과 높으신 탄세스(Tancese) 성전기사가 제게 저지르고도 묵인받은 죄를 시간순으로 적었어요.".b
abort "not exactly one target clause" unless record.scan(old).size == 1 && source.scan(old).size == 1
result = source.sub(old, new_text)
abort "inverse mismatch" unless result.sub(new_text, old) == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "record breaks changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                    [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
File.binwrite(path, result)
abort "on-disk mismatch" unless Digest::SHA256.file(path).hexdigest == Digest::SHA256.hexdigest(result)
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bare_LF=#{result.scan(/(?<!\r)\n/n).size}"
