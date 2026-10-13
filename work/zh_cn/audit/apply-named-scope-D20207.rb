#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20207/locatexts_zh_cn.koalocatext_default.csv"
expected = "8b02767230305512a5286f1721ba00a647d2280981279d71c3c548c9ccdafaa3"
edits = {
  56615 => ["조툰", "요툰"],
  56639 => ["여행자 야영지", "트래블러 야영지"],
  56643 => ["조툰", "요툰"]
}

before = File.binread(path)
abort "hash/backup mismatch" unless
  Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end

after = before.dup
edits.each do |id, (old, replacement)|
  original = row.call(after, id)
  abort "target mismatch #{id}" unless original.scan(old.b).size == 1
  after.sub!(original, original.sub(old.b, replacement.b))
end

inverse = after.dup
edits.each do |id, (old, replacement)|
  current = row.call(inverse, id)
  abort "replacement mismatch #{id}" unless current.scan(replacement.b).size == 1
  inverse.sub!(current, current.sub(replacement.b, old.b))
end
abort "non-target bytes changed" unless inverse == before

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort "BOM/endings/order mismatch" unless
  shape.call(before) == shape.call(after) &&
  shape.call(after)[-1] == (0..65134).map(&:to_s)

files = [
  after,
  *%w[en_us ja_jp zh_cn].map do |locale|
    File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  end
]
records = files.map do |bytes|
  (56601..56650).map do |id|
    matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
    abort "row missing/duplicate #{id}" unless matches.size == 1
    fields = CSV.parse_line(
      matches.first.dup.force_encoding("UTF-8"),
      col_sep: ";",
      row_sep: "\r\n",
      liberal_parsing: true
    )
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
      .map { |token| token.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') }
end
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |text| marker.call(text) }
  id = 56601 + index
  abort "break/marker mismatch #{id}" unless
    texts.map { |text| text.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 &&
    signatures[0] == signatures[1]
end

File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edits=#{edits.keys.join(',')} inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-keys/breaks/markers=OK"
