#!/usr/bin/env ruby
require "csv"
require "digest"
require "fileutils"
require "json"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
snapshot = "work/zh_cn/audit/uncertain-100-D19729-20261012.jsonl"
expected = "da210b42855812a8fc380300d02fe269a6aed3152dc3330ca92a09e1140ad5b9"
backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19729/locatexts_zh_cn.koalocatext_default.csv"

# [ID, exact old fragment, approved replacement, expected occurrences in record]
edits = [
  [60485, "성채 관리관(Castellan)", "성주(Castellan)", 1],
  [60520, "이곳에는 저만의 마법이", "이곳에는 이곳만의 마법이", 1],
  [60527, "완벽한 미사루 피추적자 확대 지렛목", "흠 없는 미타란 피추적자의 지렛목", 1],
  [60568, "추락한 자여", "타락한 자여", 1],
  [60622, "남작(Baronett)", "바로넷(Baronett)", 1],
  [60640, "그 계승자(Scion)", "그 사이온(Scion)", 1],
  [60735, "미사란(Mitharans)", "미타란족(Mitharans)", 1],
  [60739, "학자 엔가르(Savant Engar)", "사반트 엔가르(Savant Engar)", 1],
  [60747, "숄리아 아르카나(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)", 1],
  [60850, "벡컨드(Beckoned)", "부름받은 자(Beckoned)", 1],
  [60851, "트래블러스(Travelers)", "트래블러(Travelers)", 1],
  [60924, "맹세의 칼(Oathblade)", "맹세의 칼날(Oathblade)", 1],
  [60956, "위나돈(Ynadon)", "이나돈(Ynadon)", 1],
  [60965, "비탄의 집(House of Sorrows)", "비탄의 힘(Sorrows)", 1],
  [60992, "은신 감지(Detect Hidden)", "숨겨진 물건 찾기(Detect Hidden)", 1],
  [60993, "데타이어(Detyre)", "데티르(Detyre)", 1],
  [61003, "미사란 프리즘어 경비병", "미타란 프리즘어 경비병", 1]
].freeze

if ARGV[0] == "19730"
  snapshot = "work/zh_cn/audit/uncertain-100-D19730-20261012.jsonl"
  expected = "9d28160961e3a29f104c1152f9a8817733bfca818dd395ab1ec1fce95cd0c3fc"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19730/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [61056, "개드플로(Gadflow)", "가드플로(Gadflow)", 1],
    [61089, "장로들(Eldest)", "엘더스트(The Eldest)", 1],
    [61089, "장로들에 관해", "엘더스트에 관해", 1],
    [61101, "하이페리온(Hyperian)", "하이페리언(Hyperian)", 1],
    [61166, "슬픔의 집(House of Sorrows)", "비탄의 집(House of Sorrows)", 1],
    [61173, "슬픔의 군주가 일어서자 비탄의 기사가 맞서 싸웠네.",
      "슬픔의 군주, 비탄의 기사가 일어나 맞섰네.", 1],
    [61174, "알메인(Almain)", "알마인(Almain)", 1],
    [61177, "계승자(Scion)", "사이온(Scion)", 1],
    [61190, "완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)", 1],
    [61208, "여행자들처럼", "트래블러처럼", 1],
    [61222, "까마귀가 먹도록 난 먹잇감인가?", "까마귀가 먹을 먹잇감인가?", 1],
    [61242, "아르케스(Arkes)의 관", "아르케스의 서클릿(Circlet of Arkes)", 1],
    [61243, "완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)", 1],
    [61266, "학자 잉가르(Savant Engar)", "사반트 엔가르(Savant Engar)", 1],
    [61274, "워스워른(Warsworn)", "워스원(Warsworn)", 1],
    [61274, "워스워른의", "워스원의", 1],
    [61279, "교수대 끝", "갤로스 엔드", 1],
    [61332, "불려온 자(Beckoned)", "부름받은 자(Beckoned)", 1],
    [61361, "트래블러스(Travelers)", "트래블러(Travelers)", 1],
    [61383, "워스워른(Warsworn)", "워스원(Warsworn)", 1],
    [61395, "첫 계승자(First Scion)", "첫 사이온(First Scion)", 1],
    [61402, "놈들이 멜 센시르(Mel Senshir)의 알파르(Alfar) 군대에 보내기 전에 노움들이",
      "멜 센시르(Mel Senshir)의 알파르(Alfar) 군대에 보내지기 전에 노움들이", 1]
  ].freeze
end

