#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19891/locatexts_zh_cn.koalocatext_default.csv"
expected = "5f4e177133add8b72303a7c504babc95ae41c820a3cd2f773c156350422f580c"
range = 40801..40850
edits = {
  40801 => ["윈더미어의 아가씨".b, "윈더미어의 시녀".b],
  40819 => ["비탄의 가문 본관 대강당".b, "비탄의 집 본관 대강당".b],
  40824 => [
    "바그레스트 심장의 재생하는 온기를 불어넣은 부적.".b,
    "바게스트 심장의 재생 온기가 깃든 부적.".b
  ],
  40839 => ["여름의 숲".b, "여름".b],
  40844 => ["고통스럽게 죽진 않았어.".b, "그자는 고통받지 않았어.".b],
  40846 => [
    "그곳에서 싸우라고 돈을 받았으니 가야 해.".b,
    "그곳에서 싸우라고 돈을 받았으니 싸워야 해.".b
  ]
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
