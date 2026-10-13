#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20112/locatexts_zh_cn.koalocatext_default.csv"
expected = "5ede44c68e3c1337a1bda86a190e4be54ec1b646ce1e99572ef4c27050c66af2"
edits = {
  51859 => [
    ["아르카나 학회는", "스콜리아 아르카나는"]
  ],
  51865 => [
    ["완벽한 미타란 관통 리벳", "흠 없는 미타란 관통 리벳"]
  ],
  51867 => [
    ["아르카나 학회에", "스콜리아 아르카나에"]
  ],
  51870 => [
    ["석주(lith)", "석조물(lith)"]
  ]
}

source = File.binread(path)
abort "active hash or byte-identical backup mismatch" unless
  Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source

extract = lambda do |bytes, row_id|
  matches = bytes.to_enum(:scan, /^#{row_id};.*?(?=^\d+;|\z)/nm)
    .map { Regexp.last_match[0] }
  abort "missing/duplicate ID #{row_id}" unless matches.length == 1
  matches.first
end

updated = source.dup
edits.each do |row_id, substitutions|
  row = extract.call(updated, row_id)
  substitutions.each do |old_text, new_text|
    abort "expected unique text missing at #{row_id}" unless
      row.scan(old_text.b).length == 1
    row = row.sub(old_text.b, new_text.b)
  end
  original_row = extract.call(updated, row_id)
  offset = updated.index(original_row)
  updated[offset...offset + original_row.bytesize] = row
end

inverse = updated.dup
edits.each do |row_id, substitutions|
  row = extract.call(inverse, row_id)
  substitutions.reverse_each do |old_text, new_text|
    abort "inverse text missing at #{row_id}" unless
      row.scan(new_text.b).length == 1
    row = row.sub(new_text.b, old_text.b)
  end
  original_row = extract.call(inverse, row_id)
  offset = inverse.index(original_row)
  inverse[offset...offset + original_row.bytesize] = row
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
abort "BOM, line endings, row order, or row count changed" unless
  shape.call(source) == shape.call(updated) &&
  shape.call(updated)[3] == (0..65134).map(&:to_s)

source_paths = {
  "en" => "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "ja" => "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "zh" => "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
}
locale_bytes = { "ko" => updated }
source_paths.each { |locale, source_path| locale_bytes[locale] = File.binread(source_path) }
marker_pattern = /\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n

(51851..51900).each do |row_id|
  fragments = locale_bytes.transform_values { |bytes| extract.call(bytes, row_id) }
  signatures = fragments.transform_values do |fragment|
    [
      fragment.scan(/\n/n).length,
      fragment.scan(marker_pattern)
    ]
  end
  abort "line-break or runtime-marker mismatch at #{row_id}" unless
    signatures.values.uniq.length == 1
end

ids = locale_bytes.transform_values do |bytes|
  bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
    .select { |row_id| (51851..51900).cover?(row_id.to_i) }
end
abort "source scope alignment mismatch" unless
  ids.values.uniq.length == 1 && ids.values.first == (51851..51900).map(&:to_s)

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(",")} inverse/BOM/mixed-endings/ordered-IDs/50-row-breaks-and-marker-identities/four-locale-alignment=OK"
