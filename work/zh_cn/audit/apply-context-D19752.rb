#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-context-D19752/locatexts_zh_cn.koalocatext_default.csv"
source = File.binread(backup)
abort "active differs from backup" unless File.binread(path) == source
abort "missing BOM" unless source.start_with?("\xEF\xBB\xBF".b)

changes = {
  "28554" => [
    "그에게서 질서에 가입하려면",
    "그에게서 스콜리아 아르카나에 가입하려면"
  ],
  "28561" => [
    "나와 같은 영혼, 나처럼 음악의 뮤즈를 따르는 사람들을",
    "나처럼 음악의 뮤즈를 따르는, 뜻이 통하는 사람들을"
  ],
  "28588" => [
    "물품 목록을 조금 손볼 수밖에 없었어",
    "재고를 조금 손볼 수밖에 없었어"
  ]
}

result = source.dup
changes.each do |id, (old_text, new_text)|
  pattern = /(?<=\n)#{id};[^\r\n]*\r\n/n
  old_row = source.scan(pattern)
  abort "expected exactly one record for #{id}" unless old_row.size == 1
  old_row = old_row.fetch(0)
  abort "old phrase missing or duplicated for #{id}" unless old_row.scan(old_text.b).size == 1
  new_row = old_row.sub(old_text.b, new_text.b)
  abort "changed another record for #{id}" unless result.scan(old_row).size == 1
  result = result.sub(old_row, new_row)
end
abort "BOM changed" unless result.start_with?("\xEF\xBB\xBF".b)
abort "break counts changed" unless [source.scan(/\r\n/n).size, source.scan(/(?<!\r)\n/n).size] ==
                                   [result.scan(/\r\n/n).size, result.scan(/(?<!\r)\n/n).size]
reversed = result.dup
changes.each do |id, (old_text, new_text)|
  old_row = source.scan(/(?<=\n)#{id};[^\r\n]*\r\n/n).fetch(0)
  new_row = old_row.sub(old_text.b, new_text.b)
  reversed = reversed.sub(new_row, old_row)
end
abort "other bytes changed" unless reversed == source
File.binwrite(path, result)
abort "write mismatch" unless File.binread(path) == result
puts "backup=#{Digest::SHA256.hexdigest(source)} active=#{Digest::SHA256.hexdigest(result)}"
puts "CRLF=#{result.scan(/\r\n/n).size} bareLF=#{result.scan(/(?<!\r)\n/n).size}"
