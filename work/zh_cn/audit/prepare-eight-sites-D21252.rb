#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

specs = [
  {key: "place:snowmelt-caverns", english: "Snowmelt Caverns", category: "place",
   korean: "눈녹음 동굴(Snowmelt Caverns)", count: 1,
   notes: "English base:851 names Snowmelt Caverns, Chinese 融雪洞穴 corroborates caves; Japanese 雪解の道 conveys a snowmelt passage. Retain existing 눈녹음 동굴 and pair the full English map label, without inferring another passage identity."},
  {key: "place:lucky-mine", english: "Lucky Mine", category: "place",
   korean: "럭키 광산(Lucky Mine)", count: 11,
   notes: "English bounty rows for Grinning Vane and whiskey retrieval for Derfel explicitly name Lucky Mine in Acatha. Japanese ラッキー鉱山 and Chinese 幸运矿洞/矿井 corroborate. Normalize 럭키/러키/행운의 광산 to the repeated base and quest spelling 럭키 광산, preserving all unrelated people and regional spellings."},
  {key: "place:cynric-mine", english: "Cynric Mine", category: "place",
   korean: "신릭 광산(Cynric Mine)", count: 2,
   notes: "English base:1748 names Cynric Mine; default:22757 explicitly locates the Cynric family's mine south of Whitestone and uses source-local Cynric mine. Japanese シンリック採石場 and Chinese 辛瑞克矿井 corroborate. Pair the complete place name, leaving the separate family mention and registered Lirin Cynric identity untouched."},
  {key: "place:daeras-mine", english: "Daeras Mine", category: "place",
   korean: "대에라스 광산(Daeras Mine)", count: 1,
   notes: "English default:5856 names Daeras Mine, Japanese ダエラス鉱山 and Chinese 戴拉斯矿井 corroborate. Retain existing 대에라스 광산 and add the complete source label."},
  {key: "place:glowlode-cavern", english: "Glowlode Cavern", category: "place",
   korean: "글로우로드 동굴(Glowlode Cavern)", count: 5,
   notes: "English default:40896/47265/57671/58553 explicitly describe escorting Esha and Ashmoor survivors through Glowlode Cavern; default:9955 gives the standalone label. Japanese グローロード洞窟 and Chinese 光脉洞穴 corroborate. Retain 글로우로드 동굴 and annotate each explicit existing Korean occurrence, without inserting a second omitted name or merging the separate source-labelled Glowlode Mine."},
  {key: "place:glowlode-mine", english: "Glowlode Mine", category: "place",
   korean: "글로우로드 광산(Glowlode Mine)", count: 1,
   notes: "English default:36762 explicitly labels Glowlode Mine; Japanese グローロード鉱山 and Chinese 光脉矿井 corroborate the mine. Keep the source's mine wording distinct from Glowlode Cavern rather than assuming physical identity solely from the shared stem."},
  {key: "place:echoing-light-mine", english: "Echoing Light Mine", category: "place",
   korean: "메아리빛 광산(Echoing Light Mine)", count: 1,
   notes: "English default:24683 names Echoing Light Mine; Japanese エコーライト鉱山 and Chinese 回音之光矿井 corroborate. Retain existing 메아리빛 광산 and add the full English label."},
  {key: "place:howling-shrine", english: "Howling Shrine", category: "place",
   korean: "울부짖는 성소(Howling Shrine)", count: 2,
   notes: "English base:3053/default:32564 repeat Howling Shrine, Japanese 唸る聖堂 and Chinese 嚎叫神龛/神殿 corroborate. Retain existing 울부짖는 성소 and pair the name; do not alias generic shrines."}
]
context = "English-led comparison across affix/base/default with aligned Japanese and Chinese reviews 24 distinct rows and eight source-labelled sites. Official Korean manual PDF pages 3/4/9 distinguish world/map locations and shrines; it is not a complete place directory. Preserve source-local case, unrelated people, places, wording, particles, tokens and paragraph breaks. Glowlode cave/mine are separate source-form entries without an asserted physical merge. Existing 28 indexed holds and separate Hreid relationship are unchanged; no historical global tally."
ReviewedDiscoverySpecs.run(21_252, "Eight Named Caves Mines And Shrine", specs, context,
  "## D-21251: Four Explicit Full NPC Names") do |spec, key, text, source|
  case spec[:key]
  when "place:lucky-mine"
    pattern = /(?:럭키|러키|행운의) 광산(?:\(Lucky Mine\))?/
    raise "Lucky Mine span missing" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  when "place:cynric-mine"
    english = JSON.parse(source["en_texts_json"]).compact.join("\n")
    label = english.include?("Cynric mine") ? "신릭 광산(Cynric mine)" : spec[:korean]
    pattern = /신릭(?:\(Cynric\))? 광산(?:\(Cynric [Mm]ine\))?/
    raise "Cynric Mine span missing" unless text.match?(pattern)
    text.gsub!(pattern, label)
  else
    stems = {
      "place:snowmelt-caverns" => "눈녹음 동굴",
      "place:daeras-mine" => "대에라스 광산",
      "place:glowlode-cavern" => "글로우로드 동굴",
      "place:glowlode-mine" => "글로우로드 광산",
      "place:echoing-light-mine" => "메아리빛 광산",
      "place:howling-shrine" => "울부짖는 성소"
    }
    stem = stems.fetch(spec[:key])
    pattern = /#{Regexp.escape(stem)}(?:\(#{Regexp.escape(spec[:english])}\))?/
    raise "site span missing #{key.inspect}" unless text.match?(pattern)
    text.gsub!(pattern, spec[:korean])
  end
  [text, false]
end
