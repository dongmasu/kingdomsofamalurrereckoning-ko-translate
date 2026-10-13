#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20187/locatexts_zh_cn.koalocatext_default.csv"
expected = "4e042bd4c20ff2dc6376aa38685b49350ec8de36707159a246d713dead13abf6"
changes = {
  55609 => [["브레이코르의 격노(Fury of Vraekor)", "브래코르의 격노(Fury of Vraekor)"]],
  55620 => [["갤러스 엔드(Gallows End)", "갤로우스 엔드(Gallows End)"]]
}.transform_values { |pairs| pairs.map { |old_text, new_text| [old_text.b, new_text.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

row_bytes = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing or duplicated #{id}" unless matches.length == 1
  matches.first
end

updated = source.dup
changes.each do |id, replacements|
  row = row_bytes.call(updated, id)
  replacements.each do |old_text, new_text|
    abort "target cell text mismatch or duplicate #{id}" unless row.scan(old_text).length == 1
    row = row.sub(old_text, new_text)
  end
  updated.sub!(row_bytes.call(updated, id), row)
end

inverse = updated.dup
changes.each do |id, replacements|
  row = row_bytes.call(inverse, id)
  replacements.reverse_each do |old_text, new_text|
    abort "inverse target mismatch or duplicate #{id}" unless row.scan(new_text).length == 1
    row = row.sub(new_text, old_text)
  end
  inverse.sub!(row_bytes.call(inverse, id), row)
end
abort "non-target bytes changed" unless inverse == source

shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count/order differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)

files = [
  path,
  "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
]
records = files.map do |file|
  bytes = File.binread(file).sub(/\A\xEF\xBB\xBF/n, "")
  (55601..55650).to_h do |id|
    raw = row_bytes.call(bytes, id)
    fields = CSV.parse_line(raw.dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
    abort "#{file}: invalid record #{id}" unless fields&.length == 2
    [id, fields[1]]
  end
end
abort "range is not 50 ordered rows in each locale" unless records.all? { |rows| rows.keys == (55601..55650).to_a }

marker_signature = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
    .map { |marker| marker.sub(/\A\{\*(\d+).*\}\z/, '{*\\1}') }
end
(55601..55650).each do |id|
  texts = records.map { |rows| rows.fetch(id) }
  abort "line-break mismatch #{id}" unless texts.map { |text| text.count("\n") }.uniq.length == 1
  abort "runtime-marker mismatch #{id}" unless texts.map { |text| marker_signature.call(text) }.uniq.length == 1
end
number_tokens = records.map { |rows| rows.fetch(55602).scan(/\d+(?:[.,]\d+)?%?/).sort }
abort "numeric values mismatch at 55602" unless number_tokens.uniq.length == 1

changes.each_key do |id|
  raw = row_bytes.call(updated, id)
  fields = CSV.parse_line(raw.dup.force_encoding("UTF-8"), col_sep: ";", row_sep: "\r\n")
  abort "unexpected CSV fields #{id}" unless fields&.length == 2
end

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order/50-row-keys/line-breaks/markers/numeric-values=OK"
