#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19868/locatexts_zh_cn.koalocatext_default.csv"
expected = "27715acf05bb289275a4d1507560f5f387654055147f38b9d574c3c22ddfc1bd"
first_id = 39251
last_id = 39350
edits = [
  [39252, "상주 양조장", "상주 양조사", 1],
  [39253, "역사적 유물", "역사적 자료", 1],
  [39255, "브레이코르", "브래코르", 3],
  [39270, "타락했고,\r\n그로써 자유를 빼앗겼다.", "타락시켰고,\r\n그로써 자유를 빼앗았다.", 1],
  [39279, "대검", "그레이트소드", 1],
  [39288, "하이페리온", "하이페리언", 1],
  [39299, "콜로새", "콜로사이", 1],
  [39321, "각 구매자에게", "평판 좋은 구매자들에게", 1]
]

abort "edit outside assigned range" unless edits.all? { |id,| (first_id..last_id).cover?(id) }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
original_shape = shape.call(source)
abort "unexpected ID order" unless original_shape[-1] == (0..65134).map(&:to_s)

rows_by_locale = {}
{
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
  "ko" => path
}.each do |locale, file|
  bytes = File.binread(file)
  rows_by_locale[locale] = bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);.*?(?=^(?:\xEF\xBB\xBF)?\d+;|\z)/nm).flatten
  abort "#{locale} scope missing" unless (first_id..last_id).all? { |id| rows_by_locale[locale].count(id.to_s) == 1 }
end
abort "locale scope order differs" unless rows_by_locale.values.map { |ids| ids.select { |id| (first_id..last_id).cover?(id.to_i) } }.uniq.one?

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, before, after, count|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "unexpected occurrence count in #{id}" unless row.scan(before.b).size == count
  updated[match.begin(0)...match.end(0)] = row.gsub(before.b, after.b)
end

inverse = updated.dup
edits.reverse_each do |id, before, after, count|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse occurrence count in #{id}" unless row.scan(after.b).size == count
  inverse[match.begin(0)...match.end(0)] = row.gsub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.map(&:first).uniq.join(',')} inverse/BOM/endings/order/locale-scope=OK"
