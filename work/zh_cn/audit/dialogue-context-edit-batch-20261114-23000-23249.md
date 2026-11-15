# Dialogue Context Translation Edit Batch: IDs `23000`-`23249`

- Date: 2026-11-14.
- Rechecked the range's candidates against the current English, Japanese,
  Chinese, and Korean rows. English established meaning, Japanese guided
  voice/register, and Chinese supported the comparison.
- Adjudicated all 14 candidates carried in the range: 12 supported corrections
  were applied and two were already reflected in the current CSV.
- Applied four linked terminology corrections outside the range. Unresolved
  findings remain held; no speaker, gender, branch, or playback order was
  inferred from asset association.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `23013` | Removed the redundant `(Fae)` inside the already-paired event title, retaining the Elf/Fae distinction. |
| `23026`, `23074` | Standardized the action objectives to `-하기`, retaining their named targets. |
| `23066` | Added `Might` and `Finesse` pairings to the already-paired `Sorcery`; kept all seven localized markup/control markers in order. |
| `23078` | Replaced polite endings with natural plain conversational speech, matching the same-ID Japanese style without assigning a speaker. |
| `23089` | Changed literal `침대` to `방`, supported by Japanese and Chinese; preserved the gold-cost variable. |
| `23151` | Reordered the six-deity phrase naturally and retained the `Six Patrons` pairing. |
| `23164` | Removed the preachy literal rendering of `be a good sort`; retained the friendly request to bring the ledger. |
| `23185` | Paired the embedded headings as `두렉의 도끼(The Durek Axe)` and `새벽 찬가(Hymn to Dawn)` without changing the poem's line layout. |
| `23199` | Paired the capitalized location as `할로(The Hollow)`. |
| `23213` | Replaced the awkward `여기서 나가고 싶다` with the natural, tentative `떠나고 싶다`, preserving Akara's departure and the ship question. |
| `23237` | Corrected both occurrences of the Kollassae name to `콜로사이(Kollassae)`, preserving this English source's spelling. |
| `3187`, `8323`, `25385` | Rechecked the related Hollow group: rendered lowercase generic `hollow` as `동굴` and aligned capitalized `The Hollow` references to `할로(The Hollow)`. This does not identify the place with Adarus Hollow. |
| `59925` | Aligned the second reference to the Motus Mining branch handbook with the established `지점 업무 안내서` wording used in the linked rows, including `23156`. |

`23116` already used `성약단(The Testament)`, and `23156` already used
`지점 업무 안내서`; neither needed a repeat edit. The range's unrelated
meaning and context holds, including `23000`, `23042`, `23137`, `23197`, and
`23200`, remain unresolved.

Only the 16 edited IDs' `source_fingerprint` values were refreshed. All other
ledger rows and fields were preserved.

## Verification

- The ledger validates all 65,135 IDs against the four current language
  tables.
- The default CSV retains its UTF-8 BOM, 65,135 ordered records, and 71,845
  CRLF / 244 LF-only record endings.
- Edited-row checks confirm the seven markup/control markers at `23066` are
  preserved in order, the two `Kollassae` spellings are paired, and the
  `23185` poem retains its 78 embedded line breaks.
- All 11 `replace_text_preserve_eol.py` regression tests passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.

The next sequential candidate range is `23250`-`23499`.
