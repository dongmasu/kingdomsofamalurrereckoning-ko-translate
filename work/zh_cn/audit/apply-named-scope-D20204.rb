#!/usr/bin/env ruby
require "csv"
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20204/locatexts_zh_cn.koalocatext_default.csv"
expected = "e2ae9b4cb677d9d6f0dded18607dfa10828feca5b6d1a73ef4ad681a7a24bc81"
changes = {
  56480 => [
    "지금은 아노카토스(Anokatos)의 침묵의 성가대가 은신처로 삼고 있다. 그 시설은 처음 파낸 자리, 이빨 산맥의 산속에 그대로 자리하고 있다.",
    "지금은 아노카토스(Anokatos)의 침묵의 합창단(Silent Choir)이 은신처로 삼고 있다. 그 시설은 처음 파낸 자리, 이빨 산맥의 산속에 그대로 자리하고 있다."
  ],
  56491 => [
    "타릭의 힘에 대해 경고했잖아… 그이는 뭐든 세게 치는 걸 좋아해. 한 번 더 해볼래?",
    "타릭의 힘에 대해 경고했잖아… 뭐든 세게 치는 걸 좋아하거든. 한 번 더 해볼래?"
  ]
}

before = File.binread(path)
abort "hash/backup mismatch" unless
  Digest::SHA256.hexdigest(before) == expected && File.binread(backup) == before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "row missing/duplicate #{id}" unless matches.size == 1
  matches.first
end

after = before.dup
changes.each do |id, (old, replacement)|
  original = row.call(after, id)
  abort "target mismatch #{id}" unless original.scan(old.b).size == 1
  after.sub!(original, original.sub(old.b, replacement.b))
end

inverse = after.dup
changes.each do |id, (old, replacement)|
  original = row.call(inverse, id)
  abort "inverse mismatch #{id}" unless original.scan(replacement.b).size == 1
  inverse.sub!(original, original.sub(replacement.b, old.b))
end
abort "non-target bytes changed" unless inverse == before

shape = lambda do |bytes|
  [
    bytes.start_with?("\xEF\xBB\xBF".b),
    bytes.scan("\r\n".b).size,
    bytes.scan(/(?<!\r)\n/n).size,
    bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten
  ]
end
abort "BOM/endings/order mismatch" unless
  shape.call(before) == shape.call(after) &&
  shape.call(after)[-1] == (0..65134).map(&:to_s)

files = [
  after,
  *%w[en_us ja_jp zh_cn].map do |locale|
    File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
  end
]
records = files.map do |bytes|
  (56451..56500).map do |id|
    fields = CSV.parse_line(
      row.call(bytes, id).dup.force_encoding("UTF-8"),
      col_sep: ";",
      row_sep: "\r\n"
    )
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1]
  end
end
marker = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
      .map { |token| token.sub(/\A\{\*(\d+).*\}\z/, '{*\1}') }
end
(0...50).each do |index|
  texts = records.map { |set| set[index] }
  signatures = texts.map { |text| marker.call(text) }
  abort "break/marker mismatch #{56451 + index}" unless
    texts.map { |text| text.count("\n") }.uniq.size == 1 &&
    signatures.map(&:sort).uniq.size == 1 &&
    signatures[0] == signatures[1]
end

File.binwrite(path, after)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(after)} backup=#{backup} inverse/BOM/endings/IDs/50-four-locale-keys/breaks/markers=OK"
