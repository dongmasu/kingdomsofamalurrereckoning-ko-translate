#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20090/locatexts_zh_cn.koalocatext_default.csv"
expected = "1498fb3f691f20c2ba71c7ce5b672b44d888b3cc34d0dda8d18ef9896e1bdc0d"
changes = {
  50768 => ["그래, 더스트링(Dustling)?", "그래, 먼지나부랭이?"]
}.transform_values { |pair| pair.map(&:b) }

source = File.binread(path)
abort "active hash or byte-identical backup mismatch" unless
  Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source

updated = source.dup
changes.each do |id, (old, replacement)|
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row/fragment missing or duplicated #{id}" unless
    match && match[0].scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
end

inverse = updated.dup
changes.each do |id, (old, replacement)|
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse fragment missing #{id}" unless
    match && match[0].scan(replacement).length == 1
  inverse[match.begin(0)...match.end(0)] = match[0].sub(replacement, old)
end
abort "bytes outside target Texto cells changed" unless inverse == source

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).length,
    bytes.scan(/(?<!\r)\n/n).length,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
before_shape = shape.call(source)
after_shape = shape.call(updated)
abort "BOM, line endings, row order, or row count changed" unless
  before_shape == after_shape &&
  after_shape[3] == (0..65134).map(&:to_s) &&
  (50751..50800).all? { |id| updated.match(/^#{id};/n) }

source_paths = %w[
  src/csv/en_us/locatexts_en_us.koalocatext_default.csv
  src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv
  src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv
]
source_paths.each do |source_path|
  ids = File.binread(source_path).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "source scope alignment mismatch: #{source_path}" unless
    ids.select { |id| (50751..50800).cover?(id.to_i) } ==
      (50751..50800).map(&:to_s)
end

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order/source-alignment=OK"
