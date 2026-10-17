#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["named work:tils-collection-iii", "Til's Collection III", "틸의 수집품 III(Til's Collection III)", 1, "Japanese ティルのコレクションIII and Chinese 蒂尔的募捐III corroborate the source title and person."],
  ["named work:tyrs-journal-iv", "Tyr's Journal IV", "티르의 일지 IV(Tyr's Journal IV)", 1, "Japanese ティアの日誌IV and Chinese 泰尔的日记IV corroborate the named journal."],
  ["named work:tils-collection-ii", "Til's Collection II", "틸의 수집품 II(Til's Collection II)", 1, "Japanese ティルのコレクションII and Chinese 蒂尔的募捐II corroborate the source title and person."],
  ["named work:fontleroys-journal-page-5", "Fontleroy's Journal, pg. 5", "폰틀로이의 일지 5쪽(Fontleroy's Journal, pg. 5)", 1, "Japanese フォンテルロイの日誌、5ページ and Chinese 方特勒罗伊的日记第5页 corroborate the exact page label."],
  ["named work:tils-collection-vii", "Til's Collection VII", "틸의 수집품 VII(Til's Collection VII)", 1, "Japanese ティルのコレクションVII and Chinese 蒂尔的募捐VII corroborate the source title and person."],
  ["named work:denrics-journal-i", "Denric's Journal, I", "덴릭의 일지 I(Denric's Journal, I)", 2, "Japanese デンリックの日誌I and Chinese 德里克的日记I corroborate the named journal; the same title occurs at two distinct base keys."],
  ["named work:tyrs-journal-iii", "Tyr's Journal III", "티르의 일지 III(Tyr's Journal III)", 1, "Japanese ティアの日誌III and Chinese 泰尔的日记III corroborate the named journal."],
  ["named work:fontleroys-journal-page-1", "Fontleroy's Journal pg. 1", "폰틀로이의 일지 1쪽(Fontleroy's Journal pg. 1)", 1, "Japanese フォンテルロイの日誌、1ページ and Chinese 方特勒罗伊的日记第1页 corroborate the exact page label."],
  ["named work:tyrs-journal-i", "Tyr's Journal I", "티르의 일지 I(Tyr's Journal I)", 1, "Japanese ティアの日誌I and Chinese 泰尔的日记I corroborate the named journal."],
  ["named work:tyrs-journal-ii", "Tyr's Journal II", "티르의 일지 II(Tyr's Journal II)", 1, "Japanese ティアの日誌II and Chinese 泰尔的日记II corroborate the named journal."],
  ["named work:tils-collection-iv", "Til's Collection IV", "틸의 수집품 IV(Til's Collection IV)", 1, "Japanese ティルのコレクションIV and Chinese 蒂尔的募捐IV corroborate the source title and person."],
  ["named work:denrics-journal-iii", "Denric's Journal, III", "덴릭의 일지 III(Denric's Journal, III)", 2, "Japanese デンリックの日誌III and Chinese 德里克的日记III corroborate the named journal; the same title occurs at two distinct base keys."],
  ["named work:tils-collection-i", "Til's Collection I", "틸의 수집품 I(Til's Collection I)", 1, "Japanese ティルのコレクションI and Chinese 蒂尔的募捐I corroborate the source title and person."],
  ["named work:fontleroys-journal-page-6", "Fontleroy's Journal, pg. 6", "폰틀로이의 일지 6쪽(Fontleroy's Journal, pg. 6)", 1, "Japanese フォンテルロイの日誌、6ページ and Chinese 方特勒罗伊的日记第6页 corroborate the exact page label."],
  ["named work:tils-collection-v", "Til's Collection V", "틸의 수집품 V(Til's Collection V)", 1, "Japanese ティルのコレクションV and Chinese 蒂尔的募捐V corroborate the source title and person."],
  ["named work:fontleroys-journal-page-2", "Fontleroy's Journal, pg. 2", "폰틀로이의 일지 2쪽(Fontleroy's Journal, pg. 2)", 1, "Japanese フォンテルロイの日誌、2ページ and Chinese 方特勒罗伊的日记第2页 corroborate the exact page label."],
  ["named work:tils-collection-vi", "Til's Collection VI", "틸의 수집품 VI(Til's Collection VI)", 1, "Japanese ティルのコレクションVI and Chinese 蒂尔的募捐VI corroborate the source title and person."],
  ["named work:tils-collection-x", "Til's Collection X", "틸의 수집품 X(Til's Collection X)", 1, "Japanese ティルのコレクションX and Chinese 蒂尔的募捐X corroborate the source title and person."],
  ["named work:denrics-journal-ii", "Denric's Journal, II", "덴릭의 일지 II(Denric's Journal, II)", 2, "Japanese デンリックの日誌II and Chinese 德里克的日记II corroborate the named journal; the same title occurs at two distinct base keys."],
  ["named work:fontleroys-journal-page-4", "Fontleroy's Journal, pg. 4", "폰틀로이의 일지 4쪽(Fontleroy's Journal, pg. 4)", 1, "Japanese フォンテルロイの日誌、4ページ and Chinese 方特勒罗伊的日记第4页 corroborate the exact page label."],
  ["named work:fontleroys-journal-page-7", "Fontleroy's Journal, pg. 7", "폰틀로이의 일지 7쪽(Fontleroy's Journal, pg. 7)", 1, "Japanese フォンテルロイの日誌、7ページ and Chinese 方特勒罗伊的日记第7页 corroborate the exact page label."],
  ["named work:tils-collection-ix", "Til's Collection IX", "틸의 수집품 IX(Til's Collection IX)", 1, "Japanese ティルのコレクションIX and Chinese 蒂尔的募捐IX corroborate the source title and person."],
  ["named work:fontleroys-journal-page-3", "Fontleroy's Journal pg. 3", "폰틀로이의 일지 3쪽(Fontleroy's Journal pg. 3)", 1, "Japanese フォンテルロイの日誌、3ページ and Chinese 方特勒罗伊的日记第3页 corroborate the exact page label."],
  ["named work:tils-collection-viii", "Til's Collection VIII", "틸의 수집품 VIII(Til's Collection VIII)", 1, "Japanese ティルのコレクションVIII and Chinese 蒂尔的募捐VIII support the series; English quest context identifies a collection of books, so the isolated Korean 모금품 is corrected to match the other volumes."]
]

