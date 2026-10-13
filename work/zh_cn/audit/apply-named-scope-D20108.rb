#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20108/locatexts_zh_cn.koalocatext_default.csv"
expected = "35faadbfdd255808739225181044cfa4e228a6563a66b7e558a1a4a4f35a9f94"
edits = {
  51669 => [
    "{*1여행자 진영}",
    "{*1트래블러 진영}"
  ],
  51688 => [
    "여행자들(Travelers)",
    "트래블러들(Travelers)"
  ]
}
scope = (51651..51700)

source = File.binread(path)
abort "active hash or byte-identical backup mismatch" unless
  Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source

updated = source.dup
changed_at = {}
edits.each do |id, (old_text, new_text)|
  old = old_text.b
  replacement = new_text.b
  match = updated.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "target row missing or duplicated: #{id}" unless
    match && match[0].scan(old).length == 1
  changed_at[id] = match.begin(0) + match[0].index(old)
  updated[match.begin(0)...match.end(0)] = match[0].sub(old, replacement)
end

inverse = updated.dup
edits.to_a.reverse_each do |id, (old_text, new_text)|
  old = old_text.b
  replacement = new_text.b
  match = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "inverse target row missing: #{id}" unless match
  offset = changed_at[id] - match.begin(0)
  abort "inverse target row changed: #{id}" unless
    offset >= 0 && match[0].byteslice(offset, replacement.bytesize) == replacement
  row = match[0].dup
  row[offset, replacement.bytesize] = old
  inverse[match.begin(0)...match.end(0)] = row
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
      fragment.scan(/\{(?:LINE_SPACE|\d+|\*\d+)/n).sort
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
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=51669,51688 inverse/BOM/mixed-endings/ordered-IDs/50-row-breaks-and-marker-identities/four-locale-alignment=OK"
