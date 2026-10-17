#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["place:morkans-cellar", "Morkan's cellar", "모르칸의 지하 저장고(Morkan's cellar)", 1, "Japanese モーカンの貯蔵室 and Chinese 莫坎的地窖 corroborate this source-local cellar/location label; preserve lowercase cellar."],
  ["place:eagonns-tomb", "Eagonn's Tomb", "이곤의 무덤(Eagonn's Tomb)", 8, "Japanese イーゴンの墓所 and Chinese 伊贡的墓室/坟墓 corroborate the named burial site. The English narrative locates it south of Alserund and says Eagonn was buried there."],
  ["place:kester-barclays-house", "Kester Barclay's House", "케스터 바클레이의 집(Kester Barclay's House)", 2, "Japanese ケスター・バークレイのハウス and Chinese 科斯特尔·巴克雷的家 corroborate the named residence."],
  ["place:lyrias-temple", "Lyria's Temple", "리리아의 사원(Lyria's Temple)", 1, "The Korean manual identifies the fate goddess as 리리아; Japanese リリア寺院 and Chinese 莉里亚神庙 corroborate the named temple."],
  ["place:derfels-house", "Derfel's House", "더펠의 집(Derfel's House)", 2, "Japanese デルフェルの家 and Chinese 德尔菲尔的家 corroborate the named residence."],
  ["place:orieators-tomb", "Orieator's Tomb", "오리에이터의 무덤(Orieator's Tomb)", 9, "Japanese オリエーターの墓所 and Chinese 奥瑞亚特之墓 corroborate the named burial site; the source context consistently places refugees, visitors, and war heroes there."],
  ["place:eadrics-shrine-of-mitharu", "Eadric's Shrine of Mitharu", "이드릭의 미사루 성소(Eadric's Shrine of Mitharu)", 1, "The Korean manual identifies Mitharu as 미사루; Japanese イードリックのミサール聖堂 and Chinese 艾德里克的米萨鲁神龛 corroborate this shrine label."],
  ["place:odwigs-shrine-of-mitharu", "Odwig's Shrine of Mitharu", "오드윅의 미사루 성소(Odwig's Shrine of Mitharu)", 1, "The Korean manual identifies Mitharu as 미사루; Japanese オドウィグのミサール聖堂 and Chinese 奥德威格的米萨鲁神龛 corroborate this shrine label."],
  ["place:st-eadrics-tomb", "St. Eadric's Tomb", "성 이드릭의 묘(St. Eadric's Tomb)", 1, "The Korean manual's general setting does not give this site name; Japanese 聖イードリックの墓所 and Chinese 圣艾德里克的坟墓 corroborate the named tomb."]
]

specs = data.map do |key, english, korean, count, notes|
  {
    key: key, english: english, category: "place",
    korean: korean, count: count,
    notes: "English-led review of a source-local named site. #{notes} Keep each site distinct from its namesake person/deity and do not merge similarly named places."
  }
end

