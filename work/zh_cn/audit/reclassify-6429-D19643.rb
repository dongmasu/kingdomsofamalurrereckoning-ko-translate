#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-reclassify-6429-D19643/locatexts_zh_cn.koalocatext_default.csv"
expected = "6fbc36e561295e5ac2d1aed97093139ab0fab4de4f0c17b4447ab65840744c04"
old_text = "벽이 더 많은 피로 물들겠군".b
new_text = "벽을 물들일 피가 더 필요하군".b

original = File.binread(path)
abort "active CSV hash changed" unless Digest::SHA256.hexdigest(original) == expected
abort "backup is not byte-identical" unless File.binread(backup) == original

lines = original.lines
matched = false
updated = lines.map do |line|
  next line unless line.match?(/\A6429;/n)
  abort "ID 6429 matched more than once" if matched
  abort "ID 6429 replacement not found" unless line.scan(old_text).length == 1
  matched = true
  line.sub(old_text, new_text)
end.join
abort "ID 6429 missing" unless matched

inverse = updated.lines.map do |line|
  line.match?(/\A6429;/n) ? line.sub(new_text, old_text) : line
end.join
abort "exact inverse failed" unless inverse == original
abort "UTF-8 BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
abort "line-ending or row-order shape changed" unless
  [original.scan("\r\n".b).length, original.scan(/(?<!\r)\n/n).length,
   original.lines.map { |line| line[/\A(\d+);/n, 1] }.compact] ==
  [updated.scan("\r\n".b).length, updated.scan(/(?<!\r)\n/n).length,
   updated.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]

File.binwrite(path, updated)
puts "reclassified ID 6429 as not an issue; post=#{Digest::SHA256.hexdigest(updated)}"
