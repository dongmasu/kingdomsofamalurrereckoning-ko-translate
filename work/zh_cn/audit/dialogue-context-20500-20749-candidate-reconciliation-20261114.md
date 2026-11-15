# Candidate Reconciliation: IDs `20500`-`20749`

- Date: 2026-11-14.
- Rechecked all 10 current ledger candidates against the active Korean CSV
  and the English, Japanese, and Chinese rows.
- Nine supported corrections were already present. The remaining candidate,
  `20671`, was cleared without editing because English and Japanese support
  the current reading.
- No speaker or playback order was inferred from asset association.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `20504` | Confirmed the complete title `갑옷 분쇄의 저주(Curse of Armorcrush)`. |
| `20529` | Confirmed `어떤 식으로든 이 일은 곧 끝날 거야`, a prediction rather than an unsupported promise to end it personally. |
| `20577` | Confirmed the complete place-name pairing `하이 풀겐(High Fulgen)`. |
| `20622` | Confirmed the established `대장기술` term and preserved the recipe quantities and blank-line layout. |
| `20671` | Retained `예전 같았으면 ... 취약하지 않았을 텐데`; English `In other times` and Japanese `普通` support the ordinary/otherwise reading, so the conflicting Chinese past-time rendering alone does not justify changing it. |
| `20674` | Confirmed the compact action objective `농민 옷 모으기`. |
| `20675` | Confirmed the consistent conversational request `이제 손님들을 맞아야 하니, 이만 가 줘. 좋은 주인으로 있고 싶거든.` |
| `20704` | Confirmed `노움은 믿을 만하다는 거 알잖아`, which expresses the idiom's point before explaining that gnomes have no time for lies. |
| `20713` | Confirmed the complete label `수석 안내인 리아나(Master Guide Liana)`. |
| `20742` | Retained `사그렐 부인(Lady Sagrell)`. The later `여사` decision was scoped to Hartwen and is not generalized to Sagrell. |

## Evidence-Limited Items

The existing holds at `20502`, `20573`, `20576`, `20615`, `20638`, `20657`,
`20696`, and `20726` remain unresolved. The available rows do not establish
the referent, source-language priority, interaction stage, or UI text type
needed to settle them.

## Verification

- All 10 in-range candidates have an explicit disposition in the accompanying
  manifest.
- No Korean text or source fingerprint changed in this pass.
- Candidate reconciliation now covers 1,148 of 4,015 IDs (28.59%), leaving
  2,867. Evidence-limited items remain unresolved.
- Source CSVs and extracted game assets were not changed.
- No commit was made.
