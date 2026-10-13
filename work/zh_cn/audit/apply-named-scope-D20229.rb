#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20229/locatexts_zh_cn.koalocatext_default.csv"
interim_backup = "/private/tmp/ko-translate-backups/20261013/before-finalize-D20229/locatexts_zh_cn.koalocatext_default.csv"
expected_before = "4888a62e9823614fca921dce65fbea5726c4e4877a380eb3237b1df1e4b90bce"
expected_interim = "a43411e009c5f8944c77a76dc037dd735f7ff674cb2bf6c0b9323a73954963e6"
edits = {
  57726 => [["까마귀단", "크로우즈(The Crows)"]],
  57728 => [
    ["도칼파르 왕립 무술 학교", "도크알브 왕립 무술 학교"],
    ["신중의 가문", "신중의 집"],
    ["용맹의 가문", "용맹의 집"],
    ["발라드의 가문", "발라드의 집", 2]
  ],
  57730 => [["앨린 쉬어가", "앨린 쉬르가"]]
}

current = File.binread(path)
abort "interim hash mismatch" unless Digest::SHA256.hexdigest(current) == expected_interim
abort "interim backup mismatch" unless current == File.binread(interim_backup)
before = File.binread(backup)
abort "range backup hash mismatch" unless Digest::SHA256.hexdigest(before) == expected_before

row = lambda do |bytes, id|
  matches = bytes.scan(/^#{id};.*?(?=^\d+;|\z)/nm)
  abort "missing/duplicate #{id}" unless matches.size == 1
  matches.first
end

after = before.dup
edits.each do |id, changes|
  original = row.call(after, id)
  updated = original.dup
  changes.each do |old, replacement, expected_count|
    expected_count ||= 1
    abort "target mismatch #{id}: #{old}" unless updated.scan(old.b).size == expected_count
    updated.gsub!(old.b, replacement.b)
  end
  after.sub!(original, updated)
end

inverse = after.dup
edits.each do |id, changes|
  current = row.call(inverse, id)
  restored = current.dup
  changes.reverse_each do |old, replacement, expected_count|
    expected_count ||= 1
    abort "inverse mismatch #{id}: #{replacement}" unless restored.scan(replacement.b).size == expected_count
    restored.gsub!(replacement.b, old.b)
  end
  inverse.sub!(current, restored)
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

files = [after, *%w[en_us ja_jp zh_cn].map do |locale|
  File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
end]
marker = lambda do |text|
  text.scan(/\{(?:\*1|\*2|\*3)[^}]*\}|\{(?:LINE_SPACE|LINE_LEFT|\d+)\}/)
      .map { |token| token.sub(/\A\{\*(\d+).+\}\z/, '{*\1}') }
end

(57701..57750).each do |id|
  texts = files.map do |bytes|
    fields = CSV.parse_line(row.call(bytes, id).dup.force_encoding("UTF-8"),
                            col_sep: ";", row_sep: "\r\n", liberal_parsing: true)
    abort "bad CSV #{id}" unless fields&.size == 2 && fields[0] == id.to_s
    fields[1].to_s
  end
  breaks = texts.map { |text| text.count("\n") }
  abort "unexpected breaks #{id}: #{breaks.inspect}" unless
    (id == 57728 ? breaks[0] == breaks[1] && breaks[0] == breaks[3] && breaks[2] == breaks[0] + 2 :
      breaks.uniq.size == 1)
  markers = texts.map { |text| marker.call(text).sort }
  abort "unexpected markers #{id}: #{markers.inspect}" unless
    (id == 57708 ? markers[0] == markers[1] && markers[0] == markers[3] &&
      markers[2].size == markers[0].size + 1 :
      markers.uniq.size == 1)
end

File.binwrite(path, after)
puts "pre=#{expected_before} post=#{Digest::SHA256.hexdigest(after)} range_backup=#{backup} immediate_backup=#{interim_backup}"
puts "edited=#{edits.keys.join(',')} inverse/BOM/mixed-endings/ordered-IDs/50-four-locale-rows-breaks-markers=OK"
