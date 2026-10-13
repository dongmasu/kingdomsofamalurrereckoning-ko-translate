#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19648/locatexts_zh_cn.koalocatext_default.csv"
old_sha = "8523f66ab00f9bbedabdb166238e2be0daf93881a22f2c693e5cd2ae1f466dac"
snapshot = "work/zh_cn/audit/uncertain-200-D3005-D3424-20261012.jsonl"
edits = {
  10491 => [["교수대 끝을", "교수대의 끝(Gallows End)을"]],
  10547 => [["엔가드의 결사로", "엥가드 교단으로"]],
  10578 => [["오리손의 첫 과업", "오리슨의 첫 과업"]],
  10595 => [["비탄의 집 앞에 서서", "비탄의 힘 앞에 서서"]],
  10699 => [["까마귀들이여,", "크로우즈여,"]],
  11033 => [["비탄의 집 사람들, 즉 '비탄(The Sorrows)'이", "비탄의 힘(Sorrows)이"]],
  11110 => [["갈로스 엔드(Gallows End)로", "교수대의 끝(Gallows End)으로"]],
  11140 => [["트래블러스(Travelers)", "트래블러(Travelers)"]],
  11147 => [["홀로랜드(Hollowlands)", "홀로우랜드(Hollowlands)"]],
  11204 => [["발라드의 집의 악당", "하우스 오브 발라드의 악당"]],
  11302 => [["여행자", "트래블러(Traveler)"]],
  11350 => [["비사레인(Bisarane)", "비사라네(Bisarane)"]],
  11355 => [["미사란(Mitharan)", "미타란(Mitharan)"]],
  11407 => [["맏이", "엘더스트(The Eldest)"]],
  11421 => [["맹세의 검 커비", "맹세의 칼날 커비"]],
  11502 => [["너는 선택받은 자다.", "너는 부름받은 자다."]],
  11577 => [["트래블러스(Travelers)", "트래블러(Travelers)"]],
  11624 => [["발라드의 집은", "하우스 오브 발라드는"]],
  11646 => [["탐험가", "탐굴자들"]],
  11658 => [["현자 아만(Amman the Clever)", "영리한 아만(Amman the Clever)"],
            ["트래블러스의", "트래블러의"]]
}.transform_values { |pairs| pairs.map { |old, new_text| [old.b, new_text.b] } }

original = File.binread(path)
abort "active hash changed" unless Digest::SHA256.hexdigest(original) == old_sha
abort "backup differs" unless File.binread(backup) == original
entries = File.foreach(snapshot).map { |line| JSON.parse(line) }
abort "snapshot shape changed" unless entries.size == 200 &&
  entries.map { |row| row.fetch("id") }.uniq.size == 200
rows = entries.to_h { |row| [row.fetch("id"), row] }
abort "unlisted edit" unless (edits.keys - rows.keys).empty?

def transform(data, changes)
  seen = changes.to_h { |id, pairs| [id, Array.new(pairs.size, 0)] }
  current = nil
  result = data.lines.map do |line|
    current = line[/\A(\d+);/n, 1]&.to_i || current
    next line unless changes.key?(current)
    changes.fetch(current).each_with_index do |(old_text, new_text), index|
      occurrences = line.scan(old_text).size
      abort "duplicate fragment #{current}" if occurrences > 1
      next if occurrences.zero?
      line = line.sub(old_text, new_text)
      seen[current][index] += occurrences
    end
    line
  end.join
  abort "missing edit" unless seen.values.all? { |counts| counts.all? { |n| n == 1 } }
  result
end

modified = transform(original, edits)
inverse = edits.transform_values { |pairs| pairs.map { |old, new_text| [new_text, old] } }
abort "inverse mismatch" unless transform(modified, inverse) == original
abort "BOM changed" unless modified.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) {
  [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size,
   bytes.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or order changed" unless shape.call(original) == shape.call(modified)
edits.each do |id, fragments|
  line = original[/^#{id};[^\n]*/n]
  abort "missing physical row #{id}" unless line
  # Quoted and multiline records are checked by inverse; fragments never
  # cross a line and the ID-scoped transform cannot touch any other row.
  abort "snapshot changed at #{id}" unless original.include?(rows.fetch(id).fetch("ko").b)
  fragments.each { |old, _new_text| abort "fragment absent at #{id}" unless original.include?(old) }
end
File.binwrite(path, modified)
puts "edited=#{edits.size} post=#{Digest::SHA256.hexdigest(modified)} inverse/BOM/endings/order/other-bytes=OK"
