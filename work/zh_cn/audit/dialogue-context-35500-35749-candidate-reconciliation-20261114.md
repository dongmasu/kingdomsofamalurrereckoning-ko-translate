# Candidate Reconciliation: IDs `35500`-`35749`

- Date: 2026-11-14.
- Rechecked all 38 current `overall=candidate` IDs against English, Japanese,
  Chinese, active Korean, and earlier edit/reconciliation decisions.
- `35580` and `35655` were directly reviewed as shared-source consistency
  cases in earlier candidate reconciliations; they are not counted again.
  The other 36 candidates are newly counted.
- Most proposed edits were already present. Two issues remained in the active
  Korean and were corrected: the question at `35565` and the syntax at
  `35594`.

## Candidate Decisions

| ID(s) | Decision and evidence |
| ---: | --- |
| `35510`, `35568`, `35581`, `35613`, `35644`, `35706` | Confirmed action-form objectives (`...하기`), matching the English actions and Japanese wording. |
| `35517` | Confirmed the complete standalone title `습격(The Raid)`. |
| `35537` | Confirmed `머드홀드 지하 통로(Mudhold Fasting)` from the Japanese/Chinese passage descriptions while preserving the exact English place label. |
| `35544` | Confirmed the revised warning names Dead Kel as the target while preserving the insult and plain voice. |
| `35546` | Confirmed `정확히는 남아 있던 시신을`; it clarifies the elliptical remains phrase without adding details. |
| `35549` | Retained the current card-game result: the four is higher than the first card, matching the English and Japanese high/low outcome. |
| `35552` | Confirmed the standalone name pairing `파르할(Farhal)`. |
| `35565` | Corrected the directive `그들에게 보상이라도 해` to the question `그들에게 보상이라도 하라는 거야?`; Japanese explicitly asks what amends are, and English supports the questioning reaction. |
| `35580` | Previously reviewed with `22613` and `25368`; the shared Cloudcrest/Hollowlands sentence is aligned. The separate continuation remains intact. |
| `35588` | Confirmed the consistent plain warning `조심해. 페이(Fae)가 목격됐어.` |
| `35593` | Confirmed the blunt, consistently plain register across the law/permission/warning statements. |
| `35594` | Recast the sentence as `아르케스(Arkes)의 지하 묘소에 오게 된다면 신들의 뜻 때문일 거라고 늘 생각했어. 그런데 지금 여기 온 건 오직 육신을 지닌 아노카토스(Anokatos)의 뜻 때문이야.` This preserves the gods-versus-flesh-and-blood Anokatos contrast without the difficult `존재인` construction. |
| `35604` | Confirmed `신탁자(Oracle)` to preserve its distinction from `Prophet` / `예언자`. |
| `35608` | Confirmed the complete W. Emundas and shop-name pairings while retaining the speaker's deliberate repetition. |
| `35615`, `35617`, `35621`, `35666`, `35667`, `35689`, `35715`, `35729`, `35739`, `35744` | Confirmed the complete English pairings for the item, title, creature, faction, and location labels. |
| `35618` | Confirmed `켈로렌 군단(Keloren's Legion)` as the named military unit and retained the distinct `Alfar Army` pairing. |
| `35623` | Confirmed the natural emphatic repetition `나는 세상을 공부하는 사람이야, 친구. 세상 말이야!` |
| `35625` | Confirmed the natural `여기 와서 건진 거라곤 이 지도뿐이야` rendering and preserved the speaker's uncertainty. |
| `35631` | Confirmed `메이지의 행운(Maisie's Luck)` in the journal explanation of the named ring. |
| `35633` | Confirmed `성스러운 연못(Sacred Pools)` and the count of five: English and Chinese say five, while Japanese alone differs. |
| `35645` | Confirmed the later letter-closing correction and preserved its paragraph breaks and signature. |
| `35655` | Previously reviewed with `25157` and `31547`; the shared sentence remains aligned and the distinct continuation is preserved. |
| `35663` | Confirmed `테스타먼트(Testament)` as the English pairing; its meaning remains held because the source languages disagree. |
| `35675` | Confirmed `영적인 일` for `ethereal matters`. Retain the current equipment term pending evidence that resolves `handwraps`. |

## Evidence-Limited Holds

- `35542`: Japanese is polite while Korean is casual; no per-key speaker or
  dialogue-stage mapping resolves the difference.
- `35555`: Japanese identifies `Tyrnoch's Eye`, but English and Chinese say
  `scrying mirror`; retain the generic Korean pending context.
- `35577`: English can describe support while Japanese describes a threat;
  the linked asset does not resolve intent.
- `35663`: `Testament` has conflicting trial/covenant readings in Japanese
  and Chinese; retain the transliteration rather than choosing a lore meaning.
- `35674`: `augmentations` does not establish whether the item is armor or
  equipment.
- `35695`: Japanese is polite while Korean uses marked 하오체; speaker and
  stage remain unmapped.
- `35698`: `Glass of Ambient` has materially different Japanese and Chinese
  readings; keep the current pairing.
- `35730`: the isolated `dwarf mariners` line does not establish the
  specific `Dverga` identity.

## Duplicate And Structure Checks

- Forty-nine exact-English duplicate groups (1,100 corpus rows) touch this
  range; Korean strings match within each full-string group. The shared-source
  findings at `35580` and `35655` were checked against their prior decisions.
- Embedded line-break counts match across all four languages. Runtime-token
  and markup order also matches Japanese and Chinese in every row; the known
  English wrapper-order difference at `35513` is documented in the sequential
  review.
- Asset associations remain grouping evidence only. No individual speaker or
  playback order was inferred.

## Verification

- Newly counted candidates: 36. Cumulative candidate reconciliation is
  2,244 / 4,015 (55.89%), with 1,771 not yet adjudicated.
- Only `35565` and `35594` changed in the active Korean CSV; only their
  `source_fingerprint` values were refreshed.
- All 65,135 ledger fingerprints validate. The generated index and both
  catalogs reproduce exactly. CSV-preservation and context-index tests: 20
  passed.
- The active CSV retains its UTF-8 BOM and exact newline inventory: 71,838
  CRLF, 244 LF-only, and no bare CR. CRLF-aware `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`35500`-`35749`](dialogue-context-default-35500-35749-revalidation-20261112.md)
and the prior application batch at
[`33500`-`35999`](dialogue-context-final-edits-33500-35999-20261114.json).
