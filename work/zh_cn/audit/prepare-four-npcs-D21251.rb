#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "person:maedrigal-fenn", english: "Maedrigal Fenn", category: "person",
   korean: "메이드리걸 펜(Maedrigal Fenn)", count: 6,
   notes: "English default:55961/57195 explicitly identify Maedrigal Fenn as the Alfar Army contact paying for recovered Bogstaunch; standalone names and return objectives agree. Japanese マエドリガル・フェン and Chinese 麦德里加尔·芬恩 corroborate. Normalize 매드리갈/메드리걸/메이드리걸 to the established standalone and complete quest-name stem 메이드리걸 펜, without adding an unproven bare Fenn alias."},
  {key: "person:wynn-ashman", english: "Wynn Ashman", category: "person",
   korean: "윈 애시먼(Wynn Ashman)", count: 6,
   notes: "English default:56661 names the Crownhold library's curator Wynn Ashman, default:41229 describes her former rare-collection work and default:60707 an assistant's posting under her. Japanese ウィン・アッシュマン and Chinese 韦恩·阿什曼 corroborate. Normalize 윈 애쉬먼/윈 애시먼 to the majority standalone/quest spelling 윈 애시먼 and pair all explicit full names; do not insert a full name for bare pronouns."},
  {key: "person:thora-woolstring", english: "Thora Woolstring", category: "person",
   korean: "토라 울스트링(Thora Woolstring)", count: 4,
   notes: "English default:13972 describes selling Hroth Magnus' breastplate to the named Thora Woolstring, corroborating the three standalone NPC-name rows. Japanese ゾーラ・ウールストリング and Chinese label 托拉·乌尔斯特灵 corroborate; the Chinese narrative surname drifts to 乌尔斯君. Retain existing 토라 울스트링; no bare Thora alias or identity inference from other Thoras."},
  {key: "person:thorir-arding", english: "Thorir Arding", category: "person",
   korean: "토리르 아딩(Thorir Arding)", count: 3,
   notes: "English default:53501 explicitly names The Calamity's bosun Thorir Arding and his wife Asa, supporting both standalone labels. Japanese トーレ・アーディング and Chinese 索里尔·亚丁 corroborate the person; English anchors the existing 토리르 아딩. Preserve the ship, wife's name and surrounding quest content."}
]
context = "Independent discovery followed by exact English-led aligned Japanese/Chinese review across affix/base/default. Nineteen distinct default rows contain these four full NPC names; none was previously registered as a canonical or alias. Official Korean manual PDF pages 1/3/8 describes characters, world and dialogue but not this NPC directory. Normalize only explicit full-name spans, preserving all other terms, titles, particles, tokens and paragraph breaks. Existing 28 indexed holds and separate unresolved Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_251, "Four Explicit Full NPC Names", specs, context,
  "## D-21250: Saltwell Caverns Three Lamps And Dark Glow") do |spec, key, text, source|
  pattern = case spec[:key]
            when "person:maedrigal-fenn"
              /(?:매드리갈|메드리걸|메이드리걸) 펜(?:\(Maedrigal Fenn\))?/
            when "person:wynn-ashman"
              /윈 애(?:시|쉬)먼(?:\(Wynn Ashman\))?/
            when "person:thora-woolstring"
              /토라 울스트링(?:\(Thora Woolstring\))?/
            when "person:thorir-arding"
              /토리르 아딩(?:\(Thorir Arding\))?/
            end
  raise "reviewed full-name span missing #{key.inspect}" unless text.match?(pattern)
  text.gsub!(pattern, spec[:korean])
  [text, false]
end
