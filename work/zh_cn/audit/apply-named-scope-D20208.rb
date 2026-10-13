#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20208/locatexts_zh_cn.koalocatext_default.csv"
expected = "522fe409323161858dd7b0e1f3556ec0173a3e1f16f13aa484c8d59f2e06ea84"
edits = [
  ["세력 퀘스트", "팩션 퀘스트"],
  ["보조 퀘스트", "사이드 퀘스트"],
  ["과제", "임무"],
  ["완료한 퀘스트", "완수한 퀘스트"]
]

before = File.binread(path)
abort "hash/backup mismatch" unless
  Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end

original = row.call(before, 56687)
updated = original.dup
edits.each do |old, replacement|
  abort "target mismatch #{old}" unless updated.scan(old.b).size == 1
  updated.sub!(old.b, replacement.b)
end
after = before.dup
after.sub!(original, updated)

inverse = after.dup
current = row.call(inverse, 56687)
edits.reverse_each do |old, replacement|
  abort "replacement mismatch #{replacement}" unless current.scan(replacement.b).size == 1
  current.sub!(replacement.b, old.b)
end
inverse.sub!(row.call(inverse, 56687), current)
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
  (56651..56700).map do |id|
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
  id = 56651 + index
  abort "break/marker mismatch #{id}" unless
    texts.map { |text| text.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 &&
    signatures[0] == signatures[1]
end

File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edited=56687 inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-keys/breaks/markers=OK"
