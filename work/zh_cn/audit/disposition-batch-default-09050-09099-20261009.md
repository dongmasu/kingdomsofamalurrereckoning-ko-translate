# Disposition and Edit Batch: `default` IDs 9050-9099

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 9050-9099.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Existing audit decisions and
  active-corpus terminology were also checked.
- Thirteen findings received dispositions: three accepted, three `not an
  issue`, and seven uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 9053 is accepted: restore the final repeated `Run!` as
  `도망쳐! 도망쳐!`, preserving the three-part urgency of the English line.
- ID 9062 is `not an issue`: Korean follows the English `Dvergan Raider`,
  corroborated by Chinese. Japanese's `Dvergan pirate ship` remains a source
  divergence.
- ID 9063 remains uncertain: `dustlings` may be a named people or a
  dismissive term for mortals; the Korean's canonical group form is unknown.
- ID 9066 remains uncertain: the narrative relationship is preserved, but the
  spellings of Fateweaver, Cradle of Summer, and Alfar need corpus alignment.
- ID 9067 is `not an issue`: Korean's broad `선물` preserves English `gifts`,
  while Japanese supports the offering nuance in `바치다`.
- ID 9069 is accepted: replace `페이 처녀` with `페이 여성` to avoid adding
  an unsupported implication of virginity to the reported attack.
- ID 9071 remains uncertain: `the telling` may be a named Fae tradition;
  terminology must align with the related unresolved occurrence at ID 8954.
- ID 9072 is `not an issue`: Korean follows English `exhumed`; Japanese's
  awakening and Chinese's birth readings are divergent supporting references.
- ID 9079 remains uncertain: `The Wolds` is likely a place name, but its
  canonical Korean spelling and parenthetical style are not established.
- ID 9081 remains uncertain: `Gallows End` has inconsistent Korean forms,
  and the named status/translation of the `Offering` ceremony is unresolved.
- ID 9088 remains uncertain: locale evidence indicates a named game, but the
  Korean title and exact game category remain open.
- ID 9094 is accepted: correct the reversed envy relation to
  `네가 나를 부러워하는 것처럼 들리는군.`
- ID 9095 remains uncertain: English calls `Missives of Sable` an ancient
  book, but the canonical Korean title/category is not established.

## Applied Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9053 | `전투에서 졌다. 바보들아, 도망쳐!` | `전투에서 졌다. 바보들아, 도망쳐! 도망쳐!` | D-2525: restore the repeated escape command. |
| 9069 | `...페이 처녀를 공격한 사건을...` | `...페이 여성을 공격한 사건을...` | D-2530: avoid implying unsupported virginity. |
| 9094 | `내가 부러워하는 것처럼 들리는군.` | `네가 나를 부러워하는 것처럼 들리는군.` | D-2536: restore the source's direction of envy. |

## Verification

- The preliminary report covers all 50 IDs. Relevant English, Japanese,
  Chinese, and Korean source rows were compared directly.
- The active Korean `default` CSV has a UTF-8 BOM, semicolon delimiter,
  two-field records, a header plus 65,135 ordered unique data IDs (0-65134),
  and CRLF-only line endings. The validation parsed multiline records.
- The active Korean `default` CSV SHA-256 after these edits is
  `d68367f81c11f09bfc09e4cd4849219c17373355ebd5fc18d3d29e789617eebc`.
- Before this batch: 399 accepted, 799 `not an issue`, and 1,326 uncertain.
  After this batch: 402 accepted, 802 `not an issue`, and 1,333 uncertain.
- Resume at ID 9100; 56,035 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
