#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "a43a8cbdee8ca28af4cda9d2c931634d0917120343f04e6c0119ccda77e1c1cf"
scopes = {
  19933 => [42901..42950, {
    42934 => ["라시어 부두에서", "라시르 부두에서"]
  }],
  19934 => [42951..43000, {
    42954 => ["이딜라와 마찬가지로", "이디라와 마찬가지로"],
    42955 => ["아르카나 학술원 경비병", "스콜리아 아르카나 경비병"],
    42960 => ["아르카나 학술원 대사관", "스콜리아 아르카나 대사관"]
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
  abort "BOM/ID order" unless original[0] && original.last == (0..65134).map(&:to_s)
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
