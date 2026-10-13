#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "c0aa2723be177c19a98e5208d45816b5f56e4cbfe7d9db466833135a32f800e3"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19960/locatexts_zh_cn.koalocatext_default.csv"
range = 44251..44300
edits = {
  44258 => [
    ["콜로새", "콜로사이", 4],
    ["마이루에게 돌아가", "마이루인들에게 돌아가", 1]
  ],
  44265 => [["비늘을 벗겨 진실을 드러내자", "저울을 치워 진실을 드러내자", 1]],
  44286 => [["첫 맹세자 중 한 명", "퍼스트스원 중 한 명", 1]]
}
shape = ->(bytes) {
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
}
apply = ->(bytes, id, from, to, count) {
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target row missing #{id}" unless match
  row = match[0]
  abort "target mismatch #{id}:#{from}" unless row.scan(from.b).size == count
  count.times { row = row.sub(from.b, to.b) }
  bytes[match.begin(0)...match.end(0)] = row
}

source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup mismatch" unless File.binread(backup) == source
original_shape = shape.call(source)
abort "BOM/ID order mismatch" unless original_shape[0] && original_shape[3] == (0..65134).map(&:to_s)

%w[en_us ja_jp zh_cn].each do |locale|
  bytes = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| range.cover?(id.to_i) }
  abort "locale alignment mismatch #{locale}" unless ids == range.map(&:to_s)
end

updated = source.dup
edits.each do |id, replacements|
  replacements.each { |from, to, count| apply.call(updated, id, from, to, count) }
end
inverse = updated.dup
edits.to_a.reverse_each do |id, replacements|
  replacements.reverse_each { |from, to, count| apply.call(inverse, id, to, from, count) }
end
abort "non-target bytes or CSV shape changed" unless inverse == source && shape.call(updated) == original_shape

File.binwrite(path, updated)
abort "write verification failed" unless File.binread(path) == updated
puts "D-19960 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
