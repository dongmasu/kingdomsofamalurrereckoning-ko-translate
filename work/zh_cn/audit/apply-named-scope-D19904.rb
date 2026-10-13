#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19904/locatexts_zh_cn.koalocatext_default.csv"
expected = "cc3baa15dcc1151b640d46a1136c1770e77ab99034849408532975d10ae6a8ab"
edits = {
  41451 => ["드루언, 난 널 잊지 못했어.".b, "드루언을 어떻게 잊겠어.".b],
  41489 => ["윌프 수사야.".b, "울프 수사야.".b],
  41491 => ["맹세방패".b, "서약방패병".b],
  41496 => ["검은 사절문서를 이용하려는".b, "세이블의 서신을 이용하려는".b],
  41500 => ["필멸자를 담보로 삼다니?".b, "필멸자가 서약자가 된다니?".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41451..41500).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41451..41500).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41451..41500).map(&:to_s)
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
