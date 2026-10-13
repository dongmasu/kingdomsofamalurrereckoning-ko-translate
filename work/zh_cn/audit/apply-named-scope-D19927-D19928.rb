#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "a7ad11e1629d2b3b4ed5a111168a90bfdfc995ae8541eba14376080e6237b569"
scopes = {
  19927 => [42601..42650, {
    42611 => ["불명예 제대한 병사 딩크다.", "불명예를 안은 병사 딩크다."],
    42627 => ["복수의 하우스뿐이야!", "복수의 집뿐이야!"],
    42640 => ["42640;망치", "42640;해머"]
  }],
  19928 => [42651..42700, {
    42658 => ["전쟁 전만큼 수확하는 사람은 거의 없어.", "전쟁 전만큼 곡식을 거두지는 못해."],
    42685 => ["전쟁의 신 티르돈{*1", "전쟁의 신 사이르돈{*1"]
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
  abort "active hash mismatch D-#{number}" unless Digest::SHA256.hexdigest(source) == expected
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
