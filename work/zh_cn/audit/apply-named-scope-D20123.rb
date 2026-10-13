#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20123/locatexts_zh_cn.koalocatext_default.csv"
pre = "20235f40a1cff7a51af8abc91175e57b4240cee550b5aa48c13e73ad3ebd1542"
edits = {
  52422 => [["후계자들은 모두", "사이온들은 모두"]],
  52425 => [["후계자(Scion)를", "사이온(Scion)을"]]
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
    next if old == replacement
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
    next if old == replacement
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
(52401..52450).each do |id|
  signatures = locales.map do |bytes|
    record = extract.call(bytes, id)
    [record.scan(/\n/n).length, record.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#|\$[A-Z0-9_.]+\$/n)]
  end
  abort "four-locale signatures #{id}: #{signatures}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=52422,52425 inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
