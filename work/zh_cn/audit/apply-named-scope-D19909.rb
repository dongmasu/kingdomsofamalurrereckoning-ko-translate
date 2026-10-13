#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19909/locatexts_zh_cn.koalocatext_default.csv"
expected = "ba567d3eef891b80bd5dce64fb8c0fa71ff9eab555626e499c5daeea392af567"
edits = {
  41703 => ["콜로새를 이끌 책임이".b, "콜로세를 이끌 책임이".b],
  41718 => ["전쟁맹세단만 한 전사는 없어.".b, "워스원만 한 전사는 없어.".b],
  41721 => ["되찾으려면 코볼트는 죽을 때까지 싸워.".b, "그걸 되찾기 위해 코볼트는 목숨 걸고 싸울 거야.".b],
  41743 => ["그가 세운 슬픔의 집은".b, "그가 세운 비탄의 집은".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41701..41750).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41701..41750).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41701..41750).map(&:to_s)
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
