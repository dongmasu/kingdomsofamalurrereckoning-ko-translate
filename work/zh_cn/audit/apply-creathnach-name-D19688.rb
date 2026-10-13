#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "46fa12187700312a890abb123721cd72d6b07b9332373a6a7a2111c6dd381c69"
backup = "/private/tmp/ko-translate-backups/20261012/before-creathnach-name-D19688/locatexts_zh_cn.koalocatext_default.csv"
old_text = "크레아스나크 틴트리".b
new_text = "크리스나크 틴트리".b

source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected_sha

records = {}
current_id = nil
record = +"".b
source.each_line do |line|
  row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
  if row_id
    records[current_id] = record if current_id
    current_id = row_id
    record = line.dup
  elsif current_id
    record << line
  end
end
records[current_id] = record if current_id

row = records.fetch(58499)
abort "expected one old place spelling" unless row.scan(old_text).size == 1
updated_row = row.sub(old_text, new_text)
updated = source.sub(row, updated_row)
abort "inverse reconstruction failed" unless updated.sub(updated_row, row) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line endings changed" unless
  [source.scan("\r\n".b).size, source.scan(/(?<!\r)\n/n).size] ==
  [updated.scan("\r\n".b).size, updated.scan(/(?<!\r)\n/n).size]
abort "row order or IDs changed" unless records.keys == updated.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.map(&:to_i)

FileUtils.mkdir_p(File.dirname(backup))
if File.exist?(backup)
  abort "existing backup differs" unless File.binread(backup) == source
else
  File.binwrite(backup, source)
end
abort "backup is not byte-identical" unless File.binread(backup) == source

File.binwrite(path, updated)
puts "ID 58499: #{old_text} -> #{new_text}"
puts "pre=#{expected_sha} post=#{Digest::SHA256.hexdigest(updated)}"
puts "backup=#{backup} inverse/BOM/mixed-endings/order/other-bytes=OK"
