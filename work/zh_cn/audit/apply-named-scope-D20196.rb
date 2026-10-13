#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20196/locatexts_zh_cn.koalocatext_default.csv"
expected = "a0ead9314bba28bb93ef16ca5e062a7e1d6fe185ae6d73d913172dbc1c91a1e5"
changes = {
  56058 => [["완벽한 미사란", "흠 없는 미타란"]],
  56060 => [["조각은 최상급 품질을", "파편은 최상급 품질을"]],
  56074 => [["대장장이 기술", "대장기술"]]
}
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate #{id}" unless matches.size == 1
  matches.first
end
after = before.dup
changes.each do |id, pairs|
  original = row.call(after, id)
  changed = original.dup
  pairs.each do |old, replacement|
    expected_count = id == 56074 ? 2 : 1
    abort "target mismatch #{id}" unless changed.scan(old.b).size == expected_count
    changed.gsub!(old.b, replacement.b)
  end
  after.sub!(original, changed)
end
inverse = after.dup
changes.each do |id, pairs|
  original = row.call(inverse, id)
  changed = original.dup
  pairs.reverse_each do |old, replacement|
    expected_count = id == 56074 ? 2 : 1
    abort "inverse mismatch #{id}" unless changed.scan(replacement.b).size == expected_count
    changed.gsub!(replacement.b, old.b)
  end
  inverse.sub!(original, changed)
end
abort "non-target bytes changed" unless inverse == before
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/IDs changed" unless shape.call(before) == shape.call(after) && shape.call(after)[-1] == (0..65134).map(&:to_s)
files = [after, *%w[en_us ja_jp zh_cn].map { |l| File.binread("src/csv/#{l}/locatexts_#{l}.koalocatext_default.csv") }]
records = files.map do |bytes|
  (56051..56100).map do |id|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = ->(text) { text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/).map { |m| m.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') } }
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |t| marker.call(t) }
  abort "break/marker mismatch #{56051 + index}" unless texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 && signatures[0] == signatures[1]
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
