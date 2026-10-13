#!/usr/bin/env ruby
require "digest"
require "csv"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19647/locatexts_zh_cn.koalocatext_default.csv"
expected_sha = "9a683428ba7c91cec308df8287acdf4669b1c05db7a8f4de023982a6ba93d989"
snapshot = "work/zh_cn/audit/uncertain-200-D2664-D3004-20261012.jsonl"
edits = {
  9497 => [["아르카나 대학", "스콜리아 아르카나"]],
  9499 => [["발라드의 집 방어구", "하우스 오브 발라드 방어구"]],
  9577 => [["우리 학자들인", "우리 사반트들인"]],
  9591 => [["전쟁서약단의 돼지들", "워스원의 돼지들"]],
  9611 => [["이야기 속에서", "전승 속에서"]],
  9625 => [["하지만 이야기는", "하지만 전승은"]],
  9670 => [["프라이토리안 소속 데카누스 브루튼", "프레토리안 근위대의 십인대장 브루튼"]],
  9705 => [["프라이토리안 친구들도", "프레토리안 친구들도"]],
  9738 => [["딱이야, 자기.", "딱이야, 친구."]],
  9847 => [["아르카나 대학의 전직", "스콜리아 아르카나의 전직"]],
  9851 => [["홀로랜드에서는", "홀로우랜드에서는"]],
  9927 => [["다시 행진지를", "다시 변경지를"]],
  10095 => [["홀로랜드에는", "홀로우랜드에는"]],
  10197 => [["홀로랜드에는", "홀로우랜드에는"]],
  10201 => [["엔가드의 결사", "엥가드 교단"]],
  10225 => [["선택받은 자여, 콜로새는", "부름받은 자여, 콜로사이는"]],
  10245 => [["엔가드의 결사", "엥가드 교단"]],
  10283 => [["대순환의 균형", "위대한 순환의 균형"]],
  10298 => [["트래블러들", "트래블러(Travelers)"]],
  10331 => [["콜로새 문화", "콜로사이 문화"]],
  10341 => [["노움들이야, 자기야.", "노움들이야, 친구."]],
  10385 => [["교수대 끝", "교수대의 끝(Gallows End)"]],
  10474 => [["윈드미어의 시녀", "윈더미어의 시녀"], ["발라드의 집에 있는", "하우스 오브 발라드에 있는"]]
}.transform_values { |pairs| pairs.map { |old, new_text| [old.b, new_text.b] } }

data = File.binread(path)
abort "unexpected active hash" unless Digest::SHA256.hexdigest(data) == expected_sha
abort "backup differs" unless File.binread(backup) == data
snap = File.foreach(snapshot).map { |line| JSON.parse(line) }.to_h { |entry| [entry.fetch("id"), entry] }
abort "snapshot not 200 distinct keys" unless snap.size == 200
abort "edits not in snapshot" unless (edits.keys - snap.keys).empty?

def transform(bytes, edits)
  seen = edits.to_h { |id, pairs| [id, Array.new(pairs.size, 0)] }
  id = nil
  out = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless edits.key?(id)
    edits.fetch(id).each_with_index do |(from, to), i|
      count = line.scan(from).size
      abort "#{id}: ambiguous text #{from.inspect}" if count > 1
      next if count.zero?
      line = line.sub(from, to)
      seen[id][i] += count
    end
    line
  end.join
  seen.each { |key, occurrences| abort "#{key}: missing/repeated edit" unless occurrences.all? { |n| n == 1 } }
  out
end

changed = transform(data, edits)
inverse = edits.transform_values { |pairs| pairs.map { |old, new_text| [new_text, old] } }
abort "inverse mismatch" unless transform(changed, inverse) == data
abort "BOM changed" unless changed.start_with?("\xEF\xBB\xBF".b)
shape = ->(bytes) {
  [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size,
   bytes.lines.map { |line| line[/\A(\d+);/n, 1] }.compact]
}
abort "line endings or ID order changed" unless shape.call(data) == shape.call(changed)

before_rows = CSV.new(data.dup.force_encoding("UTF-8"), headers: true, col_sep: ";")
after_rows = CSV.new(changed.dup.force_encoding("UTF-8"), headers: true, col_sep: ";")
verified = []
before_rows.each do |before|
  break if before[0].to_i > edits.keys.max
  after_row = after_rows.shift
  abort "CSV cell structure changed" unless after_row && before.size == after_row.size
  row_id = before[0].to_i
  abort "snapshot Korean cell mismatch #{row_id}" if snap.key?(row_id) && before[1] != snap[row_id]["ko"]
  expected_text = before[1].b
  if edits.key?(row_id)
    edits.fetch(row_id).each { |old, replacement| expected_text = expected_text.sub(old, replacement) }
    verified << row_id
  end
  abort "unapproved Texto edit #{row_id}" unless after_row[1].b == expected_text
  abort "non-Texto cell changed #{row_id}" unless before.fields.each_with_index.all? { |v, i| i == 1 || v == after_row[i] }
end
abort "edits missing in parsed records" unless verified.sort == edits.keys.sort
File.binwrite(path, changed)
puts "edited=#{edits.size} pre=#{expected_sha} post=#{Digest::SHA256.hexdigest(changed)} inverse/BOM/endings/CSV-cells=OK"
