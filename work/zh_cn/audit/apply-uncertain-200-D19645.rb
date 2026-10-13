#!/usr/bin/env ruby
require "digest"
require "csv"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19645/locatexts_zh_cn.koalocatext_default.csv"
expected = "9d866affc9eb41e46e520b5ce4ca0298ed1257e07e189b4603badf7aaf09fb05"

changes = {
  8332 => [["콜로새(Kollossae)".b, "콜로사이(Kollossae)".b]],
  8404 => [["여행자(Travelers)".b, "트래블러(Travelers)".b]],
  8433 => [["근위대(Praetorians)".b, "프레토리안 근위대(Praetorians)".b]],
  8451 => [["콜로새 연도문".b, "콜로사이 연도문".b]],
  8466 => [["여행자(Travelers)".b, "트래블러(Travelers)".b]],
  8503 => [["그분은 어떤 모습이든 사랑스럽지만".b,
            "우리는 그분의 어떤 모습이든 사랑하지만".b]],
  8525 => [["트래블러스".b, "트래블러(Travelers)".b]],
  8560 => [["콜로새어로 '통찰'을 뜻하는 말을 활용한 말장난이다.".b,
            "콜로사이의 말로 '통찰'을 뜻하는 단어를 활용한 말장난이다.".b]],
  8582 => [["행진령 지하".b, "변경지 지하".b]],
  8585 => [["대주교".b, "대사제".b]],
  8601 => [
    ["+4 홀 물리 피해".b, "+4 홀 사용 시 물리 피해".b],
    ["홀 피해 +15%".b, "홀 사용 시 피해 +15%".b]
  ],
  8637 => [["선택받은 자여!".b, "부름받은 자여!".b]],
  8690 => [["시녀의 계략도".b, "윈더미어의 시녀가 꾸민 계략도".b]],
  8706 => [
    ["다른 트래블러스인".b, "다른 트래블러인".b],
    ["대주교를".b, "대사제를".b]
  ],
  8711 => [["과부".b, "위도우(The Widow)".b]],
  8752 => [
    ["그 옛날 코리아나는 내 사랑을 모욕했지.".b,
     "그 옛날 코리아나가 내 사랑을 모욕하지 않았더라면.".b],
    ["그녀의 가문이 번성하는 동안 내 영혼이 시들지 않았다면...".b,
     "그녀의 가문이 번성하지 않고 내 영혼도 시들지 않았다면...".b]
  ],
  8817 => [["대주교께서".b, "대사제께서".b]],
  8845 => [["아르카나 학회의 대현자입니다.".b,
            "스콜리아 아르카나의 대현자입니다.".b]],
  8866 => [["그들이 서신을 가져갔어!".b,
            "그들이 세이블의 서신을 가져갔어!".b]],
  8887 => [
    ["트래블러스의 익명의 후원자인".b,
     "트래블러(Travelers)의 익명의 후원자인".b],
    ["대주교에게".b, "대사제에게".b],
    ["대주교의 성소".b, "대사제의 성소".b]
  ],
  8920 => [["서약검병 오두라".b, "맹세의 칼날 오두라".b]],
  8926 => [["현자 엥가는".b, "사반트 엥가르는".b]],
  8954 => [["이야기의 흐름".b, "전승의 흐름".b]],
  8969 => [["선택받은 자는".b, "부름받은 자는".b]],
  8984 => [["아르카나 학회 지부 도서관 사서".b,
            "스콜리아 아르카나 지부 도서관 사서".b]],
  8997 => [["아르카나 학회가 세워졌다.".b,
            "스콜리아 아르카나가 세워졌다.".b]],
  9035 => [["[지속 효과]".b, "[패시브]".b]],
  9071 => [["이야기는 우리 모두의 것이니까".b,
            "전승은 우리 모두의 것이니까".b]],
  9107 => [["복수의 전당(House of Vengeance) - 겨울 페이의 가장 젊은 전당으로, 위대한 순환을 어지럽힌다.".b,
            "복수의 집(House of Vengeance) - 겨울 페이 가운데 가장 젊은 집단으로, 위대한 순환을 어지럽힌다.".b]],
  9273 => [["에테네가 부른 선택받은 자".b,
            "에테네에게 부름받은 자".b]],
  9330 => [["체력과 힘을 조금 회복합니다.".b,
            "체력과 마나를 조금 회복합니다.".b]],
  9336 => [["소로우즈는".b, "비탄의 힘은".b]],
  9374 => [["장로에게 가기".b, "엘더스트(The Eldest)에게 가기".b]],
  9379 => [["이야기로 전할 만하군.".b, "전승에 남을 만하군.".b]],
  9385 => [["아가씨".b, "친구".b]],
  9432 => [["속이 빈 땅으로 급강하했다".b,
            "홀로우랜드로 급강하했다".b]],
  9459 => [
    ["서신을 심어야겠다".b, "세이블의 서신을 심어야겠다".b],
    ["근위병들이".b, "프레토리안 근위대가".b],
    ["트래블러스 내에서".b, "트래블러(Travelers) 내에서".b]
  ],
}

