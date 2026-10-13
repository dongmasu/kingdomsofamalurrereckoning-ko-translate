# Disposition and Edit Batch: `default` IDs 15800-15849

- Decision date: 2026-10-09.
- Scope: all preliminary findings in the range, split by source row.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and historical audit notes.
- Twenty-six source-row decisions: one accepted, five `not an issue`, and
  twenty uncertain. Uncertain rows remain unchanged.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 15800 remains uncertain: `Saltwell Caverns` is rendered singular; the
  isolated label does not establish official Korean number/style.
- ID 15801 remains uncertain: the 16% value is preserved, but `Reflection`
  may be a named effect or reflected-damage stat.
- ID 15803 remains uncertain: the four-line verse and title sequence are
  preserved, but the poetic referents and title relationships remain open.
- ID 15804 remains uncertain: `Horde` may be a faction, army, or group, and
  the key's precise relation to it is not established.
- ID 15805 remains uncertain: the directive is retained, but the canonical
  rendering of the Scion title remains unsettled.
- ID 15809 remains uncertain: `Hierophant` is rendered as `대사제`, but its
  formal title and distinction from related ranks need lore-wide alignment.
- ID 15810 is `not an issue`: both the soft-ground wish and silent-step
  farewell are preserved.
- ID 15811 remains uncertain: the capitalized Glass/Missives may be named
  objects or documents; Korean retains the deferred discussion.
- ID 15813 remains uncertain: the isolated food/item name does not establish
  whether Onionskin is a person, shop, or place.
- ID 15815 is `not an issue`: the exact `#NAMED_ICON_360_LS_PRESS#` token is
  retained and followed by the Korean press prompt.
- ID 15817 remains uncertain: the complaint is preserved, but bolgan and
  Tuatha naming/relationship need terminology alignment.
- IDs 15823-15824 remain uncertain: `City Watch` and `Finesse` terms need
  alignment with established Korean terminology.
- ID 15825 is `not an issue`: the key's limited distance and the recent
  collision with rocks are retained; Japanese and Chinese support the same
  reading, and no unsupported ship detail was added.
- ID 15827 remains uncertain: the chained woman's identity and whether
  `Hierophant keep us` is an oath or institutional invocation are unknown.
- ID 15829 remains uncertain: the isolated `Rattle` label may be a name,
  sound, or object.
- ID 15832 is `not an issue`: `vanes` is rendered as feathers, and the
  creatures' fierceness, pride, and wild nature are retained.
- ID 15835 remains uncertain: the food description is preserved, but the
  intended ingredient sense of `grist` remains unclear.
- ID 15837 is `not an issue`: the search difficulty and warning that Smiler
  knows the ruins are preserved.
- ID 15839 remains uncertain: the letter structure and signature are
  preserved, but the unusual sunset image and emotional nuance need review.
- ID 15842 remains uncertain: the scouting role and hood description are
  retained; Ariad, Alfar, and Dokkalfar forms need corpus alignment.
- ID 15844 remains uncertain: the instructional tone and Fate personification
  are present, but the `favors` metaphor and terminology remain open.
- ID 15845 is accepted: replace the literal image of turning people into
  coins with a natural Korean expression for profiting from the crowd, while
  retaining the speaker's boast and gold image.
- ID 15846 remains uncertain: locale references conflict on `Paling Wand`,
  and `Adarus Hollow`'s place type is not established.
- ID 15848 remains uncertain: the rumor, youngest child, and pillow are
  retained, but the force of `hag` is softened to `노파`.
- ID 15849 remains uncertain: the isolated name does not establish the
  canonical Korean spelling of Rhiad Guth.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 15845 | `...그 모두를 내 주머니 속 금화로 바꿀 수 있지.` | `...그들 덕에 주머니를 금화로 채울 수 있지.` | D-4923 |

## Verification

- The preliminary structural scan reports all 50 IDs in matching order across
  the compared locale rows. ID 15803 retains its three embedded line breaks;
  ID 15815 retains `#NAMED_ICON_360_LS_PRESS#`; ID 15839 retains its four
  embedded newlines, paragraph breaks, and signature. No structural
  exception was found.
- Only the approved Korean `Texto` at ID 15845 changed. Its line ending was
  restored to CRLF. The CSV retains its UTF-8 BOM, 72,046 CRLF endings, and
  39 pre-existing bare-LF endings.
- Reversing only the ID 15845 text change reproduces the preceding batch's
  SHA-256 exactly:
  `c7c370377c94cc7a79c9e1d45778128fafc3ea78e09d4154f549de4b87a9b164576`.
- The active Korean `default` CSV SHA-256 is
  `7c74c7086270664fcaa52def6143e38a9f6be9bd74de8005a4c5d1d917e844a9`.
- The older checkpoint discrepancy beginning at IDs 15450-15499 remains
  unresolved.
- Before this batch: 612 accepted, 1,524 `not an issue`, and 2,764 uncertain.
  After this batch: 613 accepted, 1,529 `not an issue`, and 2,784 uncertain
  (4,926 decisions total).
- Resume at ID 15850; 49,285 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
