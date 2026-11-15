# Candidate Reconciliation: IDs `40000`-`40249`

- Date: 2026-11-14.
- Rechecked all 19 correction candidates in the sequential report against
  English, Japanese, Chinese, current Korean, and prior scoped decisions.
  Their supported corrections are already present in the active CSV.
- Exact-source comparison found one additional discrepancy: `33884` and
  `40025` are identical in all three source locales, but differed between
  `후손` and `후계자`. Japanese uses `末裔` in both, so `40025` now matches
  the supported `후손` wording at `33884`. This supersedes the earlier
  evidence-limited hold and adds one newly identified candidate.
- Candidate `33884` was already reconciled in the `33750`-`33999` pass and is
  not counted twice. The 19 in-range candidates plus newly identified
  `40025` add 20 unique reconciled IDs.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `40002` | Verified the existing natural correction that shows the sister what was found, rather than sounding like a challenge. |
| `40009` | Verified the nearby-but-unidentified referent and natural `목소리가 들렸으니, 틀림없이 가까이 있어.` |
| `40025` | Corrected `후계자` to `후손` to match exact-source duplicate `33884`; both Japanese rows use `末裔`. |
| `40034` | Verified `메이지의 행운(Maisie's Luck)` and `메이지 칼훈(Maisie Calhoun)` against established corpus usage. |
| `40041` | Verified the full `하마 팟헬름(Hama Pot-Helm)` and `포르텐마르(Fortenmar)` pairings. |
| `40052` | Verified `닐 케른(Nil Kern)` is paired in the active text. Retained the later user-applied Korean spelling; do not silently restore the older `닐 컨` proposal. |
| `40074` | Verified the precise `화장해` correction for `cremate`. |
| `40095` | Verified the complete `마녀 기사 말윈(Witch Knight Malwyn)` pairing. |
| `40100` | Verified the utterance now uses a consistent conversational register. |
| `40105` | Verified the selected `장인의 동물성 지방(Master's Tallow)` term. |
| `40127` | Verified the natural storeroom location and instruction to pick any lock down there. |
| `40149` | Verified `짓눌리면` preserves the danger of being crushed before escape. |
| `40176` | Verified both mentions of `몰리(Molly)` are paired. The bare `Sativa` remains without an invented English gloss; see the hold below. |
| `40179` | Verified the named spell as `구속의 원(Circle of Holding) 주문`. |
| `40204` | Verified `아냐, 시간이 더 필요해.` as a natural refusal to proceed yet. |
| `40213` | Verified `한릭(Hanrik)` is paired in the journal entry. |
| `40215` | Verified the established `그리아마르(Gryamar)` spelling. |
| `40231` | Verified both `프로마(Froma)` and `나그(Nag)` are paired. |
| `40237` | Verified `강연` for `lecture` and the consistent conversational address; no speaker is inferred. |
| `40246` | Verified the full `추방자 사이단(Cydan the Outcast)` pairing and separate exiled-prince description. |

## Linked Consistency

- Exact-source rows `33884` and `40025` now have identical Korean. Their
  English, Japanese, and Chinese source strings are identical; the Japanese
  `末裔` supports `후손`, not a distinct successor role.
- The English duplicate group `Hello.` has a source-supported Korean register
  difference: `62194` pairs Japanese `こんにちは` with `안녕하세요.`, while
  the informal Japanese `やあ` rows use `안녕.`. No global rewrite is needed.
- `4710` / `40132` both say `Mine` in English, but Japanese distinguishes
  `鉱山` from `地雷`; the Korean `광산` / `지뢰` distinction is supported.
- The related Sativa rows `15532`, `40176`, and `63566` concern the
  alchemical plant/fiber. The reviewed `Sativa` terminology decision keeps
  bare `Sativa` separate from atomic names such as `Sativa Fibers`; no global
  bare-name gloss was added.
- No speaker identity or playback order was inferred from asset associations.

## Evidence-Limited Holds

The remaining unresolved issues are `40051` (conflicting source nuance),
`40052` (Burren Cove / jail location conflict), `40052` (the separate
cross-corpus `Nil Kern` spelling discrepancy), `40089` (Pledgeshield's role),
`40132` (the English `Mine` ambiguity, despite the Japanese-supported
`지뢰` wording), and `40176` (whether bare `Sativa` is a named item or plant
reference). These remain provisional rather than being guessed or globally
normalized.

## Verification

- All 19 existing candidates and the newly identified `40025` were
  dispositioned; candidate `33884` was not counted twice.
- One Korean row changed in this pass: `40025`. Its four-language source
  fingerprint was refreshed.
- All 65,135 ledger fingerprints and index, asset-catalog, and ID-catalog
  reproducibility checks passed.
- The 11 CSV-preservation tests and nine dialogue-context tests passed.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR. The CRLF-aware diff check
  passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

Candidate reconciliation now covers 2,579 / 4,018 (64.19%), with 1,439
remaining.
