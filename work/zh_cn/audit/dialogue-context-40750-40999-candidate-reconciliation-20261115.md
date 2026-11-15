# Candidate Reconciliation: IDs `40750`-`40999`

- Date: 2026-11-15.
- Rechecked all 15 correction candidates in this range against English,
  Japanese, Chinese, the active Korean CSV, and prior terminology decisions.
- Thirteen candidates already had source-supported Korean wording. Corrected
  `40927` to the established `샘(The Font)` pairing and revised `40791` for
  the English meaning “merely a soldier, an officer.”
- Exact-source checking found that `43233` is identical to `40791` in all
  three source languages. Its Korean text and prior `not-issue` ledger
  disposition were updated to match the accepted reading at `40791`; this
  adds one candidate to the pool.
- The 21 evidence-limited holds in the sequential report remain open.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `40758` | Confirmed `처형인(Headsman)`, consistent with the 26 previously checked occurrences of the term; the identical standalone label at `57045` matches exactly. |
| `40766` | Confirmed `열쇠와 주문 찾기`; the spell/action wording matches the related quest language and objective style. |
| `40782` | Confirmed `성약단(The Testament)` and `천것` for this context; no global normalization of other Testament or dreg references was inferred. |
| `40791` | Corrected to `그자는 그저 군인, 그것도 장교에 불과해.` English uses `but a soldier` in the restrictive sense; the following appositive identifies him as an officer. |
| `40802` | Confirmed the paired names `애트워터 쌍둥이(Attwater twins)`, `펜(Fenn)`, and `안소(Anso)`, preserving who starts the race and who pays. |
| `40824` | Confirmed the natural phrasing `바게스트(Barghest) 심장이 지닌 재생의 온기가 깃든 부적.` |
| `40841` | Confirmed the complete label `할리나의 시체(Halina's Corpse)`. |
| `40863` | Confirmed the complete place-name pairing and spacing `라시르 지부 회관(Rathir Chapter House)`. |
| `40890` | Confirmed the positive dawn meaning `새벽을 반긴다` and the paired group names `Soldiers of Summer` and `Guardians of the Light of Spring`. |
| `40911` | Confirmed the three paired gladiator sobriquets: `Ivan the Invincible`, `The Dragon`, and `Lotus Killer`. |
| `40927` | Changed `샘(Font)` to the established `샘(The Font)` for the named magical spring; the later generic `fountainhead` remains `원천`. |
| `40954` | Confirmed `독 속성 공격`; the two damage values and all three lines remain unchanged. |
| `40997` | Confirmed `앰비스(Ambyth)` without adding an identity or changing the surrounding sentence. |
| `40998` | Confirmed `테라 템플라(Terra Templa)` and the action-style objective `...대화하기`. |
| `40999` | Confirmed the complete title `반지의 발라드(Ballad of the Ring)`. |

## Exact-Source Follow-up

- IDs `40791` and `43233` have identical English, Japanese, and Chinese
  source strings. Both now use the same Korean text:
  `그자는 그저 군인, 그것도 장교에 불과해. 그렇게 무디고 무자비한 머리로는 바레스(Bareth)의 작품이 지닌 섬세함과 숭고함을 결코 이해하지 못하겠지.`
- Japanese and Chinese read the first clause contrastively, while the English
  `but a soldier` supports the restrictive “merely a soldier” reading. English
  is the primary semantic anchor; the sentence's appositive `an officer` is
  retained as `그것도 장교`. No speaker attribution or dialogue order is
  inferred from the shared asset association.
- The 26 previously checked `Headsman` term/name occurrences remain
  consistently paired. The identical standalone label at `40758` and `57045`
  is one exact-source duplicate pair and remains aligned.
- The sequential report's other exact-English groups remain aligned except
  for `19618`, `22319`, and `40915`, where Japanese distinguishes accepting
  from completing a request. That supported distinction is retained.
- At `40954`, all three embedded line breaks, both blank-separated effect
  values, and the `+30` / `+75%` numbers are preserved.

## Ledger and Verification

- Three Korean rows changed: `40791`, `40927`, and linked duplicate `43233`.
  Their four-language fingerprints were refreshed.
- Ledger row `43233` was reclassified from `not-issue` to `candidate` and now
  points to this follow-up. Its earlier review report remains unchanged.
- Sixteen unique candidate IDs were reconciled: all 15 in-range candidates
  plus newly identified `43233`. This raises the candidate pool from 4,019
  to 4,020. Cumulative reconciliation is 2,651 / 4,020 (65.95%), with 1,369
  remaining.
- The sequential ledger remains complete through ID `65134`; this
  candidate-application pass does not change that coverage checkpoint.
- All 65,135 ledger fingerprints validated; index/catalog regeneration and
  checks passed. The 11 CSV-preservation tests and nine dialogue-context
  tests passed. The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840
  CRLF sequences, 242 LF-only separators, and no bare CR.
- Exact-source alignment passed for IDs `40791`/`43233` and `40758`/`57045`.
  The 26-row `Headsman` term/name consistency set also passed. At `40954`,
  all four languages retain three embedded line breaks and both damage
  values. The CRLF-aware diff check passed.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
