#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-context-D19767/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
expected = "5a2fa29fc9ff11e55a14213b8b42993763e8bdd1ab8bb23abf1c3a3b0ede1013"
abort "unexpected backup hash" unless Digest::SHA256.hexdigest(source) == expected
abort "active differs from backup" unless File.binread(path) == source

changes = [
  ["29214;산란지\r\n".b, "29214;산란 웅덩이\r\n".b],
  ["29222;오드월드 바이노타스(Odwald Bynothas)의 딸이자 에올프릭 에디싱(Eolfric Edithing)의 아내인 헤라 에디싱(Hera Edithing)이 여기 잠들다. 야수에게 쓰러졌으니, 권위단(Authority)의 법도에 따라 미사루(Mitharu)께서 그녀를 위로하시길. 1490년.\r\n".b,
   "29222;오드월드 바이노타스(Odwald Bynothas)의 딸이자 에올프릭 에디싱(Eolfric Edithing)의 아내인 헤라 에디싱(Hera Edithing)이 여기 잠들다. 야수에게 쓰러졌으니, 권능(Authority)의 질서에 따라 미사루(Mitharu)께서 그녀를 위로하시길. 1490년.\r\n".b],
  ["29226;발라드 가문(House of Ballads)\r\n".b,
   "29226;발라드의 집(House of Ballads)\r\n".b],
  ["29238;이딜라(Idylla)\r\n".b, "29238;이디라(Idylla)\r\n".b]
]

result = source.dup
changes.each do |old_text, new_text|
  abort "expected one source match: #{old_text}" unless result.scan(old_text).size == 1
  result = result.sub(old_text, new_text)
end

inverse = result.dup
changes.reverse_each do |old_text, new_text|
  abort "expected one result match: #{new_text}" unless inverse.scan(new_text).size == 1
  inverse = inverse.sub(new_text, old_text)
end
abort "inverse mismatch" unless inverse == source
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "line-ending counts changed" unless
  [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
  [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
abort "record order/count changed" unless
  source.scan(/^\d+;/n) == result.scan(/^\d+;/n)

File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "before=#{Digest::SHA256.hexdigest(source)}"
puts "active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
