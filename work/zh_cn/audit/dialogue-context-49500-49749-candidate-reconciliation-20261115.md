# Candidate Application Reconciliation: IDs `49500`-`49749`

- Date: 2026-11-15.
- Rechecked the 12 current candidates from the sequential range report and
  three older active ledger candidates against English, Japanese, Chinese,
  current Korean, and prior application/context records.
- Twelve in-range candidates are newly reconciled. `49642`, `49700`, and
  `49701` were already reconciled in the `46000`-`51999` application.
- Three source-supported Korean corrections were applied at `49608`, `49652`,
  and `49692`. The other nine in-range candidates already have supported text.
- `49652` had previously been marked `not-issue` in its asset review, but the
  current source comparison exposed a distinct meaning issue; it was corrected
  and tracked as a reopened finding, outside the historical candidate-pool
  tally.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `49510` | Retained | `하드루스 르웰린(Hadrus Llewellyn)` and the full book title `세데아스, 수정 방벽(Sedeas, the Crystal Weir)` are paired. |
| `49530` | Retained | The named greatsword is `신사의 호의(Gentleman's Favor)`; the father's sword and its theft remain clear. |
| `49540` | Retained | The complete role and name appear as `치유사 그린(Green the Healer)`. |
| `49565` | Retained | `사반트들(Savants)` preserves the established rank and source pairing. |
| `49608` | Corrected | Rephrased the preselected-abilities sentence for naturalness; all five localized wrappers retain their identities and English order. |
| `49616` | Retained | `와이번-기프르(Wyvyrn-Gifre) 가문` is paired, while the requested objects and their locations remain distinct. |
| `49631` | Retained | `해스테 에이드링(Haeste Aedring)` and `구드울프 여사(Lady Gudwulf)` are fully paired. |
| `49652` | Reopened and corrected | Clarified that raising a blade means defending the prisoners, not attacking them. English supports the threat's exception; Japanese and Chinese support the same broad reading. |
| `49692` | Corrected | Changed the standalone label to glossary-standard `마녀 기사 아니라(Anira)`, avoiding the English conjunction-like `아니라` and a duplicate title inside parentheses. |
| `49702` | Retained | `흐느끼는 눈(Crying Eyes)` uses the established entity name; the arrival and promise to explain it are preserved. |
| `49718` | Retained | The effect remains an instruction to add 120 Poison Damage to Smoke Bomb for five seconds. |
| `49731` | Retained | `장엄한 종(Solemn Bell)` and `옛 집회장` match established terminology and the meeting-hall sense. |
| `49642` | Previously reconciled | `책의 지시 따르기` was applied in the earlier `46000`-`51999` batch. |
| `49700` | Previously reconciled | The current line uses `칙허장` and pairs `고든(Gordon)`, as recorded in the earlier batch. |
| `49701` | Previously reconciled | The current line identifies Venris's pet as a wolf and preserves their close bond. |

## Separate Holds

The 13 evidence-limited holds in the sequential range report remain
unchanged. Asset links were not treated as proof of individual speaker or
dialogue order.

## Verification

- The three edits used `tools/replace_text_preserve_eol.py` by exact ID and
  expected old text.
- Refreshed only the three corresponding ledger `source_fingerprint` values;
  all other ledger fields and rows were preserved.
- The five display wrappers at `49608` remain in source order. No embedded
  line breaks or runtime tokens were added, removed, or reordered.
- Candidate reconciliation is now `3,236 / 4,026` (`80.38%`), with `790`
  remaining. This cumulative figure excludes reopened `49652`, which was not
  in the active candidate pool before this review.
- See the machine-readable
  [decision manifest](dialogue-context-final-edits-followup-49500-49749-20261115.json).
