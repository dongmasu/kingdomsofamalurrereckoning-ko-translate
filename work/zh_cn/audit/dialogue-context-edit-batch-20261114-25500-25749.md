# Dialogue Context Translation Edit Batch: IDs `25500`-`25749`

- Date: 2026-11-14.
- Rechecked the range's candidates against current English, Japanese, Chinese,
  and Korean. English guided meaning, Japanese guided voice and layout, and
  Chinese served as supporting evidence.
- Applied 13 candidate corrections and two related name/term updates.
  `25595` already matched the supported wording.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `25526`, `25553`, `25599` | Added complete English pairings for Mitharan Spiritweave Cloth, Hellbane, and Ancient Delfric. |
| `25534` | Paired the named period Long Winter. |
| `25549` | Corrected the direction of the first Fae migration into Amalur. |
| `25596` | Changed the unsupported romantic implication to the Maid's recognition. |
| `25627`, `25700`, `25713` | Smoothed Ordo's self-introduction, Ollie's player-directed instruction, and the change of addressee in the Lupoku line. |
| `25632` | Recast the formal letter closing as a natural Korean sign-off. |
| `25684` | Added the English epithet to Maire, Queen of Cups. |
| `25699` | Removed the redundant lost/retrieval phrasing and restored the tentative future statement. |
| `25720` | Paired Bodan's name; the separate Aster spelling question remains unresolved. |
| `25727` | Corrected Hexes from curses to the established card-game name. |
| `25742` | Replaced the unsupported squad/crew reading with the five individual deserters/recruits. |

The existing duplicate candidate at `58994` already matches `25576` and
`63906` in Korean, so it was not changed. The incomplete fragment at `25544`
and the uncertain register at `25615` remain held.

## Verification

- The changed rows' four-language fingerprints validate against the ledger.
- The default CSV retains its row order, BOM, and existing line-ending
  distribution. The focused preservation and context-index tests and
  CRLF-aware diff check pass.

The next sequential candidate range is `25750`-`25999`.

## Follow-up Verification

The later four-language reconciliation found that the active CSV did not
fully match two corrections described above. At `25713`, the text still
used `Lupoku` and did not match the accepted casual-register proposal. At
`25742`, the sentence omitted the supported count of five individual
recruits. Both rows were corrected with the byte-preserving CSV editor, and
only their ledger fingerprints were refreshed. See
[`dialogue-context-25500-25749-candidate-reconciliation-20261114.md`](dialogue-context-25500-25749-candidate-reconciliation-20261114.md).
