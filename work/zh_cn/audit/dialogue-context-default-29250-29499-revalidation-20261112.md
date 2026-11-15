# Sequential `default` Revalidation: IDs `29250`-`29499`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 69 recorded IDs and added 181 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `29296` | Name / format | This entry alternates `아스터(Aster)`/`아스터 쌍둥이` with `애스터` in the brothers' names. The same inheritance uses `애스터 금고(Aster Strongboxes)` at `29348`, and the active translation uses `애스터` for the family elsewhere. Standardize this entry's family references to `애스터` while preserving the names and the five-paragraph structure. | High |
| `29405` | Name / format | Standalone faction name `The Testament` is rendered only as `테스타먼트`; the active translation elsewhere uses `테스타먼트(The Testament)` (for example, `23116`). Add the English pairing without changing the warning or tense. | High |
| `29423` | Name / format | The checklist names Colet, Thorn, and Hardy. Only Colet is paired with English; `손` and `하디` are unpaired. Existing rows use `손(Thorn)` (`5041`) and `도란 하디(Dolan Hardy)` (`5740`). Add source names to the two checklist entries while preserving its clipped rhythm. | High |
| `29462` | Name / format | Heki and Efyr are named in the smithy directions but lack English pairings, while Gavroche is paired. Existing rows use `헤키(Heki)` and `에피르(Efyr)` (for example, `9935` and `10964`). Pair those names consistently; preserve the distinction between general goods, repairs, and armor. | High |
| `29465` | Format | The English ingredient list separates every quantity from the ingredient name. Korean has spaces after the White Flake parenthetical but omits them after `이사의 숨결(Ysa's Breath)`, `바닷아마(Seaflax)`, and `운명의 정수(Essence of Fate)`. Add the missing spaces before `(2)`, `(1)`, and `(1)`; preserve the blank lines and list order. | High |
| `29476` | Naturalness | This quest-log entry ends a written past-tense account with conversational `숨어 있었지`. Japanese uses written `隠れていた`, and nearby clauses are journal narration. Prefer `폐허의 지하실에 숨어 있었다`, preserving the uncertainty in the following sentence. | High |
| `29481` | Naturalness | `one of my station` means a person of the speaker's rank. Korean `나 같은 지위에 있는 사람과 이야기할 허가를 받았나` is understandable but cumbersome. Consider `나와 같은 지위의 사람에게 말을 걸 허락을 받았나, 사악한 자여?`; retain the imperious address and the Warlord title. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `29460` | Meaning | The poem's English fragment `Never to be Dara anymore` is ambiguous. Japanese interprets it as never meeting Dara again, while Chinese is closer to no longer being Dara. Korean's `다시는 다라로 돌아올 수 없네` also permits a place-like reading. Do not choose among these meanings without more textual or game context. |
| `29287` | Meaning | `I'm here to collect.` does not identify what is being collected. Korean `받으러 왔어` narrows it to receiving something; Japanese says `回収に来た`, but the preceding exchange is unavailable here. Keep the row on hold rather than selecting a collection/receipt meaning. |

## Earlier Findings And Checks

- Retain the existing `29366` candidate: `That is your name, isn't it?` is
  deliberately part of the spider-slayer joke; `별명` rationalizes the
  speaker's mistaken assumption. The earlier report proposes `그게 네 이름
  맞지?`.
- Retain the existing `29490` meaning hold; the referent of `it` and the
  relationship between destroying it and Idylla's fall remain unresolved.
- 63 exact-English duplicate groups touch this range (1,315 corpus rows).
  Korean wording matches within each group; some Japanese styles differ.
- Normalized runtime-token signatures and line-break counts match across
  English, Japanese, Chinese, and Korean. Embedded poem and journal breaks
  remain intact.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 38,835 of 65,135 unique IDs (59.62%),
leaving 26,300. Sequential coverage reaches ID `29499`; next:
`29500`-`29749`.
