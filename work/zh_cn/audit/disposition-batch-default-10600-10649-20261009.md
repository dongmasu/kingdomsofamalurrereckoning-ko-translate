# Disposition and Edit Batch: `default` IDs 10600-10649

- Decision date: 2026-10-09.
- Scope: nineteen direct preliminary findings and their source-keyed
  historical questions.
- Compared English meaning, Japanese voice/register and structure, Chinese
  supporting evidence, active Korean, prior dispositions, and recurring
  names/terms.
- Nineteen findings received dispositions: one accepted, thirteen
  `not an issue`, and five uncertain.
- One supported correction was applied only to the active Korean `Texto`
  cell. This is a working disposition, not independent final approval.

## Decisions

- ID 10601 remains uncertain: the boast is retained, but the Maid's canonical
  title and kingdom phrasing remain tied to unresolved lore terminology.
- ID 10602 is `not an issue`: Korean preserves the omitted condition and the
  distinction between weakening and usually not killing.
- ID 10607 is `not an issue`: the wind bag, stone sentry, and Hierophant's
  Court relationship are retained.
- ID 10608 is `not an issue`: the secondary-weapon label and both runtime
  markers retain their order.
- ID 10609 is `not an issue`: the search and conditional prayer-bead return
  are preserved without narrowing “if the worst has happened.”
- ID 10614 is `not an issue`: the Root Golem threat and danger to all of
  Revival are retained.
- ID 10616 remains uncertain: the suffocating Alfar-lore metaphor is present,
  but `lore` may mean history, magic, or cultural influence.
- ID 10622 remains uncertain: the seasonal title/pun is retained, but its
  resource type and wordplay are unknown.
- ID 10625 is accepted: add `(The Widow)` to distinguish the named
  spider-ruling figure from a generic widow while retaining the Korean
  wordplay.
- ID 10627 is `not an issue`: all three ingredients, 3/3/1 quantities, and
  four embedded line breaks are retained.
- ID 10634 remains uncertain: the morale-breaking effect is preserved, but
  the nature of the capitalized Sorrows and plural relation are unresolved.
- ID 10639 is `not an issue`: the retrieval condition, seller, return
  destination, and current dagger holder are retained.
- ID 10641 is `not an issue`: the artifact's age and tentative attribution
  to someone called Gabriel are preserved.
- ID 10643 is `not an issue`: the blacksmith icon marker is unchanged.
- ID 10644 remains uncertain: its +2 bonus is present, but the active corpus
  has competing Korean forms for Dispelling; no local normalization is
  authorized.
- ID 10645 is `not an issue`: both damage modifiers and their line layout are
  retained.
- ID 10647 is `not an issue`: the spell equip action and slot number are
  present; no UI-context correction is supported.
- ID 10648 is `not an issue`: the public-service justification and wish for
  extra cash are both retained.
- ID 10649 is `not an issue`: the pointed, casual prison question is
  preserved without intensifying it.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10625 | `하지만 과부가 내 아내를 빼앗아 갔어.` | `하지만 과부(The Widow)가 내 아내를 빼앗아 갔어.` | D-3054: identify the recurring named Widow while preserving the Korean wordplay. |

## Verification

- All four locale CSVs have 65,135 sequential default IDs in identical order.
- IDs 10600-10649 have matching normalized runtime-marker sequences and
  embedded line-break counts across English, Japanese, Chinese, and active
  Korean. ID 10627 retains four embedded line breaks, ID 10645 retains one,
  and ID 10643's icon marker is unchanged.
- The active Korean CSV retains its UTF-8 BOM, 65,135 records, and CRLF
  record endings, with no bare LF or CR bytes.
- Only the approved Korean `Texto` cell at ID 10625 changed in this batch.
- Active Korean `default` CSV SHA-256:
  `72b1685b35ffd97938e7fa6524649fdac89e57471f04374ee5d6d9f45c418656`.
- Before this batch, the register contained 466 accepted, 936 `not an issue`,
  and 1,643 uncertain findings. After this batch, it contains 467 accepted,
  949 `not an issue`, and 1,648 uncertain findings.
- Direct findings and their historical questions through ID 10649 now have
  dispositions. Resume at ID 10650; 54,485 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
