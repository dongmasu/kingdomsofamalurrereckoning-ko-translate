#!/usr/bin/env ruby
require "csv"
require "digest"
path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20228/locatexts_zh_cn.koalocatext_default.csv"
expected = "b575380bf7ac1d45f6a9e37fd5bf13602b29f2fdc81936f9ef1b71a00a4e20b5"
edits = {
  57220 => [["암호문을 지닌 채", "사이퍼(Cipher)를 지닌 채"]],
  57662 => [["암호자가 네 손에", "사이퍼(Cipher)가 네 손에"],
            ["암호자를 들고", "사이퍼(Cipher)를 들고"]],
  57663 => [["이브닝타이드의 친구", "이븐타이드의 친구"]],
  57696 => [["57696;까마귀단", "57696;크로우즈"]]
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
  changes.each do |old, replacement|
    abort "target mismatch #{id}" unless updated.scan(old.b).size == 1
    updated.sub!(old.b, replacement.b)
  end
  after.sub!(original, updated)
end
inverse = after.dup
edits.each do |id, changes|
  current = row.call(inverse, id)
  restored = current.dup
  changes.reverse_each do |old, replacement|
    abort "inverse mismatch #{id}" unless restored.scan(replacement.b).size == 1
    restored.sub!(replacement.b, old.b)
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
([57220] + (57651..57700).to_a).each do |id|
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
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} edited=#{edits.keys.join(",")} inverse/BOM/mixed-endings/ordered-IDs/51-four-locale-keys/breaks/markers=OK"
