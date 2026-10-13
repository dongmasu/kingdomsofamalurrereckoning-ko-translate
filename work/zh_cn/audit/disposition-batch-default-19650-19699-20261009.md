# Disposition and Edit Batch: `default` IDs 19650-19699

- Decision date: 2026-10-09.
- Scope: all candidate groups in the preliminary report; English meaning,
  Japanese voice/register, supporting Chinese, active Korean, historical
  questions, and recurring terms were compared.
- Decisions: two accepted, four `not an issue`, and eight uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 19651 is accepted: retain the card-game term `Hex`, but correct the
  malformed Korean ending `가장 높은 패지` to `가장 높은 패야`. English
  calls it the highest card; Japanese retains Hex and says it is high. Chinese
  reads the game value as six, so the card/rank identity remains open.
- ID 19653 is accepted: replace `쓰레기 더미` with `석탄통` for `scuttle`.
  Japanese explicitly says buckets and Chinese says coal buckets; the English
  construction also describes materials scavenged from a scuttle.
- IDs 19655 and 19675 remain uncertain: both strings resemble internal or
  template/UI labels, but these sources do not establish whether players see
  them. Do not decide to localize or leave them in English without runtime
  evidence.
- ID 19657 is `not an issue`: `용병들` conveys `swords for hire` in context;
  the Korean preserves the boast about the mercenaries without making them a
  literal sword class.
- IDs 19659 and 19662 are `not an issue`: the repair tutorial preserves the
  condition, blacksmith, and repair-kit markers and their order. The ranged
  tutorial retains `{1}`, `{LINE_SPACE}`, and the right-stick icon, with the
  target-switch instruction intact.
- IDs 19665 and 19666 are `not an issue`: the Kollossae/Jottun appeal and the
  implicit place that closed and was sealed retain the source meaning without
  adding an antecedent.
- IDs 19670-19671 remain uncertain: `대사제` agrees with English and Chinese
  for `Hierophant`, but Japanese uses a different role. Canonical lore
  terminology is not established here.
- ID 19677 remains uncertain: the quest meaning is retained, but the
  canonical spellings/types for Bristletongue and Font and the entity's
  terminology need glossary/context alignment.
- ID 19682 is `not an issue`: the Tapestry/veil metaphor and the barrier
  between worlds are preserved.
- ID 19685 remains uncertain: the quest sequence and the reference to
  `Primos` are preserved, but the term's entity/rank sense and related names
  need context.
- ID 19691 remains uncertain: `Sandstone Villa` is recognizable, but its
  canonical Korean place-name treatment and estate type need alignment.
- ID 19694 remains uncertain: `child of dust` is rendered consistently with
  the source image, but its status as a lore title and canonical Korean form
  are not established.
- ID 19697 remains uncertain: Japanese supports “rite of stay” and Chinese
  gives a wandering sense for `Sojourn`; the rite's identity and canonical
  term remain unresolved. `amphora` is rendered as `암포라`.
- ID 19699 remains uncertain: the source and references identify Fellfire
  Pit, but the canonical place-name and `Pit` treatment need broader
  terminology alignment.

## Verification

- Active Korean, English, Japanese, and Chinese contain IDs 19650-19699 in
  identical order.
- Only the approved Korean text cells at IDs 19651 and 19653 changed.
- ID 19659 retains its localized marker wrappers and `{LINE_SPACE}`; ID 19662
  retains `{1}`, `{LINE_SPACE}`, and `#NAMED_ICON_360_RS#` in order.
- Active default CSV SHA-256:
  `315e83b2f737110b98a85865f736c14506a4744d03adb0c32f652d3e87e54d95`;
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing
  bare-LF endings must remain.
- A whole-file CSV parse is not claimed because existing malformed/multiline
  records remain.
- Resume disposition work at ID 19700; 45,435 `default` rows remain.
- Register totals after this batch: 704 accepted, 1,998 `not an issue`, and
  3,492 uncertain findings (6,194 counted decisions). Duplicate rows
  D-5305 and D-5306 are excluded.

These dispositions do not complete the integrated linguistic review or
constitute independent approval.
