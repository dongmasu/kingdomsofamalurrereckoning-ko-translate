#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19822/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "8758e96eafe0ab37ac2c39248134b8a6ffc849374c95fbcc1b2a09dc7812860c"
edits = {
  34670 => ["몰래 들어온 자들이 재빠르게 칼을 휘둘러 내 곁에서 보석을 훔쳐 갔어.",
            "누군가 몰래 들어와 날카로운 칼을 들고 소리 없이 다가와 내 곁에서 보석을 훔쳐 갔어."],
  34694 => ["요정의 고분에 관해 말해 줘.", "페이의 케언에 관해 말해 줘."],
  34712 => ["그게 그나마 회사라면", "변변찮긴 하지만"],
  34717 => ["순수한 마법의 영역인 에샤라의 심장부로 위험한 여정을 떠나 혼돈의 힘을 다스리려 했고, 그 과정에서 정신과 육체, 영혼을 위험에 빠뜨렸다.",
            "순수한 마법의 영역인 에샤라의 심장부로 향하는 위험한 여정을 시작했다. 혼돈 그 자체의 힘을 익히기 위해 정신과 육체, 영혼을 위험에 빠뜨렸다."]
}.transform_values { |pair| pair.map(&:b) }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected_sha
abort "backup differs" unless File.binread(backup) == source
updated = source.dup
edits.each do |id, (old, new_text)|
  pattern = /^(?:\xEF\xBB\xBF)?#{id};.*?(?=^\d+;|\z)/nm
  match = updated.match(pattern)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "fragment missing or repeated #{id}" unless row.scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(old, new_text)
end
inverse = updated.dup
edits.each do |id, (old, new_text)|
  pattern = /^#{id};.*?(?=^\d+;|\z)/nm
  match = inverse.match(pattern)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse fragment missing or repeated #{id}" unless row.scan(new_text).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(new_text, old)
end
abort "other bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
File.binwrite(path, updated)
puts "pre=#{expected_sha} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edits=#{edits.keys.join(',')} inverse/BOM/endings/order=OK"
