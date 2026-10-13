#!/usr/bin/env ruby
require "csv"
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20220/locatexts_zh_cn.koalocatext_default.csv"
expected = "5bb2ffe36ec8d5ea7fc0667af204b6a7c3bae15e3803d1be13ccabbce82e5d81"
edits = {
  57278 => [["여행자에 합류", "트래블러에 합류", 1],
            ["그램은", "그림은", 1],
            ["여행자 야영지", "트래블러 야영지", 1]],
  57289 => [["지팡이, 차크람, 홀", "지팡이, 차크람, 셉터", 2],
            ["장검", "롱소드", 1], ["망치", "해머", 1],
            ["단검", "대거", 1], ["장궁", "롱보우", 1],
            ["대검", "그레이트소드", 1]],
  57299 => [["전쟁맹세단 동료", "워스원 동료", 1]]
}
before = File.binread(path)
abort "hash/backup mismatch" unless Digest::SHA256.hexdigest(before) == expected &&
  before == File.binread(backup)
row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate #{id}" unless matches.size == 1
  matches.first
end
after = before.dup
edits.each do |id, changes|
  original = row.call(after, id)
  updated = original.dup
  changes.each do |old, replacement, count|
    abort "target mismatch #{id} #{old}" unless updated.scan(old.b).size == count
    updated.gsub!(old.b, replacement.b)
  end
  after.sub!(original, updated)
end
inverse = after.dup
edits.each do |id, changes|
  current = row.call(inverse, id)
  restored = current.dup
  changes.reverse_each do |old, replacement, count|
    abort "inverse mismatch #{id} #{replacement}" unless restored.scan(replacement.b).size == count
    restored.gsub!(replacement.b, old.b)
  end
  inverse.sub!(current, restored)
end
abort "non-target bytes changed" unless inverse == before
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
(57251..57300).each do |id|
  texts = files.map do |bytes|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"),
                            col_sep: ";", row_sep: "\r\n", liberal_parsing: true)
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1].to_s
  end
  abort "break/marker mismatch #{id}" unless
    texts.map { |t| t.count("\n") }.uniq.size == 1 &&
    texts.map { |t| marker.call(t).sort }.uniq.size == 1
end
File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edited=#{edits.keys.join(",")} inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-keys/breaks/markers=OK"