already_closed = [8342, 8610, 8663, 8780, 8822]
abort "unexpected overlap with previously closed IDs" unless
  (already_closed & changes.keys).empty?

def transform(bytes, changes)
  seen = Hash.new { |hash, id| hash[id] = Array.new(changes.fetch(id).length, 0) }
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    changes.fetch(id).each_with_index do |(old, replacement), index|
      count = line.scan(old).length
      abort "ID #{id}: repeated #{old.inspect}" if count > 1
      next if count.zero?
      line = line.sub(old, replacement)
      seen[id][index] += count
    end
    line
  end.join
  changes.each_key do |target_id|
    abort "ID #{target_id}: missing or repeated change" unless
      seen[target_id] == Array.new(changes.fetch(target_id).length, 1)
  end
  result
end

original = File.binread(path)
abort "active CSV hash changed" unless Digest::SHA256.hexdigest(original) == expected
abort "backup is not byte-identical" unless File.binread(backup) == original
updated = transform(original, changes)
inverse = changes.transform_values do |pairs|
  pairs.map { |old_text, new_text| [new_text, old_text] }
end
abort "exact inverse failed" unless transform(updated, inverse) == original
abort "UTF-8 BOM changed" unless updated.start_with?("\xEF\xBB\xBF".b)

shape = ->(data) {
  [
    data.scan("\r\n".b).length,
    data.scan(/(?<!\r)\n/n).length,
    data.lines.length,
    data.lines.map { |line| line[/\A(\d+);/n, 1] }.compact
  ]
}
abort "row/order/line-ending shape changed" unless shape.call(original) == shape.call(updated)

snapshot = File.foreach("work/zh_cn/audit/uncertain-200-D2320-D2663-20261012.jsonl")
  .to_h do |line|
    entry = JSON.parse(line)
    [entry.fetch("id"), entry.fetch("ko")]
  end
abort "snapshot size changed" unless snapshot.size == 200
before_rows = CSV.new(original.dup.force_encoding("UTF-8"), headers: true, col_sep: ";")
after_rows = CSV.new(updated.dup.force_encoding("UTF-8"), headers: true, col_sep: ";")
verified = []
before_rows.each do |before|
  break if before[0].to_i > changes.keys.max
  after_row = after_rows.shift
  abort "CSV row shape changed" unless after_row && before.size == after_row.size
  id = before[0].to_i
  abort "source snapshot mismatch at #{id}" if snapshot.key?(id) && snapshot[id] != before[1]
  if changes.key?(id)
    expected_text = before[1].b
    changes.fetch(id).each { |old, replacement| expected_text = expected_text.sub(old, replacement) }
    abort "unexpected Texto at #{id}" unless after_row[1].b == expected_text
    verified << id
  else
    abort "unapproved Texto change at #{id}" unless before[1] == after_row[1]
  end
  abort "non-Texto field changed at #{id}" unless
    before.fields.each_with_index.all? { |field, index| index == 1 || field == after_row[index] }
end
abort "approved rows missing" unless verified.sort == changes.keys.sort

File.binwrite(path, updated)
puts "edited=#{changes.size} pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/mixed-endings/CSV-cells=OK"
