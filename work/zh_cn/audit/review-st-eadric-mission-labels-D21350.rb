#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["place:st-eadrics-mission", "St. Eadric's Mission", "성 이드릭 선교원(St. Eadric's Mission)", 9, "English and Japanese 聖イードリック修道院 and Chinese 圣艾德里克布道所 consistently identify the named mission site. Default:7130, 35937, 44024, and 48417 identify its well, burial pall, tomb, and excavation."],
  ["place:st-eadrics-perpetual-mission", "St. Eadric's Perpetual Mission", "성 이드릭 영구 선교원(St. Eadric's Perpetual Mission)", 4, "English, Japanese 聖イードリック終身修道院, and Chinese 圣艾德里克的永恒布道所 corroborate the complete institutional/site label. Keep it separate from St. Eadric's Mission; no identity between their physical sites is inferred."]
]

specs = data.map do |key, english, korean, count, notes|
  {
    key: key, english: english, category: "place",
    korean: korean, count: count,
    notes: "English-led review of the complete St. Eadric-named mission label. #{notes} Preserve the separate person entry for St. Eadric and do not infer a broader order or site identity beyond this exact source label."
  }
end

changes = {
  ["base", "3863", "11"] => ["성 이드릭(St. Eadric)의 선교회", "성 이드릭 선교원(St. Eadric's Mission)"],
  ["default", "3498", ""] => ["성 이드릭(St. Eadric)의 선교원", "성 이드릭 선교원(St. Eadric's Mission)"],
  ["default", "7130", ""] => ["성 이드릭(St. Eadric) 선교회의 우물", "성 이드릭 선교원(St. Eadric's Mission) 우물"],
  ["default", "35872", ""] => ["성 이드릭(St. Eadric) 선교소", "성 이드릭 선교원(St. Eadric's Mission)"],
  ["default", "35937", ""] => ["물건 세 개를 훔쳐야 해. 다이덴힐(Didenhil)의 메달, 성 이드릭(St. Eadric) 선교소의 관 덮개, 시드(Sidhe)의 단검들이야.", "물건 세 개를 훔쳐야 해. 다이덴힐(Didenhil)의 메달, 성 이드릭 선교원(St. Eadric's Mission)의 관 덮개, 시드(Sidhe)의 단검들이야."],
  ["default", "44024", ""] => ["다음 물건을 훔쳐야 한다. 다이덴힐(Didenhil)의 귀족 이얼프위그 그릴리카스(Ealfwig Grilricas)의 메달, 그리고 성 이드릭(St. Eadric) 선교회에 있는 성 이드릭(St. Eadric)의 무덤에서 관 덮개.", "다음 물건을 훔쳐야 한다. 다이덴힐(Didenhil)의 귀족 이얼프위그 그릴리카스(Ealfwig Grilricas)의 메달, 그리고 성 이드릭 선교원(St. Eadric's Mission)에 있는 성 이드릭(St. Eadric)의 무덤에서 관 덮개."],
  ["default", "48417", ""] => ["에테어(Etair) 신부와 울프(Wulf) 수사는 성 이드릭(St. Eadric) 선교원 우물을 발굴하다가 기이한 수정 몇 개를 발견했다. 그 수정들이 사라진 모양이다. 우물부터 찾아봐야겠다. 에테어(Etair)는 살해당하기 직전 물을 길으러 가는 모습이 목격됐다.", "에테어(Etair) 신부와 울프(Wulf) 수사는 성 이드릭 선교원(St. Eadric's Mission) 우물을 발굴하다가 기이한 수정 몇 개를 발견했다. 그 수정들이 사라진 모양이다. 우물부터 찾아봐야겠다. 에테어(Etair)는 살해당하기 직전 물을 길으러 가는 모습이 목격됐다."],
  ["base", "4401", "11"] => ["성 이드릭(Eadric)의 영구 선교회", "성 이드릭 영구 선교원(St. Eadric's Perpetual Mission)"],
  ["default", "7242", ""] => ["낡고 해진 이 일지의 여백에는 하크시(Haxhi)에 있는 성 이드릭(St. Eadric) 영구 선교회의 영적 지도자, 에테어 신부(Father Etair)가 매일 바친 기도와 사색이 적혀 있다.", "낡고 해진 이 일지의 여백에는 하크시(Haxhi)에 있는 성 이드릭 영구 선교원(St. Eadric's Perpetual Mission)의 영적 지도자, 에테어 신부(Father Etair)가 매일 바친 기도와 사색이 적혀 있다."],
  ["default", "17679", ""] => ["제단은 아무 말도 하지 않지만, 대사제(Hierophant)가 훔쳐 오라고 한 물건들이 떠오른다. 다이덴힐(Didenhil)에 있는 이얼프위그 그릴리카스(Ealfwig Grilricas)의 메달, 성 이드릭(St. Eadric)의 상설 선교회에 있는 성 이드릭(St. Eadric)의 수의, 그리고 시드(Sidhe)에 있는 거너 프로드(Gunnar Frode)가 소유한 한 쌍의 단검, 드라우그의 이쑤시개(Draug's Toothpicks)다.", "제단은 아무 말도 하지 않지만, 대사제(Hierophant)가 훔쳐 오라고 한 물건들이 떠오른다. 다이덴힐(Didenhil)에 있는 이얼프위그 그릴리카스(Ealfwig Grilricas)의 메달, 성 이드릭 영구 선교원(St. Eadric's Perpetual Mission)에 있는 성 이드릭(St. Eadric)의 수의, 그리고 시드(Sidhe)에 있는 거너 프로드(Gunnar Frode)가 소유한 한 쌍의 단검, 드라우그의 이쑤시개(Draug's Toothpicks)다."],
  ["default", "37728", ""] => ["백색의 할람(Hallam the White)은 연금술사이자 미사루(Mitharu)의 사제인 에테어(Etair)가 윈더미어의 시녀(Maid of Windemere)가 위대한 페이(Fae)의 노래를 어떻게 바꾸는지 알고 있을지도 모른다고 했어. 에테어(Etair)는 남동쪽 시드(Sidhe)에 있는 성 이드릭(St. Eadric) 영구 선교원에 살아.", "백색의 할람(Hallam the White)은 연금술사이자 미사루(Mitharu)의 사제인 에테어(Etair)가 윈더미어의 시녀(Maid of Windemere)가 위대한 페이(Fae)의 노래를 어떻게 바꾸는지 알고 있을지도 모른다고 했어. 에테어(Etair)는 남동쪽 시드(Sidhe)에 있는 성 이드릭 영구 선교원(St. Eadric's Perpetual Mission)에 살아."]
}.freeze

