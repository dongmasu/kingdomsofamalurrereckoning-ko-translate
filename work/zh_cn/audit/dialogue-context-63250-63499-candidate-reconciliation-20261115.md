# Candidate Reconciliation: IDs `63250`-`63499`

- Date: 2026-11-15.
- Rechecked 12 new candidates against the active Korean text and English,
  Japanese, and Chinese sources.
- Corrected `63255` and `63292`; the other ten candidates already had
  supported wording.
- Rechecked seven earlier findings. Corrected the request's agency at
  `63374`; the other six already had supported wording.
- English anchors meaning, Japanese is the primary reference for voice,
  register, and phrasing, and Chinese is supporting evidence.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63252` | Retained | `미리아(Myria)` is already paired with the source name. |
| `63255` | Corrected | The sources say the speaker's group follows behind, watches for a Tuatha ambush, then shields the vanguard scouts. Recast the full line as conversational plain Korean without changing that sequence or inferring a speaker. |
| `63284` | Retained | The named concept is already paired as `조화의 사원소(Harmonic Quarternion)`; the source spelling is preserved. |
| `63292` | Corrected | Added the missing `The Mission` pairing. The exact-English duplicate `57692` has the same Japanese and Chinese text and the same quest asset; its current Korean already uses `선교원(The Mission)`. |
| `63326` | Retained | `이야기는 흔해 빠졌고` conveys the dismissive sense of “tales are cheap” naturally; the warning about misleading legends remains intact. |
| `63329` | Retained | `켈로렌 군단(Keloren's Legion)` is already paired, along with the other established names in the sentence. |
| `63376` | Retained | The gameplay stat already uses the established `체력` term, and the `+100%` values and line break are preserved. |
| `63378` | Retained | The current Korean has one delivery/purchase sentence, not a repeated second sentence. The four localized marker spans remain in source order. |
| `63380` | Retained | `리르(Lir)` and `피어스(Pearse)` are already paired; no unsupported title was added. |
| `63402` | Retained | `유능한 이들이 맡고 있으니` is a natural, neutral reassurance and does not invent a specific promise by “us.” |
| `63408` | Retained | Both `리리아의 눈(Eye of Lyria)` and `깨어나는 단검의 해(Year of Waking Knives)` are already paired; chronology is unchanged. |
| `63420` | Retained | `지는 해의 시간(Hour of the Setting Sun)` is already paired, and `아만(Amman)의 동굴` preserves the physical-place reading. |

## Earlier Findings Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63303` | Retained | `미스로리스(Mithroliths)` already includes the source name. |
| `63332` | Retained | `지켜야 할 규칙은 하나뿐이야` is natural Korean and conveys the single binding obligation in context; no speaker is inferred. |
| `63343` | Retained | `대위` is the established Korean rank for `Captain` in this context. |
| `63374` | Corrected | English explicitly says Menri wants the narrator to contact her parents; Japanese and Chinese support that request. Changed the ending to `부모님께 연락해 달라고 했어` so the requested actor is clear. |
| `63389` | Retained | `개대가리` now matches the established Korean rendering of the same `dog-face` insult. |
| `63399` | Retained | `페이지(Paige)`, `코볼트(Kobold)`, `요툰(Jottun)`, `클랜 토템(Clan Totem)`, and `선택받은 자들(Chosen)` are paired in the current sentence. |
| `63431` | Retained | The objective already uses the established action form `업그레이드하기`. |

## Holds And Formatting

- Evidence-limited holds and embedded-line-ending decisions in the sequential
  range report remain unchanged. No source conflict, speaker identity, or
  dialogue order was inferred.
- No embedded line breaks, runtime markers, or immutable source files were
  changed.
- Exact-English duplicate rows `57692` and `63292` now use the same Korean
  text, `그 염주를 선교원(The Mission)에 돌려주면 좋겠네. 부탁하네.`
  Only `63292` required a change in this pass.

## Result And Verification

- Twelve new candidates were reconciled: two were corrected and ten already
  had supported wording. Seven earlier candidates were rechecked; one was
  corrected and six retained.
- Candidate reconciliation is `3,488 / 4,026` (`86.64%`), with `538`
  remaining. Only the 12 new candidates advance the cumulative tally.
- Three Korean rows changed: `63255`, `63292`, and `63374`. Only their
  `Texto` fields changed, and only their ledger `source_fingerprint` fields
  were refreshed.
- All 65,135 ledger fingerprints validate. The index and both catalogs
  reproduce; all 11 CSV-preservation tests and nine context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
