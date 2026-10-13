#!/usr/bin/env ruby
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D19868-followup/locatexts_zh_cn.koalocatext_default.csv"
expected = "68660b7289612d90bbd5a239328d8a490b62c60a845684ea3cc92978f5a40be5"
first_id = 39251
last_id = 39350
edits = [
  [39252, "상주 양조사이야", "상주 양조사야"],
  [39253, "역사적 자료이 풍부한", "역사적 자료가 풍부한"],
  [39279, "그레이트소드으로", "그레이트소드로"]
]

abort "edit outside assigned range" unless edits.all? { |id,| (first_id..last_id).cover?(id) }
source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
original_shape = shape.call(source)
abort "unexpected ID order" unless original_shape[-1] == (0..65134).map(&:to_s)

FileUtils.mkdir_p(File.dirname(backup))
abort "backup already differs" if File.exist?(backup) && File.binread(backup) != source
File.binwrite(backup, source) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == source

updated = source.dup
edits.each do |id, before, after|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing #{id}" unless match
  row = match[0]
  abort "expected text missing or repeated in #{id}" unless row.scan(before.b).size == 1
  updated[match.begin(0)...match.end(0)] = row.sub(before.b, after.b)
end

inverse = updated.dup
edits.reverse_each do |id, before, after|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse row missing #{id}" unless match
  row = match[0]
  abort "inverse text missing or repeated in #{id}" unless row.scan(after.b).size == 1
  inverse[match.begin(0)...match.end(0)] = row.sub(after.b, before.b)
end
abort "non-target bytes changed" unless inverse == source
abort "BOM/endings/order changed" unless shape.call(updated) == original_shape

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.map(&:first).join(',')} inverse/BOM/endings/order=OK"
