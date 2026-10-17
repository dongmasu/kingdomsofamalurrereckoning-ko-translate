#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["unique item:st-eadrics-pall", "St. Eadric's Pall", "성 이드릭의 수의(St. Eadric's Pall)", 3, "Japanese 聖イードリックの骸布 and Chinese 圣艾德里克的裹尸布 corroborate the named garment and owner."],
  ["unique item:belens-greaves", "Belen's Greaves", "벨렌의 정강이받이(Belen's Greaves)", 1, "The Korean manual identifies Belen as 벨렌; Japanese ベイレンのグリーブ and Chinese 贝伦护胫 corroborate the named equipment."],
  ["unique item:eagonns-greaves", "Eagonn's Greaves", "이곤의 정강이받이(Eagonn's Greaves)", 1, "Japanese イーゴンのグリーブ and Chinese 伊贡的护胫 corroborate Eagonn and the item."],
  ["unique item:ratofers-daggers", "Ratofer's Daggers", "라토퍼의 단검(Ratofer's Daggers)", 4, "Japanese ラトファーのダガー and Chinese 拉托弗的匕首 corroborate the named pair; the source variant Ratofer's Daggers Improved is recorded as a local alias."],
  ["unique item:ethenes-tear", "Ethene's Tear", "에테네의 눈물(Ethene's Tear)", 1, "The Korean manual identifies the knowledge deity as 에테네; Japanese エセンの涙 and Chinese 伊希恩之泪 corroborate the title."],
  ["unique item:grinning-vanes-armband", "Grinning Vane's Armband", "웃는 베인의 완장(Grinning Vane's Armband)", 1, "Japanese にやにやヴェインの腕章 and Chinese 微笑的瓦内的臂章 corroborate the named armband."],
  ["unique item:lunalas-boots", "Lunala's Boots", "루날라의 장화(Lunala's Boots)", 1, "Japanese ルナーラのブーツ and Chinese 卢娜拉之靴 corroborate the named equipment."],
  ["unique item:aryllias-robe", "Aryllia's Robe", "아릴리아의 로브(Aryllia's Robe)", 1, "The Korean manual identifies Aryllia as 아릴리아; Japanese アリリアのローブ and Chinese 阿丽莉娅的长袍 corroborate the title."],
  ["unique item:kiftals-elixer", "Kiftal's Elixer", "키프탈의 엘릭서(Kiftal's Elixer)", 1, "Japanese キフタルのエリクサー and Chinese 基弗塔尔的灵药 corroborate the named potion; preserve the English source spelling Elixer."],
  ["unique item:lunalas-crescents", "Lunala's Crescents", "루날라의 초승달(Lunala's Crescents)", 1, "Japanese ルナーラの三日月 and Chinese 卢娜拉的新月 corroborate the named item."],
  ["unique item:thyrdons-gauntlets-of-war", "Thyrdon's Gauntlets of War", "사이르돈의 전쟁 건틀릿(Thyrdon's Gauntlets of War)", 1, "The Korean manual identifies the war deity as 사이르돈; Japanese シアドンのウォーガントレット and Chinese 提利顿的战争拳套 corroborate the complete title."],
  ["unique item:eagonns-cuirass", "Eagonn's Cuirass", "이곤의 흉갑(Eagonn's Cuirass)", 1, "Japanese イーゴンのキュイラス and Chinese 伊贡的胸甲 corroborate the named armor."],
  ["unique item:belens-cuirass", "Belen's Cuirass", "벨렌의 흉갑(Belen's Cuirass)", 1, "The Korean manual identifies Belen as 벨렌; Japanese ベイレンのキュイラス and Chinese 贝伦胸甲 corroborate the item."],
  ["unique item:belens-helm", "Belen's Helm", "벨렌의 투구(Belen's Helm)", 1, "The Korean manual identifies Belen as 벨렌; Japanese ベイレンのヘルム and Chinese 贝伦头盔 corroborate the item."],
  ["unique item:aryllias-handwraps", "Aryllia's Handwraps", "아릴리아의 손붕대(Aryllia's Handwraps)", 1, "The Korean manual identifies Aryllia as 아릴리아; Japanese アリリアのハンドラップ and Chinese 阿丽莉娅的护手 corroborate the item."],
  ["unique item:orieators-shield", "Orieator's Shield", "오리에이터의 방패(Orieator's Shield)", 1, "Japanese オリエーターの盾 and Chinese 奥瑞亚特的护盾 corroborate the named shield."],
  ["unique item:eldrics-staff", "Eldric's Staff", "엘드릭의 지팡이(Eldric's Staff)", 2, "Japanese エルドリックの杖 and Chinese 埃尔德里奇的法杖 corroborate the named staff; preserve the source-shortened Eldric form."],
  ["unique item:lyrias-handwraps", "Lyria's Handwraps", "리리아의 손붕대(Lyria's Handwraps)", 1, "The Korean manual identifies Lyria as 리리아; Japanese リリアのハンドラップ and Chinese 莉里亚的护手 corroborate the item."],
  ["unique item:ratofers-boots", "Ratofer's Boots", "라토퍼의 장화(Ratofer's Boots)", 1, "Japanese ラトファーのブーツ and Chinese 拉托弗之靴 corroborate the named equipment."],
  ["unique item:puras-helm", "Pura's Helm", "퓨라의 투구(Pura's Helm)", 1, "Japanese ピュラのヘルム and Chinese 普拉的头盔 corroborate the named armor and person."],
  ["unique item:drewns-ring", "Drewn's Ring", "드루엔의 반지(Drewn's Ring)", 2, "Japanese ドリューンの指輪 and Chinese 德鲁温的戒指 corroborate the ring; default:24768 explicitly identifies it as the same named item."]
]

