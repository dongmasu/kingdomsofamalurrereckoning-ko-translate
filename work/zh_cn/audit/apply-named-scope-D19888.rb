#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19888/locatexts_zh_cn.koalocatext_default.csv"
expected = "f9ce5a8a7d99dc394f3146c24f53e9f4f41fa6b0c427fb6a5bbed0198000cec8"
range = 40651..40700
edits = {
  40659 => ["콜로세 문화".b, "콜로사이 문화".b],
  40664 => ["장검 물리 피해 +5\r\n장검 피해 +10%".b,
            "롱소드 물리 피해 +5\r\n롱소드 피해 +10%".b],
  40689 => ["가문이 생기기 전부터 살아왔을 만큼 오래됐지.".b,
            "비탄의 집이 생기기 전부터 살아왔을 만큼 오래됐지.".b],
  40698 => ["그 눈빛은 약속을 건네지. 결코 지켜주지 않을 약속을 말이야.".b,
            "그 눈빛은 그녀가 결코 주지 않을 것들을 약속하지.".b]
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
