#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
expected = "cbe48dd83bbe251e1c1f523ea8c07fcdaa7a6827a99419a173b33ac82246065a"
scopes = {
  19923 => [42401..42450, {
    42402 => ["42402;호스피탈리스 구역", "42402;병원 구역"],
    42413 => ["이딜라 지하 하수도에서", "이디라 지하 하수도에서"],
    42416 => ["42416;미사루의 거석", "42416;미타란의 거석"],
    42431 => ["하우스는 폐허가 되었고", "비탄의 집은 폐허가 되었고"],
    42441 => ["42441;하이페리온의 부상", "42441;히페리안의 부상"],
    42442 => ["성 뒤편 도서관에 있을 거야.", "성 안쪽에 있는 도서관에 있을 거야."],
    42446 => ["하우스 오브 발라드의 왕좌에", "발라드의 집 왕좌에"]
  }],
  19924 => [42451..42500, {
    42460 => ["명망 높은 조직인 트래블러스에", "명망 높은 조직인 트래블러에"],
    42485 => ["하우스 오브 소로우즈는", "비탄의 집은"],
    42496 => ["42496;아무도 다치게 하지 않을 거야.", "42496;넌 아무도 다치게 하지 않을 거야."]
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
