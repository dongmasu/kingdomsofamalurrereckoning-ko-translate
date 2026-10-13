#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20089/locatexts_zh_cn.koalocatext_default.csv"
expected = "6857eed61047dca1a7b138fdad3a6dc5ffab2549db566258bbdd59998c344d44"
changes = {
  50710 => [
    "대사제에게서 주변 도시 라시르(Rathir)에서 물건 세 점을 훔치라는 임무를 받았다.",
    "대사제에게 서품 의식을 받고, 인근 도시 라시르(Rathir)에서 물건 세 점을 훔치라는 명을 받았다."
  ],
  50742 => [
    "이게 너처럼 운명을 벗어난 자가 될 기회야.",
    "이게 너처럼 운명 없는 자가 될 기회야."
  ]
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
  (50701..50750).all? { |id| updated.match(/^#{id};/n) }

source_paths = %w[
  src/csv/en_us/locatexts_en_us.koalocatext_default.csv
  src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv
  src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv
]
source_paths.each do |source_path|
  ids = File.binread(source_path).scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  abort "source scope alignment mismatch: #{source_path}" unless
    ids.select { |id| (50701..50750).cover?(id.to_i) } ==
      (50701..50750).map(&:to_s)
end

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/endings/order/source-alignment=OK"
