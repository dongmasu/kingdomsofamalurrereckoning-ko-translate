#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["unique item:thyrdons-helm-of-war", "Thyrdon's Helm of War", "사이르돈의 전쟁 투구(Thyrdon's Helm of War)", "unique item", 1, "The Korean manual identifies the war deity as 사이르돈; Japanese シアドンのウォーヘルム and Chinese 提利顿的战争头盔 corroborate the complete title."],
  ["unique item:donnel-cuttys-ring", "Donnel Cutty's Ring", "도넬 커티의 반지(Donnel Cutty's Ring)", "unique item", 1, "Japanese ドンネル・カッティーの指輪 and Chinese 唐纳·库迪的戒指 corroborate the full named ring."],
  ["unique item:gunnar-frodes-key", "Gunnar Frode's Key", "거너 프로드의 열쇠(Gunnar Frode's Key)", "unique item", 1, "Japanese ガナー・フロードの鍵 and Chinese 冈纳·弗劳德的钥匙 corroborate the full named key."],
  ["unique item:brother-delfs-key", "Brother Delf's key", "델프 수사의 열쇠(Brother Delf's key)", "unique item", 1, "Japanese ブラザー・デルフの鍵 and Chinese 德尔夫修士的钥匙 corroborate the named key; preserve the source's lowercase key."],
  ["unique item:aryllias-cowl", "Aryllia's Cowl", "아릴리아의 두건(Aryllia's Cowl)", "unique item", 1, "The Korean manual identifies Aryllia as 아릴리아; Japanese アリリアのカウル and Chinese 阿丽莉娅的斗篷 corroborate the item."],
  ["unique item:vraekors-handwraps", "Vraekor's Handwraps", "브래코르의 손붕대(Vraekor's Handwraps)", "unique item", 1, "The Korean manual identifies Vraekor as 브래코르; Japanese ブレカーのハンドラップ and Chinese 弗烈克的护手 corroborate the item."],
  ["unique item:lunalas-armor", "Lunala's Armor", "루날라의 갑옷(Lunala's Armor)", "unique item", 1, "Japanese ルナーラの鎧 and Chinese 卢娜拉的护甲 corroborate the named armor."],
  ["unique item:eagonns-crested-helm", "Eagonn's Crested Helm", "이곤의 문장 투구(Eagonn's Crested Helm)", "unique item", 1, "Japanese イーゴンの紋章ヘルム and Chinese 伊贡图纹头盔 corroborate the named armor."],
  ["unique item:ratofers-ring", "Ratofer's Ring", "라토퍼의 반지(Ratofer's Ring)", "unique item", 5, "Japanese ラトファーの指輪 and Chinese 拉托弗的戒指 corroborate the exact ring. Default:6209, 41374, 41533, and 56892 respectively refer to cleaning, labeling, selling, and the item itself."],
  ["title:delfs-chest", "Delf's Chest", "델프의 궤짝(Delf's Chest)", "title", 1, "Japanese デルフの宝箱 and Chinese 德尔夫的宝箱 corroborate the complete named container label; no further item or location identity is inferred."]
]

specs = data.map do |key, english, korean, category, count, notes|
  {
    key: key, english: english, category: category,
    korean: korean, count: count,
    notes: "English-led review of a source-local named equipment/object label. #{notes} Keep the owner or person entry separate and do not infer additional biography, rarity, or item properties."
  }
end

changes = {
  ["base", "1687", "11"] => ["사이르돈(Thyrdon)의 전쟁 투구", "사이르돈의 전쟁 투구(Thyrdon's Helm of War)"],
  ["base", "1755", "11"] => ["도넬 커티(Donnel Cutty)의 반지", "도넬 커티의 반지(Donnel Cutty's Ring)"],
  ["base", "1902", "11"] => ["거너 프로드(Gunnar Frode)의 열쇠", "거너 프로드의 열쇠(Gunnar Frode's Key)"],
  ["base", "1954", "11"] => ["델프 수사(Brother Delf)의 열쇠", "델프 수사의 열쇠(Brother Delf's key)"],
  ["base", "2175", "11"] => ["아릴리아(Aryllia)의 두건", "아릴리아의 두건(Aryllia's Cowl)"],
  ["base", "2177", "11"] => ["브래코르(Vraekor)의 손붕대", "브래코르의 손붕대(Vraekor's Handwraps)"],
  ["base", "2539", "11"] => ["루날라(Lunala)의 갑옷", "루날라의 갑옷(Lunala's Armor)"],
  ["base", "2651", "11"] => ["이곤(Eagonn)의 문장 투구", "이곤의 문장 투구(Eagonn's Crested Helm)"],
  ["base", "2732", "11"] => ["라토퍼(Ratofer)의 반지", "라토퍼의 반지(Ratofer's Ring)"],
  ["base", "2762", "11"] => ["델프(Delf)의 궤짝", "델프의 궤짝(Delf's Chest)"],
  ["default", "6209", ""] => ["라토퍼(Ratofer)의 반지 세척 완료", "라토퍼의 반지(Ratofer's Ring) 세척 완료"],
  ["default", "41374", ""] => ["라토퍼(Ratofer)의 반지", "라토퍼의 반지(Ratofer's Ring)"],
  ["default", "41533", ""] => ["라토퍼(Ratofer)의 반지 판매", "라토퍼의 반지(Ratofer's Ring) 판매"],
  ["default", "56892", ""] => ["라토퍼(Ratofer)의 반지", "라토퍼의 반지(Ratofer's Ring)"]
}.freeze

context = <<~TEXT.strip
  Review ten newly registered source-local equipment/object labels across
  base/default, including the four row-scoped Ratofer's Ring references.
  English identifies the objects; aligned Japanese and Chinese corroborate
  their names and types. The Korean manual's deity and generic equipment
  sections (PDF pages 2 and 6-8) support background terminology but do not
  name these items. Treat Delf's Chest only as a named container label; do
  not infer a place, inventory class, rarity, or additional property.
TEXT

ReviewedDiscoverySpecs.run(
  21_348, "Additional Named Equipment And Object Labels", specs, context,
  "## D-21347: Named Equipment And Unique Item Labels"
) do |_spec, key, text, _source|
  from, to = changes.fetch(key)
  raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
  [text.sub(from, to), false]
end
