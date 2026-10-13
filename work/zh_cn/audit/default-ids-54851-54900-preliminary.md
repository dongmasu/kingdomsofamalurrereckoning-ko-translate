# Preliminary Language Scan: `default` IDs 54851-54900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54851-54900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54854 | `Missives of Sable` / `세이블의 서신` | Standardize the formal title and distinguish the missives from a book/scroll collection. | Korean keeps the proper-name form and plural “letters/missives”; Japanese and Chinese render a book/scroll title. Earlier active text at 54737 also uses `세이블의 서신`, so retain corpus consistency pending context. | Medium |
| 54863 | `주인님` for `the master` | Determine whether `master` means a master/teacher, institutional head, or owner, and preserve the grateful address to the Beckoned. | Korean uses a general honorific “master.” Japanese/Chinese interpret an institutional head/dean; the source alone does not specify the role. | Medium |
| 54867 | `Scion` / `후계자` | Confirm whether Scion is a formal rank/title or a generic successor in Akara's line. | Korean preserves the relation that the player is Akara's new Scion; the title's specific lore sense remains open. | Medium |
| 54869 | `용맹의 군주들(Lords of Valor)` | Determine whether this is a named group, faction, or generic honorific; standardize its Korean name. | Korean follows the capitalized plural title. Japanese transliterates the group and Chinese translates “lords of valor.” | Medium |
| 54871 | `hoplon` / `호플론` | Confirm whether `hoplon` is the formal shield type/name and preserve the legendary defensive capability. | Korean transliterates the source item term and retains the need for a strong arm and its defensive reputation. Chinese describes a large round shield; source `capablities` is misspelled but the intended sense is clear. | Medium |
| 54874 | `Rast는 죄 없는 사람이야` for `Rast is an innocent` | Preserve the intended meaning of `innocent` and the reason the speaker lied about the revenge mission. | Korean says Rast is a person without guilt; this is a plausible reading, while the line could also use “innocent” as a broader characterization. The rest of the motive is retained. | Medium |
| 54881 | Wolds / `meeting its destiny quietly` | Clarify whether the Wolds are accepting, approaching, or quietly undergoing their fate; preserve the contrast with unrest elsewhere in Erathell. | Korean says the Wolds are quietly meeting their destiny. Japanese says destiny is silently approaching, while Chinese also describes the Wolds facing their fate. The English personification is ambiguous. | Medium |
| 54886 | Sinsear / Hollow / `the Sorrows` | Determine whether `the Sorrows` means the House of Sorrows/faction and whether `Hollow` is a proper location; preserve the totem, barrier, and key objectives. | Korean explicitly expands `the Sorrows` to `비애의 집`, but parenthetically uses the English lowercase `the Sorrows`; other locales vary between a faction and “sorrows.” The sentence's objective chain is retained. | High |
| 54891 | localized merchant/gold/buy/sell markers | Preserve all marker identities/order, `LINE_SPACE`, `{1}`, and `{2}` while keeping the displayed UI labels consistent. | The four locales share the normalized marker sequence `{*1}`, `{*1}`, `{LINE_SPACE}`, `{1}`, `{2}`, `{*1}`, `{*1}`. Korean localizes the display labels; the exact purchase/sale UI wording remains a terminology check. | High |
| 54893 | `운명의 실마리` for `the threads` | Confirm whether this explicitly means threads of Fate or simply the threads the speaker is trying to read; preserve the “something funny about you” observation. | Korean supplies “threads of Fate,” which fits the setting but is not explicit in this row. Japanese keeps literal threads; Chinese interprets them as clues. | Medium |
| 54896 | `사랑하는 메이르의 마음` for `my Maire's sweet heart` | Preserve the intimate endearment and confirm Maire's established Korean name form. | Korean retains the returned heart as the greatest treasure and calls Maire beloved; the exact affectionate tone and name spelling remain open. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Jera, Mattix Dace, Missives
of Sable, Sir Elswin, Dellach, Siege Breaker, Beckoned, Scion, Lords of
Valor, hoplon, Rast, Wolds, Mitharu, Empty Tome, Embassy Hall, Togh,
Sinsear, Hollow, House of Sorrows, Virki, Tywili Coast, High King,
Jakin, Jokull Fangard, Maire, Gambling Den, Ega Golfred, Tuatha, and
Maire.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54850-54949`.
  Relevant questions include Missives of Sable (54854), Scion (54867),
  Lords of Valor (54869), hoplon (54871), Rast's innocence (54874), the
  Wolds/destiny phrase (54881), Hollow/Sorrows (54886), merchant markers
  (54891), fate-threads (54893), and the Valor Arena/Jakin/Jokull items
  later in the range.
- ID 54850 is the historical range's opening boundary and was included in
  the preceding active report. This report begins at 54851 without overlap.
- Historical questions remain preliminary prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54851-54900 once
  and in identical ascending order.
- Physical line-break counts match throughout the range.
- The `+15%` Piercing Damage value at 54864 is preserved. Marker identities
  and order at 54891 match after normalizing localized display labels.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

This document records a preliminary scan, not independent final approval.
Its findings were dispositioned in
[`disposition-batch-default-54851-54900-20261010.md`](disposition-batch-default-54851-54900-20261010.md):
no CSV edits, 39 `not an issue` IDs, and 11 uncertain IDs.
Continue at `default` ID 54901.