specs = data.map do |key, english, korean, count, notes|
  {
    key: key, english: english, category: "named work",
    korean: korean, count: count,
    notes: "English identifies this as a source-local journal, book-collection, or page label. #{notes} This registers the complete work label only; the owner's identity remains a separate glossary entry."
  }
end

changes = {
  ["base", "87", "11"] => ["틸(Til)의 수집품 III", "틸의 수집품 III(Til's Collection III)"],
  ["base", "115", "11"] => ["티르(Tyr)의 일지 IV", "티르의 일지 IV(Tyr's Journal IV)"],
  ["base", "161", "11"] => ["틸(Til)의 수집품 II", "틸의 수집품 II(Til's Collection II)"],
  ["base", "256", "11"] => ["폰틀로이(Fontleroy)의 일지 5쪽", "폰틀로이의 일지 5쪽(Fontleroy's Journal, pg. 5)"],
  ["base", "273", "11"] => ["틸(Til)의 수집품 VII", "틸의 수집품 VII(Til's Collection VII)"],
  ["base", "516", "11"] => ["덴릭(Denric)의 일지 I", "덴릭의 일지 I(Denric's Journal, I)"],
  ["base", "4776", "11"] => ["덴릭(Denric)의 일지 I", "덴릭의 일지 I(Denric's Journal, I)"],
  ["base", "558", "11"] => ["티르(Tyr)의 일지 III", "티르의 일지 III(Tyr's Journal III)"],
  ["base", "938", "11"] => ["폰틀로이(Fontleroy)의 일지 1쪽", "폰틀로이의 일지 1쪽(Fontleroy's Journal pg. 1)"],
  ["base", "976", "11"] => ["티르(Tyr)의 일지 I", "티르의 일지 I(Tyr's Journal I)"],
  ["base", "1030", "11"] => ["티르(Tyr)의 일지 II", "티르의 일지 II(Tyr's Journal II)"],
  ["base", "1081", "11"] => ["틸(Til)의 수집품 IV", "틸의 수집품 IV(Til's Collection IV)"],
  ["base", "1158", "11"] => ["덴릭(Denric)의 일지 III", "덴릭의 일지 III(Denric's Journal, III)"],
  ["base", "2857", "11"] => ["덴릭(Denric)의 일지 III", "덴릭의 일지 III(Denric's Journal, III)"],
  ["base", "1294", "11"] => ["틸(Til)의 수집품 I", "틸의 수집품 I(Til's Collection I)"],
  ["base", "1861", "11"] => ["폰틀로이(Fontleroy)의 일지 6쪽", "폰틀로이의 일지 6쪽(Fontleroy's Journal, pg. 6)"],
  ["base", "2246", "11"] => ["틸(Til)의 수집품 V", "틸의 수집품 V(Til's Collection V)"],
  ["base", "2392", "11"] => ["폰틀로이(Fontleroy)의 일지 2쪽", "폰틀로이의 일지 2쪽(Fontleroy's Journal, pg. 2)"],
  ["base", "2708", "11"] => ["틸(Til)의 수집품 VI", "틸의 수집품 VI(Til's Collection VI)"],
  ["base", "2759", "11"] => ["틸(Til)의 수집품 X", "틸의 수집품 X(Til's Collection X)"],
  ["base", "3097", "11"] => ["덴릭(Denric)의 일지 II", "덴릭의 일지 II(Denric's Journal, II)"],
  ["base", "3116", "11"] => ["덴릭(Denric)의 일지 II", "덴릭의 일지 II(Denric's Journal, II)"],
  ["base", "3117", "11"] => ["폰틀로이(Fontleroy)의 일지 4쪽", "폰틀로이의 일지 4쪽(Fontleroy's Journal, pg. 4)"],
  ["base", "3774", "11"] => ["폰틀로이(Fontleroy)의 일지, 7쪽", "폰틀로이의 일지 7쪽(Fontleroy's Journal, pg. 7)"],
  ["base", "4156", "11"] => ["틸(Til)의 수집품 IX", "틸의 수집품 IX(Til's Collection IX)"],
  ["base", "4605", "11"] => ["폰틀로이(Fontleroy)의 일지 3쪽", "폰틀로이의 일지 3쪽(Fontleroy's Journal pg. 3)"],
  ["base", "4769", "11"] => ["틸(Til)의 모금품 VIII", "틸의 수집품 VIII(Til's Collection VIII)"],
  ["base", "2294", "11"] => ["틸 수사(Brother Til)의 수집품", "틸 수사의 수집품(Brother Til's Collection)"],
  ["default", "38760", ""] => ["틸 수사(Brother Til)의 수집품", "틸 수사의 수집품(Brother Til's Collection)"]
}.freeze

context = <<~TEXT.strip
  Review the numbered Til book-collection labels, Tyr and Denric journal
  volumes, and Fontleroy journal pages as complete named works. English
  descriptions at default:11145 and 54166 identify Brother Til's collection
  as bawdy books returned for a reward; Japanese corroborates a book
  collection. The English manual's generic book-reading reference (PDF p. 4)
  supplies no exact title spellings. Preserve the owners as separate glossary
  entries and pair each complete work label once. The lowercase phrase in
  default:15933 describes a generic collection of books, not the exact named
  title; exclude that row from the work-label scope and preserve its Korean.
TEXT

ReviewedDiscoverySpecs.run(
  21_345, "Named Journal, Letter And Collection Titles", specs, context,
  "## D-21344: Seven Complete Item And Document Labels"
) do |_spec, key, text, _source|
  if key == ["default", "15933", ""]
    [text, true]
  else
    from, to = changes.fetch(key)
    raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
    [text.sub(from, to), false]
  end
end
