# Candidate Reconciliation: IDs `11000`-`11249`

- Date: 2026-11-14.
- Scope: all ten current `overall=candidate` IDs in this range, checked against
  English meaning, Japanese voice/register/layout, Chinese supporting evidence,
  active Korean, and linked terminology/context records.
- Four remaining corrections were applied; five candidates already reflected
  in Korean were confirmed, and one was retained with its full name and title
  already paired. The linked candidate at `11619` was corrected with `11022`
  for the same Onarach spelling and naturalness issue.
- Asset association was not used to infer individual speakers or playback
  order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `11022` | Corrected | Changed the unsupported `오나라흐` to the established `오나락(Onarach)` and streamlined the sentence while retaining the circlet, gem, Rose of Kandrian, named crown, and Hendi's role. |
| `11038` | Corrected | Fixed the ungrammatical `악당에 겁쟁이` and restored the repeated agreement in English: `그래, 네 말이 맞아. 맞아. 난 악당이자 겁쟁이지만, 너라도 똑같이 했을 거야.` |
| `11069` | Confirmed | The alchemy term is `시약`; quantities, ingredient names, and existing line breaks are preserved. The separate Sativa ingredient reading remains unresolved. |
| `11101` | Corrected | Removed the unsupported additive `도`: `네가 한 일이야. 네 책임이야.` |
| `11102` | Confirmed | The nickname is paired as `첫째(First)`. The compressed final fragment remains unresolved rather than being expanded by guess. |
| `11125` | Confirmed | `에픽 보석` follows the official Korean manual; the separate `pristine quality` tier is not reinterpreted. |
| `11136` | Confirmed | `예언자(Augur)와 그 일행` avoids the unsupported disparaging `일당` while retaining the accountability request. |
| `11172` | Retained | All 26 exact-English `Argine, Queen of Staves` entries share the same Korean text, `아르진(Argine), 지팡이의 여왕(Queen of Staves)`. Both name and title are paired; no change is needed to restore consistency. |
| `11194` | Confirmed | The contrast in `my true voice` is retained as `내 본래 목소리`; both sentences remain conversational and source-faithful. |
| `11210` | Corrected | Changed the imperative objective to the established action form `코흐 대위(Captain Koch)에게 돌아가기`. |

## Related Consistency

- Corrected `오나락(Onarach)` at both `11022` and related candidate `11619`,
  consistent with established references such as `500` and `52736`.
- At `11619`, changed the awkward “visitors are not rare” construction to
  `여기 오나락(Onarach)에는 손님이 잘 안 와... 무슨 일이지?`, matching
  English, Japanese, and Chinese.
- Refreshed only the five changed IDs' four-language `source_fingerprint`
  values: `11022`, `11038`, `11101`, `11210`, and `11619`.

## Verification

- All ten in-range candidates and the linked candidate at `11619` are
  reconciled; cumulative sequential candidate reconciliation is 686 / 4,015
  (17.09%), with 3,329 not yet reconciled.
- The full review ledger validates all 65,135 reviewed IDs.
- The generated quest-asset index and both catalogs reproduce exactly.
- CSV preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was changed.
