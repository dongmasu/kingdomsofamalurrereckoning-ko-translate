#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20052/locatexts_zh_cn.koalocatext_default.csv"
expected = "0a4890d567577db677f43d9679d372ff58a37d2f845ba8b85649ad8097e72ef9"
changes = {
  48882 => ["고대 노움 문자", "고대 노움 문헌"],
  48888 => ["예언자는 할 말이 많지만", "오거는 할 말이 많지만"],
  48895 => ["여행자들", "트래블러"]
}.transform_values { |old, replacement| [old.b, replacement.b] }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
record = ->(bytes, id) { bytes.match(/^#{id};.*?(?=^\d+;|\z)/mn) }
updated = source.dup
changes.each do |id, (old, replacement)|
  match = record.call(updated, id)
  abort "row missing #{id}" unless match && match[0].scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
end
inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = record.call(inverse, id)
  abort "inverse row missing #{id}" unless match && match[0].scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
end
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (48851..48900).all? { |id| record.call(updated, id) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
