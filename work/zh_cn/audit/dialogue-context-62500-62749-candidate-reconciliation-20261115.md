# Candidate Reconciliation: IDs `62500`-`62749`

- Date: 2026-11-15.
- Rechecked nine new candidates against active Korean and English, Japanese,
  and Chinese sources.
- Corrected `62658` and `62730`; the other seven already had supported
  wording.
- Rechecked four earlier candidates and corrected `62502` and `62582`.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62523` | Retained | `그만 좀 내버려 둬` already naturally conveys `Leave a man in peace`; the Korean keeps the dismissive plain style. |
| `62550` | Retained | `올라나(Olaana)를 정말 좋아해` correctly expresses the speaker's affection, rather than only describing Olaana as lovable. |
| `62563` | Retained with distinction | The exact-English group has Japanese `よし` (“all right”) at `16898` and `18884`, but `またな` / `またね` (farewell) at `60779` and `62563`. Keep `좋아, 그럼.` for the former and `그럼 또 보자.` for the latter; Japanese context supports the difference. |
| `62613` | Retained | The current line consistently uses conversational plain Korean, including `겉치레보다 행동을 중시하지`. |
| `62633` | Retained | `이제 대회계원에서 우리 원정에 자금을 지원해` already removes the awkward possessive and states the funding naturally. |
| `62637` | Retained | `곧 미룰 시간도 없어` naturally conveys that there will soon be no later opportunity. |
| `62658` | Corrected | The source says `other Hirelings`; the Korean now pairs the plural as `다른 고용병들(Hirelings)`. |
| `62682` | Retained | `거래해서 즐거웠어` avoids the mismatched `당신` and informal ending while keeping the hesitation. |
| `62730` | Corrected | Recast the stilted wish as `주사위 운이 따르길`, a natural, playful appeal to luck in the dice game. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62502` | Corrected | `아카라(Akara)가 선택해! 네가 아니라!` expresses the contrast directly and emphatically in conversational Korean. |
| `62505` | Retained | The current `웬센(Wencen)과 대등한 인물이야` is grammatical and preserves Belmaid's swordsmanship comparison. |
| `62582` | Corrected | Added the missing English pairing: `스프라이트(Sprite)`. |
| `62676` | Retained | The current sentence says to find Feride and carry out the requested experiment without repeating `도와`. |

## Holds and Formatting

- The location conflict at `62650` remains held: English places Adar behind
  the jail, while Japanese and Chinese place him in it.
- Existing evidence-limited meaning holds and the five embedded-line-ending
  holds in the range remain unchanged. No newline or marker sequence was
  normalized.
- No speaker attribution or dialogue order was inferred from asset links.

## Result and Verification

- Nine new candidates were reconciled: two were corrected and seven already
  had supported wording. Four earlier candidates were rechecked; two were
  corrected and two retained.
- Cumulative reconciliation is `3,455 / 4,026` (`85.82%`), with `571`
  remaining.
- Four Korean rows changed (`62502`, `62582`, `62658`, `62730`); their ledger
  source fingerprints were refreshed.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
