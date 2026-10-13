#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19896/locatexts_zh_cn.koalocatext_default.csv"
expected = "1da9b9fc714dc1a9d666a5c4ec4382252c0045f10d68bcbee9661aa11e895434"
range = 41051..41100
edits = {
  41060 => ["시드헤를 지나는 동안엔".b, "시드를 지나는 동안엔".b],
  41085 => ["까마귀단의 새 단원을".b, "크로우즈(The Crows)의 새 단원을".b]
}

abort "edit outside scope" unless edits.keys.all? { |id| range.cover?(id) }
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
abort "backup is not byte-identical" unless File.binread(backup) == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
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
