# Candidate Application Reconciliation: IDs `50750`-`50999`

- Date: 2026-11-15.
- Rechecked the 14 proposals in the sequential report against current Korean,
  English, Japanese, Chinese, and earlier ID-scoped decisions.
- Eleven in-range active ledger candidates were newly reconciled.
  `50951` had already been reconciled with the `FFQ03` ingredient group.
- Corrected `50765` and its exact four-language duplicate `58929`, plus
  reopened item `50844`. The latter was previously marked not-issue in an
  asset review; the same-ID source comparison supports the correction.
- The other active candidates already have supported wording. `50751` and
  `50816` remain not-issue; the latter already uses the consistent polite
  first-person form `제 생각엔`.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `50751` | Retained | The existing `FFQ71` review marked this not-issue. The current direct request and address to the Hero remain understandable; no individual speaker or playback position is inferred from the linked asset. |
| `50765` | Corrected | Reworked the cane/crutch image so the ruin, the youth-draining metaphor, and the speaker's knowledge read in sequence. Preserved all 12 embedded line breaks. |
| `50816` | Retained | The current `네...`, `제 생각엔`, and polite endings are internally consistent and fit Japanese/Chinese. |
| `50835` | Retained | The sentence clearly says lords do not spare expense when dressing mercenaries in distinctive armor. |
| `50836` | Retained | The current item label uses established `흠 없는` and preserves Mitharan, Amplified, and Rivets. |
| `50844` | Reopened and corrected | English says Sigra distributed the erroneous invoices from her husband's potion shop; Japanese and Chinese support her as the distributor. The revised Korean explicitly identifies her as the person who distributed them. The older ledger disposition is preserved as history. |
| `50853` | Retained | The current label uses `흠 없는` and preserves Mitharan, Enchanted, and Rivets. |
| `50876` | Retained | Both clauses now use conversational 해체, matching the Japanese source; no speaker is assigned from the asset association. |
| `50889` | Retained | The complete named title is paired as `스톤캔들 광산 기록(Stonecandle Mining Log)`. |
| `50891` | Retained | The current label uses `흠 없는` and retains Mitharan, Ravenous, and Hilt. |
| `50963` | Retained | Both questions are complete and natural; Ivar and Connovar are paired with their English names. |
| `50967` | Retained | The championship statement and challenge consistently use conversational 해체. |
| `50974` | Retained | The concise objective `성스러운 통로 찾기` follows the established `-기` form. |
| `50984` | Retained | `정예 돌격 부대` conveys `elite shock-troops`; the Legion, Alfar army, gauntlets, and battle context remain clear. |
| `50951` | Previously reconciled | The current `재료` wording remains supported by the plant-ingredient quest context and the related `FFQ03` rows. |

## Separate Holds

The four evidence-limited holds at `50834`, `50923`, `50980`, and `50997`
remain unchanged. The prior speaker and dialogue-order limits also remain:
asset links do not prove an individual line's speaker or playback order.

## Duplicate and Formatting Check

- `50765` and `58929` have identical English, Japanese, and Chinese source
  strings. Their Korean translations now match exactly as well.
- Both poem rows retain 13 displayed lines and 12 embedded line breaks.
- No runtime tokens or display markup were added, removed, or reordered.
- `50844` remains a journal entry, not dialogue; its correction does not
  assign a speaker.

## Verification

- Applied three ID-targeted edits with
  `tools/replace_text_preserve_eol.py`; only `Texto` changed in those rows.
- Refreshed only the `source_fingerprint` fields for `50765`, `50844`, and
  `58929`; all ledger dispositions and other fields remain unchanged.
- All 65,135 ledger fingerprints, the index and both catalog reproductions,
  11 CSV-preservation tests, nine context-index tests, row order, UTF-8 BOM,
  mixed line endings, and the CRLF-aware diff check passed.
- The active CSV has 65,135 ordered records, 71,839 CRLF endings, 242
  LF-only endings, and no bare CR endings.
- Candidate reconciliation is `3,292 / 4,026` (`81.77%`), with `734`
  remaining. The reopened `50844` finding is outside the historical
  candidate-pool tally.
- See the machine-readable
  [decision manifest](dialogue-context-final-edits-followup-50750-50999-20261115.json).
