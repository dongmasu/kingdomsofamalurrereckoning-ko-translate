#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19910/locatexts_zh_cn.koalocatext_default.csv"
expected = "bbc3387fdee8e757403be67ec56aac7d43f91cf8ab1b4de66f03ff2437b52482"
edits = {
  41751 => ["콜로새는 타고난 체력과".b, "콜로세는 타고난 체력과".b],
  41755 => ["선택받은 자여.".b, "부름받은 자여.".b],
  41769 => ["콜로새의 하늘석공들이".b, "콜로세의 하늘석공들이".b],
  41780 => ["선결자들을 상대해선".b, "예정된 자들을 상대해선".b],
  41784 => ["보가트와 폐품꾼을 처치해야 해.".b, "보가트와 스캐브를 처치해야 해.".b],
  41787 => ["전쟁맹세단".b, "워스원".b],
  41792 => ["전쟁맹세단".b, "워스원".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41751..41800).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41751..41800).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41751..41800).map(&:to_s)
end
replace = lambda do |bytes, id, from, to|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless match && match[0].scan(from).size == 1
  bytes[match.begin(0)...match.end(0)] = match[0].sub(from, to)
end
updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
