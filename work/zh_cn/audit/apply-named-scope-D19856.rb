#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19856/locatexts_zh_cn.koalocatext_default.csv"
expected = "3443677a4e91afe8b3376c1c1aa9dc38e9bd4dc01574fd3a12fff7efa8cc598c"
edits = {
  38059 => ["아, 초대받은 자로군.", "아, 부름받은 자로군."],
  38082 => [
    "이 페이의 무덤돌은 로어스톤의 일종으로, '메로피스의 보물'이라는 발라드를 전한다. 발라드의 집과 관련된 장소에서 찾을 수 있는 메아리석과 함께 사용해야 한다.",
    "이 페이의 돌무덤은 로어스톤의 일종으로, '메로피스의 보물'이라는 발라드를 전한다. 발라드의 집과 관련된 장소에서 찾을 수 있는 메아리석과 함께 사용해야 한다."
  ],
  38139 => ["라시어의 피르데리", "라시르의 피르데리"]
}

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
before_shape = shape.call(source)
abort "unexpected ID order" unless before_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (38051..38150).all? { |id| source.match(/^#{id};/n) }

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, (before, after)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "text not unique #{id}" unless row.scan(before.b).size == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end
inverse = updated.dup
edits.each do |id, (before, after)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text not unique #{id}" unless row.scan(after.b).size == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == before_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/order=OK"
