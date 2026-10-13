#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20192/locatexts_zh_cn.koalocatext_default.csv"
expected = "dbc7eac3ddacb17025d6be203196ebebf2a8979c1b11d25d20bdc2ec994e0638"
before = File.binread(path)
abort "active hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate row #{id}" unless matches.size == 1
  matches.first
end
original = row.call(before, 55882)
abort "unexpected cell" unless original.scan("페이랜드(Faelands)".b).size == 1
changed = original.sub("페이랜드(Faelands)".b, "패란즈(Faelands)".b)
after = before.sub(original, changed)
abort "non-target bytes changed" unless after.sub(changed, original) == before
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/IDs changed" unless shape.call(before) == shape.call(after) && shape.call(after)[-1] == (0..65134).map(&:to_s)
files = [after, *%w[en_us ja_jp zh_cn].map { |l| File.binread("src/csv/#{l}/locatexts_#{l}.koalocatext_default.csv") }]
records = files.map do |bytes|
  (55851..55900).map do |id|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = ->(text) { text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/).map { |m| m.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') } }
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |t| marker.call(t) }
  abort "break/marker mismatch #{55851 + index}" unless texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 && signatures[0] == signatures[1]
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
