#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20061/locatexts_zh_cn.koalocatext_default.csv"
expected = "7f6b45482384798c33de03aa0efc2044bd16afb391559fe07c2684d999d707ed"
changes = {
  49310 => ["상부 첨탑 지구가 빛과 마법, 부로 가득하다는 것뿐이야.", "첨탑 꼭대기에는 빛과 마법, 부가 가득하다는 것뿐이야."],
  49347 => ["뭐라도 해야 해. 반드시... 이 배신자 고옌 린을 죽여야 해.", "뭐라도 해야 해. 반드시... 반드시... 이 배신자 고옌 린을 죽여야 해."]
}.transform_values { |old, replacement| [old.b, replacement.b] }

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
updated = original.dup

changes.each do |id, (old, replacement)|
  row = before_rows.fetch(id)
  abort "old text mismatch at #{id}" unless row.scan(old).length == 1
  updated.sub!(row, row.sub(old, replacement))
end

after_rows = records_by_id(updated)
inverse = updated.dup
changes.each do |id, (old, replacement)|
  row = after_rows.fetch(id)
  abort "replacement mismatch at #{id}" unless row.scan(replacement).length == 1
  inverse.sub!(row, row.sub(replacement, old))
end
abort "non-target bytes changed" unless inverse == original
abort "ID order changed" unless before_rows.keys == after_rows.keys
abort "ID scope changed" unless before_rows.keys == (0..65134).to_a
abort "BOM changed" unless original.start_with?("\xEF\xBB\xBF".b) == updated.start_with?("\xEF\xBB\xBF".b)
abort "line endings changed" unless [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length] ==
  [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length]

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
