#!/usr/bin/env ruby
require "csv"
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20203/locatexts_zh_cn.koalocatext_default.csv"
expected = "4cbc417398dbce5c644c5454441d5ded1b56e68ea849cead223a801a2dd71c32"
changes = {
  56401 => ["완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)"],
  56408 => ["라시어의 동쪽", "라시르의 동쪽"],
  56433 => ["지팡이의 여왕 아르진", "지팡이 여왕 아르진"],
  56434 => ["텔로그루스(Telogrus)", "텔로그러스(Telogrus)"],
  56435 => ["안녕히 가십시오, 전하.", "안녕히 가십시오, 각하."],
  56438 => ["교수대 끝자락일까?", "갤로우스 엔드(Gallows End)일까?"]
}
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end
after = before.dup
changes.each do |id, (old, replacement)|
  original = row.call(after, id)
  abort "target mismatch #{id}" unless original.scan(old.b).size == 1
  after.sub!(original, original.sub(old.b, replacement.b))
end
inverse = after.dup
changes.each do |id, (old, replacement)|
  original = row.call(inverse, id)
  abort "inverse mismatch #{id}" unless original.scan(replacement.b).size == 1
  inverse.sub!(original, original.sub(replacement.b, old.b))
end
abort "non-target bytes changed" unless inverse == before
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size,
                  b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
abort "BOM/endings/order mismatch" unless shape.call(before) == shape.call(after) &&
  shape.call(after)[-1] == (0..65134).map(&:to_s)
files = [after, *%w[en_us ja_jp zh_cn].map { |l| File.binread("src/csv/#{l}/locatexts_#{l}.koalocatext_default.csv") }]
records = files.map do |bytes|
  (56401..56450).map do |id|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = ->(t) { t.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/).map { |m| m.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') } }
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |t| marker.call(t) }
  abort "break/marker mismatch #{56401 + index}" unless texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 && signatures[0] == signatures[1]
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
