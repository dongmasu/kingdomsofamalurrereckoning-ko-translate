#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "faction:ashmoor", english: "Ashmoor", aliases: "Ashmoor Clan",
   category: "faction", korean: "애시무어(Ashmoor)", count: 24,
   notes: "English default:13094 explicitly identifies the clan of Ashmoor and default:27333 repeats it; default:8506/36028/47424 say Ashmoor Clan. Japanese アシュムーア族 and Chinese 阿什穆尔部族/氏族 corroborate a clan with homeland uses, not solely a separate place. Normalize 애시무어/애쉬무어/애슐무어 to the existing standalone and equipment-description stem 애시무어. Preserve source-local clan, house, homeland and survivor wording instead of imposing one rank on every use. Full Ashmoor Clan compounds remain atomic. At default:57671, English and both supporting locales distinguish the Ashmoor survivors from Esha herself: correct the Korean coordination that incorrectly calls them survivors of Ashmoor and Esha."}
]
context = "Independent source discovery and exact English-led Japanese/Chinese comparison across affix/base/default reviews 24 default rows. Official Korean manual PDF pages 1/3/7/9 supply Fae/world/faction context, not this clan's individual name. Do not infer a separate geographic entity from homeland metonymy or merge Eventide into Ashmoor. Preserve unrelated names, labels, tokens, register and paragraph breaks. Existing 28 indexed holds and separate Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_257, "Ashmoor Clan And Source-Local Homeland References", specs, context,
  "## D-21256: Acatha Region And Bogstaunch Medicine") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  if english.include?("Ashmoor Clan")
    pattern = /애(?:시|쉬|슐)무어(?:\(Ashmoor\))? 부족/
    raise "full clan span missing" unless text.match?(pattern)
    text.gsub!(pattern, "애시무어 부족(Ashmoor Clan)")
  else
    pattern = /애(?:시|쉬|슐)무어(?:\(Ashmoor\))?/
    raise "Ashmoor span missing" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  end
  if key == ["default", "57671", ""]
    old = "애시무어(Ashmoor)와 에샤(Esha)의 생존자들을 전부 탈출시키지 못했어."
    new_text = "애시무어(Ashmoor) 생존자들과 에샤(Esha)를 전부 탈출시키지 못했어."
    raise "survivor coordination differs" unless text.include?(old)
    text.sub!(old, new_text)
  end
  [text, false]
end