already_complete = {
  ["default", "12252", ""] => "성 이드릭 선교원(St. Eadric's Mission)",
  ["default", "54708", ""] => "성 이드릭 선교원(St. Eadric's Mission)"
}.freeze

context = <<~TEXT.strip
  Review both exact source labels for St. Eadric's Mission and St. Eadric's
  Perpetual Mission, retaining their English distinction. English and
  Japanese/Chinese identify a missionary monastery/site; default dialogue
  places wells, a tomb, and the burial pall at the first mission, while the
  second is separately described in Haxhi and the Sidhe. Do not infer whether
  the two names denote branches of one institution. Normalize existing Korean
  선교회/선교소/선교원 and 상설/영구 variants to 선교원 and 영구 선교원,
  respectively. The official Korean manual has no direct name for either
  mission; its setting and religion sections provide background only.
TEXT

ReviewedDiscoverySpecs.run(
  21_350, "St. Eadric Mission Name And Site Labels", specs, context,
  "## D-21349: Named Tombs, Residences, Shrine And Temple Labels"
) do |_spec, key, text, _source|
  if already_complete.key?(key)
    raise "complete-label check differs #{key.inspect}" unless text == already_complete.fetch(key)
    [text, false]
  else
    from, to = changes.fetch(key)
    raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
    [text.sub(from, to), false]
  end
end
