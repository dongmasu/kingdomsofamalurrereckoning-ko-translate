# Sequential `default` Revalidation: IDs `64250`-`64499`

- Date: 2026-11-13.
- Compared the current Korean with English for meaning, Japanese for voice,
  register, honorifics, and layout, and Chinese as supporting evidence.
- Rechecked 72 existing ledger IDs without rewriting their append-only rows.
  Added the other 178 IDs in ascending order: 169 with no new issue, eight
  evidence-limited holds, and one correction candidate.
- No translation CSV, source CSV, or extracted game asset was changed for
  this review.

## New Correction Candidate

| ID | Finding | Review note |
| ---: | --- | --- |
| `64412` | `scavengers` rendered as `약탈자들` | Japanese characterizes the people as rubbish scavengers. `약탈자` can imply raiding or plunder, which is stronger than the source evidence. Revisit the noun; no replacement was applied. |

## New Evidence-Limited Holds

| ID | Unresolved point |
| ---: | --- |
| `64252` | The isolated UI label `Higher` has no visible comparison target or operation in the row. |
| `64258` | `Oathblade` is retained as a name in English, rendered as a rank in Japanese, and translated literally in Chinese; the game's intended referent is not established. |
| `64276` | `The Pit` is rendered as a waiting area in Japanese, a pit in Chinese, and a fighting arena in Korean. The exact in-game location is unclear. |
| `64341` | The Geoff/cape joke has divergent agency and timing across the language sources; its intended punchline is uncertain. |
| `64353` | The English poem's metaphors and wordplay do not align cleanly with Japanese and Chinese; a confident correction would risk changing its imagery. |
| `64458` | The referent of “in this they are true” is unclear: it may qualify the stories, the Fae, or a specific claim about them. |
| `64490` | `Warden` may be an office or a descriptive role. Japanese describes a guard's duties, while English and Chinese support broader interpretations. |
| `64492` | `Page Carolic` may contain a role/title rather than a personal-name element; locale evidence does not settle how it should be rendered. |

## Rechecked Existing Findings

Seven existing candidate rows (`64283`, `64287`, `64372`, `64377`, `64438`,
`64447`, `64469`) and one existing uncertain row (`64468`) were checked
against the current text and source languages. Their earlier ledger rows and
fingerprints were preserved; this report does not overwrite their original
ID-level findings.

At `64321`, the current wording differs from an earlier accepted phrasing,
but still asks how to reach the key's location and is supported by the
Japanese and English. No further wording change was identified. Earlier
accepted corrections at `64114`, `64118`, `64155`, and `64195` remain present.

## Cross-Checks

- All four language tables contain the same 65,135 IDs in matching order.
- Sixty-one exact-English duplicate groups touch the range and contain 777
  corpus rows. Korean translations match within all groups.
- Seventeen Korean multiline records were checked. Logical line-break
  structure and runtime-marker/formatting skeletons match the corresponding
  language sources; existing Korean CRLF separators were preserved.
- Of the 178 newly recorded IDs, 136 have indexed asset links (137 links
  across 74 assets) and 42 have none. Asset association does not establish a
  specific speaker or playback order.

## Range Result

- The new rows comprise 169 `not-issue` dispositions, eight
  evidence-limited holds, and one correction candidate.
- This range adds 178 IDs to the ledger; 72 IDs already had records and were
  rechecked without rewriting those rows.
- The findings are review records, not approval to edit translations.

## Verification

The final corpus-wide ledger fingerprint, catalog, regression-test, and
CRLF-aware diff checks are recorded in the completion report and current
audit summaries.
