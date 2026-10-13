# Disposition Batch: `default` IDs 58751-58800

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 34 `not an issue` IDs, and 16 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The pre-batch CSV matched the preceding checkpoint and was backed up
  byte-for-byte before disposition. No translation CSV cells changed.

## Accepted Corrections

No translation CSV cells were changed. The uncertain findings require
context or terminology evidence that is not available in these rows; the
remaining translations preserve the evident English meaning and structure.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17760 | 58754 | `Dove` may be an affectionate vocative; Japanese omits it and Chinese reads it as “peacemaker.” The gem-flaw advice is retained, but the address needs speaker context. |
| D-17761 | 58758 | The family reaction and tavern visit are preserved; canonical Wyvyrn-Gifre spelling and name treatment remain open. |
| D-17762 | 58763 | The wrecked commerce-raider source, Ljosalfar style, maker's mark, and blade inscription are retained; the compressed item/ship referent needs context. |
| D-17763 | 58764 | The sibling contrast and bookish self-deprecation are preserved; Ram's canonical name spelling varies across locales. |
| D-17764 | 58770 | `Brash` can mean bold, reckless, or overconfident; locales differ on the precise trait, and Kaleva's name form is provisional. |
| D-17765 | 58774 | Cryamor and Bareth being `gone` is preserved; whether this means death or departure is unresolved. |
| D-17766 | 58776 | Fel's investigation is retained; capitalized `Adept` may be a formal rank, and the Korean rank/name forms need context. |
| D-17767 | 58778 | The level-5 Familiar Mastery condition is preserved; player-facing requirement versus internal resource label is unknown. |
| D-17768 | 58779 | The DLC2 and Primal Damage testing purpose is explicit; whether this staff text is an internal test asset remains unverified. |
| D-17769 | 58783 | The restriction on entering the Court is preserved; `Court of Enchantments` has competing Korean institutional-name forms across locales. |
| D-17770 | 58784 | Tari's execution and local custom are retained; the canonical Korean place-name form for Gallows End remains inconsistent. |
| D-17771 | 58789 | The staff's cold touch and resemblance to Sorrows Tree wood are retained; the tree/place name and whether the entity is formally named remain open. |
| D-17772 | 58790 | The embassy introduction and bloodied-waters image are preserved; the epithet's idiomatic Korean form and Odvar spelling need alignment. |
| D-17773 | 58793 | The former trading role and sister-city relation are retained; the feminine antecedent and exact place identity need quest context. |
| D-17774 | 58797 | Reciprocal belonging is retained, but Korean expresses one side as ownership and the other as being part of the land; intended symmetry remains unclear. |
| D-17775 | 58798 | English capitalizes `Counsel`, while Japanese/Chinese indicate an adviser and Korean uses `평의회` (Council). Possible source typo remains unresolved; neither side is silently changed. |

## Not an Issue

Decision D-17776 records these 34 IDs: 58751-58753, 58755-58757,
58759-58762, 58765-58769, 58771-58773, 58775, 58777, 58780-58782,
58785-58788, 58791-58792, 58794-58796, and 58799-58800. These rows preserve
the evident English meaning, voice/register, values, and structure. The UI
label at 58752 consistently uses `분해` for salvage; the village dialogue at
58771 retains its exclusionary meaning; and the quantities at 58799/58800
remain eight labors and ten years.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58751-58800 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The Mark of Flame description at 58781 retains two embedded line breaks
  and its three-line layout in all locales. Five targets, 220 Fire Damage,
  30 Burning Damage, and 10/42 Mana costs are preserved.
- The second-floor value at 58713 in the previous batch and the eight tasks
  at 58799 remain consistent; this batch preserves the ten-year interval at
  58800. No runtime-marker discrepancy was found.
- Reconciled the source-keyed historical prompts for IDs 58750-58849.
  Unresolved applicable prompts are recorded above; no candidate was
  promoted to an accepted correction without a demonstrated Korean defect
  and a supported replacement.
- The preliminary scan's stored active-default hash differs from the actual
  pre-batch checkpoint. The checkpoint and byte-identical backup both
  verified as `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`;
  the scan hash was not used as the review baseline.
- The active default CSV remains at SHA-256
  `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58751/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`).

D-17760-D-17775 record 16 uncertain findings; D-17776 records the remaining
34 `not an issue` IDs. Direct register totals: 1,716 accepted, 12,684
`not an issue`, and 11,176 uncertain (25,576 total); next D-17777.

Resume at `default` ID 58801; 6,334 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
