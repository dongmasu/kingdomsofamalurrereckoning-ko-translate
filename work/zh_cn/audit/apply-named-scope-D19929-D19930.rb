#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "1a30d5185af2fd6b92fd38d3e487d621642d7ea4ec88ec4c0fc4657d6aee399c"
scopes = {
  19929 => [42701..42750, {
    42713 => ["미사란 드레드스케일 흉갑", "미타란 드레드스케일 흉갑"],
    42738 => ["라시어가 되었다.", "라시르가 되었다."],
    42739 => ["오라이즌 의식을 마치노라.", "오라이슨 의식을 마치노라."],
    42747 => ["에마이어에서 앨린 시르 만나기", "에마이어에서 앨린 쉬르 만나기"]
  }],
  19930 => [42751..42800, {
    42758 => ["그런데 트래블러스도", "그런데 트래블러도"],
    42763 => ["42763;라시어", "42763;라시르"],
    42781 => ["전승 방식도 바뀌었어.", "전승도 바뀌었어."],
    42782 => ["상자가 처음 보내진 아포티어에서", "상자가 처음 보내진 아포타이어에서"],
    42785 => ["실드링 킵에서 용병으로 워스원에", "실드링 킵에서 고용병으로 워스원에"]
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
