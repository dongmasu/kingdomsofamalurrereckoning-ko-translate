#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20099/locatexts_zh_cn.koalocatext_default.csv"
expected = "42b487a7987d46cf7a12e7e0ed5e2ee230012cb789aff1d82f025ceaecf3e4c6"
edits = {
  51204 => [
    "사냥한 뒤 증거를 가져와.",
    "영양을 잡고, 사냥했다는 증거를 가져와."
  ],
  51237 => [
    "이 집에 파괴를 가져온 게",
    "발라드의 집에 파괴를 가져온 게"
  ],
  51244 => [
    "신앙이 우리 종족을 바꾸는 걸 봤지만, 침묵의 합창단(Silent Choir)만큼은 아니야.",
    "신앙이 우리 종족을 바꾸는 걸 봤지만, 침묵의 합창단(Silent Choir)만큼 크게 바뀐 이들은 없어."
  ]
}
scope = (51201..51250)

source = File.binread(path)
abort "active hash or byte-identical backup mismatch" unless
  Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source

updated = source.dup
edits.each do |id, (old_text, new_text)|
  old = old_text.b
  replacement = new_text.b
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target row missing or duplicated: #{id}" unless
    match && match[0].scan(old).length == 1
  updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
end

inverse = updated.dup
edits.each do |id, (old_text, new_text)|
  old = old_text.b
  replacement = new_text.b
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse target row missing or duplicated: #{id}" unless
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
  after_shape[3] == (0..65134).map(&:to_s)

source_paths = {
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
}
locale_bytes = { "ko" => updated }
source_paths.each { |locale, source_path| locale_bytes[locale] = File.binread(source_path) }

extract = lambda do |bytes, id|
  matches = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate ID #{id}" unless matches.length == 1
  matches.first
end

scope.each do |id|
  fragments = locale_bytes.transform_values { |bytes| extract.call(bytes, id) }
  signatures = fragments.transform_values do |fragment|
    [
      fragment.scan(/\n/n).length,
      fragment.scan(/\{(?:LINE_SPACE|\d+|\*\d+)/n).flatten
    ]
  end
  abort "line-break or runtime-marker mismatch at #{id}: #{signatures.inspect}" unless
    signatures.values.uniq.length == 1
end

scope_ids = locale_bytes.transform_values do |bytes|
  bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
    .select { |id| scope.cover?(id.to_i) }
end
abort "source scope alignment mismatch: #{scope_ids.inspect}" unless
  scope_ids.values.uniq.length == 1 &&
  scope_ids.values.first == scope.map(&:to_s)

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=51204,51237,51244 inverse/BOM/mixed-endings/ordered-IDs/50-row-breaks-and-runtime-markers/four-locale-alignment=OK"
