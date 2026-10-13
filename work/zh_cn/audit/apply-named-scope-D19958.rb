#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "bf41dd249ffd1738fd5e90b9807bca4cddd9375bc680d227414ad11ba497447f"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19958/locatexts_zh_cn.koalocatext_default.csv"
edits = {
  44167 => ["에이먼은 서쪽 출신이지만, 데티르에서 전쟁의 서약자 워스원이 되었어.", "에이먼은 서쪽 출신이지만, 데티르에서 워스원이 되었어."],
  44189 => ["가문을 떠났지", "비탄의 집을 떠났지"],
  44196 => ["방패고리 요새", "실드링 킵"]
}
range = 44151..44200
shape = ->(bytes) {
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
}
replace = ->(bytes, id, from, to) {
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target row missing #{id}" unless match
  row = match[0]
  abort "target mismatch #{id}" unless row.scan(from.b).size == 1
  bytes[match.begin(0)...match.end(0)] = row.sub(from.b, to.b)
}

source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup mismatch" unless File.binread(backup) == source
original_shape = shape.call(source)
abort "BOM/ID order mismatch" unless original_shape[0] && original_shape[3] == (0..65134).map(&:to_s)
abort "edit outside scope" unless edits.keys.all? { |id| range.cover?(id) }

%w[en_us ja_jp zh_cn].each do |locale|
  bytes = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| range.cover?(id.to_i) }
  abort "locale alignment mismatch #{locale}" unless ids == range.map(&:to_s)
end

updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target bytes or CSV shape changed" unless inverse == source && shape.call(updated) == original_shape

File.binwrite(path, updated)
abort "write verification failed" unless File.binread(path) == updated
puts "D-19958 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
