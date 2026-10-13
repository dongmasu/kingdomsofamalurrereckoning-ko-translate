#!/usr/bin/env ruby
require "digest"

path = "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
scope = Integer(ARGV.fetch(0))
changes = {
  20128 => {
    52661 => ["완벽한 미타란", "흠 없는 미타란"],
    52688 => ["그들은 미래를 알고 싶어 하는 사람들, 부와 행운을 바라는 사람들 때문에 나를 여기 데려왔어.", "그들은 부와 행운을 바라며 미래를 알고 싶어서 나를 여기로 데려왔어."],
    52699 => ["티끌의 자식", "먼지의 아이"]
  },
  20129 => {
    52717 => ["누구든 그녀를 잡아갔어.", "누구든 그녀를 죽였어."],
    52750 => ["영웅이 이제 우리 민족을 더는 ‘마이루(Mairu)’라고 부르지 않겠다고 선언했다는 거야?", "영웅이 이제 우리 민족을 더는 ‘마이루(Mairu)’라고 부르지 말라고 선언했다는 거야?"]
  },
  20130 => {
    52776 => ["덤벼라, 전사들이여!", "싸워라, 전사들이여!"],
    52787 => ["이딜라(Idylla)", "이디라(Idylla)"]
  },
  20131 => {
    52848 => ["네 목숨을 유지하는 데 돈이 꽤 들었어. 드디어 이 일을 끝낼 때가 오길 고대하고 있지.", "네가 살아 있는 바람에 돈이 꽤 들고 있어. 마침내 네 목숨을 끝낼 날이 기대되는군."]
  },
  20132 => {
    52852 => ["암호문(Cipher)", "사이퍼(Cipher)"],
    52895 => ["완벽한 미타란", "흠 없는 미타란"]
  },
  20133 => {
    52909 => ["이거 라토퍼(Ratofer)의 작품이지? 알아보겠어. 아버지가 만든 거야.", "이거 라토퍼(Ratofer)의 물건이지? 이 솜씨를 알아보겠어. 내 아버지가 만든 거야."]
  },
  20134 => {
    52956 => ["페이랜드의 페이트위버", "패란즈의 페이트위버"],
    52970 => ["여행자들(Travelers)", "트래블러들(Travelers)"],
    52998 => ["계산이 맞지 않아.", "명부 내용이 맞질 않아."]
  },
  20135 => {
    53002 => ["교수대의 끝(Gallows End)", "갤로우스 엔드(Gallows End)"]
  },
  20136 => {
    53086 => ["교수대의 끝(Gallows End)", "갤로우스 엔드(Gallows End)"],
    53093 => ["교수대의 끝(Gallows End)", "갤로우스 엔드(Gallows End)"]
  },
  20137 => {
    53147 => ["이딜라(Idylla)", "이디라(Idylla)"]
  },
  20138 => {
    53161 => ["클루리콘(Klurikon)의 거대한 거인들이 아직 묘목만 하던 시절", "클루리콘(Klurikon)의 거목들이 아직 묘목이던 시절"],
    53184 => ["에일을 한두 잔 마신 뒤", "에일을 한 잔이나 세 잔쯤 마신 뒤"],
    53200 => ["후계자(Scion)", "사이온(Scion)"]
  },
  20139 => {
    53210 => ["하이페리온(Hyperian)", "하이페리언(Hyperian)"],
    53232 => ["교수대의 끝(Gallows End)", "갤로우스 엔드(Gallows End)"],
    53244 => ["신들이 가장 필요로 했던 너를 보내 준 것 말고 달리 무슨 이유가 있겠어?", "내게 가장 필요했던 너를 신들이 보내 주신 게 아니면 달리 뭐겠어?"]
  },
  20140 => {
    53283 => ["발라드 가문(House of Ballads)", "발라드의 집(House of Ballads)"]
  },
  20141 => {
    53317 => ["완벽한 미타란", "흠 없는 미타란"]
  },
  20142 => {
  },
  20143 => {
  },
  20145 => {
    53542 => ["오랜 연구와 수련을 거치면 셉터(Sceptres)을 매우 능숙하게 다룰 수 있습니다.", "오랜 연구와 수련을 거치면 셉터(Sceptres)를 매우 능숙하게 다룰 수 있습니다."]
  },
  20146 => {
    53582 => ["페이랜드(Faelands)에서", "패란즈(Faelands)에서"]
  },
  20147 => {
    53607 => ["돈을 벌 수 있을 텐데.", "돈을 쓸 수 있을 텐데."],
    53637 => ["마법술은", "마법은"]
  },
  20148 => {
    53679 => ["알파르 군대가 전선을 넘어오는 자들을 모두 막고 있어.", "알파르 군대가 전선 통행을 모두 막고 있어."],
    53697 => ["그 구슬들이", "그것들이"]
  },
  20149 => {
    53701 => ["아르카나 학회(Scholia Arcana)", "스콜리아 아르카나(Scholia Arcana)"]
  },
  20150 => {
    53752 => ["루에더르 더 그루트(Luether de Groot)의 시신에서 나온 편지", "루에더르 더 그루트(Luether de Groot)의 시신에서 발견한 편지"],
    53755 => ["성전기사가 약속 장소에 가는 것을 막을 생각은 없네.", "성전기사단원이 약속 장소에 가는 것을 막을 생각은 없네."],
    53759 => [
      ["검은 서신(Missives of Sable)", "세이블의 서신(Missives of Sable)"],
      ["앰비언트의 유리(Glass of Ambient)를", "앰비언트의 거울(Glass of Ambient)을"]
    ],
    53760 => ["검은 서신", "세이블의 서신(Missives of Sable)"],
    53783 => ["늙은 나린 농장(Old Nareen Farm)이 다시 나타났어.", "늙은 나린 농장(Old Nareen Farm)이 다시 돌아왔어."]
  }
}.fetch(scope)
if scope == 20150 && ARGV[2] == "fix-53759-particle"
  changes = {
    53759 => [["앰비언트의 거울(Glass of Ambient)를", "앰비언트의 거울(Glass of Ambient)을"]]
  }
