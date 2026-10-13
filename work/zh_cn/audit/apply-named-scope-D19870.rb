#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19870/locatexts_zh_cn.koalocatext_default.csv"
expected = "6f0bc1e827146e1888e4cf42639ecb97224bf2c57527eaa726a6873473579d16"
range = 39451..39550
edits = {
  39455 => ["이딜라의 부상에 관한 기록", "이디라의 부상에 관한 기록"],
  39467 => ["이딜라의 기반 상태", "이디라의 기반 상태"],
  39501 => ["어린 콜로새와 다 큰 콜로새", "어린 콜로사이와 다 큰 콜로사이"],
  39544 => ["갤로우즈 엔드", "갤로우스 엔드"]
}
abort "outside assigned range" unless edits.keys.all? { |id| range.cover?(id) }
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
original_shape = shape.call(source)
abort "unexpected ID order" unless original_shape[-1] == (0..65134).map(&:to_s)
{
  en: "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  ja: "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  zh: "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
}.each do |locale, file|
  ids = File.binread(file).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "#{locale} scope mismatch" unless ids.select { |id| range.cover?(id.to_i) } == range.map(&:to_s)
end

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, (before, after)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing row #{id}" unless match
  row = match[0]
  abort "nonunique expected text #{id}" unless row.scan(before.b).length == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end
inverse = updated.dup
edits.to_a.reverse_each do |id, (before, after)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing inverse row #{id}" unless match
  row = match[0]
  abort "nonunique inverse text #{id}" unless row.scan(after.b).length == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/order/locale-scope=OK"