if ARGV[0] == "19731"
  snapshot = "work/zh_cn/audit/uncertain-100-D19731-20261012.jsonl"
  expected = "24ce7c236635add6f0c2f38c8b7273c174f398c31813839a46bc74367c57cd2b"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19731/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [61446, "워스워른(Warsworn)", "워스원(Warsworn)", 1],
    [61515, "대현자 신비술사를", "신비술의 대가를", 1],
    [61604, "교수대 끝(Gallows End)", "갤로스 엔드(Gallows End)", 1],
    [61607, "트래블러스(Traveler)", "트래블러(Traveler)", 1],
    [61619, "완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)", 1],
    [61655, "슬픔의 집(the Sorrows)", "비탄의 힘(the Sorrows)", 1],
    [61665, "워스워른(Warsworn)", "워스원(Warsworn)", 1],
    [61673, "시녀(The Maid of Windemere)", "윈더미어의 시녀(The Maid of Windemere)", 1],
    [61677, "완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)", 1],
    [61728, "슬픔의 집(the Sorrows)", "비탄의 힘(the Sorrows)", 1]
  ].freeze
end

if ARGV[0] == "19732"
  snapshot = "work/zh_cn/audit/uncertain-100-D19732-20261012.jsonl"
  expected = "1bb3e7edb4a7972fa0f5c88bd8158802f11e223d0ab6f18c240ca202de6003f4"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19732/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [61739, "크라잉 아이즈(Crying Eyes)", "흐느끼는 눈(Crying Eyes)", 1],
    [61748, "완벽한 미사란(Mitharan)", "흠 없는 미타란(Mitharan)", 1],
    [61760, "하이페리온(Hyperian)", "하이페리언(Hyperian)", 1],
    [61777, "계승자(Scion)", "사이온(Scion)", 1],
    [61787, "플레지실드 페난(Pledgeshield Fenan)", "서약방패병 페난(Pledgeshield Fenan)", 1],
    [61841, "하이페리온", "하이페리언", 2],
    [61851, "포모러스 휴즈(Fomorous Hugues)", "포모러스 휴그(Fomorous Hugues)", 1],
    [61902, "슬픔(Sorrows)", "비탄의 힘(Sorrows)", 1],
    [61932, "서약 방패(Pledgeshield)는", "서약방패병(Pledgeshield)은", 1],
    [61938, "무르간(Murghan)", "머건(Murghan)", 1],
    [61951, "우리 여행자(Travelers)는", "우리 트래블러(Travelers)는", 1],
    [61974, "콜로새인", "콜로사이인", 1],
    [61975, "교수형의 끝(Gallows End)", "갤로스 엔드(Gallows End)", 1],
    [61979, "선택받은 자(The Beckoned)", "부름받은 자(The Beckoned)", 1],
    [61979, "콜로새가", "콜로사이가", 1],
    [61980, "미사루 신도들이", "미타란족이", 1],
    [62005, "이 발라드가 불리는 한, 그대에게 진 빚은 갚지 못할 거요, 벗이여.",
      "이 발라드가 불리는 한, 그대에게 빚진 몸이오, 벗이여.", 1],
    [62054, "돌아왔군. 천 조각은 구했나?", "돌아왔군, 천것아?", 1],
    [62118, "교수형의 끝(Gallows End)", "갤로스 엔드(Gallows End)", 1]
  ].freeze
end

if ARGV[0] == "19733"
  snapshot = "work/zh_cn/audit/uncertain-100-D19733-20261012.jsonl"
  expected = "21936593939215f3822fcb30e348eecddcb0f8be162f8f5eae0ccc86161d22c8"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19733/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [62163, "물론 거기서 배가 난파되지 않는다면 말이야.", "물론 거기서 배가 난파된다면 얘기가 다르겠지만.", 1],
    [62199, "도칼파르", "도크알브", 1],
    [62204, "교만의 집(House of Pride)", "긍지의 집(House of Pride)", 1],
    [62219, "도와 시녀와 맞서더니", "도와 윈더미어의 시녀와 맞서더니", 1],
    [62241, "교만의 집(House of Pride)", "긍지의 집(House of Pride)", 1],
    [62258, "선택받은 자여", "부름받은 자여", 1],
    [62931, "복수의 가문.", "복수의 집.", 1],
    [62937, "히에로판트에게", "대사제에게", 1],
    [62945, "투아타", "투아사", 1],
    [62956, "시녀가 자기 진실로", "윈더미어의 시녀가 자기 진실로", 1],
    [62971, "최고의 학술지이자 강연 단체이며",
      "최고의 학술지와 강연을 주관하는 단체이자", 1]
  ].freeze
end

