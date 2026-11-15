# Sequential `default` Revalidation: IDs `44250`-`44499`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 76 existing ledger fingerprints and added 174 new IDs.
- Recorded 23 current correction-candidate IDs and four evidence-limited
  holds. ID `44477` has both a name-format candidate and a separate
  meaning/terminology hold; 224 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Some candidates were previously recorded in asset-based reviews;
this pass rechecked them against all four language rows.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `44258` | Title format | The named play `The Humbled` appears as `《겸손한 자들》` without its English title. Pair the first title reference as `《겸손한 자들(The Humbled)》`; preserve the repeated title's existing layout and the source's paragraph structure. | High |
| `44263` | Name format | `Motus Mining Co. HQ` is a named company location, but Korean has only `모투스 광업 본사`. Other active rows use `모투스 광업(Motus Mining)` for the company. Consider `모투스 광업(Motus Mining) 본사`. | High |
| `44294` | Name / meaning / format | The existing SQ50 finding remains supported: `세라벨` lacks its English name, and `페이(Fae)의 골짜기 아다루스` conflicts with the established `아다루스 동굴(Adarus Hollow)` form and the Japanese/Chinese cave wording. Consider `세라벨(Serabel)과 아릭(Arick)은 오랜 세월 떠나 있던 옛 농장으로 돌아왔다. 하지만 페이(Fae)의 아다루스 동굴(Adarus Hollow)에 숨겨져 있을 페일링 완드(Paling Wand)가 없으면 농장을 재건할 수 없다.` | Medium-high |
| `44311` | Name / place format | Japanese and Chinese identify Mayotte as an island, while Korean has only `마요트`. Consider `마요트섬(Mayotte)` to retain the geographic type and English name. | Medium-high |
| `44334` | Naturalness | `생존자가 세상에서 하나 줄었다` uses an unnatural counter. Consider `오르도(Ordo)를 끔찍한 운명에서 구하지 못했다. 이제 세상에 남은 이븐타이드(Eventide) 씨족의 생존자가 한 명 줄었다.` | High |
| `44347` | Speech level / address | Japanese addresses the player informally (`きれいだよ、お前`), but Korean combines honorific `아름다우시군요` with intimate `그대`. Consider a consistently informal affectionate line such as `정말 아름다워, 내 사랑.` The exact speaker is not established. | Medium-high |
| `44354` | Name consistency / format | This row uses `리라` for Lyra, while the quest's other references use `라이라(Lyra)` in line with Japanese `ライラ`. Consider `라이라(Lyra)에 관해서...`. | High |
| `44360` | Speech level | English and Japanese use plain speech, but Korean switches to polite `받으세요` and `할인해 드리겠습니다`. The parallel reward line at `37913` is also casual. Retain the previously recorded suggestion: `그래, 네가 할 수 있는 건 다 했군. 고맙다는 뜻으로 이 금화를 받아. 필요하면 내 서비스도 할인해 줄게.` The asset does not prove the individual speaker. | High |
| `44368` | Terminology / consistency | The ingredient `Fennwrac` is rendered `펜와락`, while the same ingredient varies across the corpus and `default:12843` already uses `펜라크(Fennwrac)`. Consider `펜라크(Fennwrac)` here, following Japanese `フェンラク` and Chinese `芬恩瓦克`; this remains a terminology proposal, not an approved global change. | High |
| `44377` | Naturalness / terminology | The existing SQ08 finding remains supported: `페이에게 목숨을 건 결투를 신청받았다` is awkwardly passive, and `생명력을 노예처럼 부려` obscures the source. Consider a direct construction such as `필멸자의 생명력을 빼앗아 페이(Fae)의 위상을 되찾으려는 처형인(Headsman)이라는 페이(Fae)가 내게 목숨을 건 결투를 신청했다.` The Korean rendering of `Headsman` remains provisional. | Medium-high |
| `44398` | Name format | The earlier meaning hold is cleared (see rechecked findings), but the source title `Fontmaster` is not paired, and `Font` lacks its established English form. Compare the existing `샘의 관리자 노메론(Fontmaster Nomeron)` / `샘(The Font)` wording at `default:51753`. Consider `샘의 관리자 노메론(Fontmaster Nomeron)을 죽였다. 샘(The Font)의 물줄기를 늘리는 일도, 실제로는 물이 줄고 있다는 사실을 숨기는 일도 더는 그를 도울 수 없다.` | High |
| `44413` | Meaning | The Korean `오래전에` omits the source's `many rounds ago`; Japanese and Chinese preserve the repeated-round image. Consider `운명의 실에 묶여 이미 몇 라운드 전에 죽었어야 했는데!` | Medium-high |
| `44423` | Meaning / naturalness | The Korean `훌륭하군` describes excellence, while English `marvelous`, Japanese `奇跡的`, and Chinese `妙` express astonishment or wonder. Consider the consistent exclamation `아, 놀라워, 놀라워, 정말 놀라워!` | Medium-high |
| `44431` | Meaning / naturalness / name format | The Korean compresses “Aluck and the other survivors of Ashmoor” into `애시무어 생존자 알럭과 일행`, obscuring who made the request; `Cadsymyr` and `Aluck` also lack English pairings. Retain the earlier SQ102 proposal: `알럭(Aluck)과 애시무어(Ashmoor)의 다른 생존자들이 카드시미르(Cadsymyr)라는 거대한 투아사(Tuatha) 야영지를 파괴해 달라고 했다. 그 야영지는 고갯길 위에 있으며, 가스크(Gask)라는 투아사(Tuatha)와 그의 마녀 기사(Witch Knight) 장교 둘이 다스리고 있다. 우선 마녀 기사들을 찾아 쓰러뜨려야 한다.` | High |
| `44434` | Terminology | `Fulcrum` is rendered `지점기`, but the established `base` equipment terminology renders this weapon component as `지렛목` (for example, `base:1266` `기본형 관통 지렛목`). Consider `흠 없는 미타란(Mitharan) 관통 지렛목`. | High |
| `44443` | Name format / naturalness | `old Rhose` is rendered as `늙은 로즈`, which can sound disparaging, and the name lacks the English pairing used elsewhere (`로즈(Rhose)`). Japanese omits the age descriptor while Chinese retains it; pair the name and review the descriptor in context. The dice idiom would read more naturally as `주사위에 언제 행운이 깃들지 모르잖아!` | Medium |
| `44468` | Speech level | Korean uses polite `찾고 있나요?`, while Japanese uses a casual question (`探しているのかい？`). Consider `특별히 찾는 사람 있어?` if the line is intended as casual NPC dialogue; the asset does not map this key to an individual speaker. | Medium |
| `44469` | Name format | `Cayman Islands` is translated only as `케이맨 제도`. Pair the geographic name as `케이맨 제도(Cayman Islands)`. | High |
| `44477` | Name consistency / format | The existing SQ08 finding remains supported: `Tinehil` lacks its English pairing here, unlike the established `타인힐(Tinehil)` form. Pair the name without resolving the separate `hollow` term hold below. | High |
| `44482` | Meaning | The Korean `한 잔 더 마시고 싶어` interprets `another round` as a drink, following Japanese `新しいお酒`; however, the English sentence explicitly says the uncle lost money betting in a gambling den, and Chinese also says another round. In that context the speaker wants another game: consider `삼촌이 이 조그만 도박장에서 돈을 다 잃었지. 아그니, 어디 있어? 한 판 더 하고 싶어!` | High |
| `44491` | Terminology | `Erathi runes` is reduced to `에라시(Erathi) 문자`. Preserve the runic meaning with `에라시(Erathi) 룬 문자`. | Medium-high |
| `44495` | Speech level | Korean uses marked 하오체 (`바라오`, `말하지 않겠소`), while Japanese uses unmarked plain speech. Consider a consistent plain register, for example `우린 외부인의 간섭을 꺼려. 죽은 이들은 누운 자리에 고이 묻어 두길 바라. 더는 말하지 않겠어.` Recheck the full line if edited; the example avoids adding information about the dead. | Medium-high |
| `44497` | Name format | `St. Eadric's` is rendered only as `성 이드릭`, while the established site reference elsewhere is `성 이드릭(St. Eadric's)`. Consider adding the source form without deciding whether the abbreviated name denotes the church or its mission. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `44380` | Meaning / terminology | English says `the fonts are running dry`; Japanese and Chinese also describe the magical springs drying up. The sentence's general meaning is clear, but this plural use does not establish whether Korean should render the setting-specific `Font` as `샘`, `샘물`, or another plural form. Retain the current wording pending a terminology decision. |
| `44458` | Speech level | Japanese is conversational while Korean uses polite endings. The English is neutral and Chinese is also courteous; the asset has no per-key speaker mapping. Retain as an unresolved register question rather than a confirmed error. |
| `44462` | Speech level / address | Korean uses the marked vocative `이방인` and `-나` question endings, while Japanese is conversational. The shared asset has no NPC or per-key speaker mapping to establish speaker or scene stage; retain as unresolved. |
| `44477` | Meaning / terminology | English calls Tinehil `a hollow`, Korean says `골짜기`, and Japanese/Chinese use cave wording. The different English capitalization and context do not establish whether this is the same feature as the Headsman's `Hollow`; do not globally replace `골짜기` with `동굴` without further evidence. |

