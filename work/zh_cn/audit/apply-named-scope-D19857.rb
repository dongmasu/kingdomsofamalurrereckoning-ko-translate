#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19857/locatexts_zh_cn.koalocatext_default.csv"
expected = "5218f3f3f316f1b1c4c13a98687b902087851212c7c7f9d1c92a1ae74c14374f"
edits = {
  38174 => ["꼬마 운명 직조사여, 나를 감옥에서 풀어다오!",
            "꼬마 페이트위버여, 나를 감옥에서 풀어다오!"],
  38234 => ["저기 아풀로스는 자기가 갑옷을 산 뒤보다 더 멋지게 고칠 수 있다고 믿게 만들걸.",
            "저기 아풀로스는 어떤 갑옷이든 샀을 때보다 더 좋은 상태로 고칠 수 있다고 믿게 만들걸."]
}

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).size,
   bytes.scan(/(?<!\r)\n/n).size,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
original_shape = shape.call(source)
abort "unexpected ID order" unless original_shape[-1] == (0..65134).map(&:to_s)
abort "scope missing" unless (38151..38250).all? { |id| source.match(/^#{id};/n) }

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
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/order=OK"
