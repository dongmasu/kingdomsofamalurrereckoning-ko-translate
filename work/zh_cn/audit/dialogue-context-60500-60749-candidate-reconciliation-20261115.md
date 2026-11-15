# Candidate Reconciliation: IDs `60500`-`60749`

- Date: 2026-11-15.
- Rechecked ten new correction candidates against the active Korean and
  English, Japanese, and Chinese source rows. `60675` was already reconciled
  with exact-source duplicate `43317`; it was not counted twice.
- The other nine new candidates were reconciled: seven were corrected and
  two already had supported wording.
- Rechecked six earlier candidates and one existing hold. Three earlier
  candidates were corrected; two were already supported, while the
  `Templar` office-term question at `60614` remains scoped and unresolved.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60525` | Corrected | Paired the complete role/name as `티린 대여사제(High Priestess Tirin)`. |
| `60527` | Already resolved | The complete item label is already paired as `흠 없는 미타란 피추적자의 지렛목(Flawless Mitharan Bloodseeker's Fulcrum)`. |
| `60531` | Corrected | Paired the named destination as `대도서관(Great Library)`. |
| `60542` | Corrected | Paired the full title as `비탄의 집(House of Sorrows) 왕자(Prince of Sorrows)`. |
| `60564` | Already resolved | The shop name already appears once as `그월흐마이의 물건(Gwalchmai's Goods)`. |
| `60576` | Corrected | Changed the objective to the established action form `내 동맹들과 대화하기`. |
| `60577` | Corrected | Changed the objective to `장벽 통과하기`. |
| `60599` | Corrected | Paired the standalone title as `선반 넷, 자물쇠 넷(Four Shelves, Four Locks)`. |
| `60667` | Corrected | Recast the source as not relying on a god: `어느 신에게도 의지하지 않는 너의 자립은 그 자체로 보상을 가져다준다.` |
| `60675` | Previously reconciled | Its exact-source duplicate `43317` was already reconciled; both use `고대 금고(Ancient Vault) 탐험하기`. |

## Earlier Findings Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60546` | Corrected | Replaced elevated `그대의 것이 될 것이다` with conversational `네 것이야`, matching English and Japanese. |
| `60560` | Corrected | Changed the paired category label to `소형 생물`, matching `대형 생물` at `36853`. |
| `60614` | Partly held | `키 큰 조수` already captures Japanese `ノッポ`; the varied Korean rendering of `Templar` still lacks a project-wide decision, so its role wording was not guessed or globally changed. |
| `60646` | Corrected | Removed the implication that all the younger brothers are children: `세상의 모든 동생들을 위해`. |
| `60652` | Retained | `죽여야 해` accurately follows this row's `kill it`. Related `52702` says `destroy it` in English, so its `처치` rendering is not imposed mechanically here. |
| `60709` | Already resolved | The current `그게 헐값이라고?` already conveys `for a song` as “cheaply,” preserving the bargaining joke. |
| `60679` | Held | The source locales differ in polarity and implication; no confident replacement is supported. |

## Report-Only Findings

- `60545`: Changed the objective to `미스그라(Meathgra) 처치하기`.
- `60653`: Changed the objective to `사망 통지 전달하기`.

The append-only ledger dispositions were preserved. No speaker or playback
order was inferred from asset associations.

## Applied Changes

Updated 12 IDs with `tools/replace_text_preserve_eol.py`:
`60525`, `60531`, `60542`, `60545`, `60546`, `60560`, `60576`, `60577`,
`60599`, `60646`, `60653`, and `60667`. Only these IDs' four-language
`source_fingerprint` fields were refreshed.

## Result and Verification

- Nine new candidates were reconciled: seven corrected and two already
  supported. `60675` was counted in its earlier exact-source reconciliation.
- Candidate reconciliation is `3,392 / 4,026` (`84.25%`), with `634`
  remaining.
- The unresolved `Templar` term question and evidence-limited `60679` hold
  remain documented rather than guessed.
- Fingerprint, index/catalog, test, CSV structure, encoding, newline, and
  CRLF-aware diff results are recorded in the accompanying manifest.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
