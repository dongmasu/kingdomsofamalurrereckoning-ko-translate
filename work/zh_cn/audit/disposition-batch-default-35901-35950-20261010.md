# Disposition Batch: `default` IDs 35901-35950

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, and source-keyed
  historical notes.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, three `not an issue`, and three uncertain.
- CSV change: ID 35936 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35906, 35908 | Antelope trophies / Henge watch | Not an issue: `trophies` does not specify a trophy/head, and the Japanese-only head interpretation is not required. `침입` already conveys unauthorized entry in the Henge line; it need not literally reproduce `unwanted elements`. |
| 35911, 35924 | `it`/`he` switch / Well of Souls detects magic | Not an issue: Korean preserves the source's `그게` then `그자` shift. `감지하지 않을 수 없을 만큼 강했지` accurately conveys a source so powerful the Well could not help but detect it; the Chinese “select” reading is not adopted over English. |
| 35917, 35921 | `Wrappings` / `Entry VIII` | Uncertain: `붕대` may be appropriate if the label names bandages, but the row does not establish whether it is a garment/material category. `제8항` can imply a clause or article, while the locales do not establish whether Entry VIII is a journal entry or another numbered label. |
| 35931, 35937 | Sorrogweth / `pall` | Uncertain: the potion-preparation sequence is retained, but Sorrogweth's item identity and `pall` as coffin cover, burial cloth, or shroud are not resolved by conflicting locale renderings. |
| 35936 | Arrival greeting to the quickling | Accepted: English says `Here you are, at last`; Japanese and Chinese likewise say the quickling has arrived. Korean `깨어났구나?` invents an awakening event absent from this row. Change the opening to `드디어 왔구나.` |
| 35947 | Eight-line poem | Uncertain: the line count and comparisons are retained, but the source-keyed audit explicitly flags the parallel imagery and royal-herald relation. Do not polish the poem without resolving those literary/context questions. |
| Remaining ordinary text in IDs 35901-35950 | Dialogue, objectives, names, labels, and values | Not an issue: the other 40 IDs were checked in all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed 35800-35999 entry specifically flags the poem at 35947;
  that open literary question remains uncertain. It contains no historical
  approval for other rows in this batch.
- The added “woke up” action at 35936 is not supported by English, Japanese,
  or Chinese and is removed. The pall, Wrappings, and Entry VIII questions
  remain deferred rather than guessed.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 35901-35950
  once in identical order.
- ID 35947 retains seven embedded line breaks (eight lines) in all four
  locales. No runtime-marker mismatch was found.
- The four-antelope count and three-object list at 35937 are retained.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `f9c48ab250f9048bc60d1c547695eaf5a7e17f600787704148bcd10cec18693c`.
- The pre-existing checkpoint-hash discrepancy remains unresolved; it was
  not used to revert or rewrite unrelated rows.
- These are working dispositions, not independent final linguistic
  approval.

## Checkpoint

Disposition is complete through ID 35950. Resume at ID 35951; 29,184
`default` IDs remain through ID 65134. The next unused decision ID is
D-11604. Preliminary scan:
`default-ids-35951-36000-preliminary.md`.
