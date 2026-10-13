#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20108-followup/locatexts_zh_cn.koalocatext_default.csv"
expected = "a7478e85dcfc6d10fc97318c80b46d8b878b0572f35ca5f1ad4e84fc14388270"
id = 51672
old_text = "원초 마법(Primal Magic)의 힘이 깃든 신비로운 홀."
new_text = "원초 마법(Primal Magic)의 힘이 깃든 신비로운 셉터(Sceptre)."

source = File.binread(path)
abort "active hash or byte-identical backup mismatch" unless
  Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source

match = source.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "target row missing or duplicated" unless
  match && match[0].scan(old_text.b).length == 1
updated = source.dup
updated[match.begin(0)...match.end(0)] =
  match[0].sub(old_text.b, new_text.b)
inverse = updated.dup
changed_row = inverse.match(/^#{id};.*?(?=^\d+;|\z)/nm)
abort "inverse target row missing" unless changed_row
inverse[changed_row.begin(0)...changed_row.end(0)] =
  changed_row[0].sub(new_text.b, old_text.b)
abort "bytes outside target Texto cell changed" unless inverse == source

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
extract = lambda do |bytes, row_id|
  matches = bytes.to_enum(:scan, /^#{row_id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate ID #{row_id}" unless matches.length == 1
  matches.first
end

(51651..51700).each do |row_id|
  fragments = locale_bytes.transform_values { |bytes| extract.call(bytes, row_id) }
  signatures = fragments.transform_values do |fragment|
    [
      fragment.scan(/\n/n).length,
      fragment.scan(/\{(?:LINE_SPACE|\d+|\*\d+)/n).sort
    ]
  end
  abort "line-break or runtime-marker mismatch at #{row_id}" unless
    signatures.values.uniq.length == 1
end

ids = locale_bytes.transform_values do |bytes|
  bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
    .select { |row_id| (51651..51700).cover?(row_id.to_i) }
end
abort "source scope alignment mismatch" unless
  ids.values.uniq.length == 1 && ids.values.first == (51651..51700).map(&:to_s)

File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=51672 inverse/BOM/mixed-endings/ordered-IDs/50-row-breaks-and-marker-identities/four-locale-alignment=OK"
