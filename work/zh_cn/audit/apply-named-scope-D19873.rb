#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19873/locatexts_zh_cn.koalocatext_default.csv"
expected = "4265caf3da79a693da14e18fd2aa2cc1a1b457b73806adec24dff19e35696888"
range = 39751..39850
edits = {
  39773 => ["용맹의 전당 토너먼트", "용맹의 집 토너먼트"],
  39801 => ["해제 훈련", "디스펠 훈련"],
  39826 => ["이 책을 읽으면 {1} 기술이 영구적으로 상승합니다.", "이 책을 읽어 {1} 기술이 영구적으로 상승했습니다."]
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
