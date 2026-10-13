#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19776/locatexts_zh_cn.koalocatext_default.csv"
expected = "7b7979bef442aa9d089447b269639e127285d1673cc95dd9d5f4a876c667a4ab"
source = File.binread(backup)
abort "unexpected backup hash" unless Digest::SHA256.hexdigest(source) == expected
abort "active differs from backup" unless File.binread(path) == source

old = "윈드미어의 수호자는".b
replacement = "윈더미어의 수호자는".b
records = []
current_id = nil
record = +"".b
prefix = +"".b
source.each_line do |line|
  id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
  if id
    records << [current_id, record] if current_id
    current_id = id
    record = line.dup
  elsif current_id
    record << line
  else
    prefix << line
  end
end
records << [current_id, record] if current_id

seen = false
result = prefix + records.map do |id, bytes|
  next bytes unless id == 30080
  abort "duplicate ID 30080" if seen
  abort "expected one old term at ID 30080" unless bytes.scan(old).size == 1
  seen = true
  bytes.sub(old, replacement)
end.join
abort "ID 30080 not found" unless seen

inverse = result.sub(replacement, old)
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
puts "edited_id=30080"
