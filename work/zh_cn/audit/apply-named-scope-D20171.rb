#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20171/locatexts_zh_cn.koalocatext_default.csv"
expected = "9b23596e37b0aa4aac99d2c44024fb7f223d10969d7b8f0c4e5d1a289ffb1152"
changes = {
  54819 => ["투사 구출", "구출된 투사"]
}.transform_values { |old_text, new_text| [old_text.b, new_text.b] }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
changes.each do |id, (old_text, new_text)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "target cell mismatch or duplicate #{id}" unless row.scan(old_text).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old_text, new_text)
end

inverse = updated.dup
changes.each do |id, (old_text, new_text)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse cell mismatch or duplicate #{id}" unless row.scan(new_text).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(new_text, old_text)
end
abort "other bytes changed" unless inverse == source

shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count/order differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (54801..54850).all? { |id| updated.match(/^#{id};/n) }

row = updated.match(/^54819;.*?(?=^\d+;|\z)/nm)[0]
parsed = CSV.parse_line(row.dup.force_encoding("UTF-8"),
  col_sep: ";", row_sep: :auto)
abort "unexpected CSV fields" unless parsed.length == 2
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
