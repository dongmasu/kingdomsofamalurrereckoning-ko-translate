#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19887/locatexts_zh_cn.koalocatext_default.csv"
expected = "704eb12feb941d72cd6a29e21a9ab452d55f067a65cbeb1dc328360d638117d1"
range = 40601..40650
edits = {
  40601 => ["호스피탈리스 구역의 청원 게시판".b,
            "병원 구역의 청원 게시판".b],
  40610 => ["선택받은 자여".b, "부름받은 자여".b],
  40620 => ["페이랜드".b, "패란즈".b],
  40638 => ["완벽한 미사란".b, "흠 없는 미타란".b],
  40644 => ["바람의 신전".b, "바람의 성소".b]
}
abort "edit outside scope" unless edits.keys.all? { |id| range.cover?(id) }
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup is not byte-identical" unless File.binread(backup) == source

shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
original = shape.call(source)
abort "ID order differs" unless original.last == (0..65134).map(&:to_s)
%w[en_us ja_jp zh_cn].each do |locale|
  file = "src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv"
  ids = File.binread(file).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "#{locale} scope mismatch" unless ids.select { |id| range.cover?(id.to_i) } == range.map(&:to_s)
end

replace = lambda do |bytes, id, before, after|
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/nonunique row text #{id}" unless match && match[0].scan(before).size == 1
  bytes[match.begin(0)...match.end(0)] = match[0].sub(before, after)
end
updated = source.dup
edits.each { |id, (before, after)| replace.call(updated, id, before, after) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (before, after)| replace.call(inverse, id, after, before) }
abort "non-target byte/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} inverse/BOM/endings/order/locale=OK"
