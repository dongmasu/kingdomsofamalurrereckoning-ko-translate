# Disposition and Edit Batch: `default` IDs 9400-9449

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9400-9449.
- English governs meaning; Japanese informs voice/register and structure;
  Chinese is supporting evidence. Historical audit notes were also checked.
- Twenty-five findings received dispositions: one accepted, five `not an
  issue`, and nineteen uncertain.
- This is an in-progress disposition pass, not independent final linguistic
  approval.

## Decisions

- ID 9400 remains uncertain: `Apotyre Mining Families` does not establish
  whether Apotyre is a place, lineage, or organization.
- ID 9401 remains uncertain: Japanese suggests succession, while English and
  Chinese leave open whether the helm is a physical object or authority.
- ID 9402 is `not an issue`: `칸드리안 왕조의 역사` concisely conveys the
  history of Kandrian's line of kings without repeating the title wording.
- ID 9403 remains uncertain: `Amethyn`'s canonical Korean spelling and
  parenthetical display convention are unsettled.
- ID 9404 remains uncertain: `Death Cap` may be a mushroom or a specific
  inventory name; the isolated label does not establish which Korean form is
  appropriate.
- ID 9405 is accepted: replace `살아 있는 불꽃의 으뜸가는 근원지` with
  `살아 있는 불꽃과 가장 긴밀히 이어진 중심지`. English calls Aodh the
  `prime nexus` of the living flame, not its origin or source. Japanese and
  Chinese use source/origin-like wording, but English is the semantic
  authority. Paragraph and blank-line structure are unchanged.
- ID 9406 is `not an issue`: Korean preserves the narrator's explicit
  uncertainty about whether the blade is Niskaru-made.
- ID 9407 remains uncertain: `intercept Agarth` may mean meet/catch up with
  him or physically block him; the locale references diverge.
- ID 9408 remains uncertain: `gone` does not establish departure versus
  death; Chinese specifies death, while English and Japanese do not.
- ID 9412 is `not an issue`: Korean retains the broken ring, the debt owed,
  and the plan to return with the money without claiming sale proceeds were
  received.
- ID 9414 remains uncertain: the conjectural authorship and weapon
  description are preserved, but canonical Kollossae/Fae/Faeblade forms need
  terminology alignment.
- ID 9418 remains uncertain: the Korean shifts the comparison from Webwood
  itself to life there. Context may imply that reading, but the references do
  not establish it strongly enough for an edit.
- ID 9419 remains uncertain: `gone` is non-specific in English, and Japanese
  and Chinese suggest different outcomes; retain the existing wording pending
  context.
- ID 9421 remains uncertain: the isolated `Runaways` label does not establish
  whether it is a quest/title or a description of people.
- ID 9422 remains uncertain: `Preordained` may be a faction/status or generic
  description; canonical Korean terminology is open.
- ID 9424 remains uncertain: capitalization suggests a title or poetic
  fragment, but its intended image and continuation are not established.
- ID 9427 remains uncertain: duration and weapon-slot condition are
  preserved, but the official Korean combat term for `Charm` is unverified.
- ID 9430 is `not an issue`: both localized markers remain in source order,
  and Korean preserves the bonus Fate reward without changing its recipient.
- ID 9432 remains uncertain: the five-line creation verse and its imagery are
  retained, but canonical spellings for Saina, Esharra, and Hollowlands need
  alignment.
- ID 9434 remains uncertain: `Collections` may identify collectibles,
  donations, or another UI category; the source label alone is insufficient.
- ID 9437 remains uncertain: the isolated `Doness` label does not establish
  whether it is a name, title, or role.
- ID 9442 remains uncertain: the name sequence is clear, but Korean
  transliteration and parenthetical display should follow a corpus-wide
  convention.
- ID 9446 remains uncertain: English says `mission`, Japanese says
  monastery, and Chinese describes a preaching place; the Korean institution
  term cannot yet be settled.
- ID 9448 is `not an issue`: `집계` preserves the accurate-counts meaning and
  the formal request's pivot to the interview question.
- ID 9449 remains uncertain: the artifact and Ethene spellings are not
  canonicalized; the references do not establish a better exact distinction
  between creating and assembling it.

## Applied Edit

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 9405 | `살아 있는 불꽃의 으뜸가는 근원지가 아오드라는 데에는 의심의 여지가 없다.` | `살아 있는 불꽃과 가장 긴밀히 이어진 중심지가 아오드라는 데에는 의심의 여지가 없다.` | D-2628: render `nexus` as a central connection, not an origin. |

## Verification

- The 25 candidate findings were checked against the actual English,
  Japanese, Chinese, and active Korean rows. Historical questions identified
  for this range were checked against the active rows.
- The active `default` CSV parses as 65,135 records with IDs 0-65134 in
  order. Its UTF-8 BOM and CRLF record endings are preserved; there are no
  bare LF endings.
- Only the approved `Texto` phrase at ID 9405 changed. No runtime marker,
  row key, variant, or paragraph break was changed.
- Active Korean `default` CSV SHA-256:
  `d94089d9b4638e57a1c8c526938f617f5c8b95c9aae716782cd4fd6ef414e57`.
- Before this batch: 411 accepted, 836 `not an issue`, and 1,380 uncertain.
  After this batch: 412 accepted, 841 `not an issue`, and 1,399 uncertain.
- Resume at ID 9450; 55,685 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
