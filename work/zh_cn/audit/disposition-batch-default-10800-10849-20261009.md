# Disposition and Edit Batch: `default` IDs 10800-10849

- Decision date: 2026-10-09.
- Scope: fifteen direct preliminary findings and their source-keyed
  historical questions.
- Compared English meaning, Japanese voice/register and structure, Chinese
  supporting evidence, active Korean, recurring terms, and prior audit notes.
- Fifteen findings received dispositions: three accepted, five `not an issue`,
  and seven uncertain.
- Three supported corrections were applied only to the active Korean
  `Texto` cells. These are working dispositions, not independent final
  approval.

## Decisions

- ID 10800 is accepted: `Honorable Military Discharge` is rendered as
  `명예 제대 증서`, preserving the certificate nuance explicit in Japanese
  `名誉除隊証書`.
- ID 10802 remains uncertain: the isolated `Activity - Butcher - Fish`
  hierarchy does not establish whether `Butcher` is a category, action, or
  profession; do not invent a Korean label.
- ID 10803 remains uncertain: `Fahrlangi` has competing active Korean forms
  (`파를랑기` and `파흘랑기`); defer corpus-wide name normalization.
- ID 10808 remains uncertain: the row does not establish whether `The Chariot`
  is an archetype/title or a literal vehicle.
- ID 10809 is `not an issue`: the ability-potion instructions, all four
  reagents, quantities 3/3/2/1, and five embedded line breaks are retained.
- ID 10813 remains uncertain: the capitalized `Well` may be a named project,
  and the possible `Well`/`paid well` wordplay cannot be settled from this
  isolated passage.
- ID 10820 is `not an issue`: the unnamed tragedy and location remain
  unspecified, and the speaker's apology and refusal to elaborate are
  preserved.
- ID 10822 remains uncertain: the massacre, destruction, and corruption
  sequence is retained, but canonical forms for Court of Winter, Bhaile, and
  Midden need terminology review.
- ID 10828 remains uncertain: `Redemption` may be a title, quest, skill, or
  moral concept; the isolated label does not resolve its category.
- ID 10831 remains uncertain: the active corpus contains both
  `그왈흐마이` and `그월흐마이`; do not normalize this row alone.
- ID 10833 is accepted: identify the named magical source consistently as
  `샘(The Font)`, matching the active corpus' established rendering.
- ID 10838 is `not an issue`: the city history and hidden-prize clue are
  retained; Apotyre, Detyre, Livrarium, and Praetorian Garrison follow
  established active-corpus forms. All seven embedded line breaks match the
  three source locales.
- ID 10842 is `not an issue`: the father/mercenary history, combat anecdote,
  and chronology are preserved. Tyr Magnus, Hroth Magnus, and Fae Engard
  follow the supported name forms; all four embedded line breaks match the
  three source locales.
- ID 10848 is `not an issue`: `bring the fight to Telogrus` is naturally
  conveyed as initiating a fight, consistent with Japanese and Chinese.
- ID 10849 is accepted: change the archaic, male-coded Korean register to
  conversational speech, consistent with the Japanese dialogue, while
  preserving the question, completed departure, overnight stay, and
  destination.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10800 | `명예 제대` | `명예 제대 증서` | D-3117: retain the certificate sense supported by Japanese. |
| 10833 | `샘` | `샘(The Font)` | D-3127: identify the named source consistently with active usage. |
| 10849 | `마법사 에리온 래프와 함께 다니는 사람이오? 그는 벌써 떠났소. 선술집에서 하룻밤을 보내고 멀 레인으로 향했지.` | `마법사 에리온 래프와 함께 다니는 사람이야? 그 마법사라면 벌써 떠났어. 선술집에서 하룻밤 묵고 멀 레인으로 향했어.` | D-3131: align conversational register with Japanese while preserving the source facts. |

## Verification

- IDs 10800-10849 exist in all four locale CSVs in identical key order.
- Runtime-marker sequences match across the four locales in this range.
- IDs 10809, 10838, and 10842 retain respectively five, seven, and four
  embedded line breaks in all four locales.
- Recipe quantities at ID 10809 and the seven- and four-break layouts at IDs
  10838 and 10842 are unchanged.
- Only the approved Korean `Texto` cells at IDs 10800, 10833, and 10849
  changed in this batch.
- The active Korean CSV retains 65,135 sequential IDs, its UTF-8 BOM, and
  CRLF record endings.
- Active Korean `default` CSV SHA-256:
  `f1f3bfe01687d5f5badc8c5a4c6407fa8ddb7027c491583b53c5d814848ca01b`.
- Before this batch: 470 accepted, 976 `not an issue`, and 1,670 uncertain.
  After this batch: 473 accepted, 981 `not an issue`, and 1,677 uncertain.
- Direct findings and carried historical questions through ID 10849 now have
  dispositions. Resume at ID 10850; 54,285 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
