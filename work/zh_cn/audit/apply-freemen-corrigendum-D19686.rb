#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "1900a910d13e5c800b022437487c4c778e0c4d71237c05505c27658ebc9c3464"
backup = "/private/tmp/ko-translate-backups/20261012/before-freemen-corrigendum-D19686/locatexts_zh_cn.koalocatext_default.csv"
old_text = "자유민(Freemen)".b
new_text = "프리맨(Freemen)".b

source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
rows = source.scan(/^55162;[^\r\n]*/n)
abort "expected one ID 55162 row" unless rows.size == 1 && rows.first.scan(old_text).size == 1
old_row = rows.first
new_row = old_row.sub(old_text, new_text)
updated = source.sub(old_row, new_row)
abort "inverse failed" unless updated.sub(new_row, old_row) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line ending counts changed" unless
  [source.scan("\r\n".b).size, source.scan(/(?<!\r)\n/n).size] ==
  [updated.scan("\r\n".b).size, updated.scan(/(?<!\r)\n/n).size]

FileUtils.mkdir_p(File.dirname(backup))
File.binwrite(backup, source)
abort "backup mismatch" unless File.binread(backup) == source
File.binwrite(path, updated)
puts "id=55162 old=#{old_text} new=#{new_text}"
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup}"
puts "inverse/BOM/mixed_endings/other_bytes=OK"
