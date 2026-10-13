#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20114/locatexts_zh_cn.koalocatext_default.csv"
expected = "7c266063c321b4850d1057c74bfa79b63cbd1fed9ee29b5360402ea22cbcc04a"
edits = {
  51958 => [
    ["고립된 멜 센시르(Mel Senshir)를 포위했고", "멜 센시르(Mel Senshir)를 고립시켰고"],
    ["틸레라 장군은 논평을 거부했다", "틸레라 장군에게서는 논평을 들을 수 없었다"]
  ],
  51959 => [
    ["여행자들(Travelers)의", "트래블러들(Travelers)의"],
    ["여행자들 야영지", "트래블러 야영지"]
  ]
}
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == expected && File.binread(backup) == source
extract = lambda do |bytes, id|
  rows = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing/duplicate #{id}" unless rows.length == 1
  rows.first
end
updated = source.dup
edits.each do |id, substitutions|
  row = extract.call(updated, id)
  substitutions.each do |old, replacement|
    abort "non-unique #{id}: #{old}" unless row.scan(old.b).length == 1
    row = row.sub(old.b, replacement.b)
  end
  updated[updated.index(extract.call(updated, id)), extract.call(updated, id).bytesize] = row
end
inverse = updated.dup
edits.each do |id, substitutions|
  row = extract.call(inverse, id)
  substitutions.reverse_each do |old, replacement|
    abort "inverse non-unique #{id}" unless row.scan(replacement.b).length == 1
    row = row.sub(replacement.b, old.b)
  end
  inverse[inverse.index(extract.call(inverse, id)), extract.call(inverse, id).bytesize] = row
end
abort "outside target cells changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[3] == (0..65134).map(&:to_s)
locales = {
  en: File.binread("src/csv/en_us/locatexts_en_us.koalocatext_default.csv"),
  ja: File.binread("src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv"),
  zh: File.binread("src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"),
  ko: updated
}
(51951..52000).each do |id|
  signatures = locales.transform_values do |bytes|
    row = extract.call(bytes, id)
    [row.scan(/\n/n).length, row.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n)]
  end
  abort "locale signatures #{id}: #{signatures}" unless signatures.values.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
