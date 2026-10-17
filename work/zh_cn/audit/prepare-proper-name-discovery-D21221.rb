#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["angsar-solsvard", "Angsar Solsvard", "앙사르 솔스바르드(Angsar Solsvard)", 3,
   /(?:앙사르|앙스가르) 솔스바르드(?:\(Angsar Solsvard\))?/,
   "Japanese アングサー・ソルスヴァード and Chinese 安格萨·索尔斯瓦德 corroborate the named Gravehal builder. Retain default:2858's 앙사르 spelling; do not silently alias the distinct English spelling Ansgar Solsvard or infer that the different heir narrative names the same person."],
  ["augusta-adele", "Augusta Adele", "어거스타 아델(Augusta Adele)", 2,
   /(?:아우구스타|어거스타) (?:아델|애덜)(?:\(Augusta Adele\))?/,
   "Japanese オーガスタ・アデル and Chinese 奥古斯塔·阿戴尔 corroborate the full name. Reuse the in-corpus short Augusta spelling 어거스타 and surname 아델; do not create bare-name aliases."],
  ["gefroy-stoine", "Gefroy Stoine", "게프로이 스토인(Gefroy Stoine)", 3,
   /(?:게프로이|제프로이|제프루아) 스토인(?:\(Gefroy Stoine\))?/,
   "Japanese ゲフロイ・ストイン and Chinese 戈弗里·斯多英 corroborate the memorial-list full name. Reuse default:15889 게프로이 스토인. Abel Gefroy is another person; no bare Gefroy or Stoine alias is inferred."],
  ["gwastl-brad", "Gwastl Brad", "그와스틀 브래드(Gwastl Brad)", 4,
   /(?:그와스틀|그와스트|과스틀) 브래드(?:\(Gwastl Brad\))?/,
   "Japanese グワストル・ブラッド and Chinese 格瓦斯特尔·布拉德 corroborate the Tirin's Rest contact. Reuse default:13627 그와스틀 브래드. Brad and Cergren business references are not personal aliases."],
  ["halder-rodric", "Halder Rodric", "할더 로드릭(Halder Rodric)", 2,
   /(?:핼더|할더) 로드릭(?:\(Halder Rodric\))?/,
   "Japanese ハルダー・ロドリック and Chinese 哈尔德·罗德里克 corroborate. Reuse default:52841 할더, also present in the short-name label, without automatically registering short Halder as a person alias."],
  ["jennery-vauner", "Jennery Vauner", "제너리 바우너(Jennery Vauner)", 3,
   /제너리 (?:바우너|보너)(?:\(Jennery Vauner\))?/,
   "Japanese ジェネリー・ボーナ and Chinese 詹内瑞·沃纳尔 corroborate; default:14523 explicitly calls Syllareta his wife. Reuse default:8303 and the separately registered Syllareta Vauner family's surname 바우너, without merging people."],
  ["johan-vernt", "Johan Vernt", "요한 버른트(Johan Vernt)", 2,
   /요한 (?:베른트|번트|버른트)(?:\(Johan Vernt\))?/,
   "Japanese ジョハン・ヴァーント and Chinese 约翰·冯特 corroborate. Follow the already registered Vernt family spelling 버른트, without merging Johan and Garaner or assigning the unlinked bare Vernt fallback label."]
]
specs = data.map do |key, english, korean, count, pattern, notes|
  {key: "person:#{key}", english: english, category: "person", korean: korean,
   count: count, pattern: pattern, notes: notes}
end
context = "English-led full-name review across affix/base/default. Only explicit full-name spans are normalized; shared surnames do not establish identity. Official Korean manual PDF pages 1 and 8 give setting and dialogue context, not these NPC spellings. Hreid Amelthoe versus Hreid Amlethoe is deliberately outside this batch pending identity review; no uncertain spelling is silently merged."
ReviewedDiscoverySpecs.run(21_221, "Seven Explicit Full Names", specs, context,
  "## D-21220: Shrines, Altar, Lock And Thicket") do |spec, _key, text, _source|
  [text.gsub(spec.fetch(:pattern), spec.fetch(:korean)), false]
end
