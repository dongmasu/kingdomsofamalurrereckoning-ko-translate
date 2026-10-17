#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["myren-toll", "Myren Toll", "마이런 톨(Myren Toll)", 2,
   /(?:마이런|마이렌) 톨(?:\(Myren Toll\))?/,
   "Japanese マイレン・トール and Chinese 迈仁·托尔 corroborate; standardize to the established default:691 form 마이런 톨."],
  ["riagan-bhain", "Riagan Bhain", "리아건 베인(Riagan Bhain)", 3,
   /(?:리아건 베인|리아간 바인)(?:\(Riagan Bhain\))?/,
   "English names the alchemist, supported by Japanese リアガン・バーイン and Chinese 瑞根·贝恩. Reuse default:5180 리아건 베인; annotate the explicit full name in default:43056 without changing other creature/place names."],
  ["rupert-jienne", "Rupert Jienne", "루퍼트 지엔느(Rupert Jienne)", 2,
   /루퍼트 (?:지엔느|지엔)(?:\(Rupert Jienne\))?/,
   "Japanese ルパート・ジエンヌ and Chinese 鲁珀特·杰恩 corroborate the person; reuse the full standalone default:54394 지엔느 in the base storage-owner label too. The storage location itself is not a personal alias."],
  ["siani-dirwyd", "Siani Dirwyd", "시아니 디르위드(Siani Dirwyd)", 2,
   /시아니 (?:더위드|디르위드)(?:\(Siani Dirwyd\))?/,
   "Japanese シアニ・ダーウィド and Chinese 希亚尼·迪尔维德 corroborate; retain the fuller existing default:56494 surname 디르위드."],
  ["skarsgard-bellum", "Skarsgard Bellum", "스카스가르드 벨룸(Skarsgard Bellum)", 4,
   /(?:스카스가르드|스카스가드) 벨룸(?:\(Skarsgard Bellum\))?/,
   "English explicitly identifies the weapon crafter. Japanese スカースガード・ベラム and Chinese 斯卡斯加德·贝鲁姆 corroborate. Use the complete standalone name at default:20705, 스카스가르드 벨룸, in all four rows, including the two crafter descriptions without an annotation."],
  ["thorvald-ulfsson", "Thorvald Ulfsson", "토르발드 울프손(Thorvald Ulfsson)", 2,
   /(?:토르발드|토르발) 울프손(?:\(Thorvald Ulfsson\))?/,
   "Japanese ソーヴァルド・ウルフソン and Chinese 索瓦尔德·奥弗森 corroborate; reuse default:51868 토르발드 울프손 rather than dropping the final 드."],
  ["wine-raething", "Wine Raething", "와인 래싱(Wine Raething)", 2,
   /와인 (?:레이싱|래싱)(?:\(Wine Raething\))?/,
   "English here is a full personal name, not the beverage wine. Japanese ワイン・ラエシング and Chinese 韦恩·利星 corroborate. Reuse default:15751 와인 래싱; no bare Wine alias."],
  ["ysold-holstig", "Ysold Holstig", "이졸드 홀스티그(Ysold Holstig)", 2,
   /(?:이졸드|이솔드) 홀스티그(?:\(Ysold Holstig\))?/,
   "English names the grave's occupant; Japanese イゾルド・ホルスティグ and Chinese 伊索尔德·霍斯迪格/霍尔斯提格 corroborate. Reuse base:895 이졸드 홀스티그; keep the grave-of relation and distinguish other Holstig people."]
]
specs = data.map do |key, english, korean, count, pattern, notes|
  {key: "person:#{key}", english: english, category: "person", korean: korean,
   count: count, pattern: pattern, notes: notes}
end
context = "English-led eight-person full-name review across affix/base/default. Shared surnames, storage labels and graves are not aliases for other people or sites. Official Korean manual PDF pages 1/8 provide setting, dialogue and crafting context, not these individual spellings. No bare first-name/surname alias is inferred; Nuala Ignus is handled separately against the existing Nuala Ignas entry."
ReviewedDiscoverySpecs.run(21_222, "Eight Explicit Full Names", specs, context,
  "## D-21221: Seven Explicit Full Names") do |spec, _key, text, _source|
  [text.gsub(spec.fetch(:pattern), spec.fetch(:korean)), false]
end
