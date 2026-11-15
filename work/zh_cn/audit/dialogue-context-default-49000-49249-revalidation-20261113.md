# Sequential `default` Revalidation: IDs `49000`-`49249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 63 previously recorded four-language fingerprints; all match.
  Added the other 187 IDs to the review ledger.
- Recorded nine current correction-candidate IDs and three evidence-limited
  holds; 238 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `49040` | Name consistency / format | `old Gastyr shrine` is rendered `옛 개스티어 성소`, while the established family/place form is `가스티르(Gastyr)` (for example, `가스티르 성(Castle Gastyr)`). Align the name, e.g. `절벽에 있는 가스티르(Gastyr)의 옛 성소`. | High |
| `49097` | Faction-member name | The capitalized singular `Sparrow` is rendered as the generic bird `참새`. The project uses `참새단(Sparrows)` for the faction and `참새단원(Sparrow)` for an individual member (e.g. ID `3534`). Consider `다른 참새단원(Sparrow)이 한 명이라도 살아 있는 한, 이 보금자리와 안식처를 지키는 일을 돕겠어.` | High |
| `49113` | Naturalness / emphasis | `죽음의 일을 시작한 건 나였어. 오직 나 혼자였지` is an awkwardly literal rendering of the emphatic contrast; Japanese likewise stresses that the speaker alone began the `死の技`. Consider combining the emphasis: `그는 내 제자였지만, 죽음의 일을 시작한 건 나, 오직 나였어.` Preserve the following sentence about there having been more deaths. | Medium |
| `49146` | Naturalness | `great thieves` is rendered `대도적`, which can suggest a single grand/big thief rather than a group reputed to be skilled thieves. Japanese describes a well-regarded thieves' organization. Consider `트래블러(Travelers)는 뛰어난 도둑들로 이름난 유목민 조직이다.` | Medium-high |
| `49170` | Named-item format | Rechecked the prior candidate: `Maisie's Luck` is a named ring and this row calls it `메이지의 행운` without its English pairing. Other occurrences include the paired title. Add `메이지의 행운(Maisie's Luck)`; retain `테` for the ring's band. | High |
| `49191` | Name / title format | The label is `Templar Octienne`, but Korean pairs only the personal name: `템플러 옥티엔(Octienne)`. The established complete form is `템플러 옥티엔(Templar Octienne)` (e.g. ID `2930`). | High |
| `49196` | Naturalness | `그런 경험은 오래가는 유대감을 만들지` is understandable but reads as a calque of “creates lasting bonds.” Japanese describes people becoming bound together through such an experience. Consider `그런 일을 함께 겪으면 오래도록 끈끈해지기 마련이야.` | Medium |
| `49205` | Name format | Rechecked the prior candidate: `Joanne` is rendered `조앤` without the English pairing. Add `조앤(Joanne)` at the first mention in the row. | High |
| `49212` | Meaning / naturalness | Rechecked the prior candidate: English `fortitude` and Japanese `耐久力` refer to endurance or the ability to withstand harm; `끈기` leans toward persistence. Consider `문제는 힘이 아니라 얼마나 잘 버티느냐야.` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `49018` | Title terminology | The singular rank `Templar` varies among `템플러`, `성전기사`, and `성전 기사`; the project has not established a final Korean form for personal ranks. Retain the current wording pending a terminology decision. |
| `49195` | Meaning / naturalness | English `necessary corruption`, Japanese “necessary destruction,” and Chinese “necessary depravity” still do not settle the intended nuance. Retain `필요한 타락` pending stronger context, consistent with the earlier SQ55 review. |
| `49246` | Meaning | English and Chinese can be read as the speaker becoming a hungry spider, while Japanese explicitly threatens to make the listener food for a hungry spider. Korean follows the former reading. Without resolving this source conflict, do not choose between `거미로 변하다` and `거미의 먹이가 되다`. |

## Rechecked Findings and Structure

- The 63 pre-existing ledger rows were rechecked against the current four
  language sources; their fingerprints match. Existing candidate/hold
  dispositions, including `49018`, `49170`, `49195`, `49205`, and `49212`,
  remain recorded as historical rows. This report carries forward the two
  named-item/name-format candidates and the `fortitude` candidate.
- Two exact-English duplicate groups touch the range:
  `49051`/`49245` (`Goodbye.`) and `49067`/`49137` (`Good day.`). Japanese
  and Korean match within both groups.
- Four entries contain line breaks: `49084` has 16, `49188` has 10, and
  `49190` and `49228` have five each. The line-break counts match across all
  four languages, totaling 36 breaks per language.
- Runtime/display markers occur at `49000`, `49014`, and `49140`. Marker
  identities and order match across all four languages.
- Of 250 IDs, 196 have indexed asset associations, represented by 202
  ID-asset links across 132 assets; 54 IDs have no indexed asset. Of the 187
  newly recorded IDs, 133 have indexed associations, represented by 137
  links across 79 assets; 54 have no indexed asset. Asset links do not
  establish per-key speakers or playback order.

## Range Result

- The range has nine current correction-candidate IDs and three
  evidence-limited holds; 238 IDs have no current finding.
- After appending 187 new IDs, the ledger covers 53,433 of 65,135 unique
  `default` IDs (82.03%), leaving 11,702. Sequential coverage reaches
  `49249`; next is `49250`-`49499`. Recounting against the generated ID
  catalog gives 42,772 IDs with indexed asset links and 10,661 without.
  The earlier tally counted ID `47041`'s `no_quest_asset_match` sentinel as
  an asset link; it is not a linked asset.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
- Catalog/index reproduction, all 53,433 ledger fingerprints, nine related
  tests, and the line-ending-aware diff check passed after updating the
  ledger and catalogs.
