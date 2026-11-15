# Sequential `default` Revalidation: IDs `64750`-`64999`

- Date: 2026-11-13.
- Compared the current Korean with English for meaning, Japanese for voice,
  register, honorifics, and layout, and Chinese as supporting evidence.
- Rechecked 69 existing ledger IDs without rewriting their append-only rows.
  Added the other 181 IDs in ascending order: 178 with no new issue and
  three evidence-limited holds.
- No translation CSV, source CSV, or extracted game asset was changed for
  this review.

## New Evidence-Limited Holds

| ID | Unresolved point |
| ---: | --- |
| `64844` | `a telling` is a setting-specific narrative/legend term. Japanese uses a word for tradition or tale, while Chinese uses a different term; the established Korean lore term needs confirmation in context. |
| `64878` | `Orison` may name a prayer, offering, or ritual. The capitalized English and divergent locale renderings do not establish the exact referent. |
| `64972` | `your grace` conflicts with the casual Japanese address and the Chinese royal honorific. The speaker-recipient relationship is not proven by this isolated key. |

## Rechecked Existing Findings

Six existing candidate rows (`64768`, `64795`, `64911`, `64916`, `64922`,
`64964`) and one existing uncertain row (`64954`) were checked against the
current text and sources. Their original ledger rows and fingerprints were
preserved.

At `64847`, the active wording differs from the earlier accepted proposal,
but preserves the rule that a correct hex or ace ends the game while another
correct card advances to the next hand. No additional change was identified.

At `64964`, the earlier naturalness correction to the fresh-corpse wording is
present. The separate `cremate` wording question remains distinct: English
uses that verb, while Japanese and Chinese describe burning, so the current
`불태워` remains supportable. The earlier quest-context proposal is retained
in its own report and was not applied here.

## Cross-Checks

- All four language tables contain the same 65,135 IDs in matching order.
- Fifty-six exact-English duplicate groups touch the range and contain
  1,356 corpus rows. Korean translations match within all groups.
- Twenty-one Korean multiline records were checked. Logical line-break
  structure and runtime-marker/formatting skeletons match the corresponding
  language sources; existing Korean CRLF separators were preserved.
- Of the 181 newly recorded IDs, 132 have indexed asset links (138 links
  across 78 assets) and 49 have none. Asset association does not establish a
  specific speaker or playback order.

## Range Result

- The new rows comprise 178 `not-issue` dispositions and three
  evidence-limited holds.
- This range adds 181 IDs to the ledger; 69 IDs already had records and were
  rechecked without rewriting those rows.
- The holds remain unresolved rather than being guessed or normalized.

## Verification

The final corpus-wide ledger fingerprint, catalog, regression-test, and
CRLF-aware diff checks are recorded in the completion report and current
audit summaries.
