#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20117/locatexts_zh_cn.koalocatext_default.csv"
pre = "3b6b5863e9c2f1486a92fb3c02db60bd57542f400ffdfc03210160e86c0d90f2"
edits = {
  52101 => [["여기 여행자들(Travelers)은", "여기 트래블러들(Travelers)은"]],
  52118 => [["탈라라네(Tala-Rane)로 좌천된 이유", "탈라라네(Tala-Rane)로 전근된 이유"]],
  52135 => [["콜로새(Kollossae)", "콜로사이(Kollossae)"]],
  52145 => [["콜로새(Kollossae)", "콜로사이(Kollossae)"]]
}
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
updated = source.dup
edits.each do |id, substitutions|
  row = extract.call(updated, id)
  substitutions.each do |old, replacement|
    abort "non-unique #{id}: #{old}" unless row.scan(old.b).length == 1
    row = row.sub(old.b, replacement.b)
  end
  original = extract.call(updated, id)
  updated[updated.index(original), original.bytesize] = row
end
inverse = updated.dup
edits.each do |id, substitutions|
  row = extract.call(inverse, id)
  substitutions.reverse_each do |old, replacement|
    abort "inverse non-unique #{id}" unless row.scan(replacement.b).length == 1
    row = row.sub(replacement.b, old.b)
  end
  original = extract.call(inverse, id)
  inverse[inverse.index(original), original.bytesize] = row
end
abort "outside target cells changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[3] == (0..65134).map(&:to_s)
locales = [
  "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
].map { |p| File.binread(p) } + [updated]
(52101..52150).each do |id|
  signatures = locales.map do |bytes|
    row = extract.call(bytes, id)
    [row.scan(/\n/n).length, row.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n)]
  end
  if id == 52129
    abort "52129 prior wrap exception changed" unless signatures.map(&:last).uniq.length == 1 &&
      signatures.map(&:first) == [4, 3, 3, 3]
  else
    abort "four-locale signatures #{id}: #{signatures}" unless signatures.uniq.length == 1
  end
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK (52129 documented EN wrap)"
