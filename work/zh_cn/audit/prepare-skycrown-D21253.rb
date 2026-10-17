#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:skycrown-peak", english: "Skycrown Peak",
   aliases: "Skycrown|Creathnach Thintri", category: "place",
   korean: "스카이크라운 봉우리(Skycrown Peak)", count: 22,
   notes: "English default:9506 explicitly says Creathnach Thintri is what the Fae call Skycrown mountain; default:31887/58499 repeat the equivalence. Japanese スカイクラウン山/クリースナック・シントリ and Chinese 天冠山/克里亚斯纳克·辛特利 corroborate. Twenty mountain references preserve local Peak, mountain, short Skycrown or Creathnach Thintri rather than expanding every short reference to Peak. The two Cave/Cavern labels are excluded from mountain identity and separately registered; a shared stem is not proof that a cave is the mountain. Correct the direct geographic alias wording at default:31887 rather than suggesting one mountain is part of the other."},
  {key: "place:skycrown-cave", english: "Skycrown Cave", category: "place",
   korean: "스카이크라운 동굴(Skycrown Cave)", count: 1,
   notes: "English base:3752 explicitly names Skycrown Cave; Japanese スカイクラウン洞窟 and Chinese 天冠洞穴 corroborate. Preserve source-local Cave and the existing Korean stem. This source-form entry does not assert that Cave equals Cavern or the mountain."},
  {key: "place:skycrown-cavern", english: "Skycrown Cavern", category: "place",
   korean: "스카이크라운 동굴(Skycrown Cavern)", count: 1,
   notes: "English default:48232 explicitly names Skycrown Cavern; Japanese/Chinese cave labels corroborate. Retain source-local Cavern and the existing Korean stem, without asserting physical identity with the separately labelled Cave or mountain."}
]
context = "Independent read-only mountain/alias investigation followed by exact English-led Japanese/Chinese comparison across all resources. Manual PDF pages 3/4/9 establish world, map and named-place context, not these individual sites. Twenty-two distinct rows cover twenty-four entity matches, including two mountain exclusions. Preserve source-local English scope/case, other names, tokens and paragraph breaks. The separate item Thintri's Malus is not a mountain alias. Existing 28 indexed holds and separate Hreid relationship remain unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_253, "Skycrown Mountain Alias And Separate Cave Labels", specs, context,
  "## D-21252: Eight Named Caves Mines And Shrine") do |spec, key, text, source|
  if spec[:key] == "place:skycrown-peak"
    if [["base", "3752", "11"], ["default", "48232", ""]].include?(key)
      [text, true]
    else
      english = JSON.parse(source["en_texts_json"]).compact.join("\n")
      if key == ["default", "31887", ""]
        old = "나는 스카이크라운(Skycrown) 산의 크리스나크 틴트리(Creathnach Thintri) 첨탑 꼭대기에 있을 걸세."
        new_text = "나는 크리스나크 틴트리(Creathnach Thintri), 흔히 스카이크라운 산(Skycrown mountain)이라 부르는 곳의 첨탑 꼭대기에 있을 걸세."
        raise "alias phrase differs" unless text.include?(old)
        text.sub!(old, new_text)
      else
        if english.include?("Skycrown Peak")
          pattern = /스카이크라운(?:\(Skycrown\))? 봉우리(?:\(Skycrown Peak\))?/
          raise "Peak span missing" unless text.match?(pattern)
          text.gsub!(pattern, spec[:korean])
        elsif english.include?("Skycrown mountain")
          pattern = /스카이크라운(?:\(Skycrown\))?(?: 산)?(?:\(Skycrown mountain\))?/
          raise "mountain span missing" unless text.match?(pattern)
          text.gsub!(pattern, "스카이크라운 산(Skycrown mountain)")
        else
          pattern = /스카이크라운(?:\(Skycrown\))?/
          raise "short mountain span missing" unless text.match?(pattern)
          text.gsub!(pattern, "스카이크라운(Skycrown)")
        end
        if english.include?("Creathnach Thintri")
          pattern = /크리스나크 틴트리(?:\(Creathnach Thintri\))?/
          raise "Fae alias span missing" unless text.match?(pattern)
          text.gsub!(pattern, "크리스나크 틴트리(Creathnach Thintri)")
        end
      end
      [text, false]
    end
  else
    raise "unexpected standalone cave" unless text == "스카이크라운 동굴"
    [spec[:korean], false]
  end
end
