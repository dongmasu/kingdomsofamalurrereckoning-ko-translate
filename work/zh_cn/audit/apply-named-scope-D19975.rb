#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19975/locatexts_zh_cn.koalocatext_default.csv"
expected = "fe7d447b23df24f0b7af4f2a0c86277c45563fdee7908e2f4fc684ac9421cd8b"
edits = {
  45036 => ["교수대 끝 동쪽", "갤로우즈 엔드 동쪽"],
  45047 => ["발라드 가문과", "발라드의 집과"]
}
shape = ->(bytes) {
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
}
replace = ->(bytes, id, from, to) {
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing ID #{id}" unless match
  row = match[0]
  abort "unexpected target #{id}" unless row.scan(from.b).size == 1
  bytes[match.begin(0)...match.end(0)] = row.sub(from.b, to.b)
}
source = File.binread(path)
abort "active or backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
before = shape.call(source)
abort "invalid original structure" unless before == [true, 72011, 73, (0..65134).map(&:to_s)]
(%w[en_us ja_jp zh_cn].map { |locale|
  File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
      .scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (45001..45050).cover?(id.to_i) }
}).each { |ids| abort "unaligned locale" unless ids == (45001..45050).map(&:to_s) }
updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target bytes or CSV structure changed" unless inverse == source && shape.call(updated) == before
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "D-19975 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} targets=#{edits.keys.join(',')} BOM/endings/IDs/locales/inverse=OK"
