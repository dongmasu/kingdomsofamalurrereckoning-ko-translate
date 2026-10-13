#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20065/locatexts_zh_cn.koalocatext_default.csv"
expected = "1509596287a9a374644427d91aff8b6c6c3d8709de07c11f6e5c0413bab115be"
id = 49514
old = "워스워른".b
replacement = "워스원".b

def records_by_id(bytes)
  result = {}
  id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      result[id] = record if id
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  result[id] = record if id
  result
end

original = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(original) == expected
abort "backup differs" unless File.binread(backup) == original
before_rows = records_by_id(original)
row = before_rows.fetch(id)
abort "target text mismatch" unless row.scan(old).length == 1

updated = original.dup
updated.sub!(row, row.sub(old, replacement))
after_rows = records_by_id(updated)
inverse = updated.dup
inverse.sub!(after_rows.fetch(id), after_rows.fetch(id).sub(replacement, old))
abort "non-target bytes changed" unless inverse == original
abort "ID order changed" unless before_rows.keys == after_rows.keys
abort "ID scope changed" unless before_rows.keys == (0..65134).to_a
abort "BOM changed" unless original.start_with?("\xEF\xBB\xBF".b) == updated.start_with?("\xEF\xBB\xBF".b)
abort "line endings changed" unless [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length] ==
  [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length]

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/order=OK"
