#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19643/locatexts_zh_cn.koalocatext_default.csv"
expected = "e6c4df562b57bd72ed3ffb26c8a997c387fffb5dfa625467c75af57db0889548"

changes = {
  5712 => [["모든 시설".b, "모든 요소".b]],
  5714 => [["전쟁맹(Warsworn)의 징계".b, "워스원(Warsworn)의 징계".b]],
  5882 => [["전쟁맹이라도".b, "워스원(Warsworn)이라도".b]],
  5941 => [["여행자(Traveler)처럼".b, "트래블러(Traveler)처럼".b]],
  6016 => [
    ["비탄의 봉인을 풀어 버렸어".b, "비탄의 힘을 가둔 봉인을 풀어 버렸어".b],
    ["이미 비탄이 아말루르로".b, "이미 비탄의 힘이 아말루르로".b]
  ],
  6146 => [["여행자(Traveler)가".b, "트래블러(Traveler)가".b]],
  6167 => [["전쟁맹 요새".b, "워스원(Warsworn) 요새".b]],
  6184 => [["비탄의 영혼들과 교감".b, "비탄의 힘과 교감".b]],
  6386 => [["이제 네 직함은 박탈이야".b, "이제 넌 지위를 박탈당한 거야".b]],
  6405 => [["내가 스스로 투항하겠어".b, "내가 스스로 목숨을 내놓겠어".b]],
  6416 => [
    ["내... 내 키잖아. 나랑 같은 키라니".b,
     "내... 내 체격이잖아. 나랑 같은 체격이라니".b]
  ],
  6422 => [["서약검 쿠라(Oathblade Kura)".b,
            "맹세의 칼날 쿠라(Oathblade Kura)".b]],
  6429 => [["벽을 물들일 피가 더 필요하군".b,
            "벽이 더 많은 피로 물들겠군".b]],
  6435 => [["페트리코어(Petrichor)를 흡수할 거야".b,
            "페트리코어(Petrichor)를 마실 거야".b]],
  6461 => [["이런, 날 묶어 끌고 가려는 건가".b,
            "이런, 별일이 다 있군".b]],
  6470 => [
    ["\"\"\"\"\"용감한".b, "\"\"\"용감한".b],
    ["하오.\"\"\"\"\"".b, "하오.\"\"\"".b]
  ],
  6530 => [["쥐 트리거".b, "트리거 쥐".b]],
  6628 => [["계시자(Hierophant)의 가호".b,
            "대사제(Hierophant)의 가호".b]],
  6688 => [["대순환에 들지".b, "위대한 순환에 들지".b]],
  6737 => [["관리인 부인(Lady of Receivership)".b,
            "재산관리관(Lady of Receivership)".b]],
  6934 => [["계시자(Hierophant) 밑에".b,
            "대사제(Hierophant) 밑에".b]]
}

def transform(bytes, changes)
  seen = Hash.new { |hash, id| hash[id] = Array.new(changes.fetch(id).length, 0) }
  id = nil
  result = bytes.lines.map do |line|
    id = line[/\A(\d+);/n, 1]&.to_i || id
    next line unless changes.key?(id)
    changes.fetch(id).each_with_index do |(old, replacement), index|
      count = line.scan(old).length
      raise "ID #{id}: duplicate #{old.inspect}" if count > 1
      if count == 1
        raise "ID #{id}: repeated fragment #{old.inspect}" if seen[id][index] > 0
        line = line.sub(old, replacement)
        seen[id][index] += 1
      end
    end
    line
  end.join
  changes.each do |target_id, pairs|
    expected = Array.new(pairs.length, 1)
    raise "ID #{target_id}: missing fragments #{seen[target_id].inspect}" unless seen[target_id] == expected
  end
  result
end

original = File.binread(path)
abort "active CSV hash changed" unless Digest::SHA256.hexdigest(original) == expected
abort "backup is not byte-identical" unless File.binread(backup) == original
updated = transform(original, changes)
inverse = changes.transform_values { |pairs| pairs.reverse.map { |new_text, old_text| [old_text, new_text] } }
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
abort "BOM/row-order/line-ending shape changed" unless shape.call(original) == shape.call(updated)

File.binwrite(path, updated)
puts "edited=#{changes.length} pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)} inverse/BOM/order/line-endings=OK"
