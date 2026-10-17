#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "lore term:barelegs-sisters", english: "Barelegs Sisters", category: "lore term",
   korean: "맨다리 자매(Barelegs Sisters)", count: 4,
   notes: "English names the trio's collective sobriquet and its eponymous tale; this is neither a faction nor a merged individual person. English explicitly describes exposed legs and short dresses; Chinese 赤腿姐妹 supports 맨다리, while Japanese 裸足の姉妹 localizes as bare feet. Preserve the complete The Barelegs Sisters annotation on both book-title labels and annotate three explicit named mentions in default:49084, not every ordinary sisters pronoun."},
  {key: "person:boxer-rak", english: "Boxer Rak", category: "person",
   korean: "복서 라크(Boxer Rak)", count: 2,
   notes: "English titled personal label, Japanese ボクサー・ラック and Chinese 拳击手拉克 agree. Standardize surname/name spelling to 라크, already in the standalone Rak label default:28471; do not infer a global bare Rak identity alias."},
  {key: "person:lady-shir", english: "Lady Shir", category: "person",
   korean: "시어 부인(Lady Shir)", count: 3,
   notes: "English titled name, Japanese レディー・シアー and Chinese 希尔女士 support the form. Reuse the in-corpus Alyn Shir surname 시어 rather than 시르/쉬르. This source-title registration does not assert that bare Alyn or other Shir forms are new aliases."},
  {key: "person:lord-ambyth", english: "Lord Ambyth", category: "person",
   korean: "앰비스 경(Lord Ambyth)", count: 4,
   notes: "English explicitly names the Order of Fateweavers leader; Japanese アムビス卿 and Chinese 安比斯领主 corroborate. Reuse the repeated 앰비스 경 instead of isolated 암비스. No bare Ambyth alias inferred."},
  {key: "person:sir-airor", english: "Sir Airor", category: "person",
   korean: "에어로르 경(Sir Airor)", count: 3,
   notes: "English names the knight in the journal and repeated song. Japanese varies アイロア/エアラ and Chinese 艾洛尔/艾尔, so neither is treated as definitive pronunciation; standardize to the already bilingual default:63500 에어로르, not a claim of official romanization. Same-row short Airor in the song uses 에어로르(Airor); unlinked standalone short labels are not global aliases."},
  {key: "person:warden-blackwood", english: "Warden Blackwood", category: "person",
   korean: "블랙우드 감시관(Warden Blackwood)", count: 5,
   notes: "English default:49829 explicitly calls him the law officer of Gale Crossing, supporting 감시관 rather than prison-specific 간수. Japanese 衛士ブラックウッド corroborates a civic officer; Chinese 典狱长 is supporting, not the meaning anchor. Mama Blackwood is his mother, not an alias; no bare Blackwood match."},
  {key: "title:warlord-experiorati", english: "Warlord Experiorati", category: "title",
   korean: "전쟁군주 엑스페리오라티(Warlord Experiorati)", count: 3,
   notes: "English default:50211 explicitly proclaims the player's bestowed title, not a separate NPC. Japanese 並外れた将軍 and Chinese 战争领主 corroborate. Reuse default:4958's complete title and preserve the local honorific/register."}
]
context = "English-led review of seven collective/titled proper names across affix/base/default. Official Korean manual PDF pages 1/8 supply setting, dialogue and title context, not an exhaustive roster. Existing Korean comparators determine consistent editorial spellings; they are not claimed to be official pronunciations. Preserve book-title articles, same-row short names and all unrelated people."
ReviewedDiscoverySpecs.run(21_224, "Collective And Titled Names", specs, context,
  "## D-21223: House, Ranger, Memorial Name And Title") do |spec, key, text, _source|
  case spec[:key]
  when "lore term:barelegs-sisters"
    if key == ["base", "4828", "11"] || key == ["default", "53289", ""]
      text = text.sub(/(?:맨발의 자매들|맨다리 자매들?) ?(?:\((?:The )?Barelegs Sisters\))?/, "맨다리 자매(The Barelegs Sisters)")
    else
      text = text.gsub(/(?:맨발의 자매들|맨다리 자매들?)(?:\(Barelegs Sisters\))?/, spec[:korean])
    end
  when "person:boxer-rak"
    text = text.gsub(/복서 (?:랙|락|라크)(?:\(Boxer Rak\))?/, spec[:korean])
  when "person:lady-shir"
    text = text.gsub(/(?:레이디 시르|(?:시르|쉬르|시어) 부인)(?:\(Lady Shir\))?/, spec[:korean])
  when "person:lord-ambyth"
    text = text.gsub(/(?:암비스|앰비스) 경(?:\(Lord Ambyth\))?/, spec[:korean])
  when "person:sir-airor"
    text = text.gsub(/(?:에어러|에어로르|에어로) 경(?:\(Sir Airor\))?/, spec[:korean])
    text = text.gsub(/에어로(?:르)?(?:\(Airor\))?를/, "에어로르(Airor)를") if key[0] == "default"
  when "person:warden-blackwood"
    text = text.gsub(/(?:블랙우드\(Blackwood\) 감시관|(?:관리관|감시관|간수) 블랙우드(?:\(Warden Blackwood\))?)/, spec[:korean])
    {"가" => "이", "는" => "은", "를" => "을", "로" => "으로", "야" => "이야"}.each do |from, to|
      text = text.gsub("#{spec[:korean]}#{from}", "#{spec[:korean]}#{to}")
    end
  when "title:warlord-experiorati"
    text = text.gsub(/(?:전쟁군주|워로드) 엑스페리오라티(?:\(Warlord Experiorati\))?/, spec[:korean])
  end
  [text, false]
end
