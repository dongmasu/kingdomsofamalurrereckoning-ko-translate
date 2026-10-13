#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20209/locatexts_zh_cn.koalocatext_default.csv"
expected = "a9133d8c8411081dd243a8494b7aa66ebc47b2052639be49785ae818a5eed631"
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected &&
  File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end
original = row.call(before, 56739)
old = "브레이코르(Vraekor)".b
new_text = "브래코르(Vraekor)".b
abort "target mismatch" unless original.scan(old).size == 1
updated = original.sub(old, new_text)
after = before.sub(original, updated)
abort "non-target bytes changed" unless
  after.sub(row.call(after, 56739), row.call(after, 56739).sub(new_text, old)) == before

shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/order mismatch" unless
  shape.call(before) == shape.call(after) &&
  shape.call(after)[-1] == (0..65134).map(&:to_s)

files = [after, *%w[en_us ja_jp zh_cn].map do |locale|
  File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
end]
marker = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
    .map { |token| token.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') }
end
(56701..56750).each do |id|
  texts = files.map do |bytes|
    raw = row.call(bytes, id).dup.force_encoding("UTF-8")
    fields = CSV.parse_line(raw, col_sep: ";", row_sep: "\r\n", liberal_parsing: true)
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
  abort "break/marker mismatch #{id}" unless
    texts.map { |text| text.count("\n") }.uniq.size == 1 &&
    texts.map { |text| marker.call(text).sort }.uniq.size == 1
end

File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edited=56739 inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-keys/breaks/markers=OK"
