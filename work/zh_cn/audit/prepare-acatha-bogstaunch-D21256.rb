#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:acatha", english: "Acatha", category: "place",
   korean: "아카사(Acatha)", count: 23,
   notes: "English default:11370 identifies Acatha as a land within Kandrian's borders, default:42226 its wetlands and the Lucky Mine quests its region. Japanese アカサ and Chinese 阿卡撒 corroborate. Normalize 아카타/아카사 to the existing base reading 아카사. Retain whole source compounds Acatha Stone and The Hammer of Acatha atomically, without deciding whether the poetic hammer is an object or epithet. Acathan derivatives are outside this exact-boundary review; no global inferred alias."},
  {key: "item:bogstaunch", english: "Bogstaunch", category: "unique item",
   korean: "보그스턴치(Bogstaunch)", count: 13,
   notes: "English default:55961/57195 explicitly names the valuable field medicine Bogstaunch; base:4335 and the recovery dialogue/objectives corroborate. Japanese ボグストーンチ and Chinese 博格止血剂 identify medicine, though some Chinese prose drifts to wine. Normalize 보그스턴치/보그스탠치/보그스토언치/보고스턴치 and the mistranslated bottle label 늪지 방지제 to the existing base stem 보그스턴치. Preserve source-lowercase bogstaunch at default:57286, every repeated mention, and container/medicine nouns outside the atomic name."}
]
context = "Independent discovery plus exact English-led Japanese/Chinese comparison across affix/base/default reviews 36 distinct rows, with region/medicine identities kept separate. Manual PDF pages 3/4/8/9 supply map, items, alchemy and world context, not these particular names. Preserve unrelated already reviewed Lucky Mine, Maedrigal Fenn, quest terms, tokens, line breaks and particles. Existing 28 indexed holds and separate unresolved Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_256, "Acatha Region And Bogstaunch Medicine", specs, context,
  "## D-21255: Broken Tower Saltwell Mines And Lab Notes") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  case spec[:key]
  when "place:acatha"
    if english == "Acatha Stone"
      raise "Acatha Stone label differs" unless text == "아카사(Acatha) 석"
      text = "아카사 석(Acatha Stone)"
    elsif english.include?("The Hammer of Acatha")
      pattern = /아카(?:타|사)(?:\(Acatha\))?의 망치/
      raise "poetic hammer span missing" unless text.match?(pattern)
      text.gsub!(pattern, "아카사의 망치(The Hammer of Acatha)")
    else
      pattern = /아카(?:타|사)(?:\(Acatha\))?/
      raise "Acatha region span missing" unless text.match?(pattern)
      text.gsub!(pattern, spec[:korean])
    end
  when "item:bogstaunch"
    if key == ["default", "31100", ""]
      raise "bottle label differs" unless text == "늪지 방지제 병"
      text = "보그스턴치(Bogstaunch) 병"
    else
      pattern = /(?:보그스턴치|보그스탠치|보그스토언치|보고스턴치)(?:\(Bogstaunch\))?/
      raise "medicine span missing" unless text.match?(pattern)
      label = english.include?("bogstaunch") ? "보그스턴치(bogstaunch)" : spec[:korean]
      text.gsub!(pattern, label)
    end
  end
  [text, false]
end
