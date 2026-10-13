#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20115/locatexts_zh_cn.koalocatext_default.csv"
pre = "752c89333747759bffec3e7d9adb44f796adf67989dfeff4fb1a034dc6110934"
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
before = extract.call(source, 52048)
old = "마법 해제(Dispelling)".b
replacement = "디스펠(Dispelling)".b
abort "old text not unique" unless before.scan(old).length == 1
updated = source.sub(before, before.sub(old, replacement))
abort "outside target Texto changed" unless updated.sub(extract.call(updated, 52048), extract.call(updated, 52048).sub(replacement, old)) == source
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
(52001..52050).each do |id|
  signatures = locales.map do |bytes|
    row = extract.call(bytes, id)
    [row.scan(/\n/n).length, row.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n)]
  end
  abort "four-locale signatures #{id}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=52048 inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
