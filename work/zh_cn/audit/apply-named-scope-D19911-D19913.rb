#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
scopes = {
  19911 => [41801..41850, {
    41801 => ["그자는 우리 중 몇 명을 대신 내기에 쓰고 있어. 여기 남으려면 우리가 뭘 할 수 있겠어?", "그자는 우리 중 몇 명에게 자기 대신 내기를 시키고 있어. 여기 계속 있으려면 우리로선 어쩔 도리가 없지."],
    41848 => ["괴물의 보물 더미에 끼워져 있던 찢어진 쪽지.", "괴물이 모아 둔 물건 더미에 끼워져 있던 찢어진 책장."]
  }],
  19912 => [41851..41900, {
    41858 => ["전쟁맹세단이 뭘 숨겨 두고 있는지", "워스원이 뭘 숨겨 두고 있는지"],
    41878 => ["주인과 떨어져 잘 지내지 못한 모양이야.", "부츠는 주인과 떨어져 있는 동안 상태가 나빠진 모양이야."]
  }],
  19913 => [41901..41950, {
    41916 => ["콜로새의 시조인 크레이오스의 것이라고 한다. 쓰면 콜로새의", "콜로세의 시조인 크레이오스의 것이라고 한다. 쓰면 콜로세의"],
    41922 => ["발로어의 전당이 열리지 않았다.", "용맹의 집이 열리지 않았다."],
    41927 => ["전쟁맹세단은 관심이 없어.", "워스원은 관심이 없어."],
    41934 => ["완벽한 미사란의 고통 결박", "완벽한 미타란의 고통 결박"],
    41937 => ["자유민이나 평원에서", "프리맨(Freemen)이나 평원에서"]
  }]
}
expected = "0699a8e0da41e96d41d7c2afa36793628cae38bb279c578e56d442272411c55d"
shape = ->(bytes) {
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
}
replace = ->(bytes, id, from, to) {
  match = bytes.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing ID #{id}" unless match
  row = match[0]
  abort "ambiguous Texto #{id}" unless row.scan(from.b).size == 1
  bytes[match.begin(0)...match.end(0)] = row.sub(from.b, to.b)
}
scopes.each do |number, (range, edits)|
  source = File.binread(path)
  abort "active hash mismatch D-#{number}" unless Digest::SHA256.hexdigest(source) == expected
  original = shape.call(source)
  abort "bad ID order" unless original.last == (0..65134).map(&:to_s)
  abort "edits outside scope" unless edits.keys.all? { |id| range.cover?(id) }
  %w[en_us ja_jp zh_cn].each do |locale|
    other = File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
    ids = other.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten.select { |id| range.cover?(id.to_i) }
    abort "#{locale} IDs mismatch" unless ids == range.map(&:to_s)
  end
  backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D#{number}/locatexts_zh_cn.koalocatext_default.csv"
  FileUtils.mkdir_p(File.dirname(backup))
  File.binwrite(backup, source)
  abort "backup differs" unless File.binread(backup) == source
  updated = source.dup
  edits.each { |id, (from, to)| replace.call(updated, id, from, to) }
  inverse = updated.dup
  edits.to_a.reverse_each { |id, (from, to)| replace.call(inverse, id, to, from) }
  abort "non-target/shape change" unless inverse == source && shape.call(updated) == original
  File.binwrite(path, updated)
  abort "write mismatch" unless File.binread(path) == updated
  post = Digest::SHA256.hexdigest(updated)
  puts "D-#{number} range=#{range} pre=#{expected} post=#{post} backup=#{backup} edited=#{edits.keys.join(',')} shape=#{original[0..2].inspect} locales/inverse=OK"
  expected = post
end
