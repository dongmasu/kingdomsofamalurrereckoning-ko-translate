#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19825/locatexts_zh_cn.koalocatext_default.csv"
expected = "ea7f5f3448d18fbcbc1842d37df406c3765781e329dede67c1d1e349e6e17213"
changes = {
  34952 => ["완벽한 미타란 면역 장식", "흠 없는 미타란 면역 장식"],
  34994 => ["세이르 파라라 경의", "파라라 경의"],
  35010 => ["갤러스 엔드에서 출항했다", "갤로우스 엔드에서 출항했다"],
  35020 => ["한동안 네 힘을 살펴봤다.", "한동안 널 추적해 왔다."],
  35023 => ["갤러스 엔드에서 가장 오래 산 표류자야.", "갤로우스 엔드에서 가장 나이 많은 표류자야."]
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
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length, bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order=OK"
