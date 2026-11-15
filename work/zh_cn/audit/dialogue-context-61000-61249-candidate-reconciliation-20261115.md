# Candidate Reconciliation: IDs `61000`-`61249`

- Date: 2026-11-15.
- Rechecked all 11 new and three earlier candidate IDs against the active
  Korean and English, Japanese, and Chinese source rows.
- All 14 candidates already had supported wording in the active CSV,
  including the edits recorded in the 2026-11-14 final application.
- Applied three separate report-only corrections and refreshed only their
  ledger fingerprints. Existing candidate and hold dispositions were kept.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61016` | Retained | `운영 책임자(Director of Operations)` already applies the supported Korean title. |
| `61022` | Retained | `우리 땅에서는 조심해서 다녀, 친구.` uses conversational plain speech, as in Japanese and Chinese. |
| `61092` | Retained | The objective already uses `스베리(Sverri)나 시메온(Simeon)과 대화하기`. |
| `61167` | Retained | `무리하지 않는 선에서` naturally conveys `within reason`. |
| `61171` | Retained | The complete book title and Galenun Hegem are paired. |
| `61173` | Retained | The active verse already renders the hammer's rising and falling actively and naturally. |
| `61182` | Retained | The effect already says `적을 공황 상태에 빠뜨립니다`, matching the English and Chinese sense. |
| `61190` | Retained | The full item label is paired as `흠 없는 미타란 갑옷용 끈(Flawless Mitharan Armored String)`. |
| `61201` | Retained | `당신과 기막힌 은신처 덕분에 살았군.` naturally conveys whom and what the speaker has to thank. |
| `61216` | Retained | The passage already uses the established deity term `권능(Authority)`. |
| `61243` | Retained | The full item label is paired as `흠 없는 미타란 충전 결속구(Flawless Mitharan Charged Bindings)`. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61008` | Retained | `밴션 여사제(Banshaen Priestess) 처치하기` already uses the action-form objective. |
| `61118` | Retained | `요르반(Yolvan)에서 또 소동인가?` is supported by English and Japanese; Chinese differs, but does not establish the proposed awakening reading. |
| `61125` | Retained | `엔파마니르(Enfamanir) 처치하기` already uses the action-form objective. |

## Report-Only Corrections and Holds

- `61013`: Added `(The Wharfmaster's Child)` to the quoted book title. The
  existing 18 embedded CRLF separators and paragraph structure were preserved;
  the separate line-ending-format hold remains open.
- `61109`: Changed the objective to `크로싱의 수호자들(Crossing Keepers)과 대화하기`.
- `61145`: Changed the objective to `은 목걸이 획득하기`.
- The other evidence-limited findings remain held. In particular, no embedded
  line endings were normalized, and `61184`'s role remains unresolved without
  scene context.
- No speaker attribution or dialogue order was inferred from asset links.

## Applied Changes

Updated three IDs with `tools/replace_text_preserve_eol.py`: `61013`, `61109`,
and `61145`. Only these IDs' `source_fingerprint` fields were refreshed.
Candidate dispositions and all unrelated ledger fields were preserved.

## Result and Verification

- Eleven new candidates were reconciled; all had supported wording in the
  active Korean text. Three earlier candidates were rechecked separately.
- Cumulative reconciliation is `3,410 / 4,026` (`84.70%`), with `616`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. ID `61013` retains its 18 embedded
  CRLF separators. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