specs = data.map do |key, english, korean, count, notes|
  aliases = key == "unique item:ratofers-daggers" ?
    "Ratofer's Daggers Improved" : ""
  {
    key: key, english: english, category: "unique item",
    korean: korean, aliases: aliases, count: count,
    notes: "English-led named-item review across the base label and source-matched references. #{notes} Register the complete item separately from its owner; do not infer additional biography, rarity, or equipment properties."
  }
end

changes = {
  ["base", "29", "11"] => ["성 이드릭(St. Eadric)의 수의", "성 이드릭의 수의(St. Eadric's Pall)"],
  ["base", "50", "11"] => ["벨렌(Belen)의 정강이받이", "벨렌의 정강이받이(Belen's Greaves)"],
  ["base", "99", "11"] => ["이곤(Eagonn)의 정강이받이", "이곤의 정강이받이(Eagonn's Greaves)"],
  ["base", "112", "11"] => ["라토퍼(Ratofer)의 단검", "라토퍼의 단검(Ratofer's Daggers)"],
  ["base", "190", "11"] => ["에테네(Ethene)의 눈물", "에테네의 눈물(Ethene's Tear)"],
  ["base", "289", "11"] => ["웃는 베인(Grinning Vane)의 완장", "웃는 베인의 완장(Grinning Vane's Armband)"],
  ["base", "291", "11"] => ["루날라(Lunala)의 장화", "루날라의 장화(Lunala's Boots)"],
  ["base", "321", "11"] => ["아릴리아(Aryllia)의 로브", "아릴리아의 로브(Aryllia's Robe)"],
  ["base", "363", "11"] => ["키프탈(Kiftal)의 엘릭서", "키프탈의 엘릭서(Kiftal's Elixer)"],
  ["base", "436", "11"] => ["루날라(Lunala)의 초승달", "루날라의 초승달(Lunala's Crescents)"],
  ["base", "496", "11"] => ["전쟁의 사이르돈(Thyrdon) 건틀릿", "사이르돈의 전쟁 건틀릿(Thyrdon's Gauntlets of War)"],
  ["base", "625", "11"] => ["이곤(Eagonn)의 흉갑", "이곤의 흉갑(Eagonn's Cuirass)"],
  ["base", "668", "11"] => ["벨렌(Belen)의 흉갑", "벨렌의 흉갑(Belen's Cuirass)"],
  ["base", "722", "11"] => ["벨렌(Belen)의 투구", "벨렌의 투구(Belen's Helm)"],
  ["base", "729", "11"] => ["아릴리아(Aryllia)의 손붕대", "아릴리아의 손붕대(Aryllia's Handwraps)"],
  ["base", "735", "11"] => ["오리에이터(Orieator)의 방패", "오리에이터의 방패(Orieator's Shield)"],
  ["base", "776", "11"] => ["엘드릭(Eldric)의 지팡이", "엘드릭의 지팡이(Eldric's Staff)"],
  ["base", "857", "11"] => ["리리아(Lyria)의 손붕대", "리리아의 손붕대(Lyria's Handwraps)"],
  ["base", "1161", "11"] => ["라토퍼(Ratofer)의 장화", "라토퍼의 장화(Ratofer's Boots)"],
  ["base", "1216", "11"] => ["퓨라(Pura)의 투구", "퓨라의 투구(Pura's Helm)"],
  ["base", "1378", "11"] => ["드루엔(Drewn)의 반지", "드루엔의 반지(Drewn's Ring)"],
  ["default", "10441", ""] => ["성 이드릭(St. Eadric)의 수의에 대해 말해 줘.", "성 이드릭의 수의(St. Eadric's Pall)에 대해 말해 줘."],
  ["default", "50642", ""] => ["성 이드릭(St. Eadric)의 수의", "성 이드릭의 수의(St. Eadric's Pall)"],
  ["default", "7996", ""] => ["잠깐... 이거 라토퍼(Ratofer)의 단검 아니야?", "잠깐... 이거 라토퍼의 단검(Ratofer's Daggers) 아니야?"],
  ["default", "24998", ""] => ["라토퍼(Ratofer)의 단검 강화", "라토퍼의 단검 강화(Ratofer's Daggers Improved)"],
  ["default", "41440", ""] => ["라토퍼(Ratofer)의 단검", "라토퍼의 단검(Ratofer's Daggers)"],
  ["default", "59796", ""] => ["엘드릭(Eldric)의 지팡이 회수", "엘드릭의 지팡이(Eldric's Staff) 회수"],
  ["default", "24768", ""] => ["이건 드루엔(Drewn)의 반지야.", "이건 드루엔의 반지(Drewn's Ring)야."]
}.freeze

context = <<~TEXT.strip
  Review 21 new named equipment/item titles across base/default, including
  exact title references in dialogue and objectives. Existing fully paired
  Belne and Medgar Krast decisions are already registered and are not reopened
  or recounted. Default:10441
  and 50642 identify St. Eadric's Pall; default:7996 and 41440 identify
  Ratofer's Daggers; default:24998 is the source-local improved variant;
  default:59796 and 24768 refer to Eldric's Staff and Drewn's Ring. English
  establishes the item identity, with Japanese and Chinese as corroboration.
  Official Korean manual PDF pages 2 and 6-8 provide deity/equipment context,
  not these item spellings. Preserve the source's Elixer spelling and do not
  infer rarity, additional item properties, or a fuller owner name.
TEXT

ReviewedDiscoverySpecs.run(
  21_347, "Named Equipment And Unique Item Labels", specs, context,
  "## D-21346: Individual Journal, Letter And Collection Labels"
) do |_spec, key, text, source|
  from, to = changes.fetch(key)
  raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
  [text.sub(from, to), false]
end