if ARGV[0] == "19734"
  snapshot = "work/zh_cn/audit/uncertain-100-D19734-20261012.jsonl"
  expected = "7cac62614358975f2adfbffd91eda213dec49f1c84a86871d90b02d8908468ee"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19734/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [63064, "자긍심의 가문", "긍지의 집", 1],
    [63068, "비사레인이 소로우즈를", "비사라네가 비탄의 힘을", 1],
    [63094, "하우스 오브 발라드", "발라드의 집", 1],
    [63099, "우물은", "영혼의 샘은", 1],
    [63112, "나로스의 송곳니", "나로스의 이빨", 1],
    [63117, "플레지실드 볼턴", "서약방패병 볼턴", 1],
    [63126, "히에로판트께서", "대사제께서", 1],
    [63143, "선택받은 자", "부름받은 자", 3],
    [63147, "오스블레이드여", "맹세의 칼날이여", 1],
    [63308, "요즘 여행자들 사이엔", "요즘 트래블러 사이엔", 1],
    [63379, "하우스 오브 발라드를", "발라드의 집을", 1],
    [63475, "히에로판트(Hierophant)", "대사제(Hierophant)", 1],
    [63475, "여행자들(Travelers)", "트래블러(Travelers)", 1],
    [63494, "하우스 오브 프라이드(House of Pride)", "긍지의 집(House of Pride)", 1]
  ].freeze
end

if ARGV[0] == "19735"
  snapshot = "work/zh_cn/audit/uncertain-100-D19735-20261012.jsonl"
  expected = "930b983cb16baa229b6c5c8412653b4f043eae1c3162fe25c477c9151441c754"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19735/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [63681, "여행자들(Travelers)", "트래블러(Travelers)", 1],
    [63681, "데티어(Detyre)", "데티르(Detyre)", 1],
    [63720, "하우스 오브 밸러(House of Valor)", "용맹의 집(House of Valor)", 1],
    [63720, "데티어(Detyre)", "데티르(Detyre)", 1],
    [63817, "하우스 오브 소로우(House of Sorrows)", "비탄의 힘(Sorrows)", 1],
    [63831, "그 시간 속엔 슬픔도 있었어.", "지금은 슬픔 속에 살고 있어.", 1],
    [63843, "미사루 신도들", "미타란족", 1],
    [63911, "불려온 자(Beckoned)", "부름받은 자(Beckoned)", 1],
    [63915, "완벽한 미사루식", "흠 없는 미타란", 1],
    [63928, "베일렌의", "벨렌의", 1],
    [63934, "미사루 부족", "미타란 부족", 1],
    [63965, "통곡의 눈(Crying Eyes)", "흐느끼는 눈(Crying Eyes)", 1],
    [63991, "괜찮은 여행자였어", "괜찮은 트래블러였어", 1],
    [64003, "불려온 자(Beckoned)", "부름받은 자(Beckoned)", 1]
  ].freeze
end

if ARGV[0] == "19736"
  snapshot = "work/zh_cn/audit/uncertain-100-D19736-20261012.jsonl"
  expected = "ef49938e801a2b9ebce54adf2044a4795105d0d65a0e7c6d0101446e99e378c0"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19736/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [64093, "비사레인은 소로우(Sorrows)", "비사라네는 비탄의 힘(Sorrows)", 1],
    [64103, "갤로우스 엔드", "갤로스 엔드", 1],
    [64125, "비사레인은 소로우(Sorrows)", "비사라네는 비탄의 힘(Sorrows)", 1],
    [64128, "사이언(Scion)", "사이온(Scion)", 1],
    [64148, "대장 기술", "대장기술", 1],
    [64169, "하이페리안의 대기실", "하이페리언의 전실", 1],
    [64175, "시어스톡(Searstalk)", "시어스토크(Searstalk)", 1],
    [64218, "비사레인의", "비사라네의", 1],
    [64218, "엘디스트(Eldest)", "엘더스트(The Eldest)", 1],
    [64218, "소로우의 집", "비탄의 집", 1],
    [64218, "비사레인이 소로우의 위치를 알아내 투아타로부터 그들을",
      "비사라네가 비탄의 힘의 위치를 알아내 투아사로부터 비탄의 힘을", 1],
    [64226, "히에로판트가", "대사제가", 1],
    [64240, "미타루께서", "미사루께서", 1],
    [64254, "날 윤회로", "날 대순환으로", 1],
    [64254, "소로우는", "비탄의 힘은", 1],
    [64258, "오스블레이드(Oathblade)", "맹세의 칼날(Oathblade)", 1],
    [64269, "윈드미어의", "윈더미어의", 1],
    [64278, "플레지실드(Pledgeshield)", "서약방패병(Pledgeshield)", 1],
    [64309, "히에로판트가", "대사제가", 1],
    [64318, "히에로판트야", "대사제야", 1],
    [64318, "트래블러스를", "트래블러를", 1]
  ].freeze
end

