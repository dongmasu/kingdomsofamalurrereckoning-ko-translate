#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19901/locatexts_zh_cn.koalocatext_default.csv"
expected = "8434064aacf8a047876cf35852742c837e3cb7fb6a361ac7b181ce08f9827505"
edits = {
  41302 => ["저주를 푸는 데 도움이 되리라".b, "나르카의 저주를 푸는 데 도움이 되리라".b],
  41345 => ["오머 보가드가 리라의 어디에 반한 건지 모르겠어.".b, "오머 보가드가 리라에게서 뭘 봤는지 모르겠어.".b],
  41346 => ["드렌은 오만의 가문을 지키는 수호자야.".b, "드렌은 긍지의 집을 지키는 수호자야.".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41301..41350).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41301..41350).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41301..41350).map(&:to_s)
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
