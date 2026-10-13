# Preliminary Language Scan: `default` IDs 10100-10149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10100-10149.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10101 | `I pull your strings now` → `내가 네 줄을 쥐고 있지` | Preserve the speaker's claim of control/manipulation, but check whether the literal string image sounds natural in Korean. | The following battle condition is retained. Japanese says the player is being used and Chinese explicitly describes being manipulated; Korean's “holding your strings” preserves the metaphor but may read literally. | Medium |
| 10109 | replacement Keepers / Crossing | Confirm whether `Keepers` is an organization/title and whether the Crossing is a place or destination; preserve that this is a preparation site. | Korean keeps the replacement/successor sense as `후임 수호자들` and identifies work at the Crossing. The exact institutional role remains open. | Medium |
| 10130 | `The Scion` → `사이온` | Distinguish the formal in-world title from generic lineage/descendant uses, and reconcile its display spelling. | Korean matches the recurring title form `사이온` in rows such as 8415 and 8781. Other source occurrences use `Scion` in different senses and have multiple Korean renderings; do not normalize every sense together. | Medium |
| 10133 | `the Freemen` → `자유민들` | Align faction-name treatment with the established display convention. | This is understandable, but the active corpus also uses `프리맨(Freemen)` and `자유민(Freemen)` for the faction. | Medium |
| 10140 | `scullions` / `the Missives` → `하인들` / `서신` | Preserve the contempt in `scullions` and determine whether `the Missives` names the Sable books/collection rather than generic correspondence. | Korean keeps the servants and the importance of the text to Grim and the speaker, but `하인들` is neutral. Earlier rows 9095 and 9111 name `the Missives` as `세이블의 서신`, making the shorter generic `서신` a consistency/context question. | High |
| 10145 | capitalized `the Weave` → `직조` | Confirm whether this refers to the setting's named metaphysical Weave; align the term without changing the destruction claim. | Korean preserves that proximity causes the Weave's destruction to continue. The corpus alternates among `직조` and `운명 직조`, so the proper-name sense/display remains open. | Medium |
| 10146 | `never leave an impression` → `흔적을 남기지 않는` | Preserve the idea of being forgettable or not making an impression; check whether `흔적` suggests physical traces instead. | English and Japanese both use the social/figurative sense of leaving an impression. Korean `흔적을 남기다` can be read as leaving a physical trace, potentially shifting the joke about useful, unmemorable fools. | High |
| 10143 | Carowyn / return to Mel Senshir | Retain the inferred return-to-war object only as contextual interpretation, not as explicit source wording. | Korean says Carowyn had no intention of sending the speaker back. That fits the adjacent refusal to return to Mel Senshir, while the English omits the object of `make me`. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 10109, 10140, and 10143 against
  the active English, Japanese, Chinese, and Korean rows.
- Added active-row checks for IDs 10101, 10130, 10133, 10145, and 10146,
  including recurring `Scion`, `Freemen`, `Missives`, and `Weave` forms.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts, brace-token sequences, and runtime
  markers match across all four locales throughout this range.
- Combat values and resource amounts at IDs 10116, 10124, and 10139 are
  retained.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat name and term questions above as settled.

## Batch Status

IDs 10100-10149 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
