#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20189/locatexts_zh_cn.koalocatext_default.csv"
expected = "289a526b23484d2be8763b368c1133dd3edda06501677bae0e47b96c31072cdf"
changes = {
  55715 => ["새로운 사이온(Scion)를", "새로운 사이온(Scion)을"],
  55746 => ["워스워른(Warsworn)", "워스원(Warsworn)"]
}
before = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(before) == expected
abort "backup mismatch" unless File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing or duplicate row #{id}" unless matches.size == 1
  matches.first
end
after = before.dup
changes.each do |id, (old, replacement)|
  original = row.call(after, id)
  abort "target text mismatch #{id}" unless original.scan(old.b).size == 1
  changed = original.sub(old.b, replacement.b)
  abort "bad field count #{id}" unless CSV.parse_line(changed.dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")&.size == 2
  after.sub!(original, changed)
end
inverse = after.dup
changes.each do |id, (old, replacement)|
  current = row.call(inverse, id)
  abort "inverse mismatch #{id}" unless current.scan(replacement.b).size == 1
  inverse.sub!(current, current.sub(replacement.b, old.b))
end
abort "non-target bytes modified" unless inverse == before
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/order changed" unless shape.call(before) == shape.call(after)
abort "wrong IDs" unless shape.call(after)[-1] == (0..65134).map(&:to_s)
files = [after, *%w[en_us ja_jp zh_cn].map { |locale| File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv") }]
records = files.map do |bytes|
  (55701..55750).map do |id|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "bad row #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = ->(text) { text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/).map { |m| m.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') } }
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  abort "break/marker mismatch #{55701 + index}" unless texts.map { |t| t.count("\n") }.uniq.size == 1 && texts.map { |t| marker.call(t) }.uniq.size == 1
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edits=#{changes.keys} inverse/BOM/endings/order/50-four-locale-keys/breaks/markers=OK"
