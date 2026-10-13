#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "6bfd10b20b3dacf1ec0873a0f03d248281fae1322161d3a6d57dd4028e43c119"
scopes = {
  19925 => [42501..42550, {
    42502 => ["케이프 솔라스의", "케이프 솔러스의"],
    42510 => ["섀도손 공동에 묻힌", "섀도손 동굴에 묻힌"],
    42521 => ["트래블러의 달빛 야영지 소속", "트래블러의 달 야영지 소속"],
    42529 => ["운명의 기운이 생기를", "운명 에너지가 생기를"],
    42537 => ["42537;콜로새 경비병", "42537;콜로세 경비병"],
    42543 => ["오스트와 용병 세 명이", "오스트와 고용병 세 명이"],
    42545 => ["이 하우스는 아말루르에서", "이 발라드의 집은 아말루르에서"]
  }],
  19926 => [42551..42600, {
    42557 => ["그들부터 만나서 무슨 일이 있었는지 알아볼게.", "우선 그들부터 시작해 보고 어떻게 될지 지켜볼게."],
    42586 => ["하우스 오브 발라드의 일원인 우리도", "발라드의 집 일원인 우리도"],
    42596 => ["난 아포티어를 떠나고", "난 아포타이어를 떠나고"]
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
