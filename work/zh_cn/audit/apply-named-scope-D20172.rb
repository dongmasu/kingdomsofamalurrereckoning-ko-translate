#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20172/locatexts_zh_cn.koalocatext_default.csv"
expected = "65ac05a23612bd968a0156fd93c87a7d256389b8550bf4c819e6382100b30c43"
changes = {
  54867 => ["새로운 후계자(Scion)", "새로운 사이온(Scion)"],
  54891 => ["대부분의 물품을 {*1금화}로 거래합니다",
            "대부분의 물품을 {*1금화}로 매입합니다"]
}.transform_values { |old_text, new_text| [old_text.b, new_text.b] }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
abort "backup differs" unless File.binread(backup) == source

row_bytes = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing or duplicated #{id}" unless matches.length == 1
  matches.first
end

updated = source.dup
changes.each do |id, (old_text, new_text)|
  row = row_bytes.call(updated, id)
  abort "target cell mismatch or duplicate #{id}" unless row.scan(old_text).length == 1
  updated.sub!(row, row.sub(old_text, new_text))
end

inverse = updated.dup
changes.each do |id, (old_text, new_text)|
  row = row_bytes.call(inverse, id)
  abort "inverse cell mismatch or duplicate #{id}" unless row.scan(new_text).length == 1
  inverse.sub!(row, row.sub(new_text, old_text))
end
abort "other bytes changed" unless inverse == source

shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order changed" unless shape.call(source) == shape.call(updated)
abort "row count/order differs" unless shape.call(updated)[-1] == (0..65134).map(&:to_s)
abort "scope differs" unless (54851..54900).all? { |id| row_bytes.call(updated, id) }

files = [
  path,
  "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
]
records = files.map do |file|
  bytes = File.binread(file)
  bytes.sub!(/\A\xEF\xBB\xBF/n, "")
  (54851..54900).to_h do |id|
    raw = row_bytes.call(bytes, id)
    fields = CSV.parse_line(raw.dup.force_encoding("UTF-8"),
      col_sep: ";", row_sep: :auto)
    abort "#{file}: invalid record #{id}" unless fields&.length == 2
    [id, fields[1]]
  end
end

(54851..54900).each do |id|
  texts = records.map { |rows| rows.fetch(id) }
  abort "line-break mismatch #{id}" unless texts.map { |text| text.count("\n") }.uniq.length == 1
  markers = texts.map do |text|
    text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
      .map { |marker| marker.sub(/\A\{\*(\d+).*\}\z/, '{*\\1}') }
  end
  abort "runtime-marker mismatch #{id}" unless markers.uniq.length == 1
end

[54867, 54891].each do |id|
  raw = row_bytes.call(updated, id)
  fields = CSV.parse_line(raw.dup.force_encoding("UTF-8"),
    col_sep: ";", row_sep: :auto)
  abort "unexpected CSV fields #{id}" unless fields&.length == 2
end

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order/50-row-signatures=OK"
