#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

# These scopes and transformations were reviewed against the aligned sources.
module ScoutContinuationD21469
  extend self
  M = ReviewedNameBatches
  G = ReviewedProperNameDiscovery::GLOSSARY
  SHARED = 'English is the meaning and identity anchor; aligned Japanese and Chinese are recorded per exact row. No global short-name alias, inferred family relationship, source edit or historical translation recount. Preserve unrelated names, wording, tokens, punctuation and line breaks.'
  CONFIG = {
    21_469 => {
      term: 'Galenun', entity: 'person:galenun-hegem',
      canonical: ['Galenun Hegem', '갈레눈 헤젬(Galenun Hegem)', 'person'],
      ids: %w[1639 3372 8769 10399 11019 27951 31355 32760 35127 35221 35305 41188 47883 50033 50330 51181 52739 54260 59335 61171],
      uncertain: %w[51181],
      japanese: /ガレナン|Galenun/, chinese: /盖勒伦|Galenun/,
      note: 'The English memoir chapters and signed final chapter identify Galenun Hegem as the Adessa mason/architect and connect the Galenun treasure objective to him. Reuse 갈레눈 헤젬 from six existing full-name pairs; replace only the isolated 헤겜 variants and missing annotation. The standalone Galenun label at 51181 has literal English in Japanese and Chinese and no identifying context: retain its paired spelling but hold the link to this person as uncertain.'
    },
    21_470 => {
      term: 'Donnel', entity: 'person:donnel-cutty',
      ids: %w[2879 9747 11784 18199 30859 32151 35794 43370 44822 60894],
      uncertain: %w[2879 9747], excluded: %w[32151 35794 60894],
      japanese: /ドンネル|Donnel/, chinese: /唐纳|Donnel/,
      note: 'English 11804 identifies Donnel Cutty as Anker Edmure\'s assistant; 47682/30152 establish his Shardfall disappearance and death. The short assistant, memorial and handwrap references match this same story. Harriset Donnel is the separate Sun Camp tinker: exclude his three rows from Donnel Cutty. Two standalone Donnel labels lack enough context to disambiguate a given name from the other person\'s surname, so retain their existing bilingual text and hold these links. Do not add a global Donnel alias.'
    },
    21_471 => {
      term: 'Harriset Donnel', entity: 'person:harriset-donnel',
      canonical: ['Harriset Donnel', '해리셋 도넬(Harriset Donnel)', 'person'],
      ids: %w[32151 35794 60894],
      japanese: /ハリセット・ドンネル/, chinese: /哈里塞特·唐纳/,
      note: 'English 60894 identifies Harriset Donnel as the Sun Camp tinker buying iron components; the exact full-name label and death journal refer to this named person. Japanese ハリセット・ドンネル and Chinese 哈里塞特·唐纳 corroborate. Preserve the existing 해리셋 도넬 spelling; do not merge him with Anker Edmure\'s assistant Donnel Cutty.'
    },
    21_472 => {
      term: 'Carasta', entity: 'person:carasta-arawyn',
      canonical: ['Carasta Arawyn', '카라스타 아라윈(Carasta Arawyn)', 'person'],
      base_ids: %w[1915 3852],
      ids: %w[8096 8607 14470 19076 20032 25618 25625 27324 28871 31084 33399 41999 42836 52349 56671 58434 58806 60475 62007 64274],
      uncertain: %w[56671 62007],
      japanese: /キャラスタ|Carasta/, chinese: /卡拉斯塔|Carasta/,
      note: 'English 19076 explicitly connects Carasta Arawyn to the Gwalchmai trade deal and later short Carasta in the same journal; the two contract item labels and other trade dialogue share this context. Japanese キャラスタ and Chinese 卡拉斯塔 corroborate. Preserve complete full-name pairs, including the extra Korean full-name mention expanding English She at 8096; annotate only unpaired source-written short forms. The two isolated first-name labels have no identifying context and retain their existing bilingual spelling with the person link held uncertain.'
    },
    21_473 => {
      term: 'Arrivus', entity: 'item:arrivus-engine',
      canonical: ['Arrivus Engine', '아리부스 엔진(Arrivus Engine)', 'item'],
      base_ids: %w[301 3923],
      ids: %w[1233 11024 14878 26406 27412 33902 41650 42782 43098 44763 54937 55985 59521 60360 63248],
      uncertain: %w[14878],
      japanese: /アリヴス・エンジン|Arrivus/, chinese: /分解机|Arrivus/,
      note: 'English explicitly calls the Arrivus Engine a device whose mechanisms can separate materials and free the pick from the box; Japanese アリヴス・エンジン and Chinese 分解机 corroborate the equipment context. Normalize 아리버스 to 아리부스 and pair the complete device name, not its Arrivus component. The Broken Arrivus Engine item label retains its complete local broken-state title. The isolated Arrivus label at 14878 does not establish a device or person identity, so retain it unchanged and hold that link. No person, inventor, source-form alias or item rarity is inferred.'
    },
    21_474 => {
      term: 'Itran Sconn', entity: 'person:itran-sconn',
      canonical: ['Itran Sconn', '이트란 스콘(Itran Sconn)', 'person'],
      ids: %w[7378 22618 24045 44539],
      japanese: /アイトラン・スコン/, chinese: /伊特兰·斯科恩/,
      note: 'English identifies Itran Sconn as the symposium speaker, Savant, and sagecrafting/alchemy contact. The four exact full-name references have matching Japanese アイトラン・スコン and Chinese 伊特兰·斯科恩. Preserve the established 이트란 스콘 and locally written Savant title. Do not merge him with the former Red Legion member Itran the Shade or add a bare Itran alias.'
    },
    21_475 => {
      term: 'Itran', entity: 'person:itran-the-shade',
      canonical: ['Itran the Shade', '그림자 이트란(Itran the Shade)', 'person'],
      base_ids: %w[728],
      ids: %w[380 881 3913 7378 11062 11780 12684 22618 24045 37970 40592 42217 44539 46884 53077 55583 60501],
      uncertain: %w[728 12684 46884], excluded: %w[7378 22618 24045 44539],
      japanese: /アイトラン|Itran/, chinese: /伊特兰|Itran/,
      note: 'English 11780 explicitly says the Haxhi robber Itran calls himself the Shade; 3913/40592 connect him to Brother Delf, Ugnar and Red Legion daggers. The three Itran the Shade labels therefore share that identity. Normalize source-scoped 이 트란 to 이트란 and 셰이드 이트란 to the established 그림자 이트란. Exclude all four Itran Sconn rows as a separate scholar. The standalone Itran label, Letter to Itran item and Dearest Itran heading cannot distinguish these people from their own text: retain them unchanged and hold the identity link. No global Itran or Shade alias.'
    },
    21_476 => {
      term: 'Cadoc', entity: 'person:cadoc-reen',
      ids: %w[9577 27200],
      japanese: /キャドック/, chinese: /卡多克/,
      note: 'English 61266 explicitly links the same possessing force to Nuala Ignus, Cadoc Reen and Savant Engar; 9577 and 27200 list the corresponding short names in that same possession storyline. Japanese キャドック and Chinese 卡多克 corroborate the short name. Pair only the written Cadoc as 캐독(Cadoc); retain the other names and all thirteen already-terminal full-name occurrences without reopening them.'
    },
    21_477 => {
      term: 'Ragnarr', entity: 'title:ragnarr',
      canonical: ['Ragnarr', '라그나르(Ragnarr)', 'title'],
      ids: %w[412 5916 9745 10427 15268 15964 16215 18902 19484 19797 28142 31497 35183 39155 43071 43784 43797 50993 51279 52598 55576 63954],
      japanese: /ラグナー/, chinese: /拉格纳/,
      note: 'English 31497 defines Ragnarr as the Jottun priest, apothecary and spiritual guide; repeated old/new successors and the two Ragnarr in 50993 prove this is a title, not one individual. Preserve 라그나르 and annotate the local title, including The Ragnarr, while retaining the existing full Ragnarr Vokvekk person pair. Normalize the collective designation Ragnarr\'s Chosen atomically as 라그나르의 선택받은 자들(Ragnarr\'s Chosen), without nesting an extra title pair inside it. The plural Ragnarrs in the historical passage remains source-local in its pair. Do not merge the different office-holders.'
    },
    21_478 => {
      term: 'Ragnarr Vokvekk', entity: 'person:ragnarr-vokvekk',
      canonical: ['Ragnarr Vokvekk', '라그나르 보크베크(Ragnarr Vokvekk)', 'person'],
      ids: %w[50993],
      japanese: /ラグナー・ヴォクヴェック/, chinese: /拉格纳尔·沃克维克/,
      note: 'English names the historical Ragnarr Vokvekk in the account of Castellan Hostrum Krell. Japanese ラグナー・ヴォクヴェック and Chinese 拉格纳尔·沃克维克 corroborate this named individual. Retain the already correct full bilingual pair; Ragnarr is separately registered as a title and the other office-holders are not this person by inference.'
    },
    21_479 => {
      term: "Ragnarr's Chosen", entity: 'title:ragnarrs-chosen',
      canonical: ["Ragnarr's Chosen", "라그나르의 선택받은 자들(Ragnarr's Chosen)", 'title'],
      ids: %w[35183 43071 52598 63954],
      japanese: /ラグナーの幹部/, chinese: /拉格纳.*之选/,
      note: 'English 63954 explicitly calls three Jottun Chieftains the Ragnarr\'s Chosen; 43071 identifies them as his closest supporters. Register the collective designation, not a separate species or an invented formal faction. Retain the complete bilingual designation established during the independent Ragnarr-title scope; do not edit or recount those earlier title decisions.'
    },
    21_480 => {
      term: 'Maybryn', entity: 'person:maybryn',
      canonical: ['Maybryn', '메이브린(Maybryn)', 'person'],
      base_ids: %w[716],
      ids: %w[6079 8096 8372 10162 11434 14470 16218 16776 17082 19076 19438 20850 22778 23263 30031 34492 38542 42836 44444 47988 51199 52010],
      uncertain: %w[11434],
      excluded: %w[716 6079 8096 8372 10162 14470 16218 16776 17082 19076 19438 20850 22778 23263 30031 34492 38542 42836 44444 52010],
      japanese: /メイブリン|Maybryn/, chinese: /梅布林|梅布瑞恩|Maybryn/,
      note: 'English 51199 explicitly identifies Maybryn as both mage and vintner, and 47988 describes the man brewing only nine hundred bottles four hundred years ago. Japanese and Chinese corroborate those two personal references. All bottle, drink and vintage references denote the wine instead and are excluded from the person scope. The bare Maybryn label at 11434 has no context and remains uncertain between maker and wine. Keep the wine as a separate item entry.'
    },
    21_481 => {
      term: 'Maybryn', entity: 'item:maybryn-wine',
      canonical: ['Maybryn Wine', '메이브린 와인(Maybryn Wine)', 'item'],
      base_ids: %w[716],
      ids: %w[6079 8096 8372 10162 11434 14470 16218 16776 17082 19076 19438 20850 22778 23263 30031 34492 38542 42836 44444 47988 51199 52010],
      uncertain: %w[11434], excluded: %w[47988 51199],
      japanese: /メイブリン|Maybryn/, chinese: /梅布林|梅布瑞恩|Maybryn/,
      note: 'English repeatedly identifies the named bottled drink Maybryn Wine; the same journal at 19076 uses the shortened Maybryn for additional bottles. Japanese メイブリン・ワイン and Chinese 梅布林酒 corroborate. Pair complete written Maybryn Wine as the established Korean 메이브린 와인(Maybryn Wine), and retain the short source form as 메이브린(Maybryn) without inventing Wine inside the English pair. Where Korean expanded that short form with 와인, retain its meaning outside the pair. The two references to the mage/vintner are excluded and the isolated label remains uncertain. No global Maybryn wine alias or uniqueness/rarity claim is added.'
    },
    21_482 => {
      term: 'Canneroc Gossamer', entity: 'item:canneroc-gossamer',
      canonical: ['Canneroc Gossamer', '캐너록 거미줄 비단(Canneroc Gossamer)', 'item'],
      base_ids: %w[4470], ids: %w[11056 19570 22640 33995 61174 62222 63238],
      japanese: /キャネロック/, chinese: /坎能(?:洛|诺)克/,
      note: 'English 61174 explicitly describes spider-silk being processed into the textile known as Canneroc gossamer; the item label, deliveries, robes and solvent-cloth dialogue refer to this same named textile. Japanese キャネロックの柔糸 and Chinese 坎能洛克蛛丝 corroborate. Use the established place stem 캐너록 within the complete atomic item label 캐너록 거미줄 비단(Canneroc Gossamer), correcting the isolated 카네록 spelling only in this new item scope. Do not replace ordinary silk/gossamer or the separate Gossamer End place. Earlier Canneroc, family and Widow dispositions on the long lore rows remain separate and unchanged.'
    },
    21_483 => {
      term: 'Avery', entity: 'person:avery-egest',
      canonical: ['Avery Egest', '에이버리 이게스트(Avery Egest)', 'person'],
      base_ids: %w[68],
      ids: %w[704 873 5758 8187 9025 9805 10173 14475 17784 18940 20349 22273 30794 36137 60225 62070 63363 64240 64784],
      uncertain: %w[704 8187 18940 20349 22273 62070 63363 64784],
      japanese: /エイブリー/, chinese: /艾弗里/,
      note: 'English 64240 identifies Avery Egest as the dead soldier, husband and father; 9805 links the letters to his grave. Mason\'s letters to Avery explicitly mention Rikka, Gorhart and the war, and Rikka\'s own journal and widow dialogue recall her dead Avery, supporting these five short-name references. Japanese エイブリー and Chinese 艾弗里 corroborate. The source-local comma in Letter to Avery, Egest at 14475 is corroborated by the complete Japanese/Chinese name; retain the already correct canonical pair. The pre-existing person:egest surname scope is preserved independently, not reidentified or merged. Five island-correspondence signatures and three isolated headings do not establish this soldier\'s identity; retain their text and hold those person links. Do not infer that all Avery references are the same person.'
    },
    21_484 => {
      term: 'Luca', entity: 'person:luca-soren',
      ids: %w[10212 48762 57507], revisit: %w[10212], uncertain: %w[57507],
      japanese: /ルカ/, chinese: /卢卡|露卡/,
      note: 'English 46910/25890 explicitly identify Luca Soren as the thresh-venom victim treated with Searstalk; 48762 uses short Luca in that treatment dialogue. English 10212 uses both Luca Soren and the later explicit short Luca in one row: preserve its full-name pair and supersede only the previous short-name annotation omission, retaining that key\'s previous accepted disposition/evidence in the manifest and adding no duplicate. The later Korean Luca in 25890 merely expands English who and is not an explicit English-name omission. The Rundamir journal at 57507 mentions its writer\'s daughter Luca without a surname: the relationship to Luca Soren is unproved, so retain the cell and hold that link. No global Luca alias.'
    },
    21_485 => {
      term: 'The Journal of Luca Soren', entity: 'named work:luca-sorens-journal',
      ids: %w[46892],
      japanese: /ルカ・ソレンの日誌/, chinese: /卢卡·索伦的日记/,
      note: 'English The Journal of Luca Soren is an alternate complete title for the already registered work Luca Soren\'s Journal, corroborated by the identical Japanese and Chinese journal labels. Pair the complete locally written English title as 루카 소렌의 일지(The Journal of Luca Soren), not a nested person pair. Preserve the earlier person:luca-soren exclusion for this atomic work label and the base journal\'s independent terminal decisions; add only this missing work occurrence and no global title alias.'
    },
    21_486 => {
      term: 'Kester', entity: 'person:kester-barclay',
      ids: %w[5910 17129 18739 19785 36867 39702 56453 61923],
      uncertain: %w[36867 39702],
      japanese: /ケスター|Kester/, chinese: /科斯特尔|凯斯特|Kester/,
      note: 'English 21097 identifies Kester Barclay as Didenhil\'s leader, 21105 locates him in the town square, and 59187/44205 connect his work to the village crisis. The short warden, town-square, village-support and scouting references fit this scope with aligned Japanese/Chinese corroboration. Retain the established 케스터(Kester). The local Kester Barlcay objective at 61923 has the same complete Japanese/Chinese name as the Barclay objectives: preserve its already correct Korean and literal English source spelling without adding a global typo alias. The standalone Kester label and the mining foreman Papa Kester reference lack evidence linking them to this warden; keep their text and hold those links.'
    },
    21_487 => {
      term: 'Skye', entity: 'person:skye-sinclair',
      canonical: ['Skye Sinclair', '스카이 싱클레어(Skye Sinclair)', 'person'],
      ids: %w[24964 40557],
      japanese: /スカイ・シンクレア/, chinese: /斯凯·辛克莱/,
      note: 'Both exact English Skye Sinclair labels have the identical Japanese スカイ・シンクレア and Chinese 斯凯·辛克莱 names. Reuse the already paired Korean 스카이 싱클레어(Skye Sinclair) from 24964 and add only the missing pair at 40557. This name is not Oleander Sinclair, and sharing a surname does not establish a family link. No bare Skye, Sinclair or house alias is registered.'
    },
    21_488 => {
      term: 'Rydder', entity: 'person:drystan-rydder',
      ids: %w[6497 20244 29555 37891 40046],
      japanese: /リッダー/, chinese: /莱德/,
      note: 'English 36170 identifies Drystan Rydder as Revival\'s Warsworn Amaldor/security chief, and 37891 identifies Captain Rydder as leader of the same camp protectors. The short surname and local Almador-title references concern that same leader, with Japanese リッダー and Chinese 莱德 corroboration. Reuse the established 라이더 stem, replacing only 리더 in these name spans. Preserve the local English Almador spelling and existing Korean 알마도르 rather than inventing a different rank or full given name. Keep the nine terminal full-name rows unchanged and add no global surname/rank alias.'
    },
    21_489 => {
      term: 'Vane', entity: 'person:grinning-vane-spirrick',
      ids: %w[1285 25808 34225 35962 42243 52773 65044],
      excluded: %w[1285 34225 42243], uncertain: %w[25808 35962],
      japanese: /ヴェイン|プテリクス/, chinese: /瓦内|瓦恩|龙枭/,
      note: 'English identifies Grinning Vane as the Lucky Mine outlaw whose armband is required as bounty proof, and both Take Vane\'s Armband objectives use that same short name. Reuse 베인(Vane) and pair the one missing short reference. Pteryx Vane is a feather, corroborated by Japanese プテリクスの羽 and Chinese 龙枭羽毛, not this person: exclude those three rows. The two isolated Vane\'s Luck titles do not prove the bearer\'s identity and remain uncertain in this person scope. Preserve all twelve terminal full/nickname matches and add no global Vane alias.'
    },
    21_490 => {
      term: "Vane's Luck", entity: 'title:vanes-luck',
      canonical: ["Vane's Luck", "베인의 행운(Vane's Luck)", 'title'],
      ids: %w[25808 35962],
      japanese: /ヴェインの運/, chinese: /瓦恩的运气/,
      note: 'Both exact English Vane\'s Luck labels have the identical Japanese ヴェインの運 and Chinese 瓦恩的运气. Pair this source-local named title as 베인의 행운(Vane\'s Luck) without inferring whether its resource is a quest, item or book, or whether its bearer is Grinning Vane. The independent person-identity uncertainties at these rows remain unresolved and are not reopened.'
    },
    21_491 => {
      term: 'Imelda', entity: 'person:imelda-holn',
      canonical: ['Imelda Holn', '이멜다 홀른(Imelda Holn)', 'person'],
      base_ids: %w[2572],
      ids: %w[1217 4457 5530 19789 22687 30433 32609 42389 42575 46790 48649 52253 54791 54967 55111 56180 56273 56487 61944 62077 64354],
      japanese: /イメルダ/, chinese: /伊美尔达|伊梅尔达/,
      note: 'English 4457 explicitly identifies Enconeg Holn\'s wife Imelda, while 1217/52253 identify Imelda Holn\'s grave and the ettin-stolen charm. The wife, memories, grave and charm references belong to this same story, corroborated by Japanese イメルダ and Chinese 伊美尔达. Reuse the existing full-name pair 이멜다 홀른(Imelda Holn) and its short 이멜다(Imelda) form; annotate only missing name spans, without changing Holn, Enconeg, the grave/charm wording or the narrative. No global Imelda alias or inferred relationship beyond the explicit source statement.'
    },
    21_492 => {
      term: 'Ivar', entity: 'person:ivar',
      canonical: ['Ivar', '아이바르(Ivar)', 'person'],
      ids: %w[4019 13087 26393 28613 29336 31829 36942 40084 41497 50845 50963 52495 61431],
      japanese: /アイヴァー/, chinese: /伊瓦尔/,
      note: 'English 4019 explicitly identifies Corporal Ivar of the Kandrian Guard and the Connovar bounty, connecting the rank labels, return objectives and other Ivar dialogue. Japanese アイヴァー and Chinese 伊瓦尔 corroborate. Reuse 아이바르 from the existing paired 4019/13087/52495 forms, supported by Japanese アイヴァー, and normalize 이바르/아이바 only for this person. Preserve 상병 as the existing rank translation and pair the complete source-written Corporal Ivar locally as 아이바르 상병(Corporal Ivar); bare Ivar remains 아이바르(Ivar). Korean 4019 omits the second English Ivar subject; retain that existing sentence rather than inventing a new Korean name mention.'
    },
    21_493 => {
      term: "Imelda's Charm", entity: 'item:imeldas-charm',
      canonical: ["Imelda's Charm", "이멜다의 부적(Imelda's Charm)", 'item'],
      base_ids: %w[2572], ids: %w[5530 55111],
      japanese: /イメルダのお守り/, chinese: /伊美尔达的符咒|伊美尔达的护符/,
      note: 'The English item label Imelda\'s Charm and its matching question refer to the charm stolen from Imelda Holn\'s grave, corroborated by Japanese イメルダのお守り and Chinese 伊美尔达的符咒/护符. Replace only the component person annotation with the complete atomic item pair 이멜다의 부적(Imelda\'s Charm). Preserve the separate person:imelda-holn dispositions and do not treat the item name as a global person alias or infer extra item properties.'
    }
  }.freeze

  def normalize(d, source)
    text = source.fetch('work_text')
    id = source.fetch('ID_Linha')
    config = CONFIG.fetch(d)
    return text if (config.fetch(:uncertain, []) + config.fetch(:excluded, [])).include?(id)
    case d
    when 21_469
      text.gsub(/갈레눈 헤(?:젬|겜)(?!\()/, '갈레눈 헤젬(Galenun Hegem)')
    when 21_470
      text.gsub(/도넬(?!\()/, '도넬(Donnel)')
    when 21_471
      text.gsub(/해리셋 도넬(?!\()/, '해리셋 도넬(Harriset Donnel)')
    when 21_472
      text.gsub(/카라스타(?! 아라윈|\()/, '카라스타(Carasta)')
    when 21_473
      return text.sub('부서진 아리버스(Arrivus) 엔진', '부서진 아리부스 엔진(Broken Arrivus Engine)') if id == '301'
      text.gsub(/아리(?:부|버)스(?:\(Arrivus\))? 엔진(?!\()/, '아리부스 엔진(Arrivus Engine)')
    when 21_474
      text.gsub(/이트란 스콘(?!\()/, '이트란 스콘(Itran Sconn)')
    when 21_475
      return text.sub('셰이드 이트란(Itran the Shade)', '그림자 이트란(Itran the Shade)') if id == '55583'
      return text if %w[53077 60501].include?(id)
      text.gsub('이 트란(Itran)', '이트란(Itran)').gsub(/이트란(?!\()/, '이트란(Itran)')
    when 21_476
      text.sub('캐독,', '캐독(Cadoc),')
    when 21_477
      case id
      when '35183', '43071'
        return text if text.include?("라그나르의 선택받은 자들(Ragnarr's Chosen)")
        text.sub('라그나르의 선택받은 자들', "라그나르의 선택받은 자들(Ragnarr's Chosen)")
      when '52598'
        text.sub('라그나르가 선택한 자들', '라그나르의 선택받은 자들')
      when '63954'
        text
      when '43797'
        text == '라그나르' ? '라그나르(The Ragnarr)' : text
      when '50993'
        text.sub('라그나르 두 명', '라그나르(Ragnarr) 두 명')
          .sub('두 라그나르 사이', '두 라그나르(Ragnarrs) 사이')
      else
        text.gsub(/라그나르(?!\()/, '라그나르(Ragnarr)')
      end
    when 21_478, 21_479
      text
    when 21_480
      text.gsub(/메이브린(?!\()/, '메이브린(Maybryn)')
    when 21_481
      return text if id == '6079'
      if id == '19076'
        return text.sub('이 메이브린 와인을', '이 메이브린 와인(Maybryn Wine)을')
          .sub('다른 메이브린 와인도', '다른 메이브린(Maybryn) 와인도')
      end
      return text.sub('메이브린 와인이', '메이브린(Maybryn) 와인이') if id == '30031'
      return text.gsub(/메이브린(?!\()/, '메이브린(Maybryn)') if %w[34492 44444].include?(id)
      text.gsub('메이브린(Maybryn) 와인', '메이브린 와인(Maybryn Wine)')
        .gsub(/메이브린 와인(?!\()/, '메이브린 와인(Maybryn Wine)')
    when 21_482
      spans = {
        '4470' => '캐너록(Canneroc)의 비단실',
        '11056' => '캐너록(Canneroc)의 거미줄 비단',
        '19570' => '캐너록(Canneroc)의 거미줄 비단',
        '22640' => '카네록 거미줄(Canneroc Gossamer)',
        '33995' => '캐너록(Canneroc) 고사머 천',
        '61174' => '캐너록(Canneroc)의 고운 비단',
        '62222' => '캐너록(Canneroc)의 거미줄 비단',
        '63238' => '캐너록(Canneroc) 거미줄'
      }
      paired = CONFIG.fetch(d).fetch(:canonical)[1]
      return text if text.include?(paired)
      old_span = spans.fetch(id)
      raise 'Canneroc textile source drift' unless text.scan(old_span).length == 1
      text.sub(old_span, paired)
    when 21_483
      text.gsub(/에이버리(?! 이게스트|\()/, '에이버리(Avery)')
    when 21_484
      text.gsub(/루카(?! 소렌|\()/, '루카(Luca)')
    when 21_485
      text == '루카 소렌의 일지' ? '루카 소렌의 일지(The Journal of Luca Soren)' : text
    when 21_486
      return text if id == '61923'
      text.gsub(/케스터(?!\()/, '케스터(Kester)')
    when 21_487
      text.gsub(/스카이 싱클레어(?!\()/, '스카이 싱클레어(Skye Sinclair)')
    when 21_488
      case id
      when '20244', '29555'
        text.sub('리더(Rydder)', '라이더(Rydder)')
      when '37891'
        text.include?('라이더 대장(Captain Rydder)') ? text : text.sub('라이더 대장', '라이더 대장(Captain Rydder)')
      when '40046'
        text.sub('알마도르 리더에게', '알마도르 라이더(Almador Rydder)에게')
      else
        text
      end
    when 21_489
      text.gsub(/베인(?!\()/, '베인(Vane)')
    when 21_490
      text == '베인의 행운' ? "베인의 행운(Vane's Luck)" : text
    when 21_491
      text.gsub(/이멜다 홀른(?!\()/, '이멜다 홀른(Imelda Holn)')
        .gsub(/이멜다(?! 홀른|\()/, '이멜다(Imelda)')
    when 21_492
      full = '아이바르 상병(Corporal Ivar)'
      return text if text.include?(full)
      english = source['en_texts_json'] ? JSON.parse(source['en_texts_json']).compact : [source.fetch('english', '')]
      if english.any? { |value| value.include?('Corporal Ivar') }
        text.gsub(/(?:아이바르|이바르|아이바)(?:\(Ivar\))? 상병/, full)
      else
        text.gsub(/(?:아이바르|이바르|아이바)(?:\(Ivar\))?/, '아이바르(Ivar)')
      end
    when 21_493
      text.sub('이멜다(Imelda)의 부적', "이멜다의 부적(Imelda's Charm)")
    else
      raise "unreviewed batch #{d}"
    end
  end

  def prepare(d)
    ReviewedProperNameDiscovery.ensure_unused_batch!(d)
    config = CONFIG.fetch(d)
    glossary = M.table(G)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    entity = config.fetch(:entity)
    indexed = index.select { |row| row['entity_key'] == entity }.map { |row| M.key(row) }
    pattern = /(?<![A-Za-z])#{Regexp.escape(config.fetch(:term))}(?![A-Za-z])/i
    sources = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.reject do |row|
      indexed.include?(M.key(row)) && !config.fetch(:revisit, []).include?(row['ID_Linha'])
    end
    expected_keys = config.fetch(:ids).map { |id| ['default', id, ''] } +
      config.fetch(:base_ids, []).map { |id| ['base', id, '11'] }
    raise "D-#{d} source scope differs" unless sources.map { |row| M.key(row) }.sort == expected_keys.sort
    reviews = sources.sort_by { |row| row['ID_Linha'].to_i }.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "D-#{d} aligned evidence differs #{key.inspect}" unless
        japanese.match?(config.fetch(:japanese)) && chinese.match?(config.fetch(:chinese))
      old = source.fetch('work_text')
      proposed = normalize(d, source)
      raise 'non-idempotent reviewed transformation' unless normalize(d, source.merge('work_text' => proposed)) == proposed
      raise 'opaque tokens/line endings changed' unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) == proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
      status = if config.fetch(:excluded, []).include?(key[1])
                 'excluded'
               elsif config.fetch(:uncertain, []).include?(key[1])
                 'uncertain'
               elsif old == proposed
                 'not-an-issue'
               else
                 'accepted'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{config.fetch(:note)} #{SHARED}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    definitions = []
    if config[:canonical]
      raise 'person already registered' if glossary.any? { |row| row['entity_key'] == entity }
      en, ko, category = config.fetch(:canonical)
      values = {
        'entity_key' => entity, 'english_canonical' => en, 'korean_canonical' => ko,
        'english_aliases' => '', 'category' => category, 'status' => 'confirmed',
        'korean_variants' => ko.sub(/\([^()]*\)\z/, ''),
        'evidence_ids' => "D-#{d}|#{reviews.map { |row| M.key(row).join(':') }.join('|')}",
        'notes' => "#{config.fetch(:note)} #{SHARED}"
      }
      definitions = [glossary.headers.to_h { |field| [field, values.fetch(field, '')] }]
      generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
      exact_keys = generated.map { |row| M.key(row) }
      exact_reviews = reviews.select { |row| exact_keys.include?(M.key(row)) }
      ReviewedProperNameDiscovery.validate!(definitions, exact_reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    else
      raise 'existing person missing' unless glossary.any? { |row| row['entity_key'] == entity }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    edits.group_by { |row| row['resource'] }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    puts "D-#{d}: #{reviews.length} rows, #{edits.length} edits; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    [glossary, index, definitions, reviews]
  end

  def apply(d)
    glossary, index, definitions, reviews = prepare(d)
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
    raise 'review outputs already exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, glossary.headers, definitions) if definitions.any?
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    existing_keys = index.map { |row| [row['entity_key'], *M.key(row)] }
    new_index = reviews.reject { |row| existing_keys.include?([row['entity_key'], *M.key(row)]) }.map do |row|
      {
        'entity_key' => row['entity_key'], 'resource' => row['resource'],
        'ID_Linha' => row['ID_Linha'], 'Tipo_Variante' => row['Tipo_Variante'],
        'matched_english' => CONFIG.fetch(d).fetch(:term), 'english_source' => row['english'],
        'korean_current' => row['old'], 'status' => 'needs-context',
        'evidence' => 'Exact source row reviewed before scoped registration.'
      }
    end
    M.write_table(G, glossary.headers, glossary.map(&:to_h) + definitions) if definitions.any?
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + new_index)
    states = CONFIG.fetch(d).fetch(:revisit, []).empty? ? ['needs-context'] : %w[needs-context accepted]
    M.run(review_path, d, 1, review_states: states)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      next if row['entity_key'] == CONFIG.fetch(d).fetch(:entity) &&
        CONFIG.fetch(d).fetch(:revisit, []).include?(row['ID_Linha'])
      raise 'unrelated existing disposition altered' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'prior glossary changed' unless M.table(G).map(&:to_h) == glossary.map(&:to_h) + definitions
    raise 'new occurrence count differs' unless final.length == index.length + new_index.length
  end
end

if $PROGRAM_NAME == __FILE__
  d = Integer(ARGV.fetch(0))
  case ARGV.fetch(1, 'prepare')
  when 'prepare' then ScoutContinuationD21469.prepare(d)
  when 'apply' then ScoutContinuationD21469.apply(d)
  else abort 'usage: review-scout-continuation-D21469.rb D [prepare|apply]'
  end
end
