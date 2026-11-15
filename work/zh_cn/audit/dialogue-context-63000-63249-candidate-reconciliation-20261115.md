# Candidate Application Reconciliation: IDs `63000`-`63249`

- Date: 2026-11-15.
- Rechecked the seven new correction candidates against the active Korean
  text and the same-ID English, Japanese, and Chinese sources.
- Four new candidates were corrected; three were already supported.
- Rechecked eight earlier candidates. Their supported text is already
  present; no further changes were needed.
- English anchors meaning, Japanese is the primary reference for voice,
  register, and phrasing, and Chinese is supporting evidence.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63074` | Retained | The rule already compares the two-dice sum for `High Roll` and predicts a sum range for `Ranged Roll`. `범위 굴림(Ranged Roll)` is the established term; no terminology change was made. |
| `63152` | Corrected | This formally confers the Scholia Arcana rank `Neophyte`. Standardized the rank to the established `초심자(Neophyte)` while preserving the natural, ceremonial register. |
| `63164` | Corrected | Added the full event-name pairing `Battle of Galafor Plains`; the surrounding conversational narration and all other names remain unchanged. |
| `63194` | Retained | The current text already uses the deity name `권능(Authority)` and correctly refers to the Authority's order, not an authority council. |
| `63204` | Corrected | Replaced the misleading abstract `공허` with `동굴`. The same Sinsear hollow is rendered as a cave at `2091`, and Japanese also identifies a cave; the Alabastra location is preserved. |
| `63229` | Retained | The standalone category already pairs `대가문(Great House)`. |
| `63244` | Corrected | Recast the phrase as `우리처럼 불쌍한 난민` so it naturally describes the refugees as pitiable, consistent with Japanese and Chinese, without changing the speaker's meaning or plain register. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63049` | Retained | `친구` is the previously established neutral rendering of the familiar `dove` vocative; the rest of the sentence remains conversational. |
| `63060` | Retained | `이해해` is a plain-style imperative, matching English `Understand` and Japanese `理解しろ`; the utterance remains consistently informal. |
| `63112` | Retained | Both occurrences of Acyone are paired as `아시온(Acyone)`, and the lost texts use the established `연도문`. |
| `63113` | Retained | The current sentence preserves the Wreath's gold foundation and prayer runes in natural conversational wording. |
| `63118` | Retained | `다시 왔구나. 뭘 도와줄까?` is natural conversational Korean and keeps one speech level; no speaker is inferred from the linked asset. |
| `63124` | Retained | The named `Weave` already uses `운명의 태피스트리(The Weave)`; the journal-style first-person narration is preserved. |
| `63146` | Retained | The action objective already uses `리치우드 나무껍질(Leechwood Bark) 수확하기`. |
| `63233` | Retained | The full label `Irion, King of Cups` is present in the parenthetical. The exact-English duplicate group was cross-checked separately below. |

## Cross-Row Consistency

- The same Galafor battle was checked across `3916`, `2588`, `9132`,
  `10739`, `13105`, `24307`, `36017`, `52524`, and `63164`. The Korean event
  name is now consistently `갈라포르 평원 전투`; existing source-specific
  English variants such as `Battle of Galafor fields` and
  `Battle for Galafor Plain` were preserved. Added the missing English
  pairing at `3916` and `13105`, corrected the Galafor spelling at `9132`
  and `36017`, and paired the source label at `63164`.
- All 20 exact-English rows for `Irion, King of Cups` now use the same
  Korean text, `컵의 왕 이리온(Irion, King of Cups)`. The outlier at
  `59823` was aligned with the other 19 rows; Japanese title wording varies
  slightly but does not change the referent or meaning.
- No speaker attribution, dialogue order, or unstated gender was inferred.

## Holds And Formatting

- The eight source-evidence holds in the sequential range report
  (`63018`, `63020`, `63040`, `63102`, `63129`, `63131`, `63178`, and
  `63202`) remain unresolved. The embedded-line-ending/layout holds also
  remain unchanged.
- No embedded line breaks, runtime markers, or source-language files were
  changed.
- The sequential range report remains the record of full-range review and
  structural checks; this report records only candidate reconciliation and
  the linked consistency follow-ups.

## Result And Verification

- Seven new candidates were reconciled: four corrections and three retained
  as already supported. Eight earlier candidates were rechecked and retained.
- Candidate reconciliation is `3,476 / 4,026` (`86.34%`), with `550`
  remaining.
- Nine Korean rows changed: `3916`, `9132`, `13105`, `36017`, `59823`,
  `63152`, `63164`, `63204`, and `63244`. Only the `Texto` fields changed.
- The corresponding nine ledger fingerprints were refreshed; all 65,135
  ledger fingerprints validate. Index and both catalogs reproduce, and
  all 20 preservation/context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes. The 20-row exact-English Irion group has one identical Korean
  translation.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
