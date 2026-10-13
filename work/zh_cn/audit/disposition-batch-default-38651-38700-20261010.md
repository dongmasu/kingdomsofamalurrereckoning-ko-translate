# Disposition Batch: `default` IDs 38651-38700

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and four uncertain.
- CSV changes: ID 38690 only; this edit was already present at resume.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38661 | Counsel / `자문회` | Uncertain: Japanese and Chinese support an adviser/strategist, while the capitalized English term may name an individual, office, or group. Recurrent prior decisions leave the referent unresolved; do not normalize this isolated row by guesswork. |
| 38684 | the Glass / `유리` | Uncertain: the capitalized term is treated as a named concept in the other locales, but neither this line nor the existing Glass of Ambient decisions establishes whether it is a place, object, or magical entity. |
| 38690 | `Would you like one?` / `하나 살래?` | Accepted: retain the already-applied `하나 가져갈래? 무기 말이야. 네 손은 작으니까.` The English and Japanese ask whether the addressee wants a weapon; they do not explicitly establish a sale, so Korean `살래?` adds an unsupported transaction. Chinese independently supports the neutral offer. |
| 38694 | Queen of Staves / `지팡이의 여왕` | Uncertain: the named Queen of Staves title is retained, but prior decisions explicitly leave the tarot-suit versus staff-title reading and canonical Korean convention unresolved. |
| 38699 | The Orison / `기도` | Uncertain: capitalization and Japanese transliteration support a named entity, while Chinese supports the generic prayer reading. Prior decisions leave Orison's identity and Korean rendering unresolved. |
| Other rows in IDs 38651-38700, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- The source-keyed historical question log has a documented coverage gap for
  IDs 37700-40349. Related Counsel, Glass, Queen of Staves, and Orison
  decisions were consulted; unresolved entries are not treated as approval.
- ID 38651 contains locale-specific puzzle text. The encoding/source
  discrepancy was preserved rather than translated or normalized.
- These are working dispositions, not independent linguistic approval.

## Verification

- Immutable English, Japanese, and Chinese rows confirm a non-transactional
  offer at ID 38690; the active Korean already contains the approved wording.
- The preliminary structural comparison reports matching ID order, line
  breaks, and runtime-marker identities/order across all four locales.
- No CSV bytes were changed in this resumed batch. The active CSV SHA-256 is
  `74acbdae303231d3b1c6653b70abdeeba85ea6f09b2bfc07c95daa29d6ce15dc`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38700. Resume at ID 38701; 26,434
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38701-38750-preliminary.md`. The next unused decision ID is
D-12481.