changes = {
  ["base", "94", "11"] => ["모르칸(Morkan)의 지하 저장고", "모르칸의 지하 저장고(Morkan's cellar)"],
  ["base", "268", "11"] => ["이곤(Eagonn)의 무덤", "이곤의 무덤(Eagonn's Tomb)"],
  ["default", "6149", ""] => ["이곤(Eagonn)의 무덤으로 이동하기", "이곤의 무덤(Eagonn's Tomb)으로 이동하기"],
  ["default", "6157", ""] => ["이곤(Eagonn)의 무덤", "이곤의 무덤(Eagonn's Tomb)"],
  ["default", "10303", ""] => ["이곤(Eagonn)의 무덤으로 가라", "이곤의 무덤(Eagonn's Tomb)으로 가라"],
  ["default", "21378", ""] => ["신비한 망치(Mystic Hammer)는 소유자의 유해와 함께 알세룬드(Alserund) 남쪽의 좁은 고갯길에 있는 이곤(Eagonn)의 무덤에 묻혔다. 오래전 이곤(Eagonn)은 베신(Besin)처럼 니스카루(Niskaru) 군주를 풀어 주려던 마법사 파를랑(Fahrlang)을 막는 데 그 망치를 사용했다.", "신비한 망치(Mystic Hammer)는 소유자의 유해와 함께 알세룬드(Alserund) 남쪽의 좁은 고갯길에 있는 이곤의 무덤(Eagonn's Tomb)에 묻혔다. 오래전 이곤(Eagonn)은 베신(Besin)처럼 니스카루(Niskaru) 군주를 풀어 주려던 마법사 파를랑(Fahrlang)을 막는 데 그 망치를 사용했다."],
  ["default", "23307", ""] => ["이곤(Eagonn)의 무덤", "이곤의 무덤(Eagonn's Tomb)"],
  ["default", "29923", ""] => ["그래, 알겠다. 이곤(Eagonn)의 무덤에 있을 거야. 안타깝게도 서약방패병(Pledgeshield)이여, 맹세의 칼날보다 낮은 계급은 우리 성지에 들어갈 수 없다네. 하지만 해결은 간단하지.", "그래, 알겠다. 이곤의 무덤(Eagonn's Tomb)에 있을 거야. 안타깝게도 서약방패병(Pledgeshield)이여, 맹세의 칼날보다 낮은 계급은 우리 성지에 들어갈 수 없다네. 하지만 해결은 간단하지."],
  ["default", "61591", ""] => ["신비한 망치(Mystic Hammer)는 주인과 함께 알세룬드(Alserund) 남쪽의 좁은 고갯길에 있는 이곤(Eagonn)의 무덤에 묻혔다. 오래전 이곤(Eagonn)은 베신(Besin)처럼 니스카루(Niskaru) 군주(Niskaru Lord)를 산속 감옥에서 풀어 주려던 마법사 파를랑(Fahrlang)의 계획을 막기 위해 그 망치를 사용했다.", "신비한 망치(Mystic Hammer)는 주인과 함께 알세룬드(Alserund) 남쪽의 좁은 고갯길에 있는 이곤의 무덤(Eagonn's Tomb)에 묻혔다. 오래전 이곤(Eagonn)은 베신(Besin)처럼 니스카루(Niskaru) 군주(Niskaru Lord)를 산속 감옥에서 풀어 주려던 마법사 파를랑(Fahrlang)의 계획을 막기 위해 그 망치를 사용했다."],
  ["base", "306", "11"] => ["케스터 바클레이(Kester Barclay)의 집", "케스터 바클레이의 집(Kester Barclay's House)"],
  ["default", "7896", ""] => ["케스터 바클레이(Kester Barclay)의 집", "케스터 바클레이의 집(Kester Barclay's House)"],
  ["base", "529", "11"] => ["리리아(Lyria)의 사원", "리리아의 사원(Lyria's Temple)"],
  ["base", "865", "11"] => ["더펠(Derfel)의 집", "더펠의 집(Derfel's House)"],
  ["default", "48742", ""] => ["더펠(Derfel)의 집", "더펠의 집(Derfel's House)"],
  ["base", "1178", "11"] => ["오리에이터(Orieator)의 무덤", "오리에이터의 무덤(Orieator's Tomb)"],
  ["default", "102", ""] => ["오리에이터(Orieator)의 무덤", "오리에이터의 무덤(Orieator's Tomb)"],
  ["default", "1835", ""] => ["난민 리라 보가드(Lyra Vogard)와 동료들이 오리에이터(Orieator)의 무덤 깊은 곳에서 탈출해 버림받은 평원(Forsaken Plain)의 야영지로 돌아가도록 도왔다.", "난민 리라 보가드(Lyra Vogard)와 동료들이 오리에이터의 무덤(Orieator's Tomb) 깊은 곳에서 탈출해 버림받은 평원(Forsaken Plain)의 야영지로 돌아가도록 도왔다."],
  ["default", "5388", ""] => ["리라(Lyra)는 이 황량한 절벽보다 나은 피난처를 찾아 오리에이터(Orieator)의 무덤으로 갔어. 나라면 언덕 위 공동묘지를 찾아보겠어. 옛 전쟁의 영웅들이 모두 묻힌 곳이지.", "리라(Lyra)는 이 황량한 절벽보다 나은 피난처를 찾아 오리에이터의 무덤(Orieator's Tomb)으로 갔어. 나라면 언덕 위 공동묘지를 찾아보겠어. 옛 전쟁의 영웅들이 모두 묻힌 곳이지."],
  ["default", "21791", ""] => ["그 여자와 친구들은 오리에이터(Orieator)의 무덤 근처 언덕을 온통 헤집고 다녔어. 존경을 표하는 방식은 아니었지만, 선의로 한 일이야.", "그 여자와 친구들은 오리에이터의 무덤(Orieator's Tomb) 근처 언덕을 온통 헤집고 다녔어. 존경을 표하는 방식은 아니었지만, 선의로 한 일이야."],
  ["default", "28535", ""] => ["어릴 때부터 오리에이터(Orieator)의 무덤에 가보고 싶었어. 이렇게 가까이서 보게 될 줄은 몰랐지만.", "어릴 때부터 오리에이터의 무덤(Orieator's Tomb)에 가보고 싶었어. 이렇게 가까이서 보게 될 줄은 몰랐지만."],
  ["default", "38053", ""] => ["오리에이터(Orieator)의 무덤", "오리에이터의 무덤(Orieator's Tomb)"],
  ["default", "39937", ""] => ["오리에이터(Orieator)의 무덤", "오리에이터의 무덤(Orieator's Tomb)"],
  ["default", "59801", ""] => ["버림받은 평원(Forsaken Plain)에서 조심해야 할 위험은 오리에이터(Orieator)의 무덤뿐만이 아니야. 프리맨(Freemen)들이 동쪽 언덕을 배회하며 방심한 여행자에게 덫을 놓지.", "버림받은 평원(Forsaken Plain)에서 조심해야 할 위험은 오리에이터의 무덤(Orieator's Tomb)뿐만이 아니야. 프리맨(Freemen)들이 동쪽 언덕을 배회하며 방심한 여행자에게 덫을 놓지."],
  ["base", "1825", "11"] => ["이드릭(Eadric)의 미사루(Mitharu) 성소", "이드릭의 미사루 성소(Eadric's Shrine of Mitharu)"],
  ["base", "2588", "11"] => ["오드윅(Odwig)의 미사루(Mitharu) 성소", "오드윅의 미사루 성소(Odwig's Shrine of Mitharu)"],
  ["base", "2983", "11"] => ["성 이드릭(St. Eadric)의 묘", "성 이드릭의 묘(St. Eadric's Tomb)"]
}.freeze

context = <<~TEXT.strip
  Review nine named sites across base/default. English and the aligned Japanese
  and Chinese identify the same distinct tombs, residences, temple, shrines,
  and cellar label. Eagonn's Tomb and Orieator's Tomb have multiple exact
  dialogue/objective references; keep each physical site separate from its
  namesake person. Eadric's Shrine of Mitharu, Odwig's Shrine of Mitharu, and
  St. Eadric's Tomb are distinct locations; do not infer that their shared
  Mitharu/Eadric components make them one place. The Korean manual identifies
  Mitharu and Lyria but does not list these sites. Eamonn's Path is already a
  separately registered and terminal place entity; it is not reopened.
TEXT

ReviewedDiscoverySpecs.run(
  21_349, "Named Tombs, Residences, Shrine And Temple Labels", specs, context,
  "## D-21348: Additional Named Equipment And Object Labels"
) do |_spec, key, text, _source|
  from, to = changes.fetch(key)
  raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
  [text.sub(from, to), false]
end
