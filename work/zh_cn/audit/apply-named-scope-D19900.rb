#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19900/locatexts_zh_cn.koalocatext_default.csv"
expected = "44441a0160a14b8ade68952d2129461c70cb395d439dcb45d795032097863271"
edits = {
  41262 => ["불의한 자를 충격에 빠뜨리는 힘에서".b, "불의한 자에게 충격을 가하는 힘에서".b],
  41268 => ["아르카나 학회의 큰 관심을 끌 거야.".b, "스콜리아 아르카나의 큰 관심을 끌 거야.".b],
  41279 => ["이 여자는 혼수상태처럼 보이지만".b, "이 여자는 최면에 걸린 듯 보이지만".b],
  41289 => ["이 구멍을 통과하면 서약의 방패 계급을 얻게 해주지.".b, "이 일을 끝까지 마치면 서약의 방패 계급을 얻게 해주지.".b],
  41295 => ["용맹의 가문의 활약에".b, "용맹의 집의 활약에".b],
  41297 => ["발라드의 가문을 상징하는".b, "발라드의 집을 상징하는".b]
}
abort "scope mismatch" unless edits.keys.all? { |id| (41251..41300).cover?(id) }
source = File.binread(path)
abort "active/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order mismatch" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (41251..41300).cover?(id.to_i) }
  abort "#{locale} scope mismatch" unless ids == (41251..41300).map(&:to_s)
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
