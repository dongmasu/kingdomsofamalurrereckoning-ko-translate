# Disposition and Edit Batch: `default` IDs 9600-9649

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9600-9649.
- English governs meaning; Japanese informs voice/register and structure;
  Chinese is supporting evidence. Historical audit notes were also checked.
- Twenty-one findings received dispositions: two accepted, eight `not an
  issue`, and eleven uncertain.
- This is an in-progress disposition pass, not independent final linguistic
  approval.

## Decisions

- ID 9600 remains uncertain: `longlegs` is a dismissive address, but the
  isolated line does not establish that it names a people/race. Korean
  `장다리족` may imply a more formal group than the source.
- ID 9601 remains uncertain: capitalization suggests `Understyle` is a
  place, but its identity and canonical Korean form are not established.
- ID 9603 is `not an issue`: all four lines, values, damage categories,
  chance, duration, and Mana cost are preserved; the source itself does not
  name a target for the stun chance.
- ID 9604 remains uncertain: English/Japanese use `Band`, while Chinese
  suggests a specific object; the referent cannot be inferred safely.
- ID 9606 remains uncertain: `the Font` is capitalized as a recurring
  lore term, while the references identify a spring/pool; Korean uses generic
  `원천`, and `Amphora` also needs item-term alignment.
- ID 9607 is `not an issue`: despite malformed English, Korean retains the
  evident condition that all Niskaru must die before the Rifts can close.
- ID 9608 is `not an issue`: Korean preserves the speaker's surprise,
  distance from the front, and claim that the war has not reached Dalentarth.
- ID 9611 remains uncertain: capitalized `the telling` and `the Cycle` are
  recurring Fae concepts; Korean's generic `이야기` and `순환` need
  terminology alignment.
- ID 9615 is `not an issue`: the grimly comic accidents are preserved; the
  current `아르카나 대학` form is consistent with adjacent corpus usage,
  though corpus-wide institution normalization remains open.
- ID 9617 is `not an issue`: Korean retains the plea not to define the
  speaker by his poor judgments and preserves the good son/sailor claims.
- ID 9618 is `not an issue`: `손이 깨끗하다` retains the source's
  clean-hands idiom and leaves open whether it means moral innocence or lack
  of involvement.
- ID 9622 is `not an issue`: the conjecture, Ticneri's laboratory, and
  instruction to search there first are preserved; Japanese supports the
  underground-prison rendering.
- ID 9625 remains uncertain: capitalized `the Telling` names or may name a
  Fae tradition; Korean's generic `이야기` loses that distinction, but the
  final Korean lore term should be aligned across occurrences.
- ID 9628 remains uncertain: `the Crossing` is capitalized and treated as a
  named power in English/Japanese, while Chinese translates it generically;
  the name and Alserund spelling need alignment.
- ID 9629 is `not an issue`: Korean retains the Crows' role in the stalled
  tournament and the shortage of a team leader, consistent with Japanese.
- ID 9631 remains uncertain: `Counsel` may be an office/title or generic
  advice; the isolated label does not establish its institutional function.
- ID 9638 is accepted: change the polite `생각했던 것보다 키가 크시네요`
  to `생각보다 키가 크네`. Japanese uses a casual, teasing observation;
  the former Korean adds honorific distance. The direct address
  `챔피언` remains.
- ID 9639 remains uncertain: English/Japanese retain `Other Voices` while
  Chinese translates it; the row's player-facing or internal status is
  unknown.
- ID 9642 remains uncertain: Japanese treats `Hexes` as a game/activity,
  Chinese as magic; UI context is needed before changing `헥스로 놀기`.
- ID 9647 is accepted: replace `에틴 전쟁 부족` with `에틴 전쟁 무리`.
  English `War party` and Japanese `徒党` support an organized band, not a
  specifically tribal polity. The four paragraphs, names, risk, payment
  motive, and oath remain unchanged.
- ID 9648 remains uncertain: `House of Pride` may be a faction name, while
  Korean `자만의 집` can read as a building; align the named House and
  champion terminology corpus-wide.

## Applied Edits

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 9638 | `생각했던 것보다 키가 크시네요, 챔피언.` | `생각보다 키가 크네, 챔피언.` | D-2715: match the source's casual, teasing register. |
| 9647 | `에틴 전쟁 부족` | `에틴 전쟁 무리` | D-2716: avoid adding an unsupported tribal structure. |

## Verification

- The 21 candidate findings were checked against the actual English,
  Japanese, Chinese, and active Korean rows. Historical questions identified
  for this range were checked against the active rows.
- The active `default` CSV parses as 65,135 records with IDs 0-65134 in
  order. Its UTF-8 BOM and CRLF record endings are preserved; there are no
  bare LF endings.
- ID 9603's four-line layout and ID 9647's six embedded line breaks are
  unchanged. No row key, variant, or runtime marker changed.
- Active Korean `default` CSV SHA-256:
  `2a67ec0fae8714ca4e7fd5f001ecca656fdb16b275f314eb51dd39cc3a212544`.
- Before this batch: 419 accepted, 855 `not an issue`, and 1,440 uncertain.
  After this batch: 421 accepted, 863 `not an issue`, and 1,451 uncertain.
- Resume at ID 9650; 55,485 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
