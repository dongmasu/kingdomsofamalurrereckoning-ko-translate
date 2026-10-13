#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19890/locatexts_zh_cn.koalocatext_default.csv"
expected = "92fcc0e59a50cae5291033ec31a9de33b99b3d9d03703a3b3e311afd2efb03e0"
range = 40751..40800
edits = {
  40761 => [
    "황무지를 돌아다닐 땐 조심하는 게 좋을 거다, 선택받은 자여.".b,
    "황무지를 돌아다닐 땐 조심하는 게 좋을 거다, 부름받은 자여.".b
  ],
  40764 => ["갈로우스 엔드를".b, "갤로우스 엔드를".b],
  40782 => [
    "그래. 콜름이 성서를 망가뜨리던 널 붙잡았다더니 바로 네가 그 잔챙이였군. 잘했어, 콜름. 꽤 피해를 줄 수 있는 녀석 같네.".b,
    "그래. 콜름이 테스타먼트를 무너뜨리던 널 발견했다더니, 바로 네가 그 잔챙이였군. 잘했어, 콜름. 꽤 피해를 줄 수 있는 녀석 같네.".b
  ],
  40787 => ["까마귀단".b, "크로우즈(The Crows)".b],
  40791 => [
    "그자는 그저 군인이 아니라 장교야. 그렇게 무딘 데다 무자비한 정신머리로는 베레스의 작품이 지닌 섬세함과 숭고함을 결코 이해할 수 없겠지.".b,
    "그자는 그저 군인, 장교에 불과해. 그렇게 무딘 데다 무자비한 정신머리로는 베레스의 작품이 지닌 섬세함과 숭고함을 결코 이해할 수 없겠지.".b
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