## Rechecked Findings and Structure

- All 76 existing ledger fingerprints in the range match the current four
  language rows. Existing candidates `44294`, `44334`, `44354`, `44360`,
  `44368`, `44377`, `44423`, `44431`, `44468`, and `44477` remain supported.
  The former candidate at `44457` is cleared: the current Korean matches the
  established wording `야수들이 알로렌(Aloren)을 죽였어` and the parallel
  duplicate `42559`; no change is proposed.
- The earlier meaning hold at `44398` is cleared. English, Japanese, and
  Chinese agree that killing Fontmaster Nomeron ends the player's ability to
  help him increase the Font's flow and hide its recession; the Korean
  meaning is sound. Its separate name-format issue is listed above.
  Previously unflagged `44497` is reopened as a name-format candidate because
  the same site name is paired as `성 이드릭(St. Eadric's)` elsewhere.
- The holds at `44380`, `44458`, `44462`, and `44477` remain evidence-limited.
  At `44477`, the Tinehil pairing candidate and the unresolved `hollow`
  meaning are separate dimensions.
- There are 53 exact-English duplicate groups touching the range, covering
  1,390 corpus rows. The only group with differing Korean is `Be on your
  way.` (`44307`, `47264`, `58360`). Japanese distinguishes a farewell at
  `44307` (`さようなら`) from dismissive commands at the other two IDs
  (`あっちへ行け`); Korean follows that distinction (`그럼 잘 가` versus
  `가던 길이나 가`). Retain the ID-specific translations.
- Three rows contain embedded line breaks: `44258` (13), `44331` (1), and
  `44378` (2). All four languages have matching break counts; all 16 Korean
  embedded separators are CRLF and remain unchanged. Runtime-token and
  markup structure/order also match across the four languages.
- Of 250 IDs, 205 have indexed asset associations, including 129 of the 174
  newly recorded IDs. These links do not establish individual speakers,
  addressees, branches, or playback order; unsupported values remain unknown.

## Range Result

- The range has 23 current correction-candidate IDs and four
  evidence-limited holds; `44477` is included in both counts because its
  name-format candidate is separate from its meaning hold. The other 224 IDs
  have no current finding.
- After appending 174 new IDs, the ledger covers 49,932 of 65,135 unique
  `default` IDs (76.66%), leaving 15,203. Sequential coverage reaches
  `44499`; next is `44500`-`44749`. Of reviewed IDs, 40,274 have indexed
  asset links and 9,658 do not; links are not dialogue coverage.
- Catalog reproduction, all 49,932 ledger fingerprints, nine related index
  tests, and the line-ending-aware diff check passed. No translation CSV was
  modified in this batch.
