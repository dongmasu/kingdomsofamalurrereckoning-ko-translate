#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19829/locatexts_zh_cn.koalocatext_default.csv"
expected = "db9aab3795da7d8b005f42a8ed9a02db998f90cafb9f541690781185058801a7"
changes = {
  35391 => [["난 자취를 감출 거야, 그대도 그러는 게 좋겠어.", "난 자취를 감출 거야, 친구. 너도 그러는 게 좋겠어."]],
  35413 => [["완벽한 미타란", "흠 없는 미타란"]],
  35417 => [["소라 울스트링", "토라 울스트링"]],
  35431 => [["워스워른", "워스원"]]
}.transform_values { |pairs| pairs.map { |old, replacement| [old.b, replacement.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
changes.each do |id, pairs|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
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
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  pairs.reverse_each do |old, replacement|
    abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
    row = row.sub(replacement, old)
  end
  inverse[match.begin(0)...match.end(0)] = row
end
abort "other bytes changed" unless inverse == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "target scope differs" unless (35351..35450).all? { |id| updated.match(/^#{id};/n) }

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
