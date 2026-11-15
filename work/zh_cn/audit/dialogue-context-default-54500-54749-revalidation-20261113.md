# Sequential `default` Revalidation: IDs `54500`-`54749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 63 existing ledger fingerprints; all match and their rows
  remain unchanged. Appended the other 187 IDs in ascending order.
- Identified 16 new correction candidates. Thirteen are on IDs newly added to
  the ledger; three concern existing ledger IDs (`54570`, `54616`, and
  `54621`), whose append-only records remain unchanged. Rechecked and
  retained seven earlier candidates and the evidence-limited hold at `54647`.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `54512` | Name / format | `his Marauders` is a named, capitalized group in this arena introduction, but Korean leaves the English group label unpaired. Consider `그의 약탈자들(Marauders)`. | Medium-high |
| `54526` | Meaning / naturalness | `thick Varani skull` is followed by the claim that he knows the operation in detail. `둔한 ... 머리통` suggests that he is slow-witted and clashes with that praise. Recast the line to convey that the Varani has the operation memorized, from battle maps to mess kits. | Medium-high |
| `54531` | Naturalness / speech level / address | The plain, friendly Japanese line contrasts with the literary vocative `낯선 이여` and stiff `도와주지`. Use a natural conversational greeting and consistent casual endings, without inferring a speaker identity. | Medium |
| `54541` | Naturalness | `선대의 이들은` is stiff for the poem's `The ones who came before`. Consider `먼저 온 이들은 그것에 맞서 싸워 무찔렀다`, preserving the stanza and line breaks. | Medium |
| `54543` | Name / format | `니스카루(Niskaru) 군주(Niskaru Lord)` repeats the same source name in two adjacent pairings. Use `니스카루 군주(Niskaru Lord)`. | High |
| `54570` | Meaning / naturalness | In context, `Explain yourself quickly` asks the addressee to reveal who they are; Japanese and Chinese confirm that sense. `해명해` instead asks them to justify or explain themselves. Consider `빨리 정체를 밝혀. 내 위치를 들키는 건 절대 바라지 않아.` | High |
| `54607` | Naturalness | `길이 교차할지도 모르겠군` is a literal rendering of “our paths may cross again.” Japanese expresses the idiomatic meaning directly. Consider `언젠가 다시 만날지도 모르겠군, 부름받은 자(Beckoned)여.` | Medium-high |
| `54616` | Name / format | The quest-log entry names the `Omnibus Arcana`, but Korean omits its established English pairing even though the same title is paired elsewhere. Consider `아르카나 총람(Omnibus Arcana)`. | High |
| `54621` | Speech level / naturalness | `영웅이로다` is markedly archaic beside the plain English and Japanese assertion. Consider a natural plain ending such as `진정 멜 센시르(Mel Senshir)의 영웅이야.` | Medium |
| `54635` | Naturalness / terminology | `다가올 복구의 일부` is an awkward collocation for being part of a hoped-for restoration. Consider `다가올 회복에 동참하려고 당신 곁에 남아 있겠습니다.` | Medium |
| `54645` | Objective style | `Find the Crying Eyes` is a quest objective, but Korean uses the imperative `찾아라`, unlike the established compact action-form objective style. Consider `흐느끼는 눈(Crying Eyes) 찾기`. | High |
| `54656` | Meaning / naturalness | `수수께끼` makes `What a puzzle` sound like a riddle, while Japanese supports the broader sense of difficulty. Consider `으, 정말 어렵네. 나중에 보자.` | Medium |
| `54659` | Meaning / naturalness | The English refers to the multiple holds Ciara has on Caledus's mind. Korean's `정신에 걸어 둔 구속` is awkward and singular. Consider `시아라(Ciara)가 정신에 걸어 둔 속박들을 찾아 풀어 달라고 했다.` | Medium |
| `54693` | Naturalness / address | This repeats `Hello, stranger.` (`19393`, `48063`, `53657`, `54328`, `60828`); all six currently use the literary `안녕, 낯선 이여.` Japanese is identical across the group and uses an ordinary greeting. Consider `안녕, 낯선 사람.` consistently when the repeated lines are edited. | Medium-high |
| `54739` | Meaning / naturalness | `We will be there` has a plural subject, but `함께 그쪽으로 갈게` can mean the speaker will go with the addressee. Consider `지원군을 데리러 가야 해. 우리가 그쪽으로 갈게.` | Medium-high |
| `54748` | Terminology consistency | The same Valor Arena context uses `용맹의 투기장` at `54572`, while this line calls it `아레나`. Use the established `투기장` term here. | High |

## Rechecked Existing Findings and Hold

The existing correction proposals at `54527`, `54539`, `54557`, `54573`,
`54589`, `54630`, and `54727` remain supported by the current four-language
rows and their linked review reports. Their existing ledger records are
preserved unchanged. The encoded line at `54647` remains on hold: English
decodes from Atbash, but the intended language-experiment behavior is not
established.

## Source Notes and Structure

- Sixty-three exact-English duplicate groups across the corpus touch this
  range, covering 786 target rows. The only Korean wording difference is
  `54719` / `61482` (`Die, mortal!`); their Japanese forms differ
  (`死になさい！` / `死ね！`), supporting the distinct Korean register.
  No forced harmonization is proposed.
- Eight rows contain embedded line breaks: `54518` (1), `54541` (4),
  `54560` (8), `54562` (9), `54568` (1), `54601` (5), `54620` (6), and
  `54628` (16). The totals are 50/50/49/50 across English/Japanese/Chinese/
  Korean. The one-break Chinese source difference at `54628` is retained;
  Korean matches English and Japanese.
- Runtime/display markers occur at `54568` and `54662`. Marker identity and
  order match across the four languages; localized wrapper text is retained.
- Of 250 IDs, 192 have indexed asset associations, represented by 195 links
  across 127 assets; 58 have no indexed asset. Of the 187 newly recorded
  IDs, 129 are linked through 131 links across 74 assets, and 58 are
  unlinked. Asset associations do not establish per-key speakers or playback
  order.

## Range Result

- After adding 187 IDs, the ledger covers 57,488 of 65,135 unique `default`
  IDs (88.26%), leaving 7,647. Sequential coverage reaches `54749`; the next
  range is `54750`-`54999`.
- The 16 newly identified correction candidates include three IDs whose
  pre-existing ledger rows were preserved; their new findings are recorded
  here rather than by duplicating or rewriting those rows.
- Existing ledger rows remain append-only. Findings require separate
  approval before any translation CSV edit; no translation CSV was changed.
