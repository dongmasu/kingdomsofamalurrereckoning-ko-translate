# Preliminary Language Scan: `default` IDs 38451-38500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38451-38500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38468 | `{3}% 확률로 {1} {2} {4}` | Record the locale-specific marker-order exception; Korean preserves English order. | English, Chinese, and Korean order the localized effect placeholders as `{3}`, `{1}`, `{2}`, `{4}`; Japanese uses `{3}`, `{2}`, `{1}`, `{4}`. Marker identities are preserved. | High |
| 38482 | Castellan / `성주` | Check whether the formal office/title should be distinguished from a generic castle lord or owner. | English identifies the character by the office “Castellan”; Japanese likewise uses a castle-governor title. Korean conveys that she holds the vault key but may flatten the title distinction. | Medium |
| 38487 | Ravenswing / `레이븐스윙` | Determine whether Ravenswing is a personal name, alias, or ship name in the surrounding quest context. | English says to give “him” that name and then ship him to Klurikon; Japanese renders it as a ship-name form, while Korean treats it as a personal alias. | Medium |
| 38496 | Livrarium / `도서관` | Verify whether Livrarium is a named library/archive and retain the proper-name distinction if established. | English capitalizes “Livrarium”; Japanese uses a named-library form, but Korean and Chinese render it generically as a library. | Medium |

IDs 38451-38467, 38469-38481, 38483-38486, 38488-38495, and 38497-38500
generally retain the English meaning on this first reading. ID 38453's
“metaphorial” is an English source typo; the Korean conveys the intended
metaphorical sense. Proper names, lore, register, and UI context remain
subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log does not cover this range;
  its documented gap includes IDs 37700-40349. No historical disposition is
  inferred for IDs 38451-38500.
- Existing terminology notes were considered for faction/place names and
  formal titles. The identity of Ravenswing and the exact status of
  Livrarium remain unresolved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38451-38500 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities match
  across all four locales. ID 38468 has the Japanese-only `{1}`/`{2}` order
  difference; Korean follows English.
- The journal at ID 38499 retains the paragraph and `{LINE_SPACE}`/
  `{LINE_CENTER}` layout. The potion/combat values and quest/UI labels in
  this range were compared and retained.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 38451-38500 received one preliminary reading. Initial working
dispositions are recorded in
[`disposition-batch-default-38451-38500-20261010.md`](disposition-batch-default-38451-38500-20261010.md);
this does not constitute independent linguistic approval. Continue at
`default` ID 38501.
