#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20050/locatexts_zh_cn.koalocatext_default.csv"
expected = "1f32404efc0358f357584c83c55fd0c1b44f1c1ac63d1fcce99531853b7f4d81"
changes = {
  48763 => [
    ["운명 모드를", "레코닝 모드를"],
    ["운명 모드에", "레코닝 모드에"],
    ["운명을 모아야겠다", "운명 에너지를 모아야겠다"]
  ],
  48773 => [["선택받은 자.", "부름받은 자."]],
  48782 => [["역병 방호제 꾸러미도 세 개나 사라졌어!", "역병 방호제 꾸러미 세 개는 어떻게 된 거지?"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source
record = ->(bytes, id) { bytes.match(/^#{id};.*?(?=^\d+;|\z)/mn) }
updated = source.dup
changes.each do |id, pairs|
  match = record.call(updated, id)
  abort "row missing #{id}" unless match
  row = match[0]
  pairs.each do |old, replacement|
    abort "fragment missing or duplicated #{id}" unless row.scan(old).length == 1
    row = row.sub(old, replacement)
  end
  updated[match.begin(0)...match.end(0)] = row
end
inverse = updated.dup
changes.each do |id, pairs|
  match = record.call(inverse, id)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "ordered ID count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (48751..48800).all? { |id| record.call(updated, id) }
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
