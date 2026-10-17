#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "work:frostbreak-ominbus", english: "Frostbreak Ominbus",
   category: "named work", korean: "프로스트브레이크 선집(Frostbreak Ominbus)", count: 2,
   notes: "English default:10593/44077 explicitly consult the Frostbreak Ominbus as a written reference, Japanese フロストブレイク海選集 and Chinese 霜断精选集 corroborate a book. Normalize 옴니버스/선집 to 선집, retaining existing book brackets. Ominbus is the actual English spelling; do not silently correct it to Omnibus or merge the book with Frostbreak Sea."},
  {key: "work:primer-of-fire", english: "The Primer of Fire",
   category: "named work", korean: "불의 입문서(The Primer of Fire)", count: 2,
   notes: "English base:2036/default:17535 are exact standalone book-title labels; Japanese 火の初等読本 corroborates an introductory reader. Chinese 火焰入门读物 at base corroborates; 火的本源 at default drifts, so English governs. Retain The in the complete title."},
  {key: "work:gallows-end-beastiary", english: "Gallows End Beastiary",
   category: "named work", korean: "갤로우스 엔드 생물 도감(Gallows End Beastiary)", count: 2,
   notes: "English base:3423/default:36794 name the same book, Japanese ガローズ・エンドの生物たち and Chinese 绞架角图鉴 corroborate a bestiary. Retain actual source Beastiary rather than correcting it to Bestiary. Replace the nested Gallows End place annotation atomically with the complete bilingual book title; the underlying place remains independently indexed."},
  {key: "item:haldebiers-blade", english: "Haldebier's Blade",
   category: "unique item", korean: "할데비어의 칼날(Haldebier's Blade)", count: 10,
   notes: "English default:10022 explicitly calls the repaired broken sword Haldebier's Blade, and default:8725/42709 describe the famous Fae Wars sword. Japanese ハルデビアーの刃/ブレード and Chinese 哈德比尔之剑 corroborate. Normalize 할드비어/할데비어 and 검/검날/칼날 to the established 할데비어의 칼날, preserving lower-case blade at default:38103. Do not add bare Haldebier or the descriptive Haldebier's sword at default:6978 as unproven global aliases."},
  {key: "item:enders-fire", english: "Ender's Fire",
   category: "unique item", korean: "엔더의 불꽃(Ender's Fire)", count: 11,
   notes: "English default:6936 explicitly identifies Ender's Fire as one of three named Fae staffs recovered and reforged; Japanese エンダーズファイア and Chinese 安德之火 corroborate. Normalize 엔더스 파이어/엔더의 불/엔더의 불꽃 to the repeated base stem 엔더의 불꽃, correcting only directly affected Korean particles. Preserve the complete component label at base:908 instead of nesting the staff label inside it."},
  {key: "item:enders-fire-dowel", english: "Ender's Fire dowel",
   category: "unique item", korean: "엔더의 불꽃 막대(Ender's Fire dowel)", count: 1,
   notes: "English base:908 explicitly labels the staff's dowel component; Japanese エンダーズ・ファイヤーのダウエル and Chinese 安德之火榫 corroborate. Retain the existing 막대 wording with the complete component title, keeping it distinct from the finished staff and counting the overlapping CSV row only once."}
]
context = "English-led independent discovery of named books and weapons across affix/base/default with exact aligned Japanese/Chinese evidence. Official Korean manual PDF pages 6-8 distinguish named equipment, staves, crafting, salvaged components and quests, not these individual titles. Twenty-seven distinct rows cover twenty-eight entity matches; preserve unrelated names, all tokens, dialogue register and exact line breaks. Existing reviewed holds and historical global totals are unchanged; full discovery remains incomplete."
ReviewedDiscoverySpecs.run(21_249, "Three Books Haldebiers Blade And Enders Fire", specs, context,
  "## D-21248: Seven Named Inns And Sea Foam Short Forms") do |spec, key, text, source|
  case spec[:key]
  when "work:frostbreak-ominbus"
    raise "Frostbreak book span missing" unless text.match?(/프로스트브레이크 (?:옴니버스|선집)/)
    text.gsub!(/프로스트브레이크 (?:옴니버스|선집)(?:\(Frostbreak Ominbus\))?/, spec[:korean])
  when "work:primer-of-fire", "work:gallows-end-beastiary"
    old = {
      "work:primer-of-fire" => ["불의 입문서 (The Primer of Fire)", "불의 입문서"],
      "work:gallows-end-beastiary" => ["갤로우스 엔드(Gallows End) 생물 도감"]
    }.fetch(spec[:key])
    raise "unexpected standalone book" unless old.include?(text)
    text = spec[:korean]
  when "item:haldebiers-blade"
    english = JSON.parse(source["en_texts_json"]).compact.join("\n")
    label = english.include?("Haldebier's blade") ? "Haldebier's blade" : "Haldebier's Blade"
    raise "Haldebier item span missing" unless text.match?(/할(?:데|드)비어(?:\(Haldebier\))?의 (?:칼날|검날|검)/)
    text.gsub!(/할(?:데|드)비어(?:\(Haldebier\))?의 (?:칼날|검날|검)(?:\(Haldebier's [Bb]lade\))?/, "할데비어의 칼날(#{label})")
  when "item:enders-fire"
    if key == ["base", "908", "11"]
      raise "unexpected dowel" unless text == "엔더의 불꽃 막대"
    else
      pattern = /(?:엔더의 불꽃|엔더의 불|엔더스 파이어)(?:\(Ender's Fire\))?/
      raise "Ender staff span missing" unless text.match?(pattern)
      text.gsub!(/#{pattern}(를|가|라는)?/) do
        particle = {"를" => "을", "가" => "이", "라는" => "이라는"}.fetch(Regexp.last_match(1), "")
        spec[:korean] + particle
      end
    end
  when "item:enders-fire-dowel"
    raise "unexpected component" unless text == "엔더의 불꽃 막대"
    text = spec[:korean]
  end
  [text, false]
end
