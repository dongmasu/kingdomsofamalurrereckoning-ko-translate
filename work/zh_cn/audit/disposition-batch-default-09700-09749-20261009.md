# Disposition and Edit Batch: `default` IDs 9700-9749

- Decision date: 2026-10-09.
- Scope: direct preliminary findings for `default` IDs 9700-9749, including
  historical cross-references to IDs 9351 and 9670.
- English governs meaning; the actual Japanese locale CSV informs
  voice/register and structure; Chinese is supporting evidence. Historical
  audit notes and existing decisions were also checked.
- Nineteen findings received dispositions: one accepted, five `not an issue`,
  and thirteen uncertain.
- This is an in-progress disposition pass, not independent final linguistic
  approval.

## Decisions

- ID 9705 remains uncertain: Japanese and Chinese translate Praetorians as a
  military unit, while Korean transliterates the term. The related rank and
  organization terminology is already open at ID 9670 (D-2743).
- ID 9709 remains uncertain: English and Chinese retain the Circle's “vessels”
  metaphor, while Japanese interprets the role as treating Circle members.
  Korean preserves the English metaphor, but the intended in-world meaning is
  not established.
- ID 9714 remains uncertain: Korean preserves the pompous comic voice, the
  four-paragraph sequence, and the source's evident intended events despite
  English errors. `Crannog` is rendered phonetically, while Japanese and
  Chinese interpret it as a dwelling; the exact site term remains open.
- ID 9717 remains uncertain: the sweep and search for wild Fae are preserved.
  `The Preordained` and whether `property` denotes a private estate or broader
  territory need context and terminology alignment.
- ID 9719 remains uncertain: the unique ability to create one's own fate is
  preserved. `Child of Dust` is rendered differently from ID 9351 (D-2609),
  and its canonical Korean form remains unresolved.
- ID 9721 remains uncertain: the House's fall, Prince Cydan's refuge, and the
  speaker's shame are retained. The source references and Korean corpus vary
  on the name spelling, while `fallen` could mean defeat or destruction.
- ID 9723 remains uncertain: the affection for home and contrast with a slum
  are preserved, but `the Quarters` may be a named district or generic
  quarters.
- ID 9725 remains uncertain: `The Sparrows` is rendered literally as
  `참새들`; the isolated label and references do not determine whether it is a
  team/group or actual birds.
- ID 9726 is accepted: revise the plain `네` address and ending to an elevated
  register matching English `thou` and Japanese `汝`/`我`, while retaining the
  passive creation and the speaker's lack of involvement.
- ID 9727 is `not an issue`: the special-attack requirement, Fate-energy
  instruction, `{*1...}` marker, `{LINE_SPACE}`, and `{1}` control are
  preserved. Japanese and Chinese differ in the action sequence, but Korean
  follows English.
- ID 9729 is `not an issue`: all three localized markers and `{1}` are
  preserved in English order. Japanese and Chinese order the fast-travel
  marker differently; Korean matches the English source.
- ID 9733 is `not an issue`: the fire-damage effect, `+20`, `+50%`, and blank
  line are preserved.
- ID 9734 remains uncertain: the seal/medallion and Verdant Blades/chakrams
  relationship is retained, but the canonical artifact names and whether
  `Seal` is a specific insignia need terminology review.
- ID 9738 remains uncertain: `자기` can serve as an affectionate address, but
  the Japanese omits the vocative and Chinese interprets `dove` differently;
  the speaker relationship is not established here.
- ID 9743 is `not an issue`: Korean preserves the alarm, tangled-growth image,
  and claim that nowhere is safe without inventing a specific creature.
- ID 9744 remains uncertain: the conditional promise and meeting are
  preserved, but Cydan, Tuatha, Foe's Hearth, and Cursewood have unresolved
  or inconsistent Korean forms. Existing decisions defer global Tuatha
  normalization.
- ID 9745 remains uncertain: the subtlety contrast is retained, but
  `Castellan` may be a formal office rather than a generic local lord.
- ID 9746 is `not an issue`: `처리하라` preserves the broad scope of `Deal
  with`; it does not invent killing or punishment.
- ID 9748 remains uncertain: the King of Cups title and English-traceable
  Irion spelling are preserved, but the card/title status and canonical
  display convention need alignment.

## Applied Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9726 | `그리고 마침내 네가 왔구나. 나는 네 본성을 필요로 했고, 그것은 창조되었지. 내가 손댄 건 아니지만, 어떤 의미에선 그것도 운명이라 여긴다.` | `그러다 그대가 나타났지. 나는 그대의 본성이 필요했고, 그 본성은 창조되었네. 내 손이 닿은 일은 아니나, 어떤 의미에선 그것도 운명이라 여기네.` | D-2764: preserve the elevated address and keep the speaker's non-involvement explicit. |

## Verification

- The nineteen candidate findings were checked against the active Korean,
  English, actual Japanese, and Chinese locale rows. Historical questions and
  related decisions for IDs 9351 and 9670 were also checked; their prior
  dispositions were not changed.
- The active `default` CSV remains 65,135 records with IDs 0-65134 in order.
  Its UTF-8 BOM and CRLF record endings are preserved; no row keys, variants,
  runtime markers, or embedded line breaks changed.
- ID 9714's four-paragraph layout and ID 9733's blank-line stat layout remain
  intact. ID 9727's control markers are preserved. At ID 9729, Korean still
  matches English marker order; Japanese and Chinese retain their documented
  order difference.
- Active Korean `default` CSV SHA-256 after the edit:
  `2b3c92861195fce36f420a115886847b8898a28a1340a6d342df555bd58a3829`.
- Before this batch: 422 accepted, 870 `not an issue`, and 1,463 uncertain.
  After this batch: 423 accepted, 875 `not an issue`, and 1,476 uncertain.
- Resume at ID 9750; 55,385 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
