#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19905/locatexts_zh_cn.koalocatext_default.csv"
expected = "992318fe0108acb2e10b5ad9ab6876a4294d0bf08aabd258336f62d5171095c7"
edits = {
  41519 => ["발로어 구역에서 갑옷을 팔아.".b, "용맹의 집 부지에서 갑옷을 팔아.".b],
  41526 => ["페이 공동체야.".b, "페이 동굴이야.".b],
  41536 => ["위대한 여행자의 이름은".b, "위대한 트래블러의 이름은".b],
  41549 => ["투아사가 슬픔의 집을 공격한 일에".b, "투아사가 비탄의 집을 공격한 일에".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41501..41550).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41501..41550).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41501..41550).map(&:to_s)
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
