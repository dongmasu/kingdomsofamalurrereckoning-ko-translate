# Candidate Reconciliation: IDs `10750`-`10999`

- Date: 2026-11-14.
- Scope: all 18 current `overall=candidate` IDs in this range, checked against
  English meaning, Japanese voice/register/layout, Chinese supporting evidence,
  active Korean, and linked terminology/context records.
- All 18 candidates now have supported dispositions: seven missing corrections
  were applied, and 11 corrections already reflected in the active Korean were
  confirmed. The separate evidence-limited meaning question at `10974` remains
  held; its supported name-pairing correction was applied independently.
- Asset association was not used to infer individual speakers or playback
  order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `10765` | Confirmed | The full location label is paired as `간차 중위의 무덤(Grave of Lieutenant Gancha)`. |
| `10778` | Corrected | Corrected the reversed delivery direction. `배달할 물건` reflects the courier's deliveries, supported by English, Japanese, and Chinese. |
| `10786` | Corrected | Completed the title/name pairing as `드레판 대장(Captain Drefan)`, matching the same person at `32414`, `34277`, and `42096`; `아리아드(Ariad)` and `커스우드(Cursewood)` remain paired. |
| `10809` | Confirmed | `reagents` is `시약`; the ingredient list, quantities, and existing line breaks are preserved. |
| `10814` | Confirmed | The blessing's closing wish no longer uses conspicuous 하오체 and remains prayer-like. |
| `10848` | Confirmed | `생존자들을 추슬러 모을게` naturally describes organizing the survivors and preserves the contrast with the player's task. |
| `10874` | Confirmed | The named person is paired as `로토스(Lotos)`. |
| `10897` | Confirmed | The joke retains its specific reference to `샌드스톤 저택(Sandstone Villa)` rather than a generic house size. |
| `10918` | Corrected | Recast the imperative objective as the established action label `알파르(Alfar) 귀걸이 모으기`. |
| `10925` | Confirmed | `야생 사냥(Wild Hunt)` and `대현자(Archsage)` are paired; eligibility is unchanged. |
| `10927` | Corrected | Replaced the awkward literal `신들에게 평화를 가져오려면` with `신들을 달래려면`, supported by Chinese and the parallel wording at `10184`. |
| `10939` | Confirmed | The role and objective are paired and phrased as `은둔 대장장이(Hermit Smith)의 도움 구하기`. |
| `10945` | Confirmed | The name and question are already aligned as `틱네리(Ticneri)에 대해 말해 줘.` |
| `10946` | Confirmed | Added English pairing without changing the Korean place form: `프리홀드(Freehold)`. |
| `10974` | Corrected / meaning held | Added the supported proper-name pairing `샘(The Font)`. The metaphor connecting the mockingbird and the Font's sole yield remains unresolved across the source languages, so its sentence meaning was not guessed at. |
| `10978` | Corrected | Added the missing epithet pairing and made the address natural: `물러서라, 먼지의 자식(Child of Dust)이여!` The existing Anira and Tuatha Deohn references remain intact. |
| `10985` | Corrected | Paired both named camps: `별 야영지(Star Camp)` and `달 야영지(Moon Camp)`. |
| `10994` | Confirmed | Integrated the localized armor label into the comparison and removed its duplicate display while preserving the `{*3...}` wrapper. |

## Related Consistency

- `Captain Drefan` is now paired consistently across `10786`, `32414`,
  `34277`, and `42096`; the existing respectful address at `32414` is retained.
- The `Font` reference at `10974` now follows the established `샘(The Font)`
  form. Only the name-format finding is closed; the ambiguous metaphor remains
  on hold.
- Refreshed only the seven changed IDs' four-language `source_fingerprint`
  values: `10778`, `10786`, `10918`, `10927`, `10974`, `10978`, and `10985`.

## Verification

- The full review ledger validates all 65,135 reviewed IDs.
- The generated quest-asset index and both catalogs reproduce exactly.
- CSV preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was changed.
- Cumulative sequential candidate reconciliation is 675 / 4,015 (16.81%);
  3,340 candidates remain unreconciled.
