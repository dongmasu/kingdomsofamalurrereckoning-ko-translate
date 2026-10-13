#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19826/locatexts_zh_cn.koalocatext_default.csv"
expected = "20083a52e2fa705da38840f982da6e28eb43bd0e7c33640df4179b88e3f481ee"
changes = {
  35052 => ["칠칠맞군", "덜렁대는군"],
  35054 => ["미타루께", "미사루께"],
  35091 => ["워스워른", "워스원"],
  35094 => ["그레이홀", "그레이브홀"],
  35096 => ["워스워른", "워스원"],
  35105 => ["해제술 교관", "디스펠 교관"],
  35111 => [
    "회피 중 장검과 대검으로 사용할 수 있는 특수 공격을 잠금 해제합니다.",
    "회피에서 이어지는 롱소드와 그레이트소드 특수 공격을 잠금 해제합니다."
  ],
  35148 => ["안녕, 그대.", "안녕, 친구."]
}.transform_values { |pair| pair.map(&:b) }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
changes.each do |id, (old, replacement)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "fragment missing or duplicated #{id}" unless row.scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old, replacement)
end

inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse fragment missing or duplicated #{id}" unless row.scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(replacement, old)
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
abort "target scope differs" unless (35051..35150).all? { |id| updated.match(/^#{id};/n) }

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
