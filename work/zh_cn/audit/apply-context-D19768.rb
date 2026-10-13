#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-context-D19768/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
expected = "e5481e69a2147d6e45833253ab7459d8d7eacb51465367d4a8fc2546fc349e56"
abort "unexpected backup hash" unless Digest::SHA256.hexdigest(source) == expected
abort "active differs from backup" unless File.binread(path) == source

changes = [
  ["29265;여기 있는 워스워른에게 물어보는 게 어때?".b,
   "29265;여기 있는 워스원(Warsworn)에게 물어보는 게 어때?".b],
  ["29282;히페리온 사원 탈출하기".b,
   "29282;하이페리언 사원 탈출하기".b],
  ["29288;죽은 켈(Dead Kel)과 대면하기".b,
   "29288;데드 켈(Dead Kel)과 대면하기".b],
  ["동료 운명술사가 죽은 뒤".b,
   "동료 페이트위버(Fateweaver)가 죽은 뒤".b],
  ["29297;콜로새(Kollossae)".b,
   "29297;콜로사이(Kollossae)".b],
  ["29302;시종".b, "29302;수련자".b],
  ["29315;곱하기".b, "29315;숫자 키패드 * 키".b],
  ["야생 페이의 부패를 알리러".b,
   "야생 페이의 쇠퇴를 알리러".b],
  ["강력한 운명술사야".b,
   "강력한 페이트위버(Fateweaver)야".b],
  ["29350;콜름(Colm)은 전투에서 다쳐 스스로 치료할 수 없다. 상급 치유 물약을 찾거나 주변 재료로 연금술을 사용해 만들어야 한다. 콜름은 자기 배낭에 물약이 있다고 했으니 근처 어딘가에 있을 것이다.".b,
   "29350;콜름(Colm)은 전투에서 다쳐 스스로 치료할 수 없다. 대형 치유 물약을 찾거나 주변 재료로 연금술을 사용해 만들어야 한다. 콜름은 자기 배낭에 물약이 있다고 했으니 근처 어딘가에 있을 것이다.".b],
  ["62662;상급 치유 물약을 구해 콜름(Colm)을 치료할 수 있게 됐다. 글래스필러 동굴(Glasspillar Caves) 어딘가를 헤매는 그를 찾아야겠다.".b,
   "62662;대형 치유 물약을 구해 콜름(Colm)을 치료할 수 있게 됐다. 글래스필러 동굴(Glasspillar Caves) 어딘가를 헤매는 그를 찾아야겠다.".b]
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
