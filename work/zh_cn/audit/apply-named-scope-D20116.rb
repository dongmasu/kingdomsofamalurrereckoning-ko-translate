#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20116/locatexts_zh_cn.koalocatext_default.csv"
pre = "c96a4be2f0dd6ef40db6b0ae87971eef95764f1a22fa6e1e957bd12c0f795264"
edits = {
  52066 => [["불려온 자(The Beckoned)", "부름받은 자(The Beckoned)"]],
  52069 => [["암호기(Cipher)", "사이퍼(Cipher)"], ["하이페리온(Hyperian)", "하이페리언(Hyperian)"]],
  52076 => [["우리가 전쟁을 무사히 넘긴 게 아니면 뭐겠어?", "그렇지 않고서야 우리가 어떻게 전쟁을 무사히 넘겼겠어?"]]
}
source = File.binread(path)
abort "pre-edit hash/backup mismatch" unless Digest::SHA256.hexdigest(source) == pre && File.binread(backup) == source
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
  original = extract.call(updated, id)
  updated[updated.index(original), original.bytesize] = row
end
inverse = updated.dup
edits.each do |id, substitutions|
  row = extract.call(inverse, id)
  substitutions.reverse_each do |old, replacement|
    abort "inverse non-unique #{id}" unless row.scan(replacement.b).length == 1
    row = row.sub(replacement.b, old.b)
  end
  original = extract.call(inverse, id)
  inverse[inverse.index(original), original.bytesize] = row
end
abort "outside target cells changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b), bytes.scan("\r\n".b).length,
   bytes.scan(/(?<!\r)\n/n).length, bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM/endings/ID order" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[3] == (0..65134).map(&:to_s)
locales = [
  "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
  "src/csv/ja_jp/locatexts_ja_jp.koalocatext_default.csv",
  "src/csv/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
].map { |p| File.binread(p) } + [updated]
(52051..52100).each do |id|
  signatures = locales.map do |bytes|
    row = extract.call(bytes, id)
    markers = row.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#/n).map do |marker|
      marker.sub(/\A\{\*1\[[^\]]+\]\}\z/n, "{*1[LOCALIZED]}")
    end
    [row.scan(/\n/n).length, markers]
  end
  abort "four-locale signatures #{id}" unless signatures.uniq.length == 1
end
File.binwrite(path, updated)
puts "pre=#{pre} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{edits.keys.join(',')} inverse/BOM/endings/ordered-IDs/50-row-locale-signatures=OK"
