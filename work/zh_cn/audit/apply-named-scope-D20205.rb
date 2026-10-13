#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20205/locatexts_zh_cn.koalocatext_default.csv"
expected = "95c585a08306cecba9f6c3415355e680ee32673b6766d4a232832f6a64401a24"
old = "내가 사이온(Scion)다."
replacement = "내가 사이온(Scion)이야."

before = File.binread(path)
abort "hash/backup mismatch" unless
  Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end

original = row.call(before, 56537)
abort "target mismatch" unless original.scan(old.b).size == 1
after = before.dup
after.sub!(original, original.sub(old.b, replacement.b))

inverse = row.call(after, 56537)
abort "inverse mismatch" unless inverse.scan(replacement.b).size == 1
after_inverse = after.dup
after_inverse.sub!(inverse, inverse.sub(replacement.b, old.b))
abort "non-target bytes changed" unless after_inverse == before

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
  (56501..56550).map do |id|
    matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
    abort "row missing/duplicate #{id}" unless matches.size == 1
    fields = CSV.parse_line(
      matches.first.dup.force_encoding("UTF-8"),
      col_sep: ";",
      row_sep: "\r\n"
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
  abort "break/marker mismatch #{56501 + index}" unless
    texts.map { |text| text.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 &&
    signatures[0] == signatures[1]
end

File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
