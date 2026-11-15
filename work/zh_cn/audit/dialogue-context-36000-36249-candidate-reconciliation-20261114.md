# Candidate Reconciliation: IDs `36000`-`36249`

- Date: 2026-11-14.
- Rechecked all 21 current `overall=candidate` IDs against English,
  Japanese, Chinese, active Korean, related entries, and existing decisions.
- `36075` was already reconciled with `33820`, and `36231` with the earlier
  vagrant terminology review. The other 19 candidates are newly counted.
- The existing edit at `36017` was already present when this pass resumed;
  its wording was confirmed and its stale fingerprint refreshed. Four
  further candidates were already correctly reflected. Fourteen rows needed
  source-supported Korean or English-label corrections.

## Candidate Decisions

| ID(s) | Decision and evidence |
| ---: | --- |
| `36017` | Confirmed the Battle of Galafor Plain and both generals' complete name pairings. The working-tree edit predated this pass; only its fingerprint was refreshed here. |
| `36028` | Used the established `마스터 벨른(Master Belne)` title, consistent with the related named entries, while preserving the sentence and other labels. |
| `36032` | Confirmed `켈(Kel)` and the Frostbreak Sea label were already present. |
| `36054` | Completed the standalone label as `마녀 마가스(Magas the Witch)`. |
| `36075` | Already reconciled with exact-English duplicate `33820`; not counted again. |
| `36093` | Confirmed the existing `어쩐지 어려움이 생길 줄 알았어` correctly conveys unexpected intuition rather than contrast. |
| `36097` | Clarified the event as `제2차 대화재인 로스기아드(Llosgiad)` without changing the account of the battle. |
| `36121` | Added the complete title/name `백인대장 가스텟(Centurion Gastet)`; the already paired `Missives of Sable` and `Grim` references remain intact. |
| `36137` | Added `(Mason)` to the letter signature only. All paragraphs and nine embedded line breaks are preserved. |
| `36151` | Recast the greeting in conversational plain Korean as `또 만났네, 낯선 이.` |
| `36159` | Added `(Sorrogweth)` to the named plant. |
| `36168` | Added `(Bloody)` to the named character reference; no longer form such as `Bloody Bones` is inferred. |
| `36172` | Replaced the stiff `찾아오는 이는 드물지` with the conversational `찾아오는 사람은 드물어`. |
| `36179` | Added the complete labels `처형자(The Executioner)` and `고등 학자의 저택(High Scholar Estate)` while retaining the established equipment name. |
| `36191` | Used the established Dverga structure term `패스팅(Fastings)`, supported by its definition at `54487`, and made the continuation natural. |
| `36193` | Added the complete title `Death's Cryptic Hand` inside the existing quoted Korean title. |
| `36200` | Confirmed the existing modifier order clearly describes a courageous Almain woman. |
| `36206` | Confirmed `인장석` already matches the reviewed `sigil stone` terminology at `37473`. |
| `36218` | Added `(Child of Dust)` while preserving the existing Korean address and casual register. |
| `36231` | Already reconciled with the earlier vagrant terminology review; not counted again. |
| `36232` | Recast the sentence to identify the two shrines and express naturally that Arkes knew they would be needed. |

## Evidence-Limited Holds

- `36226`: The language sources differ in register, and the text may be
  tutorial copy rather than spoken dialogue. No conversational voice was
  imposed from nearby asset associations.
- `36235`: `Bloody least I can do` may be wordplay or an intensifier; the
  available language sources and isolated sentence do not resolve it.

## Structure And Verification

- The reviewed range contains 21 candidate IDs; 19 were newly reconciled.
  The cumulative candidate reconciliation is 2,275 / 4,015 (56.66%), with
  1,740 not yet reconciled.
- Fourteen rows were edited in this pass. The pre-existing `36017` change was
  confirmed; only the `source_fingerprint` fields for those 15 changed IDs
  were refreshed.
- All 65,135 ledger fingerprints validate. The generated index and both
  catalogs reproduce exactly. CSV-preservation and context-index regression
  tests: 20 passed.
- The active CSV retains 65,135 ordered records and its UTF-8 BOM. Its
  newline inventory remains 71,838 CRLF, 244 LF-only, and no bare CR.
- The four language tables have matching IDs and line-break counts for all
  19 newly reconciled candidates. The letter at `36137` retains nine line
  breaks. CRLF-aware `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`36000`-`36249`](dialogue-context-default-36000-36249-revalidation-20261112.md)
and the
[decision manifest](dialogue-context-final-edits-followup-36000-36249-20261114.json).
