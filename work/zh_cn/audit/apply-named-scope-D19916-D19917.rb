#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "62b98ecea4bcbc1fc033717e0612c594acbd329e580dfc89bc895551866202fa"
scopes = {
  19916 => [42051..42100, {
    42064 => ["42064;아르카나 학회", "42064;스콜리아 아르카나"],
    42070 => ["솔직히 난 말할 용기가 없어. 다인웰 신부에게 물어봐.", "솔직히 난 용기라곤 없어. 다인웰 신부에게 물어봐."],
    42088 => ["내 콜로새다움은", "내 콜로세다움은"],
    42093 => ["슬픔과 긍지, 복수의 집 곁에서", "비탄과 긍지, 복수의 집 곁에서"]
  }],
  19917 => [42101..42150, {
    42136 => ["네가 해낸다면 요람을 차지할 자격이 누구보다 충분하겠지.", "네가 해낸다면 내가 상상했던 것보다도 요람에 어울리는 자임을 증명하겠지."],
    42140 => ["저게 니스카루가 아니면 날 쓰러뜨려 봐.", "저게 니스카루가 아니면 날 때려도 좋아."],
    42149 => ["교수대 끝 섬이 이런 위업을 본 건 처음이다.", "갤로우스 엔드 섬이 이런 위업을 본 건 처음이다."]
  }]
}
shape = ->(b) { [b.start_with?("\xEF\xBB\xBF".b), b.scan("\r\n".b).size, b.scan(/(?<!\r)\n/n).size, b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten] }
replace = ->(b, id, from, to) {
  m = b.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target mismatch #{id}" unless m && m[0].scan(from.b).size == 1
  b[m.begin(0)...m.end(0)] = m[0].sub(from.b, to.b)
}
scopes.each do |number, (range, edits)|
  source = File.binread(path)
  abort "active hash mismatch" unless Digest::SHA256.hexdigest(source) == expected
  original = shape.call(source)
  abort "ID order" unless original.last == (0..65134).map(&:to_s)
  abort "scope mismatch" unless edits.keys.all? { |id| range.cover?(id) }
  %w[en_us ja_jp zh_cn].each do |locale|
    b = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
    ids = b.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| range.cover?(id.to_i) }
    abort "locale mismatch #{locale}" unless ids == range.map(&:to_s)
  end
  backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D#{number}/locatexts_zh_cn.koalocatext_default.csv"
  FileUtils.mkdir_p(File.dirname(backup))
  File.binwrite(backup, source)
  abort "backup mismatch" unless File.binread(backup) == source
  updated = source.dup
  edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
  inverse = updated.dup
  edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
  abort "non-target/shape changed" unless inverse == source && shape.call(updated) == original
  File.binwrite(path, updated)
  abort "write mismatch" unless File.binread(path) == updated
  puts "D-#{number}: pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys} BOM/endings/IDs/locales/inverse=OK"
  expected = Digest::SHA256.hexdigest(updated)
end
