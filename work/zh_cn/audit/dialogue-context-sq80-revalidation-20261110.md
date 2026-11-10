# SQ80 / Gorem Kane Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 36 `default` keys found in `1565116.quest_bxml`.
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains the explicit `QUEST_ID SQ80`, the asset-level symbol
`NPC_ALA_VAR_GoremKane`, and 16 serialized `dialog_line_*` handlers. Its text
concerns mercenaries at Moondown, Captain Canwen's request to clear Tuatha
watchtowers along Shadow Pass, and their contract and payment.

There is an unresolved identifier discrepancy in the same asset: all 16
handler names contain the `SQ94` prefix, and IDs `29785` and `32219` use the
runtime variable `($SQ94.gold_amount$)`, while the explicit `QUEST_ID` field
is `SQ80`. A scan of the extracted quest assets found this as the only asset
with `sq94`-prefixed dialogue handlers; it still declares `SQ80`. The index
therefore retains the explicit asset-level quest ID `SQ80`, and this report
records the `SQ94` evidence without assuming which identifier is mistaken or
changing the asset grouping.

All 36 exact-key matches were compared at the same ID across the active
Korean, English, Japanese, and Chinese `default` tables. The asset-level NPC
symbol does not map individual keys to Gorem Kane, other speakers,
callbacks, branches, addressees, or playback positions.

## Revalidation Findings

This is a read-only reviewer finding and proposed text, not permission to edit
the active translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `46715` | Terminology / context consistency | `The towers line the pass behind you` refers to the same Tuatha watchtowers described at `2243` and `23439`. The Korean switches from `감시탑` in those rows to `탑` here. Consider `네 뒤쪽 고개를 따라 감시탑들이 늘어서 있군.` | Medium-high; exact callback and speaker remain unmapped |

The identical English payment line at `29785` and `32219` has identical
Korean, Japanese, and Chinese text. The `$SQ94.gold_amount$` variable is
preserved exactly in all four locales at both IDs. `FAILURE LINE` at `32088`
is likewise unchanged across the four locales. No line breaks or brace
markup were found.

The other 35 rows showed no clearly supported meaning, Korean naturalness,
register, address, honorific, terminology, or formatting defect. The
dialogue-like Korean consistently uses informal/plain speech. The canonical
spellings and pairings for `Shadow Pass`, `Tuatha`, `Moondown`, `Camp
Moondown`, `Captain Canwen`, `Alfar`, `Desiderus Trav`, and `High Fulgen`
match the established terminology records. `Mercenaries` and `The
Mercenaries` are translated as `용병` and `용병들`; their different source
labels and unavailable line-level context do not establish a correction.

## Coverage and Limits

All 36 asset-linked IDs were reviewed for content type, meaning, Korean
naturalness, speech level, address, honorifics, terminology, and format as
applicable. The finding and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. The `SQ80` / `SQ94` identifier discrepancy
requires a separate structural analysis; it is not treated as proof of
misassigned dialogue or as approval to change any text or metadata.

The full ID set is:

`2243`, `3428`, `4818`, `6604`, `11192`, `16807`, `18071`, `22941`, `23439`,
`27635`, `29785`, `30989`, `32088`, `32219`, `33535`, `33886`, `42573`,
`43113`, `43775`, `44522`, `46571`, `46715`, `49456`, `49653`, `52159`,
`54151`, `55510`, `56836`, `57781`, `58699`, `59081`, `59821`, `60746`,
`60873`, `63558`, `64682`.