end
changes = changes.select { |id, _| id == Integer(ARGV[1]) } if ARGV[1]
changes = changes.transform_values do |entry|
  entry.first.is_a?(Array) ? entry : [entry]
end
first = 52651 + (scope - 20128) * 50
source = File.binread(path)
backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D#{scope}/locatexts_zh_cn.koalocatext_default.csv"
if scope == 20147 && File.file?(backup) && File.binread(backup) != source
  backup = "/private/tmp/ko-translate-backups/20261013/before-named-scope-D20147-followup-53607/locatexts_zh_cn.koalocatext_default.csv"
elsif scope == 20150 && File.file?(backup) && File.binread(backup) != source
  candidates = %w[
    /private/tmp/ko-translate-backups/20261013/before-named-scope-D20150-followup-53752/locatexts_zh_cn.koalocatext_default.csv
    /private/tmp/ko-translate-backups/20261013/before-named-scope-D20150-followup-53759-particle/locatexts_zh_cn.koalocatext_default.csv
  ]
  backup = candidates.find { |candidate| File.file?(candidate) && File.binread(candidate) == source } || backup
end
abort "missing or mismatched pre-edit backup" unless File.file?(backup) && File.binread(backup) == source
abort "unexpected prior checkpoint" if scope == 20128 &&
  Digest::SHA256.hexdigest(source) != "4d5f74aa9f84cf2bfb21a0ad893c69c004618fd24fe2e3714d545d1b967d8fcd"
