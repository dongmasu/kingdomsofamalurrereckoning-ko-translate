#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:broken-tower", english: "Broken Tower", category: "place",
   korean: "부서진 탑(Broken Tower)", count: 7,
   notes: "English base:4371/default:53005 label Broken Tower; default:19841 explicitly describes Matrim Hawkins' warning about events beneath it, and the search objectives/ basement label agree. Japanese 崩れ落ちた塔 and Chinese 破碎塔楼 corroborate. Normalize 무너진 탑/부서진 탑 to the majority 부서진 탑. Preserve source-lowercase broken tower in the dialogue question and annotate the complete Broken Tower Basement compound without nesting."},
  {key: "place:saltwell-mines", english: "Saltwell Mines", category: "place",
   korean: "솔트웰 광산(Saltwell Mines)", count: 4,
   notes: "English default:1230 finds Hugues in Saltwell Mines, default:32344 names his old laboratory there, and default:46550/61664 explicitly says the cavern of Saltwell Mines. Japanese ソルトウェル鉱山 and Chinese 盐井矿 corroborate. Pair the complete source-local Mines label rather than only Saltwell. Keep this source-form entry separate from Saltwell Caverns; a cavern within mines is not itself proof of exact physical equivalence. No global bare Saltwell alias."},
  {key: "work:saltwell-lab-notes", english: "Saltwell Lab Notes",
   aliases: "Saltwell Site Lab Notes", category: "named work",
   korean: "솔트웰 연구소 기록(Saltwell Lab Notes)", count: 9,
   notes: "English six base labels name Saltwell Site Lab Notes for days 21, 142 and 233, while three default labels name Saltwell Lab Notes with the corresponding days. Japanese ソルトウェル研究所の記録/研究所の記録 and Chinese 盐井矿实验室笔记/盐井实验室笔记 corroborate named lab notes. Register the title-series/source-form scope, not a claim about the physical identity of Saltwell sites or contents of each book. Keep Site as 현장 where present, use 제N일 consistently, and annotate the complete exact English title including Day N."}
]
context = "English-led focused site and named-document review across affix/base/default, with aligned Japanese/Chinese. Official Korean manual PDF pages 3/4/8/9 provide world, map, dialogue and research/crafting context but not an exhaustive site/document index. Twenty distinct rows retain unrelated people, sources' Site/Mines/Basement modifiers, particles, tokens and exact line breaks. Existing 28 indexed holds and separate Hreid relationship are unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_255, "Broken Tower Saltwell Mines And Lab Notes", specs, context,
  "## D-21254: Four Exact Creature Subtype Labels") do |spec, key, text, source|
  english = JSON.parse(source["en_texts_json"]).compact.join("\n")
  case spec[:key]
  when "place:broken-tower"
    if english == "Broken Tower Basement"
      raise "basement label differs" unless text == "부서진 탑 지하"
      text = "부서진 탑 지하(Broken Tower Basement)"
    else
      label = english.include?("broken tower") ? "부서진 탑(broken tower)" : spec[:korean]
      pattern = /(?:부서진|무너진) 탑(?:\([Bb]roken [Tt]ower\))?/
      raise "Broken Tower span missing" unless text.match?(pattern)
      text.gsub!(pattern, label)
    end
  when "place:saltwell-mines"
    pattern = /솔트웰(?:\(Saltwell\))? 광산(?:\(Saltwell Mines\))?/
    raise "Saltwell Mines span missing" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  when "work:saltwell-lab-notes"
    match = /\ASaltwell (Site )?Lab Notes, Day (21|142|233)\z/.match(english)
    raise "unexpected lab-note title" unless match
    raise "Korean lab-note title differs" unless text.match?(/\A솔트웰(?:\(Saltwell\))? (?:유적 |현장 )?연구소 기록, (?:제)?(?:21|142|233)(?:일|일째)\z/)
    modifier = match[1] ? "현장 " : ""
    text = "솔트웰 #{modifier}연구소 기록, 제#{match[2]}일(#{english})"
  end
  [text, false]
end
