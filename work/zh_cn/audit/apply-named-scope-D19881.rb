#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19881/locatexts_zh_cn.koalocatext_default.csv"
expected = "01818f4173b4c85fa00ae7f5505a789953d38c9e12f3942ac946c5a96faa323a"
range = 40301..40350
edits = { 40335 => ["해제술을 배우러 왔나?", "디스펠을 배우러 왔나?"] }
abort "edit outside scope" unless edits.keys.all? { |id| range.cover?(id) }
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
original = shape.call(source)
abort "ID order differs" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  file = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv"
  ids = File.binread(file).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "#{locale} mismatch" unless ids.select { |id| range.cover?(id.to_i) } == range.map(&:to_s)
end
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source
replace = lambda do |bytes, id, before, after|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/nonunique row text #{id}" unless match && match[0].scan(before.b).size == 1
  bytes[match.begin(0)...match.end(0)] = match[0].sub(before.b, after.b)
end
updated = source.dup
edits.each { |id, (before, after)| replace.call(updated, id, before, after) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (before, after)| replace.call(inverse, id, after, before) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