if ARGV[0] == "19737"
  snapshot = "work/zh_cn/audit/uncertain-100-D19737-20261012.jsonl"
  expected = "4e73d8c22abfa6c2d255fb2749f794fdba1ae1dfd4fce5a9fde881e7355f9599"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19737/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [64322, "투아타의", "투아사의", 1],
    [64345, "흐느끼는 왕", "통곡하는 왕", 1],
    [64348, "윤회를 둘러싼", "순환을 둘러싼", 1],
    [64348, "대윤회는", "대순환은", 1],
    [64468, "미타루께서", "미사루께서", 1],
    [64499, "불려온 자여", "부름받은 자여", 1],
    [64535, "히에로판트의", "대사제의", 1],
    [64561, "플레지실드다", "서약방패병이다", 1],
    [64568, "투아타에", "투아사에", 1],
    [64606, "미타루께서는", "미사루께서는", 1],
    [64674, "불려온 자", "부름받은 자", 1],
    [64909, "솔러스 곶", "케이프 솔러스", 1],
    [64921, "플레지실드여", "서약방패병이여", 1],
    [64987, "솔러스 곶", "케이프 솔러스", 1]
  ].freeze
end

if ARGV[0] == "19738"
  snapshot = "work/zh_cn/audit/uncertain-100-D19738-20261012.jsonl"
  expected = "827deb1e635cad5874cd7a09b1034aadf2956eed5169bff2f70180633e2d4aa9"
  backup = "/private/tmp/ko-translate-backups/20261012/before-uncertain-5-D19738/locatexts_zh_cn.koalocatext_default.csv"
  edits = [
    [65045, "클루리콘에서 투아타의 손아귀를 벗어났다고 생각하나?",
      "클루리콘에서 투아사의 지배를 꺾었다고 생각하나?", 1]
  ].freeze
end

def records_by_id(bytes)
  rows = {}
  id = nil
  record = +"".b
  bytes.each_line do |line|
    row_id = line[/\A(?:\xEF\xBB\xBF)?(\d+);/n, 1]&.to_i
    if row_id
      rows[id] = record if id
      id = row_id
      record = line.dup
    elsif id
      record << line
    end
  end
  rows[id] = record if id
  rows
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
expected_batch_size = ARGV[0] == "19738" ? 5 : 100
abort "snapshot count/IDs invalid" unless entries.size == expected_batch_size &&
  entries.map { |entry| entry.fetch("id") }.uniq.size == expected_batch_size
before = records_by_id(original)
abort "snapshot missing active rows" unless entries.all? { |e| before.key?(e.fetch("id")) }
abort "snapshot differs from active Korean cells" unless entries.all? do |e|
  cells(before.fetch(e.fetch("id"))).fetch(1) == e.fetch("ko")
end

updated = original.dup
edits.group_by(&:first).each do |id, changes|
  row = before.fetch(id)
  replacement_row = row.dup
  changes.each do |_id, old, replacement, count|
    abort "old fragment count differs at #{id}: #{old}" unless replacement_row.scan(old.b).size == count
    replacement_row = replacement_row.gsub(old.b, replacement.b)
  end
  abort "row not unique at #{id}" unless updated.scan(row).size == 1
  updated.sub!(row, replacement_row)
end
after = records_by_id(updated)
ids = edits.map(&:first).uniq
abort "keys/order changed" unless before.keys == after.keys
abort "non-target record changed" unless (before.keys - ids).all? { |id| before[id] == after[id] }
abort "non-Texto cell changed" unless edits.all? do |id, _old, _new, _count|
  a = cells(before.fetch(id))
  b = cells(after.fetch(id))
  a.size == b.size && a.each_index.all? { |index| index == 1 || a[index] == b[index] }
end
abort "BOM changed" unless updated.start_with?("\xEF\xBB\xBFID_Linha;Texto\r\n".b)
endings = ->(bytes) { [bytes.scan("\r\n".b).size, bytes.scan(/(?<!\r)\n/n).size] }
abort "line endings changed" unless endings.call(original) == endings.call(updated)
inverse = updated.dup
edits.group_by(&:first).each do |id, changes|
  row = after.fetch(id)
  restored = row.dup
  changes.reverse_each do |_id, old, replacement, count|
    abort "new fragment count differs at #{id}" unless restored.scan(replacement.b).size == count
    restored = restored.gsub(replacement.b, old.b)
  end
  abort "updated row not unique at #{id}" unless inverse.scan(row).size == 1
  inverse.sub!(row, restored)
end
abort "inverse reconstruction differs" unless inverse == original
FileUtils.mkdir_p(File.dirname(backup))
abort "existing backup differs" if File.exist?(backup) && File.binread(backup) != original
File.binwrite(backup, original) unless File.exist?(backup)
abort "backup differs" unless File.binread(backup) == original
File.binwrite(path, updated)
puts "pre=#{expected} post=#{Digest::SHA256.hexdigest(updated)}"
puts "reviewed=#{expected_batch_size} accepted=#{ids.size} not_an_issue=#{expected_batch_size - ids.size}"
puts "accepted_ids=#{ids.join(',')} backup=#{backup}"
puts "BOM/mixed-endings/order/non-target-bytes/Texto-scope/inverse=OK"
