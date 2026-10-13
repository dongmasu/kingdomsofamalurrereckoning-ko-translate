# Consolidated `affix` Residual Sweep (D-19561)

- Date: 2026-10-12; decision D-19561.
- Scope: 35 Chinese-only fallback rows: IDs 101, 115, 117, 124, 255, 341,
  and 496 at variants 12, 14, 21, 22, and 24.
- English is the semantic authority; Japanese informs voice/form; Chinese
  and other locale rows are supporting evidence.

## Findings

| ID / variants | English `FF` | Active Korean | Disposition | Reconciliation |
| --- | --- | --- | --- | --- |
| 101 / 12, 14, 21, 22, 24 | `Favors's` | `호의의` | uncertain | The English source remains malformed. Default ID 15844's Fate-related favor is not tied to this affix; sibling readings still range across favor, fortune, gifts, and patronage. |
| 115 / 12, 14, 21, 22, 24 | `of the Reckoned` | `*심판받은 자*` | uncertain; linked to D-18173 | The exact person/effect and a safe Korean rendering remain unsettled. No new item or effect link was found. |
| 117 / 12, 14, 21, 22, 24 | `Fortune's` | `행운의` | uncertain; linked to D-18175 | Generic fate/fortune text and the `Maid of Fortune` ship do not identify the affix referent. |
| 124 / 12, 14, 21, 22, 24 | `Ruin's` | `폐허의` | uncertain | Physical ruins, destruction/doom, and a named force remain possible; corpus uses do not identify the modifier's target. |
| 255 / 12, 14, 21, 22, 24 | `Kismet's` | `키스멧의` | uncertain | English/German/Italian preserve Kismet while other locales interpret fate, predetermination, existential, or fatalistic senses. |
| 341 / 12, 14, 21, 22, 24 | `of Clairy` | `*클레어리*` | uncertain | English/Japanese/German/French support a name; Spanish/Italian/Russian support clarity. No composition or lore context resolves the source conflict. |
| 496 / 12, 14, 21, 22, 24 | `Prime` | `최상급` | uncertain | Primeval/fundamental/first/supreme/elite readings remain; the equipment tier or effect is not identified. |

Direct source-row inspection confirms the English `FF` strings above and
the Chinese fallback values. Japanese has only the source-matched variant
11 for these entries; the archived Korean sibling was checked as a drafting
reference, not as proof of the `zh_cn`-only variant meaning. Targeted corpus
searches and the preceding D-19547 through D-19549 linked-context reviews
provide no new item/effect evidence that would safely authorize a text edit.
The existing dispositions are therefore retained.

## Inventory Reconciliation

The active Korean `affix` CSV contains `*심판받은 자*` for ID 115 in all
six active variants. Five fallback inventory rows had stale
`Korean_candidate` values `심판받은 자의`; these were corrected to the
active candidate. The separate `Japanese_sibling_variants` value
`11=심판받은 자의` remains accurate for the archived Japanese-derived
sibling. This metadata-only correction changes no translation decision.

## Counts and Integrity

- No active Korean CSV cells changed; no CSV backup was required.
- Active `affix` SHA-256 remains
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- The 55 Chinese-only fallback keys remain 10 accepted / 10 `not an issue`
  / 35 uncertain. Across all 140 fallback keys, the tally remains 10 / 95 /
  35.
- Corrected fallback inventory SHA-256:
  `8554f891ccf10edfbd259e95d44a3de608e354ecce6ec90d64aae367f44aec09`.
- Default totals remain **2,458 accepted / 25,352 not an issue / 10,714
  uncertain** (38,524), with four residual default holds.
- The inventory hash is recorded in the current handoff after validation.

These working dispositions are not independent final linguistic approval.

## Resume

D-19562 rechecked the four default holds together. After that sweep, retain
all four as unresolved: 62755, 62792, 62796, and 62867. Continue only if
new item/lore evidence, an authoritative Korean term, or another exact
parallel becomes available; do not repeat source-only comparisons for IDs
115 or 117 or double-count their linked decisions.
