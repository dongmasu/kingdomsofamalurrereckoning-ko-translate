#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20126/locatexts_zh_cn.koalocatext_default.csv"
pre = "ed2abee99a03faa82b180cc12c16d7390f3197357df4b0116c0f5735f0658c3f"
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
id = 52554
old = "여행자들 사이에서".b
replacement = "트래블러들 사이에서".b
row = extract.call(source, id)
abort "old text not unique" unless row.scan(old).length == 1
updated = source.sub(row, row.sub(old, replacement))
abort "outside target Texto changed" unless updated.sub(extract.call(updated, id), extract.call(updated, id).sub(replacement, old)) == source
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
(52551..52600).each do |row_id|
  signatures = locales.map do |bytes|
    record = extract.call(bytes, row_id)
    [record.scan(/\n/n).length, record.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#|\$[A-Z0-9_.]+\$/n)]
  end
  abort "four-locale signatures #{row_id}: #{signatures}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{id} inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
