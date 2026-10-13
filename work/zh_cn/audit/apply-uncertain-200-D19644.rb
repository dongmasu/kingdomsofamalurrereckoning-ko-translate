#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19644/locatexts_zh_cn.koalocatext_default.csv"
expected = "661748971420138f4dc0685d8d5f789733c384a692c32f18b88a927e313470e2"

changes = {
  7080 => [["도브(Dove)".b, "친구".b]],
  7312 => [["비탄의 집(Sorrows)".b, "비탄의 힘(Sorrows)".b]],
  7357 => [["계시자의 성소".b, "대사제의 성소".b]],
  7371 => [["서약검 오르두라(Oathblade Ordura)".b,
            "맹세의 칼날 오르두라(Oathblade Ordura)".b]],
  7373 => [["찬트리(Chantries)".b, "성소들(Chantries)".b]],
  7840 => [[
    "대사제가 우리를 잘못된 길로 이끌기 전까지는 여행자들(Among Travelers)이 가장 좋은 곳이었어. 비둘기야, 네가 훔칠 그 책으로 우리가 자유를 되찾을 거야.".b,
    "이 대사제가 우리를 잘못된 길로 이끌기 전까지는 트래블러들과 함께하는 게 가장 좋았어. 네가 훔칠 그 책으로 그 자유를 되찾을 거야, 친구.".b
  ]],
  7875 => [["서약검(Oathblade)".b, "맹세의 칼날(Oathblade)".b]],
  7965 => [["슬픔의 집(House of Sorrows)".b,
            "비탄의 집(House of Sorrows)".b]],
  7967 => [["슬픔의 집(Sorrows)".b, "비탄의 힘(Sorrows)".b]],
  8064 => [["콜로새(Kollossae)".b, "콜로사이(Kollossae)".b]],
  8143 => [["수탁 관리인".b, "재산관리관".b]],
  8182 => [["범죄자에게 뇌물을 주느라 금화 10,000개 이상을 썼습니다.".b,
            "범죄를 저지른 뒤 경비병을 매수하는 데 금화 10,000개 이상을 썼습니다.".b]],
  8269 => [["여행자(Travelers)".b, "트래블러(Travelers)".b]],
  8294 => [["콜로새(Kollossae)".b, "콜로사이(Kollossae)".b]]
}

already_closed = [7085, 7253, 7461, 7553, 7632, 7713, 7878, 7950,
                  8020, 8162, 8302]
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
      raise "ID #{id}: expected one #{old.inspect}, found #{count}" unless count == 1
      line = line.sub(old, replacement)
      seen[id][index] += 1
    end
    line
  end.join
  changes.each_key do |target_id|
    expected_counts = Array.new(changes.fetch(target_id).length, 1)
    raise "ID #{target_id}: missing or repeated change" unless seen[target_id] == expected_counts
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

File.binwrite(path, updated)
puts "edited=#{changes.size} pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/mixed-endings=OK"
