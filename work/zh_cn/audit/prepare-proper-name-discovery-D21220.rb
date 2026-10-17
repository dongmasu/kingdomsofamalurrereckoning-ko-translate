#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:hierophant-shrine", english: "Hierophant Shrine", category: "place",
   korean: "대사제의 성소(Hierophant Shrine)", count: 19,
   variants: "대사제의 사당|히에로판트의 성소|히에로판트 신전|대사제 성소|대제사장 제단|히에로판트 사당",
   notes: "English names the Travelers' shrine, not the Hierophant person/title. Japanese 導き手の祭壇/祈祷師の聖堂 and Chinese 大祭司神龛 corroborate. Keep separate mentions of the guide outside the shrine span."},
  {key: "place:litany-altar", english: "Litany Altar", category: "place",
   korean: "연도 제단(Litany Altar)", count: 8,
   variants: "연도의 제단|연도문 제단|기도문 제단",
   notes: "English identifies the named altar used to activate recovered litanies, supported by Japanese 連祷の祭壇 and Chinese 祷文祭坛. Reuse the established 연도 제단; preserve default:16040's placement by the altar and do not relabel ordinary litanies."},
  {key: "lore term:water-lock", english: "Water Lock", category: "lore term",
   korean: "수문(Water Lock)", count: 5, variants: "워터 록|물의 봉인|물 잠금장치",
   notes: "English default:5972 calls this a ward regulating the Font's flow; this is a named lock/ward mechanism, not a location. Japanese 水門の鍵 and Chinese 水锁/水闸 corroborate. Use 수문, already paired at default:53537. Preserve local source pool counts and all quest instructions."},
  {key: "place:overgrown-thicket", english: "Overgrown Thicket", category: "place",
   korean: "우거진 덤불(Overgrown Thicket)", count: 10,
   variants: "무성한 덤불|무성한 덤불숲|무성한 덤불 지대|오버그로운 시켓",
   notes: "English identifies the Odarath location, supported by Japanese 密林の洞窟 and Chinese 茂密丛林/幽暗密林. Reuse standalone default:63811 우거진 덤불. Exclude default:62300's indefinite lowercase an overgrown thicket, corroborated by generic Japanese 深い茂み, without inferring that generic brush is the named contract location."}
]
context = "English-led cross-resource review of named shrines, altar, lock mechanism and thicket. Official Korean manual PDF page 9 describes shrines and wards generally but does not establish these individual names. Lowercase indefinite brush at default:62300 is an explicit false-positive exclusion, unchanged."
ReviewedDiscoverySpecs.run(21_220, "Shrines, Altar, Lock And Thicket", specs, context,
  "## D-21219: Monster, Title, Spell, Artifact, Reagent And Place") do |spec, key, text, _source|
  excluded = spec[:key] == "place:overgrown-thicket" && key == ["default", "62300", ""]
  unless excluded
    case spec[:key]
    when "place:hierophant-shrine"
      text = text.gsub(/(대사제의 성소|대사제의 사당|히에로판트의 성소|히에로판트 신전|대사제 성소|대제사장 제단|히에로판트 사당)(?:\(Hierophant Shrine\))?(은|이|을|으로)?/) do
        name, particle = $1, $2.to_s
        if name.end_with?("사당", "신전", "제단")
          particle = {"은" => "는", "이" => "가", "을" => "를", "으로" => "로"}.fetch(particle, particle)
        end
        "#{spec[:korean]}#{particle}"
      end
    when "place:litany-altar"
      text = text.gsub(/(?:연도 제단|연도의 제단|연도문 제단|기도문 제단)(?:\(Litany Altar\))?/, spec[:korean])
    when "lore term:water-lock"
      text = text.gsub(/(수문|워터 록|물의 봉인|물 잠금장치)(?:\(Water Lock\))?(는|가|를|로)?/) do
        name, particle = $1, $2.to_s
        if name == "물 잠금장치"
          particle = {"는" => "은", "가" => "이", "를" => "을", "로" => "으로"}.fetch(particle, particle)
        end
        "#{spec[:korean]}#{particle}"
      end
    when "place:overgrown-thicket"
      text = text.gsub(/(?:무성한 덤불 지대|무성한 덤불숲|무성한 덤불|오버그로운 시켓|우거진 덤불)(?:\(Overgrown Thicket\))?/, spec[:korean])
    end
  end
  [text, excluded]
end
