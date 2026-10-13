#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20121/locatexts_zh_cn.koalocatext_default.csv"
pre = "ef4312ad22304ef46f2da59adbe38d08f1b1da066aa7a4c232889bfeffbd2196"
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
old = "아니라인(Anira)".b
replacement = "아니라(Anira)".b
row = extract.call(source, 52324)
abort "old text not unique" unless row.scan(old).length == 1
updated = source.sub(row, row.sub(old, replacement))
abort "outside target Texto changed" unless updated.sub(extract.call(updated, 52324), extract.call(updated, 52324).sub(replacement, old)) == source
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
(52301..52350).each do |id|
  signatures = locales.map do |bytes|
    record = extract.call(bytes, id)
    [record.scan(/\n/n).length, record.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#|\$INT\d+/n)]
  end
  abort "four-locale signatures #{id}: #{signatures}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=52324 inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
