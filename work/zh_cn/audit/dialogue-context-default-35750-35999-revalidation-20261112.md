# Sequential `default` Revalidation: IDs `35750`-`35999`

- Date: 2026-11-12.
- Compared all 250 in-range rows in English, Japanese, Chinese, and active
  Korean.
- Rechecked 71 existing ledger entries and reviewed the other 179 in-range
  IDs.
- Findings are proposals, not approved translation edits. No translation
  CSV, source asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `35784` | Naturalness | Retain the existing candidate. `Give me no cause to anger` means not to provoke the Hierophant; Korean `날 화나게 할 이유를 만들지 마` is a stiff calque. Consider `날 화나게 하지 마.` | High |
| `35789` | Terminology / format | Retain the existing candidate. English names `The Font`; the established display is `샘(The Font)`. This row says only `샘의 물길`, while Japanese specifies `Itha's Font`. Pair the established name without claiming that every use of `flow` means literal water. | Medium-high |
| `35832` | Meaning / naturalness | Retain the existing candidate. `The dreaded pirate` describes a feared or notorious pirate, not simply a `지독한 해적`. Consider `악명 높은 해적` while preserving the speaker's playful tone. | High |
| `35843` | Name / format | Retain the existing candidate. The quest-log label explicitly names the `Knave of Pride`, but Korean has only `교만의 시종`. Add the full pairing `교만의 시종(Knave of Pride)`. | High |
| `35857` | Name / format | The epitaph explicitly identifies `Private Lemalan` and the `Alfar Army`. Korean pairs `Alfar Army` but leaves `레마란` unpaired. Pair the complete person/title, e.g. `알파르 군(Alfar Army)의 레마란 일병(Private Lemalan)`, preserving the epitaph's four short statements. | High |
| `35864` | Meaning / format | English says `the triple key` and the related entries `15804`, `24750`, and `45140` describe separate keys to Maun's Horde. Korean `삼중 열쇠` can read as one compound key; consider `열쇠 세 개`. Pair `Charam's Grotto` where the full place label is used. The exact referent of `Maun's Horde` remains separately held below. | Medium-high |
| `35870` | Place name / format | `Salon Magisterium` is the named venue; the same title is paired in active Korean at `28030` and `32965`. Add the established `(Salon Magisterium)` pairing to this invitation text without changing `regal` or the labor-auction meaning. | High |
| `35890` | Meaning / naturalness | Retain the existing candidate. English `the way of the Telling`, Japanese `伝承にはないこと`, and Chinese `与天谕之道不符` describe something inconsistent with the Telling. Korean `전승의 섭리` overstates this as providence. Consider `전승(The Telling)의 흐름과는 맞지 않아.` | Medium-high |
| `35919` | Name / format | English names both `Ambyth` and `Arden`; only Arden is paired in Korean. Consider `앰비스(Ambyth), 아든(Arden)과 다른 이들과 평화를 유지하려 했지만…… 뜻대로 되지 않았어.` | High |
| `35921` | Numbered-label format | The current Korean `제8부` does not match English `Entry VIII` or Chinese `条目VIII`. It also diverges from the previously accepted exact-key correction `항목 VIII` at D-19834. Restore the neutral numbered-entry form `항목 VIII`; do not infer a journal or book section. | High |
| `35957` | Meaning | The upgrade says the summoned Faer Gorta siphons health from enemies and sends it to the player. Korean `자신에게` grammatically points back to Faer Gorta, not the player. Consider explicitly saying `플레이어에게 전달합니다`; retain the localized upgrade wrapper and line break. | High |
| `35959` | Meaning / terminology | The active Korean `최초의 스케이스(First Scaith)` reintroduces the ordinal phrasing rejected by the accepted D-19835 review. English context at `5873`, `9458`, and `11102` identifies the same ancestor appellation; restore `첫째 스케이스(First Scaith)`. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `35858` | Meaning / referent | `They are lost` can mean the siblings are missing or dead. Japanese `もういない` suggests they are gone, while English and Chinese permit a lost/missing reading. Keep `행방을 알 수 없어` provisional; the isolated line does not resolve their fate. |
| `35864` | Meaning / entity | English `Maun's Horde`, Japanese `マウンの財宝`, and Chinese `莫恩部落` disagree on whether Horde is treasure or a people/group. Do not replace the current `보물창고` with a more specific reading without quest context. |
| `35871` | Speech level | Retain the existing hold. Japanese uses a deferential request while Korean uses plain statements; the asset and key do not establish this line's speaker or dialogue stage. |
| `35937` | Meaning / item type | `pall` is ambiguous in isolation. Base ID `81` and the prior D-19834 review support the active `관 덮개`; Japanese also says coffin, while Chinese and a later asset review support a burial shroud (`수의`). Keep `관 덮개` provisionally and do not apply the newer `수의` proposal until the item identity is resolved. The earlier candidate is therefore reclassified as a hold. |
| `35947` | Meaning / literary structure | Retain the prior uncertainty. The eight-line poem's parallel images and the relation of the royal herald to the storm remain syntactically open in English; preserve the existing Korean wording and all eight lines rather than supplying a specific relation. |

## Rechecked Findings and Structure

- The range contains 12 candidate IDs and five hold IDs; `35864` has a
  separate candidate and hold. The remaining 234 IDs have no new finding.
- Of the 71 existing entries, five candidates and the hold at `35871` remain.
  The candidate at `35865` was cleared: its current `벨렌의 성약단(Belen's
  Testament)` and `죽음의 교단` already match the proposed terminology.
  The prior candidate at `35937` was reclassified as an evidence-limited
  hold because the sources conflict on the type of pall.
- Fifty-seven exact-English duplicate groups (1,353 corpus rows) touch this
  range when the full corpus is considered. Korean is identical within every
  group. The three duplicate groups entirely inside the range are `Lyana's
  Dance` (`35791`, `35805`), `Quest Complete` (`35823`, `35885`, `35926`),
  and `Quest Failed` (`35893`, `35940`).
- Seven in-range rows contain embedded line breaks: `35947` (7), `35953` (3),
  `35957` (1), `35977` (3), `35979` (22), `35982` (1), and `35990` (3).
  Counts match across all four languages. Normalized brace-token and
  angle-markup signatures also match throughout the range.
- Previously closed source-key findings were checked against the active
  Korean: `35953`'s `Fall`, the Laz/Raz distinction and wordplay at `35979`,
  the new land at `35984`, the Sceptre term at `35982`, and the poem at
  `35990` were not reopened.
- Asset associations remain grouping evidence only. No individual speaker or
  playback order is inferred.
- The 179 new IDs bring the ledger to 43,651 of 65,135 unique `default` IDs
  (67.02%), leaving 21,484. Sequential coverage reaches ID `35999`; the next
  range is `36000`-`36249`.
- The generated 530-asset and 65,135-ID catalogs, four-language ledger
  fingerprints, nine related tests, and audit-scoped diff check passed.
  Translation CSVs remain unchanged.
