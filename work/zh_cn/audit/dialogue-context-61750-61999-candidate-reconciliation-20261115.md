# Candidate Reconciliation: IDs `61750`-`61999`

- Date: 2026-11-15.
- Rechecked eight new candidates against active Korean and English, Japanese,
  and Chinese sources. All eight already had supported wording.
- Rechecked five earlier candidates. Four were already supported; the
  speaker/register question at `61750` remains held.
- No translation or ledger fingerprint changes were needed.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61754` | Retained | `비교적 작은 연구 분야` preserves the scholarly meaning of `a minor area of study`; its existing embedded CRLF layout remains untouched. |
| `61767` | Retained | `비전 격노(Arcane Fury)` and `원소 탈출(Elemental Escape)` are each paired inside their existing display markers. |
| `61785` | Retained | `임원 보좌관(Executive Assistant)` correctly names an assistant to an executive. |
| `61809` | Retained | The objective already uses `제프윈 랜(Zefwyn Lan)과 대화하기`. |
| `61844` | Retained | The poem already pairs the proper name as `이사(Ysa)`; its embedded CRLF layout remains untouched. |
| `61925` | Retained | `권능(Authority)의 계획` uses the established divine name, not `권능자`. |
| `61986` | Retained | The complete title is paired, and exact-English duplicate `4390` has identical Korean wording. |
| `61994` | Retained | `환영합니다, 검투사님!` is a natural polite greeting supported by the Japanese address. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61750` | Held | The journal-like text does not establish a per-key speaker, so no speaker-specific register change is justified. |
| `61758` | Retained | `절구와 공이` correctly resolves `Mine` in the potion-making context. The separate `Master Healing Potion` terminology discrepancy remains report-only. |
| `61804` | Retained | The current entry clearly identifies the Mystic Hammer, the Hall of the Firstsworn forge, and Gwyn's belief that it must be reforged there. |
| `61822` | Retained | The Korean correctly says the champion has not returned since being defeated by Hroth Magnus. |
| `61894` | Retained | The entry preserves both the mountain-troll contract and avenging Jory's death. |

## Holds and Report-Only Findings

- Existing source/register holds `61782`, `61836`, `61845`, `61926`, `61940`,
  and `61999` remain unresolved.
- The `61754`, `61767`, `61844`, and other embedded-line-ending holds remain
  unchanged; no separator was normalized.
- The potion-term discrepancy at `61758` and generic ring wording at `61918`
  remain outside the candidate count and were not changed.
- No speaker attribution or dialogue order was inferred from asset links.

## Result and Verification

- Eight new candidates were reconciled; all were already supported by the
  active Korean text.
- Cumulative reconciliation is `3,432 / 4,026` (`85.25%`), with `594`
  remaining. The unresolved earlier candidate at `61750` is not counted as
  newly reconciled.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No translation CSV, immutable source CSV, extracted game asset, or game
  binary was changed. No commit was made.
