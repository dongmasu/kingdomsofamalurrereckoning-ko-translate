#!/usr/bin/env ruby

require_relative "run-reviewed-discovery-specs"

data = [
  ["named work:octiennes-journal", "Octienne's Journal", "옥티엔의 일지(Octienne's Journal)", 3, "Japanese オクティエンヌの日誌 and Chinese 奥克蒂安的日记 corroborate the named journal and owner."],
  ["named work:ratofers-journal", "Ratofer's Journal", "라토퍼의 일지(Ratofer's Journal)", 1, "Japanese ラトファーの日誌 and Chinese 拉托弗的日记 corroborate the named journal."],
  ["named work:cordans-letter", "Courdan's Letter", "코던의 편지(Courdan's Letter)", 6, "Japanese コーダンの手紙 and Chinese 科丹的信 corroborate the named letter and owner; lowercase prose mentions are excluded from the complete-title scope."],
  ["named work:kandirs-journal", "Kandir's Journal", "칸디르의 일지(Kandir's Journal)", 2, "Japanese カンディアの日誌 and Chinese 坎迪尔的日记 corroborate the named journal."],
  ["named work:luca-sorens-journal", "Luca Soren's Journal", "루카 소렌의 일지(Luca Soren's Journal)", 1, "Japanese ルカ・ソレンの日誌 and Chinese 卢卡·索伦的日记 corroborate the full personal name and journal."],
  ["named work:aethan-engars-letter", "Aethan Engar's Letter", "에이선 엥가르의 편지(Aethan Engar's Letter)", 1, "Japanese イーサン・エンガーの手紙 and Chinese 艾森·恩加尔的信 corroborate the full personal name and letter."],
  ["named work:helycs-journal", "Helyc's Journal", "헬릭의 일지(Helyc's Journal)", 1, "Japanese ヘリクの日誌 and Chinese 赫利克的日记 corroborate the named journal."],
  ["named work:aewalds-notes", "Aewald's Notes", "애월드의 기록(Aewald's Notes)", 2, "Japanese イーワルドのメモ and Chinese 埃瓦尔德的笔记 corroborate the named notes and owner."],
  ["named work:fynwicks-journal", "Fynwick's Journal", "핀윅의 일지(Fynwick's Journal)", 1, "Japanese フィンウィックの日誌 and Chinese 费恩威克的日记 corroborate the named journal."],
  ["named work:rikkas-journal", "Rikka's Journal", "리카의 일지(Rikka's Journal)", 1, "Japanese リッカの日誌 and Chinese 丽卡的日记 corroborate the named journal."],
  ["named work:lerkaras-journal", "Lerkara's Journal", "레르카라의 일지(Lerkara's Journal)", 2, "Japanese ラーカラの日誌 and Chinese 勒卡拉的日记 corroborate the named journal; the capitalized objective at default:61783 directly names the journal."],
  ["named work:brother-tils-collection", "Brother Til's Collection", "틸 수사의 수집품(Brother Til's Collection)", 3, "Japanese ブラザー・ティルのコレクション and Chinese 提尔修士的收藏 corroborate the complete collection label; English descriptions identify the collection as bawdy books."]
]

specs = data.map do |key, english, korean, count, notes|
  {
    key: key, english: english, category: "named work",
    korean: korean, count: count,
    notes: "English-led review of a source-local document or collection label. #{notes} This registers the complete work label only; the owner's identity remains separate."
  }
end

changes = {
  ["base", "1191", "11"] => ["옥티엔(Octienne)의 일지", "옥티엔의 일지(Octienne's Journal)"],
  ["base", "1801", "11"] => ["라토퍼(Ratofer)의 일지", "라토퍼의 일지(Ratofer's Journal)"],
  ["base", "2077", "11"] => ["코던(Courdan)의 편지", "코던의 편지(Courdan's Letter)"],
  ["base", "3047", "11"] => ["칸디르(Kandir)의 일지", "칸디르의 일지(Kandir's Journal)"],
  ["base", "3301", "11"] => ["루카 소렌(Luca Soren)의 일지", "루카 소렌의 일지(Luca Soren's Journal)"],
  ["base", "3731", "11"] => ["에이선 엥가르(Aethan Engar)의 편지", "에이선 엥가르의 편지(Aethan Engar's Letter)"],
  ["base", "4144", "11"] => ["헬릭(Helyc)의 일지", "헬릭의 일지(Helyc's Journal)"],
  ["base", "4222", "11"] => ["애월드(Aewald)의 기록", "애월드의 기록(Aewald's Notes)"],
  ["base", "4267", "11"] => ["핀윅(Fynwick)의 일지", "핀윅의 일지(Fynwick's Journal)"],
  ["base", "4544", "11"] => ["리카(Rikka)의 일지", "리카의 일지(Rikka's Journal)"],
  ["base", "4714", "11"] => ["레르카라(Lerkara)의 일지", "레르카라의 일지(Lerkara's Journal)"],
  ["base", "2294", "11"] => ["틸 수사(Brother Til)의 수집품", "틸 수사의 수집품(Brother Til's Collection)"],
  ["default", "14336", ""] => ["코던(Courdan)의 편지", "코던의 편지(Courdan's Letter)"],
  ["default", "63948", ""] => ["코던(Courdan)의 편지 회수", "코던의 편지(Courdan's Letter) 회수"],
  ["default", "63725", ""] => ["칸디르(Kandir)의 일지", "칸디르의 일지(Kandir's Journal)"],
  ["default", "4005", ""] => ["애월드(Aewald)의 기록", "애월드의 기록(Aewald's Notes)"],
  ["default", "61783", ""] => ["레르카라(Lerkara)의 일지 읽기", "레르카라의 일지(Lerkara's Journal) 읽기"],
  ["default", "38760", ""] => ["틸 수사(Brother Til)의 수집품", "틸 수사의 수집품(Brother Til's Collection)"]
}.freeze

context = <<~TEXT.strip
  Review individual journal, notes, and letter labels across base/default.
  English, Japanese, and Chinese agree on the identified owners and documents.
  At default:5004 and 42432, Octienne's journal is a lowercase generic prose
  or objective reference; at default:11582, 18375, and 31756, Courdan's
  letter is likewise a lowercase generic mention. These rows retain the
  existing bilingual personal names and are excluded from the complete-work
  label scope. Base:3413 Brun's notes is also lowercase and remains a
  person-annotated descriptive label, not a confirmed named work. At
  default:15933, Brother Til's collection is lowercase prose about his books;
  preserve the Korean and exclude it from the complete-title scope. Capitalized
  labels/objectives, including Lerkara's Journal at default:61783, are paired
  as complete work names. The official Korean manual PDF p. 4 mentions books
  only as generic skill-training material and supplies no exact work names.
TEXT

ReviewedDiscoverySpecs.run(
  21_346, "Individual Journal, Letter And Collection Labels", specs, context,
  "## D-21345: Named Journal, Letter And Collection Titles"
) do |_spec, key, text, _source|
  excluded = case key
             when ["default", "5004", ""], ["default", "42432", ""],
                  ["default", "11582", ""], ["default", "18375", ""],
                  ["default", "31756", ""], ["default", "15933", ""],
                  ["base", "3413", "11"]
               true
             else
               false
             end
  if excluded
    [text, true]
  else
    from, to = changes.fetch(key)
    raise "reviewed source span differs #{key.inspect}" unless text.scan(from).length == 1
    [text.sub(from, to), false]
  end
end
