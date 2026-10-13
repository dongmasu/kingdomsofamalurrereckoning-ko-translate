# Disposition and Edit Batch: `default` IDs 9350-9399

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9350-9399.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Historical audit notes and
  active-corpus usage were also checked.
- Twenty findings received dispositions: two accepted, five `not an issue`,
  and thirteen uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 9350 remains uncertain: `Kandrian` may be a people/region adjective or
  a standalone name; this label does not settle its grammatical use or
  canonical spelling.
- ID 9351 is `not an issue`: English, Japanese, and Chinese all retain the
  dust-born image in the benevolent address, and Korean preserves that image
  and the imperative voice.
- ID 9352 is `not an issue`: despite the English subject-verb agreement
  error, the Korean correctly identifies Sun Camp as the one remaining camp
  outside Adessa.
- ID 9357 is `not an issue`: `기지` conveys the resourcefulness meant by
  `guile` in the Traveler's practical advice without implying dishonesty.
- ID 9359 remains uncertain: capitalization and the fragmentary list leave
  `Preordained`'s status as a group, faction, or generic description open.
- ID 9362 is accepted: revise the awkward gold comparison to
  `그래도 싸워야 할 이유는 있어. 금화가 그만큼 걸려 있으니까.` This
  preserves the contrast between many reasons to avoid the Arena and the
  corresponding monetary incentive, in natural conversational Korean.
- ID 9364 (voice referent) is accepted: change `네 목소리가 들려` to
  `그의 목소리가 들려`. English and Chinese explicitly identify the voice
  as “him”; the following lines also say the voice calls itself Akara. The
  previous Korean incorrectly identifies Nette as the speaker of the voice.
- ID 9364 (`Hanged Men`) remains uncertain: it appears to be Dead Kel's
  named crew, but its established Korean display form requires terminology
  alignment.
- ID 9365 remains uncertain: `Delvers` is a formal House of Sorrows role;
  `탐굴자들` may be too generic, and no canonical Korean title is established.
- ID 9371 remains uncertain: `Widow` may be a title/name or a translated
  legend figure; align its Korean display with other occurrences.
- ID 9372 remains uncertain: `Tuatha` has competing Korean forms
  (`투아타` and `투아사`) across the corpus; do not normalize this isolated
  entry.
- ID 9374 remains uncertain: capitalized `the Eldest` appears to be a
  formal House of Sorrows role/title, but the canonical Korean form is open.
- ID 9379 remains uncertain: capitalized `the Telling` likely names a Fae
  storytelling tradition; align with related occurrences before replacing
  generic `이야기`.
- ID 9382 remains uncertain: `Hollowlands` is a region name with competing
  transliterated and translated forms across locales.
- ID 9385 remains uncertain: `dove` is an affectionate or character-specific
  address; `아가씨` may add an age/status implication, but the references do
  not establish a safe replacement.
- ID 9387 is `not an issue`: the Korean's literal phrasing is understandable
  and preserves the speaker's limited association with the group.
- ID 9390 remains uncertain: canonical Korean forms for `Boggarts` and
  `Blood Plague` are not established in this line.
- ID 9395 remains uncertain: Chinese identifies the Gemstone as a tavern,
  while English names `the Gemstone` without its type; the venue's canonical
  Korean display remains open.
- ID 9398 remains uncertain: English `salvage` can invoke a game mechanic,
  while Japanese says polish and Chinese says refurbish. The intended action
  is not settled well enough to change the provisional Korean.
- ID 9399 is `not an issue`: Korean preserves the pale-country
  personification, Winter Court history, and rot-in-the-flesh image without
  assigning an unsupported referent to “her.”

## Applied Edits

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 9362 | `...싸워야 할 이유도 그만큼의 금화만큼 많지.` | `...그래도 싸워야 할 이유는 있어. 금화가 그만큼 걸려 있으니까.` | D-2613: preserve the gold incentive in natural Korean. |
| 9364 | `네 목소리가 들려, 네트.` | `그의 목소리가 들려, 네트.` | D-2614: restore the voice's male referent. |

## Verification

- The preliminary report covers all 50 IDs. Candidate lines were compared
  against the actual English, Japanese, Chinese, and active Korean CSVs;
  historical questions were reconciled against the active rows.
- ID 9364 retains all eight source lines and embedded breaks; only the
  mistaken voice referent changed.
- The active CSV parses as 65,135 records with IDs 0-65134 in order,
  matching the immutable English and Chinese keys. Its non-text fields,
  UTF-8 BOM, and CRLF record endings are preserved.
- Active Korean `default` CSV SHA-256:
  `391e040c46d749b12828e77d6c9339bfcd5f9511bd2ddba6fa0e60bd7f8b8cd0`.
- Before this batch: 409 accepted, 831 `not an issue`, and 1,367 uncertain.
  After this batch: 411 accepted, 836 `not an issue`, and 1,380 uncertain.
- Resume at ID 9400; 55,735 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
