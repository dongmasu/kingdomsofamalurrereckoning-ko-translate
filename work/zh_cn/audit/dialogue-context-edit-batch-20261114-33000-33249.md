# Dialogue Context Translation Edit Batch: IDs `33000`-`33249`

- Date: 2026-11-14.
- Rechecked the in-range candidates and linked consistency rows against
  English, Japanese, Chinese, and active Korean. English anchored meaning;
  Japanese guided voice and layout; Chinese was supporting evidence.
- Reconciled 23 unique Korean rows with their ledger fingerprints. The
  reviewed set includes 16 IDs in this range and seven linked IDs outside it.
- No speaker identity or playback order was inferred from asset membership.

## Applied And Confirmed

| ID(s) | Correction or disposition |
| --- | --- |
| `8289`, `33098` | Standardized both exact `The Road Patrol` labels as `도로 순찰대(The Road Patrol)`. |
| `30849` and 19 linked IDs | Completed `King of Cups` pairing. All 20 `Irion, King of Cups` rows now read `컵의 왕(King of Cups) 이리온(Irion)`. |
| `26551`, `26805`, `33141`, `33266`, `34152`, `45816` | Aligned all six `Aster family` references to `애스터(Aster) 가문`; `Scaith` is also paired at `26551`. |
| `33089` | Paired `듀렉(Durek)` in the inscription; all verse breaks and attribution remain intact. |
| `33102` | Restored the established full form `백색의 닐(Nil the White)`. |
| `33109`, `33113` | Matched the conversational register of the English/Japanese source; `33113` now consistently addresses the listener in plain speech. |
| `33120` | Recast the gem-removal service offer naturally and politely without changing its address term. |
| `33128` | Strengthened `Decayed Estate` to `황폐한 저택(Decayed Estate)`. |
| `33130` | The proposed `counter-ward` correction was already present as `대항 주문(counter-ward)`; retained it after checking the complete tale. |
| `33150` | Paired the office as `대현자(Archsage)` while retaining Jubal Caledus's name pairing. |
| `33166` | Paired the complete item label `Flawless Mitharan Mystic Grip`. |
| `33194`, `16617` | Aligned the exact-English duplicate dialogue; both now end with `보상을 줄게`. |
| `33195` | Paired the complete document title `Log of the Frostbreak Voyage`. |
| `33203` | Naturalized the brief response as conversational plain speech. |
| `33247` | Recast the response in consistent plain speech and preserved the source's polishing detail. |
| `33248` | Clarified that Mithros is reopening its border to the Faelands. |

The complete 20-row `Irion, King of Cups` group and both `The Road Patrol`
labels were checked together. The six Aster-family rows now use one Korean
spelling and complete English pairing. `33004` and `33018` already had their
supported name/title pairings and were retained.

## Retained And Held

- Existing source-supported translations were retained where no correction
  was needed.
- The evidence-limited holds at `33095`, `33096`, `33149`, `33186`, and
  `33234` remain unresolved; their competing source readings were not guessed.
- Other prior candidates and holds in the range retain their recorded
  dispositions unless listed above.

## Verification

- Refreshed only the 23 reviewed IDs' `source_fingerprint` fields. The full
  65,135-ID ledger validates against English, Japanese, Chinese, and Korean.
- Confirmed the exact-English `Irion` group has 20 identical Korean labels,
  the `The Road Patrol` group has two identical Korean labels, and
  `16617`/`33194` have identical Korean dialogue.
- The active `default` CSV retains its UTF-8 BOM, 65,135 ordered records,
  71,838 CRLF sequences, 244 LF-only sequences, and no bare CR.
- Index and both catalogs reproduce. All 20 CSV-preservation and
  context-index tests pass; the CRLF-aware `git diff --check` is clean.
- No source CSV, extracted game asset, or game binary was modified. No
  commit was made.

The next sequential application range is `33250`-`33499`.
