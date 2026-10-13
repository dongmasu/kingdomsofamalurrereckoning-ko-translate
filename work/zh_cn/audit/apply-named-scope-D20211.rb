#!/usr/bin/env ruby
require "csv"
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20211/locatexts_zh_cn.koalocatext_default.csv"
expected = "d8ede6a75807a6670bc4e97dbf46c8de39228a11bb9235c5e36c86932a5a71ad"
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected &&
  before == File.binread(backup)
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate #{id}" unless matches.size == 1
  matches.first
end
original = row.call(before, 56826)
old, new_text = "사이온(Scion)야?".b, "사이온(Scion)이야?".b
abort "target mismatch" unless original.scan(old).size == 1
after = before.sub(original, original.sub(old, new_text))
abort "non-target bytes changed" unless
  after.sub(row.call(after, 56826),
            row.call(after, 56826).sub(new_text, old)) == before
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/order mismatch" unless
  shape.call(before) == shape.call(after) &&
  shape.call(after)[-1] == (0..65134).map(&:to_s)
files = [after, *%w[en_us ja_jp zh_cn].map do |loc|
  File.binread("src/csv/#{loc}/locatexts_#{loc}.koalocatext_default.csv")
end]
marker = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
      .map { |token| token.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') }
end
(56801..56850).each do |id|
  texts = files.map do |bytes|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"),
                            col_sep: ";", row_sep: "\r\n", liberal_parsing: true)
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
  abort "break/marker mismatch #{id}" unless
    texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    texts.map { |t| marker.call(t).sort }.uniq.size == 1
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edited=56826 inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-keys/breaks/markers=OK"
