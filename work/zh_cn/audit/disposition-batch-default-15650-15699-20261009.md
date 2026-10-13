# Disposition and Edit Batch: `default` IDs 15650-15699

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and historical audit notes.
- Twenty-one source-row decisions: one accepted, five `not an issue`, and
  fifteen uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15650 remains uncertain: `Warsworn` is a recurring faction/rank term
  whose Korean spelling has not been settled corpus-wide.
- ID 15651 remains uncertain: the passage praises the local passion for
  combat, but does not explicitly identify the venue meant by “nowhere else.”
- ID 15652 is `not an issue`: the Smoke Bomb effect retains 90 Poison Damage
  and the five-second duration.
- IDs 15654 and 15655 remain uncertain: the five-line account is preserved,
  but Forsaken Plain, Winter Fae, House of Sorrows, and the referent of “it”
  need context and terminology alignment.
- ID 15658 is `not an issue`: the ring's Gnomish makers and its purpose of
  aiding mastery of mundane and arcane skills are retained.
- ID 15659 remains uncertain: Korean preserves the Whiner/Wine correction
  and spear-skill boast, but the name/wordplay needs literary review.
- ID 15660 is `not an issue`: `Set` and both placeholders `{1}/{2}` are
  preserved in order.
- ID 15661 remains uncertain: Besin's plan and means are preserved, but the
  entity type and canonical name of Orbocant remain unresolved.
- ID 15664 remains uncertain: `The God Fang` may be a weapon, creature, or
  title; the isolated label does not establish which.
- ID 15666 remains uncertain: `애완견` preserves a lapdog insult but may
  suggest a literal pet; `whipped dog`'s force and Eswin's Korean name need
  contextual/corpus review.
- ID 15670 remains uncertain: the objects called “the things” and Nix's
  identity/role are unspecified; Korean keeps the source's vague reference.
- ID 15671 remains uncertain: the metadata-like `Master Mitharan Immunity
  String` may be an internal/debug label rather than player-facing text;
  do not normalize it without context.
- ID 15679 remains uncertain: `Telling` and `Ballads` may name traditions,
  rites, or performances; canonical Korean terms are unresolved.
- IDs 15681 and 15682 remain uncertain: Scion, Vengeance, and their
  institutional/faction meanings require corpus-wide lore alignment.
- ID 15685 is `not an issue`: `Your Grace` receives a formal Korean honorific,
  supported by Japanese and Chinese; the respectful address is retained.
- ID 15687 is accepted: replace `퍼스트스원(Hall of the Firstsworn) 전당` with
  `퍼스트스원 전당(Hall of the Firstsworn)`. English says Hall, while
  Japanese says shrine; following English, the revised bilingual name avoids
  duplicating “Hall” as both the English name and a Korean suffix.
- ID 15691 is `not an issue`: Korean preserves “I will return it” without
  inventing the omitted object or recipient, as do the source locale rows.
- IDs 15696 and 15697 remain uncertain: `At ease` may be a military
  command, and `the last upgrade` does not identify what was being upgraded.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15687 | `퍼스트스원(Hall of the Firstsworn) 전당` | `퍼스트스원 전당(Hall of the Firstsworn)` | D-4855 |

## Verification

- The preliminary structural audit reports all 50 IDs in identical order
  across the four locales. ID 15655's lineation and ID 15660's `{1}/{2}`
  placeholder order are preserved; no structural exception was found.
- Only the accepted Korean `Texto` at ID 15687 changed. The active CSV
  retains its UTF-8 BOM, 72,046 CRLF record endings, and 39 pre-existing
  bare-LF endings.
- The active Korean `default` CSV SHA-256 is
  `09506c199e0ad42f4bb61c0f6b19045c319f96cfda4f26bc77d9c1185a72ec2c`.
- The checkpoint-hash discrepancy from IDs 15450-15499 remains documented;
  this batch did not alter any other CSV content.
- Before this batch: 609 accepted, 1,503 `not an issue`, and 2,725 uncertain.
  After this batch: 610 accepted, 1,508 `not an issue`, and 2,740 uncertain
  (4,858 decisions total).
- Resume at ID 15700; 49,435 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
