# Disposition and Edit Batch: `default` IDs 7000-7049

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 7000-7049.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twenty-one findings were dispositioned: two accepted, ten `not an issue`,
  and nine uncertain. This remains an in-progress disposition pass, not
  independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 7018 | `장착품 수리 완료` | `장착한 장비 수리` | D-1888: restore the repair action rather than an unsupported completion status. |
| 7037 | `나가! 내 눈앞에서 꺼져! 나가, 나가, 나가, 나가!` | `나가! 내 눈앞에서 꺼져! 나가, 나가, 나가, 나가, 나가!` | D-1897: preserve the five repetitions in the English source. |

## Other Dispositions

- IDs 7002, 7013-7014, 7016, 7022, 7027-7028, 7034, 7043, and 7046 are
  `not an issue`; the authority/disdain line, Eswin's characterization,
  fungus-return sequence, inaccessible-world image, hall bonus, fate/
  garment metaphor, localized markup, defense values, war duration, and
  noble count are preserved.
- IDs 7001, 7004, 7008-7009, 7011, 7021, 7029-7030, and 7035 remain
  uncertain because of deferred Balor/Rathir normalization, poem imagery,
  duration conflict, institution identity, debug-label status, ambiguous
  `Locus`/Crossing references, or unresolved canonical name spellings.
  These texts remain unchanged.
- Applicable historical questions and preliminary findings were checked
  against English, Japanese, Chinese, and active Korean. Prior register
  decisions explicitly defer corpus-wide Rathir normalization; no such
  normalization was made here.

## Verification

- The four locale CSVs contain 65,135 `default` IDs in identical order.
- The four-line poem at ID 7004 and three-line stat description at ID 7034
  retain their source line-break counts. The markup at ID 7028 is unchanged.
- The active Korean CSV has a UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and no bare LF/CR bytes.
- Active Korean `default` CSV SHA-256 at this checkpoint:
  `558b8b3dd85c306fc80acf74e34ec994cb1cfc9823b272ce493cc5136f6b2e9f`
- Cumulative dispositions: 331 accepted, 564 `not an issue`, and 1,004
  uncertain. Resume at `default` ID 7050; 58,085 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
