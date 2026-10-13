#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20170/locatexts_zh_cn.koalocatext_default.csv"
expected = "f70daa60394c194275a58ea9baa0484e317e0af6a5b66a5542136fe025e7869b"
changes = {
  54771 => ["봄의 그림 온위그(Spring Grim Onwig)",
            "그림 온위그(Grim Onwig)를 감옥에서 탈출시켜라"]
}.transform_values { |old, new_text| [old.b, new_text.b] }

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
abort "scope differs" unless (54751..54800).all? { |id| updated.match(/^#{id};/n) }

row = updated.match(/^54771;.*?(?=^\d+;|\z)/nm)[0]
parsed = CSV.parse_line(row.dup.force_encoding("UTF-8"),
  col_sep: ";", row_sep: :auto)
abort "unexpected CSV fields" unless parsed.length == 2
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