extract = lambda do |bytes, id|
  matches = bytes.to_enum(:scan, /^#{id};.*?(?=^\d+;|\z)/nm).map { Regexp.last_match[0] }
  abort "missing or duplicated ID #{id}" unless matches.length == 1
  matches.first
end
updated = source.dup
changes.each do |id, replacements|
  abort "out of scope #{id}" unless (first...(first + 50)).cover?(id)
  replacements.each do |old, replacement|
    record = extract.call(updated, id)
    abort "expected exactly one target #{id}" unless record.scan(old.b).length == 1
    revised = record.sub(old.b, replacement.b)
    updated[updated.index(record), record.bytesize] = revised
  end
end
inverse = updated.dup
changes.each do |id, replacements|
  replacements.each do |old, replacement|
    record = extract.call(inverse, id)
    abort "expected exactly one revised target #{id}" unless record.scan(replacement.b).length == 1
    inverse[inverse.index(record), record.bytesize] = record.sub(replacement.b, old.b)
  end
end
abort "non-target bytes changed" unless inverse == source
shape = lambda do |bytes|
  [bytes.start_with?("\xEF\xBB\xBF".b),
   bytes.scan("\r\n".b).length, bytes.scan(/(?<!\r)\n/n).length,
   bytes.scan(/^(?:\xEF\xBB\xBF)?(\d+);/n).flatten]
end
abort "BOM, newline or row order changed" unless shape.call(source) == shape.call(updated) &&
  shape.call(updated)[3] == (0..65134).map(&:to_s)
locales = %w[en_us ja_jp zh_cn].map do |locale|
  File.binread("src/csv/#{locale}/locatexts_#{locale}.koalocatext_default.csv")
end + [updated]
signatures = lambda do |row|
  markers = row.scan(/\{[^{}\r\n]+\}|#[A-Z0-9_]+#|\$[A-Z0-9_.]+\$/n)
  [row.scan(/\n/n).length, markers.map { |marker| marker =~ /\A\{\*(\d+)/n ? "{*#{Regexp.last_match(1)}}" : marker }]
end
(first...(first + 50)).each do |id|
  values = locales.map { |bytes| signatures.call(extract.call(bytes, id)) }
  if id == 53154
    abort "53154 source placeholder divergence changed" unless values[0] == values[2] &&
      values[0] == values[3] && values[1][0] == values[0][0] &&
      values[1][1].sort == values[0][1].sort
  elsif id == 53569
    expected_ja = values[0][1].dup
    expected_ja[1], expected_ja[2] = expected_ja[2], expected_ja[1]
    abort "53569 source placeholder divergence changed" unless values[0] == values[2] &&
      values[0] == values[3] && values[1] == [values[0][0], expected_ja]
  elsif id == 53744
    expected_ja = values[0][1].dup
    expected_ja[0], expected_ja[1] = expected_ja[1], expected_ja[0]
    abort "53744 source placeholder divergence changed" unless values[0] == values[2] &&
      values[0] == values[3] && values[1] == [values[0][0], expected_ja]
  elsif id == 53582
    expected_zh = values[0][1].dup
    expected_zh[6, 2] = ["{LINE_LEFT}", "{LINE_LEFT}"]
    abort "53582 source control-marker divergence changed" unless values[0] == values[1] &&
      values[0] == values[3] && values[2] == [values[0][0], expected_zh]
  elsif id == 53439
    abort "53439 source placeholder divergence changed" unless values[0] == values[3] &&
      values[1] == values[2] && values[0][0] == values[1][0] &&
      values[0][1].sort == ["{1}", "{2}"] && values[1][1].sort == ["{1}", "{2}"]
  else
    abort "locale signature differs at #{id}: #{values}" unless values.uniq.length == 1
  end
  old_labels = extract.call(source, id).scan(/\{\*\d+[^{}\r\n]*\}/n)
  new_labels = extract.call(updated, id).scan(/\{\*\d+[^{}\r\n]*\}/n)
  abort "localized marker label changed at #{id}" unless old_labels == new_labels
end
File.binwrite(path, updated)
puts "D-#{scope} pre=#{Digest::SHA256.hexdigest(source)} post=#{Digest::SHA256.hexdigest(updated)} backup=#{backup} edited=#{changes.keys.join(',')} inverse/BOM/mixed-endings/ordered-IDs/four-locale-signatures=OK"
