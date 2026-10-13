#!/usr/bin/env ruby
require "digest"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19649/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "4c56d6a9dea5eda83d681be5453b7fc16a91fe2ee7fcaad2ffbc663c7a10e82f"
snapshot = "work/zh_cn/audit/uncertain-200-D3426-D3746-20261012.jsonl"
edits = {
  11683 => [["맹세의 검(Oathblade)", "맹세의 칼날(Oathblade)"]],
  11881 => [["계승자(The Scion)", "사이온(The Scion)"]],
  11932 => [["미사란 조명기", "미타란 조명기"]],
  11958 => [["전쟁맹세단(War Sworn)에 서약할 텐가?", "워스원에 서약했나?"]],
  12109 => [["헌납 의식을", "봉헌 의식을"]],
  12133 => [["교수형자의 끝(Gallows End)", "교수대의 끝(Gallows End)"]],
  12141 => [["이얼프위그 그릴리카스", "엘프윅 그릴리카스"]],
  12165 => [["에세네(Ethene)", "에테네(Ethene)"]],
  12277 => [["계승자(Scion)", "사이온(Scion)"]],
  12449 => [["계승자로서", "사이온으로서"]],
  12470 => [["여행자들은", "트래블러는"]],
  12491 => [["미사란 프리즘미어", "미타란 프리즈미어"]],
  12523 => [["비사레인과", "비사라네와"]],
  12660 => [["아르카나 학회(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"]],
  12670 => [["행군지(Marches)", "변경지(Marches)"]],
  12695 => [["여행자들(Travelers)", "트래블러(Travelers)"]],
  12708 => [["세련된 수법이군.", "별나군."]],
  12799 => [["완벽한 미사루의 탐식하는 지렛대", "흠 없는 미타란 탐욕 지렛목"]],
  12812 => [["콜로새(Kollossae)족", "콜로사이(Kollossae)족"]]
}.transform_values { |pairs| pairs.map { |old, new_text| [old.b, new_text.b] } }

source = File.binread(path)
abort "active hash differs" unless Digest::SHA256.hexdigest(source) == expected_sha
abort "backup differs" unless File.binread(backup) == source
entries = File.foreach(snapshot).map { |line| JSON.parse(line) }
abort "snapshot not 200 distinct keys" unless entries.size == 200 &&
  entries.map { |e| e.fetch("id") }.uniq.size == 200
indexed = entries.to_h { |e| [e.fetch("id"), e] }
abort "unlisted edit" unless (edits.keys - indexed.keys).empty?

def transform(bytes, changes)
  seen = changes.to_h { |id, pairs| [id, Array.new(pairs.size, 0)] }
  id = nil
  data = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    changes.fetch(id).each_with_index do |(old, new_text), index|
      n = line.scan(old).size
      abort "duplicate fragment at #{id}" if n > 1
      next if n.zero?
      seen[id][index] += n
      line = line.sub(old, new_text)
    end
    line
  end.join
  seen.each { |row_id, counts| abort "missing or repeated change #{row_id}: #{counts.inspect}" unless counts.all? { |n| n == 1 } }
  data
end

updated = transform(source, edits)
inverse = edits.transform_values { |pairs| pairs.map { |old, new_text| [new_text, old] } }
abort "inverse mismatch" unless transform(updated, inverse) == source
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) {
  [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size,
   bytes.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or order changed" unless shape.call(source) == shape.call(updated)

edits.each do |id, pairs|
  record = source[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "missing row #{id}" unless record
  old_text = indexed.fetch(id).fetch("ko").b
  abort "snapshot Korean cell differs at #{id}" unless record.include?(old_text)
  expected_record = record.dup
  pairs.each do |old, new_text|
    abort "absent fragment at #{id}" unless expected_record.scan(old).size == 1
    expected_record = expected_record.sub(old, new_text)
  end
  new_record = updated[/^#{id};.*?(?=^\d+;|\z)/nm]
  abort "unexpected other-cell or record edit at #{id}" unless expected_record == new_record
end
File.binwrite(path, updated)
puts "edited=#{edits.size} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/endings/order/other-bytes=OK"
