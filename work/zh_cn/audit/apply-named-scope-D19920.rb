#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "36fee044c8a1d45326843ff8d29f3a647e8672092b36766eaa2eb80fbe372e87"
edits = {
  42264 => ["가장 오래된 여행자 중 한 명일 텐데", "가장 오래된 트래블러 중 한 명일 텐데"],
  42265 => ["정해진 자들 중 하나는 아니야.", "예정된 자들 중 하나는 아니야."],
  42266 => ["시험은 학자 엔가르가 주관할 거야.", "시험은 사반트 엔가르가 주관할 거야."],
  42273 => ["갈로우즈 엔드 해변에", "갤로우스 엔드 해변에"],
  42292 => ["42292;콜로새 시체", "42292;콜로세 시체"],
  42298 => ["여기가 이곳 이름이야?", "그게 이곳 이름이야?"]
}
source = File.binread(path)
abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
original = shape.call(source)
abort "ID order" unless original.last == (0..65134).map(&:to_s)
abort "scope mismatch" unless edits.keys.all? { |id| (42251..42300).cover?(id) }
%w[en_us ja_jp zh_cn].each do |locale|
  b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| (42251..42300).cover?(id.to_i) }
  abort "locale mismatch #{locale}" unless ids == (42251..42300).map(&:to_s)
end
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19920/locatexts_zh_cn.koalocatext_default.csv"
FileUtils.mkdir_p(File.dirname(backup))
File.binwrite(backup, source)
abort "backup mismatch" unless File.binread(backup) == source
replace = ->(b, id, from, to) {
  m = b.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless m && m[0].scan(from.b).size == 1
  b[m.begin(0)...m.end(0)] = m[0].sub(from.b, to.b)
}
updated = source.dup
edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
inverse = updated.dup
edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
abort "non-target/shape changed" unless inverse == source && shape.call(updated) == original
File.binwrite(path, updated)
abort "write mismatch" unless File.binread(path) == updated
puts "D-19920 pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
