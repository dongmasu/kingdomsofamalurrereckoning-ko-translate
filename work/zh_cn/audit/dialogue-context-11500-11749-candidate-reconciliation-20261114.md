# Candidate Reconciliation: IDs `11500`-`11749`

- Date: 2026-11-14.
- Scope: all 11 not-yet-reconciled candidates in this range, checked against
  English meaning, Japanese voice/register/layout, Chinese supporting
  evidence, active Korean, and linked terminology/context records.
- Nine candidates have supported corrections: six were changed in this pass
  and three were already corrected and were reverified. Two more already
  matched the evidence. Candidate `11619` was reconciled as a related
  Onarach row in the preceding range and is not counted again here.
- Four additional, directly linked rows were corrected for consistency;
  these do not increase this range's candidate count.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `11536` | Corrected | Recast the objective as `샌드스톤 저택(Sandstone Villa) 개량하기`, matching the established house-upgrade term and concise objective form. |
| `11572` | Previously applied, confirmed | `네 덕분에 목숨을 건졌어` naturally conveys the life-debt gratitude and retains the informal, relieved tone. |
| `11581` | Confirmed | The sentence is natural and already uses `은둔 대장장이(Hermit Smith)`. All nine explicit `Hermit Smith` source uses in the linked term set now consistently use that paired form. |
| `11599` | Previously applied, confirmed / separate hold | The `groover` and `assayer` references now match the supported `홈 파는 광부` and `감정사` terms. The other specialized mining terms remain evidence-limited; no broader technical interpretation was guessed. |
| `11617` | Corrected | Changed the prison-spell `원` to `마법진`, matching English context, Japanese `サークル`, and the same-quest terminology. The other linked circle references were already consistent. |
| `11660` | Corrected | Added the supported `Winter Fae` pairing and recast the full sentence naturally. Its exact-English duplicate at `7332` was aligned to identical Korean; the uncertain cousin/friend nuance remains source-limited. |
| `11678` | Previously applied, confirmed | The deed description no longer stacks possessives and preserves the ownership and mineral-rights details. |
| `11684` | Confirmed | `처형인(Headsman)` is correctly paired and matches the established wording across the repeated named-adversary references. |
| `11704` | Corrected | Replaced the awkward `절벽턱` with `바위턱` for the ledge overlooking the route; the directions remain clear and conversational. |
| `11728` | Corrected | Aligned `animal meat` to the quest's established `동물 고기` and retained the journal's descriptive style. |
| `11740` | Corrected | Changed the imperative objective to `허크 애드월드(Herc Adwold)에게 돌아가기`. |

## Related Consistency

- The Sandstone Villa upgrade group (`10464`, `10866`, `11536`, `44143`,
  `49479`, `60389`) now uses `개량`; objective text uses the `-하기` form.
  `60389` was corrected outside this candidate range.
- The same Winter-cousin sentence at `7332` and `11660` now has identical
  Korean. Related plural wording at `20620` now explicitly pairs
  `겨울 페이(Winter Fae)` while preserving the kinship reference.
- Bera's `animal meat` references at `11728` and `37057` now match the
  `동물 고기` objective/UI labels (`32880`, `51780`, `53459`). The
  inn-name pairing `목마른 자작나무 여관(Thirsty Birch)` is present in
  both sentences. The distinct raw-meat description at `34322` remains
  `날고기`.
- The full exact-use set for `Hermit Smith` (`8360`, `10939`, `11581`,
  `12164`, `14861`, `19097`, `28676`, `28839`, `59710`) was checked; all
  already use the same paired Korean form.
- Refreshed only the ten changed IDs' `source_fingerprint` values:
  `7332`, `11536`, `11617`, `11660`, `11704`, `11728`, `11740`, `20620`,
  `37057`, and `60389`. The three previously applied candidate rows already
  had current fingerprints.

## Verification

- All 11 in-range candidates are reconciled; cumulative sequential candidate
  reconciliation is 705 / 4,015 (17.56%), with 3,310 remaining.
- The full review ledger validates all 65,135 reviewed IDs.
- The generated quest-asset index and both catalogs reproduce exactly.
- CSV preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- The `7332` and `11660` exact-English duplicate rows now have identical
  Korean. Existing embedded line breaks and runtime tokens are unchanged.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was changed.
