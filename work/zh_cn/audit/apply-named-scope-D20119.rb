#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20119/locatexts_zh_cn.koalocatext_default.csv"
pre = "af58c90a0f3227dbb7e311128c5844de9d3364e1e10f303fb5ff7ed610e72da0"
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
old = "비탄(Sorrows)이".b
replacement = "비탄의 힘(Sorrows)이".b
row = extract.call(source, 52201)
abort "old text not unique" unless row.scan(old).length == 1
updated = source.sub(row, row.sub(old, replacement))
abort "outside target Texto changed" unless updated.sub(extract.call(updated, 52201), extract.call(updated, 52201).sub(replacement, old)) == source
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
(52201..52250).each do |id|
  signatures = locales.map do |bytes|
    record = extract.call(bytes, id)
    [record.scan(/\n/n).length, record.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n)]
  end
  abort "four-locale signatures #{id}: #{signatures}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=52201 inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
