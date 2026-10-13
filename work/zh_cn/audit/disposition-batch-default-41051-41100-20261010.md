# Disposition Batch: `default` IDs 41051-41100

- Date: 2026-10-10. Reconciled the existing preliminary scan with all 50
  active rows, immutable English/Japanese/Chinese, historical decisions, and
  established terminology.
- Decisions: two accepted, one `not an issue`, three uncertain.
- CSV edits: 41075 and 41083.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 41075 | Accepted | Replace the inconsistent player-title `선택받은 자여` with the established `부름받은 자여` (D-692); keep the sacrifice/mission sense open only where the source warrants it. |
| 41083 | Accepted | Correct the grammatical relationship: reagents are used when crafting potions at alchemy workbenches. Preserve all four localized marker identities/order and `{LINE_SPACE}`. |
| 41056-41057, 41076, 41087, 41090, 41095 | Uncertain | Malformed English, impact/senses ambiguity, Cliffbreak Fasting, antecedent of `them`, fragmentary item text, and incomplete `{*1` token need context/source investigation; do not patch the malformed marker. |
| 41054-41055, 41060, 41063, 41067-41068, 41070, 41072-41074, 41084-41085, 41094, 41099 | Uncertain | Detyre, Baronett, Sidhe, Sparrows, scavs, Champion, Praetorian Watch, Bloodbane, young races, Headhunters, Paling Wand, Crows, Dverga, and Envenomed Edge require name/category/context review. |
| 41073, 41078, 41093 | Uncertain | “Young races,” crypts beneath the sewers, and whether `[DO NOT USE]` is display text need contextual confirmation. |
| Other IDs 41051-41100 | Not an issue | No additional supported correction; numeric values, warning text, line breaks, and source marker structures are preserved. |

Decision IDs D-12886 through D-12891. The two targeted `Texto` edits reuse
the approved Beckoned title and correct the reagent instruction's syntax.
No row count, numeric value, line break, or marker identity/order changed.
The active CSV retains its UTF-8 BOM, 72,046 CRLF and 39 bare-LF endings;
SHA-256:
`0eb7f7dfc496a18995c8eb29b5f3f23f8462da4c43d5d148deab5c94c9ce9c0c`.
Disposition complete through 41100; resume 41101 (24,034 default IDs remain
through 65134).
