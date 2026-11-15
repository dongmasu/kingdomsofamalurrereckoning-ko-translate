# Sequential `default` Revalidation: IDs `53250`-`53499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 68 existing ledger fingerprints; all match and those rows
  remain unchanged. Added the other 182 IDs in ascending order.
- Two current correction candidates were rechecked from existing ledger
  records; 248 IDs have no current finding. No new candidate row was added.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Rechecked Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `53293` | Terminology / meaning | In the `SQ118` context, this is the same recoverable reconnaissance document referenced elsewhere as a report. Korean `중요한 정찰 정보` is understandable but loses the document sense present in Japanese `偵察報告書` and corroborated by the asset context. Consider `중요한 정찰 보고서` while retaining the need for someone able to enter the Midden. | High |
| `53330` | Meaning / journal form | `Now that we're through the locked door` means the locked door was opened; Japanese and Chinese make that explicit. Korean `잠긴 문을 지나왔으니` instead says the group passed through it. Consider `잠긴 문을 열었으니` and retain the journal's first-person plan to reach Maura with Ordo. | High |

Both IDs were already recorded as candidates in the ledger and linked reports.
Their source fingerprints match the current four-language rows; no ledger
entry was overwritten. No speaker or playback order is inferred from their
asset links.

## Source and Structure Checks

- Japanese ID `53265` contains a Chinese-language sentence rather than
  Japanese. English and Chinese support the current Korean meaning; this is
  recorded as a source-locale anomaly, not a Korean correction.
- `LadderVol` at `53308` is identical in all four locales and remains an
  unresolved literal identifier; no localized meaning was inferred.
- Sixty-four exact-English duplicate groups touch this range and cover 65
  target rows. Korean wording matches within every group.
- Five rows contain embedded line breaks: `53280` (1), `53295` (7),
  `53321` (4), `53394` (1), and `53478` (3). Each has matching break counts
  across all four languages, for 16 breaks per language.
- The localized display-wrapper contents at `53394` differ by language as
  expected. At `53439`, all locales retain `{1}` and `{2}` once; English and
  Korean order them `{1}`, `{2}`, while Japanese and Chinese use `{2}`,
  `{1}`. These differences are preserved.
- Of 250 IDs, 197 have indexed asset associations, represented by 204 links
  across 129 assets; 53 have no indexed asset. Of the 182 new IDs, 129 are
  linked (135 ID-asset links across 72 assets) and 53 are not. Asset links do
  not establish per-key speakers or playback order.

## Range Result

- The range has two current correction candidates, both previously recorded;
  248 IDs have no current finding. No evidence-limited hold was added.
- After adding 182 IDs, the ledger covers 56,533 of 65,135 unique `default`
  IDs (86.79%), leaving 8,602. Sequential coverage reaches `53499`; next is
  `53500`-`53749`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
