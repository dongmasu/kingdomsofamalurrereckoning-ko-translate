# Disposition Batch: `default` IDs 37451-37500

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and thirteen uncertain.
- CSV change: ID 37465.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37455 | `dying races` / `필멸자 종족` | Uncertain: the life-is-precious lesson is retained, but English may mean mortal peoples or races facing extinction; locale readings do not settle the nuance. |
| 37456 | Court of Summer | Uncertain: the peaceful Fae tribe, hidden distant city, and king are retained; the formal faction-name convention remains open. |
| 37458 | Maid / ballads and fate | Uncertain: the conditional self-rewriting and avoidance of death are retained; the capitalized Maid and ballad-lore terms need corpus alignment. |
| 37464 | Argine / Sun Camp / Travelers | Uncertain: leadership, camp creation, and its size/profitability are retained; canonical names and the exact relation to the Travelers remain provisional. |
| 37465 | `curious but careful` / `호기심이 많아도 신중하지` | Accepted: change to `호기심이 많지만 신중해`. The current Korean negates carefulness, while English, Japanese, and Chinese all describe Lila as curious yet cautious/careful. |
| 37467 | Bisarane / Cursewood / House access | Uncertain: the request and access condition are retained; person, forest, and House terminology require context and glossary alignment. |
| 37469 | quicklings | Uncertain: planting seeds, inspiring hope, and saving are preserved; the creature/group name remains provisional. |
| 37473 | Caverns of Ingress / Great Spine / Erathi sigil stones | Uncertain: route, landmark, destination, and count of three stones are retained; proper-name forms remain unsettled. |
| 37475 | Court of Enchantments / Sagrell / Hallam | Uncertain: the stay-nearby instruction and Hallam's mission request are preserved; the formal location and character names need alignment. |
| 37479 | Search for Brother Fallon | Uncertain: English, Chinese, and Korean direct the player to find Fallon, while Japanese specifies investigating his body; do not import the Japanese-only detail without quest context. |
| 37486 | Spinning Tom / buckler bracing | Uncertain: the nimble buckler use, red-hot bracing, and scorching effect remain; item-lore terminology needs review. |
| 37487 | `that flow` / Fae withering | Uncertain: weakening flow, increasing world magic, and apparent Fae decline remain; the isolated line does not identify the flow's referent. |
| 37488 | Notice of Duty | Uncertain: the duty/summons sense is retained, but whether this capitalized label is a formal title is not established. |
| 37499 | Bayala Tirin | Uncertain: both name components are present; canonical transliteration cannot be selected from the differing locale spellings alone. |
| Other rows in IDs 37451-37500 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed questions for IDs 37400-37599 were checked, including
  `dying races`, Court of Summer, the Maid, quicklings, Lila Janick, the
  Fallon objective, Spinning Tom, and Notice of Duty.
- Japanese and Chinese support the positive carefulness reading at 37465;
  the prior preliminary concern is confirmed and corrected.
- No disputed proper name or lore term was normalized beyond the accepted
  correction at 37465. These are working dispositions, not independent
  linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37451-37500 once and in identical order.
- No runtime marker, numeric value, or line break was changed.
- Only the active Korean `Texto` at ID 37465 changed.
- The UTF-8 BOM and existing mixed line endings are preserved; exact counts
  and the resulting SHA-256 are recorded in the current checkpoint documents.

## Checkpoint

Disposition is complete through ID 37500. Resume at ID 37501; 27,634
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37501-37550-preliminary.md`. The next unused decision ID is
D-12168.
