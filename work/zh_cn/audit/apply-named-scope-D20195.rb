#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20195/locatexts_zh_cn.koalocatext_default.csv"
expected = "7a75e115236206fc2d0575820957bc2945b882e65442d6cb728a73a585702466"
changes = {
  56014 => [["병영을 둘러볼", "구역을 둘러볼"]],
  56026 => [["마법 해제(Dispelling)", "디스펠(Dispelling)"], ["결계를 해제하지 못하면", "결계를 디스펠하지 못하면"]],
  56034 => [["같은 조각 두 개", "같은 파편 두 개"], ["품질의 조각을", "품질의 파편을"], ["더 좋은 조각으로", "더 좋은 파편으로"]]
}
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate row #{id}" unless matches.size == 1
  matches.first
end
after = before.dup
changes.each do |id, pairs|
  original = row.call(after, id)
  changed = original.dup
  pairs.each do |old, replacement|
    abort "target mismatch #{id}" unless changed.scan(old.b).size == 1
    changed.sub!(old.b, replacement.b)
  end
  after.sub!(original, changed)
end
inverse = after.dup
changes.each do |id, pairs|
  original = row.call(inverse, id)
  changed = original.dup
  pairs.reverse_each do |old, replacement|
    abort "inverse mismatch #{id}" unless changed.scan(replacement.b).size == 1
    changed.sub!(replacement.b, old.b)
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
  (56001..56050).map do |id|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = ->(text) { text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/).map { |m| m.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') } }
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |t| marker.call(t) }
  abort "break/marker mismatch #{56001 + index}" unless texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 && signatures[0] == signatures[1]
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
