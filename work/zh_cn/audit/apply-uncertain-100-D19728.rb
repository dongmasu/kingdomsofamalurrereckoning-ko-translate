#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-100-D19728-20261012.jsonl"
expected = "826ac181c9986a63a2d8d7cc20675413298e3a5f916b092818c0cd165953d42b"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19728/locatexts_zh_cn.koalocatext_default.csv"

# Each entry is [ID, exact old fragment, approved replacement, expected count].
edits = [
  [35760, "갤러스 엔드", "갤로스 엔드", 1],
  [35774, "니오르디르", "뇨르디르", 1],
  [35777, "하이페리안", "하이페리언", 1],
  [35784, "히에로펀트", "대사제", 1],
  [35865, "베일런의 테스타먼트", "벨렌의 테스타먼트", 1],
  [35890, "하우스 오브 발라드", "발라드의 집", 1],
  [35982, "홀", "셉터", 2],
  [36719, "용맹의 페이 가문", "페이 파벌인 용맹의 집", 1],
  [36893, "시드헤", "시드(Sidhe)", 1],
  [53491, "우리는 본질 그 자체로 죽음과 부패를 구현해야 해.",
   "우리는 본질적으로 죽음과 부패를 구현하는 존재야.", 1],
  [60374, "스카이블라섬(Skyblossom)에서 살아야지... 속삭임처럼.",
   "스카이블라섬(Skyblossom)에서 살아야 해… 하고 속삭인다.", 1],
  [60377, "미사루", "미타란", 1],
  [60393, "벨렌의 유언(Testament)", "벨렌의 테스타먼트(Testament)", 1],
  [60396, "하우스는", "발라드의 집은", 1],
  [60419, "최초의 서약자들의 전당(Hall of the Firstsworn)",
   "퍼스트스원 전당(Hall of the Firstsworn)", 1],
  [60447, "바람의 돌", "바람돌", 1],
  [60449, "바로 시작하겠습니다. 눈 깜짝할 사이에 새것처럼 고쳐 놓을게요!",
   "바로 작업을 시작하겠습니다. 눈 깜짝할 사이에 새것처럼 고쳐 놓겠습니다!", 1],
  [60461, "아르케스(Arkes)의 관", "아르케스의 서클릿(Circlet of Arkes)", 1],
  [60469, "하나 만들어 줄 수는 있어", "하나 작성해 줄 수는 있어", 1]
].freeze

def records_by_id(bytes)
  result = {}
  id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      result[id] = record if id
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  result[id] = record if id
  result
end

def cells(record)
  CSV.parse_line(record.dup.force_encoding("UTF-8"),
    col_sep: ";", row_sep: :auto)
rescue CSV::MalformedCSVError
  raw = record.sub(/\A(?:\xEF\xBB\xBF)?\d+;/n, "").sub(/\r?\n\z/n, "")
  raw = raw[1...-1].gsub('""', '"') if raw.start_with?('"') && raw.end_with?('"')
  [nil, raw.force_encoding("UTF-8")]
end

original = File.binread(path)
abort "active CSV hash differs" unless Digest::SHA256.hexdigest(original) == expected
entries = File.readlines(snapshot).map { |line| JSON.parse(line) }
abort "snapshot count or IDs invalid" unless entries.size == 100 &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == 100
before_rows = records_by_id(original)
abort "snapshot ID missing from active CSV" unless
  entries.all? { |entry| before_rows.key?(entry.fetch("id")) }

updated = original.dup
edits.each do |id, old, replacement, expected_count|
  row = before_rows.fetch(id)
  abort "pre-edit snapshot mismatch at #{id}" unless
    entries.find { |entry| entry.fetch("id") == id }.fetch("ko") == cells(row).fetch(1)
  old_bytes = old.b
  abort "source fragment count differs at #{id}" unless row.scan(old_bytes).size == expected_count
  replacement_row = row.gsub(old_bytes, replacement.b)
  abort "row not unique at #{id}" unless updated.scan(row).size == 1
  updated.sub!(row, replacement_row)
end

after_rows = records_by_id(updated)
abort "keys/order changed" unless before_rows.keys == after_rows.keys
edited_ids = edits.map(&:first)
abort "non-target record bytes changed" unless
  (before_rows.keys - edited_ids).all? { |id| before_rows[id] == after_rows[id] }
abort "target structure changed" unless edits.all? do |id, _old, _new, _count|
  before_cells = cells(before_rows.fetch(id))
  after_cells = cells(after_rows.fetch(id))
  before_cells.size == after_cells.size &&
    before_cells.each_index.all? do |index|
      index == 1 || before_cells[index] == after_cells[index]
    end
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBFID_Linha;Texto\r\n".b)
line_endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings changed" unless line_endings.call(original) == line_endings.call(updated)

inverse = updated.dup
edits.each do |id, old, replacement, expected_count|
  row = after_rows.fetch(id)
  abort "replacement count differs at #{id}" unless
    row.scan(replacement.b).size == expected_count
  restored = row.gsub(replacement.b, old.b)
  abort "edited row not unique at #{id}" unless inverse.scan(row).size == 1
  inverse.sub!(row, restored)
end
abort "inverse reconstruction differs" unless inverse == original

FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != original
File.binwrite(backup, original) unless File.exist?(backup)
abort "backup mismatch" unless File.binread(backup) == original
File.binwrite(path, updated)

puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)}"
puts "reviewed=100 accepted=#{edited_ids.size} not_an_issue=#{100 - edited_ids.size}"
puts "accepted_ids=#{edited_ids.join(",")}"
puts "backup=#{backup}"
puts "BOM/mixed-endings/order/non-target-bytes/Texto-scope/inverse=OK"
