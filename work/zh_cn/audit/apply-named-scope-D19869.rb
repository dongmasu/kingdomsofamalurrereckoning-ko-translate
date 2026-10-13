#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19869/locatexts_zh_cn.koalocatext_default.csv"
expected = "dc72d6b0c6d461aa6dfc01f7300cb5c7fd1274044f91377829d5c2790f766f17"
first_id = 39351
last_id = 39450
edits = [
  [39357, "달리기", "질주"],
  [39380, "교수대 끝", "갤로우스 엔드"],
  [39385, "콜로새", "콜로사이"],
  [39392, "이딜라", "이디라"],
  [39398, "발라드 가문", "발라드의 집"],
  [39402, "미사루식", "미타란"],
  [39441, "미사루 저항군", "미타란 저항군"]
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
edits.each do |id, before, after|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "expected text missing or repeated in #{id}" unless row.scan(before.b).size == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end

inverse = updated.dup
edits.reverse_each do |id, before, after|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text missing or repeated in #{id}" unless row.scan(after.b).size == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.map(&:first).join(',')} inverse/BOM/endings/order/locale-scope=OK"
