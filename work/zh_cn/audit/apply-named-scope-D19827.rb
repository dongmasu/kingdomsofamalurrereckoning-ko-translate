#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19827/locatexts_zh_cn.koalocatext_default.csv"
expected = "a2e08770a95c7d564857f8252885af7d5784db5164fcf5c79763463642d3beac"
changes = {
  35210 => [["마녀 기사 아니라를", "마녀 기사 아니라(Anira)를"]],
  35220 => [["아우구르가", "오거(Augur)가"]],
  35239 => [
    ["처음에는 그들이 진정한 친구였다고 생각해.", "“처음에는 그들이 진정한 친구였다고 생각해."],
    ["찾아내지 못했을 테니까.", "찾아내지 못했을 테니까.”"]
  ],
  35240 => [["세이그렐이", "사그렐이"]]
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
abort "target scope differs" unless (35151..35250).all? { |id| updated.match(/^#{id};/n) }

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
