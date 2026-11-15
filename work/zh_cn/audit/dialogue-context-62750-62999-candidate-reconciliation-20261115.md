# Candidate Reconciliation: IDs `62750`-`62999`

- Date: 2026-11-15.
- Rechecked 14 new candidates against active Korean and English, Japanese,
  and Chinese sources.
- All 14 findings were already reflected in the current Korean CSV; no text
  or ledger fingerprint change was needed.
- Rechecked six earlier findings and retained their supported wording or
  evidence-limited status.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62755` | Retained | `케자르(Kezar Ten-Fingers)` pairs the source name and translated epithet; no choice between transliterating and translating the epithet was needed. |
| `62779` | Retained | `수련자 펠(Adept Fel)` pairs the complete title and name and matches the same source label elsewhere. |
| `62828` | Retained | `왕의 징표(King's Token)` is already paired and preserves its qualification meaning. |
| `62830` | Retained | The current `대체 정체가 뭐지? 필멸자인가? 페이(Fae)인가? 도무지 알 수가 없군` is concise, uses no mismatched `당신`, and preserves the source's terse uncertainty. |
| `62839` | Retained | The current row pairs `Corthis`, `Mardalla Hest`, `Raghosh`, and `Hironar` without conflating their roles. |
| `62842` | Retained | `하이 롤(High Roll)` is paired, and the explanation correctly says the higher total on two dice wins. |
| `62869` | Retained | `발라 라치(Balla Lach)` is paired while remaining distinct from the group's unsettled Korean spelling elsewhere. |
| `62873` | Retained | The label already pairs the full source names as `로스와 베아트리스(Roth and Beatrice)`. |
| `62882` | Retained | The current transition `이제야 서로 마주하게 됐네` is concise and preserves the fallen barrier and present encounter. |
| `62895` | Retained | `프리홀드(Freehold)` is already paired without imposing a global Korean rendering. |
| `62930` | Retained | `숲의 정의(Woodland Justice)` is paired; the row does not infer whether it is a book, quest, or UI label. |
| `62967` | Retained | `개스티르 대장(Captain Gastyr)` is paired, and the sentence does not add unsupported service details. |
| `62990` | Retained | `견습생 이비타(Pupil Ibita)` pairs the complete source label without asserting a formal rank. |
| `62998` | Retained | `그녀는 날마다 그 대가를 치르고 있어` preserves the ongoing, repeated consequence in English and Chinese. |

## Earlier Findings Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62794` | Retained | `명장들(Master Makers)` is supported by the accepted bounded term decision; the append-only historical uncertainty row remains intact. |
| `62826` | Held | “For our people” remains potentially narrower than Korean `우리를 위해`; Japanese and Chinese differ, and context does not resolve the referent. |
| `62870` | Held | The Korean Syllareta spelling remains unsettled across the source languages; the current English pairing is present and no spelling is normalized. |
| `62874` | Retained | The current quest objective ends in `대화하기`, following the action-objective form. |
| `62917` | Retained | `로포쿠(Lupoku)` now follows the English source spelling; no additional source-name edit is needed. |
| `62969` | Held | The familiar address `dove` still has conflicting locale evidence. Keep `친구` provisionally without inventing a more specific endearment. |

## Holds and Formatting

- Existing evidence-limited meaning/address holds remain open as listed above.
- The poem line breaks at `62867` and `62966` remain byte-preserved; no
  embedded separators or runtime markers were normalized.
- No speaker attribution or dialogue order was inferred from asset links.

## Result and Verification

- All 14 new candidates were reconciled as already supported by the active
  Korean CSV. Six earlier findings were rechecked.
- Cumulative reconciliation is `3,469 / 4,026` (`86.16%`), with `557`
  remaining.
- No Korean text or ledger fingerprint changed in this pass.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
