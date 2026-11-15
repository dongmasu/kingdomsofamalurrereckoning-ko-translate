# Candidate Reconciliation: IDs `2500`-`2749`

- Date: 2026-11-14.
- Rechecked all 19 current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, the active Korean CSV, and linked evidence.
- Five in-range candidates received source-supported corrections; 14 were
  retained because their current translation already reflected the evidence.
- Six related candidate IDs outside the interval were also reconciled:
  two title corrections and four rows already consistent.
- Seven unique CSV rows were changed. No speaker or playback order was
  inferred from asset association.

## Applied Corrections

At `2606`, Japanese `微妙な秘密` and Chinese `微妙的秘密` support
`미묘한 비밀`, rather than the redundant and less precise `은밀한 비밀`.
The complete standalone title is now paired as
`미묘한 비밀(A Delicate Secret)`.

At `2611`, the tutorial now describes colored damage values naturally:
green means the enemy is vulnerable to that damage type; red means it shows
resistance to that type. The existing `{*1...}` wrappers remain in place.

At `2637` and `2737`, the dialogue objectives now use the established action
form: `에샤(Esha)와 대화하기` and `오머 보가드(Ommer Vogard)와 대화하기`.

At `2639`, the prose was recast as a compact, rhythmic verse. It retains the
rumor, the assurance of the seer's reign, Grim Onwig's coup, and the
Hierophant's threat, and now pairs `그림 온위그(Grim Onwig)`.

## Related Master Belne Group

The title is now consistent at `4422` and `4925` as
`마스터 벨른(Master Belne)`, matching already-correct `21983`, `52000`, and
`56416`.

At `2701`, lowercase `master makers` is a generic description of artisans;
the established broad `장인` remains appropriate. Capitalized `Master Makers`
at `4925` names the group and is already paired as `명장들(Master Makers)`.
The unresolved status of `Winter Lands` was not inferred or changed.

## Retained

- `2504` and `2512` already pair the complete titles `Escape from the
  Catacombs` and `Smuggler's Notes`.
- `2546` already uses the established `틱네리(Ticneri)` spelling and natural
  particle `한테는`.
- `2558` already pairs the signature as `마운(Maun)` and preserves the note's
  paragraph breaks.
- `2561` already pairs both names in `부두(The Quays)와 번(The Burn)`.
- `2647` already uses `챔피언의 저택(Champion's Manor)`, consistent with the
  other five current occurrences; `1498` was reconciled in its earlier range.
- `2665`, `2688`, `2703`, and `2723` already have complete pairings for Wulf,
  Gnomish Sentry, Ice Wolf, and Mage of Cups.
- `2682` already uses the natural `명장급 대장장이`.
- `2716` and the other nine Century Plants references already use
  `백년초(Century Plants)`.
- `2732` naturally conveys disagreement with Titarion's neutrality and the
  belief that his Fae subjects could be persuaded to join the battle.
- Related `30588` already names the item `코라 꽃잎(Kora Petal)`, resolving
  the linked naming candidate without another edit.
- Related `21983`, `52000`, and `56416` already use the complete
  `마스터 벨른(Master Belne)` form.

## Verification

- All 19 current candidate IDs in the range and six related candidate IDs
  have recorded decisions in the machine-readable manifest.
- Five in-range IDs and two related IDs were edited; only those seven
  fingerprints were refreshed.
- The full review ledger, CSV-preservation and context-index regression
  suites, context index/catalog reproducibility, CSV record/order/BOM/newline
  checks, and CRLF-aware diff check passed.
- Candidate reconciliation now covers 163 of 4,015 current candidates
  (4.06%). The remaining pool is still incomplete.
- No commit was made.
