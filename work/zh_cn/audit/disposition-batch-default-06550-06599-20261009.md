# Disposition and Edit Batch: `default` IDs 6550-6599

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6550-6599.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Eight findings were dispositioned: three accepted, four `not an issue`,
  and one uncertain. The three accepted edits below were applied.
- This is a working disposition, not independent final linguistic approval.

## Accepted Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6553 | `그는 자신이 벨렌의 테스타먼트(Testament)라고 믿으며` | `그는 자신이 벨렌의 테스타먼트(Testament)에 속한다고 믿으며` | D-1758: restore the source's membership relation without defining the group's exact nature. |
| 6562 | `{*1운명 역전 모드}` | `{*1레코닝 모드}` | D-1761: use the established Korean game-mode term and retain source marker order. |
| 6591 | terminal six-character ASCII sequence `\u00a0` | terminal U+00A0 nonbreaking space | D-1765: match the actual trailing whitespace in English and Chinese. |

## Other Dispositions

- IDs 6554, 6561, 6580, and 6583 are `not an issue`. The formal blessing,
  unspecified quality, Dead Kel crew/trio description, and Korean marker
  sequence preserve the source meaning and required structure.
- ID 6566 remains uncertain because the canonical Korean title for the Maid
  of Windemere is unresolved across related rows. No text was changed.
- Rechecked historical questions at IDs 6553-6554, 6561-6562, 6566, and 6580.

## Verification

- All four locale CSVs contain 65,135 `default` IDs in identical order.
- IDs 6553, 6562, and 6591 are the only translation cells edited in this batch.
- The Korean marker order at ID 6562 follows English; Japanese alone uses a
  different order. Markers at 6583 remain in English/Chinese/Korean order.
- Line-break counts and numeric values match across the batch; ID 6591 now
  ends in U+00A0, with the literal six-character escape removed.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF
  physical record endings, with zero bare LF/CR bytes.
- Active Korean `default` CSV SHA-256:
  `98f2cf30d1dd980c93c18d9ad2d5ac34bd0ad95bcbe7e24c669ee812e2ca8078`
- Cumulative dispositions: 310 accepted, 504 `not an issue`, and 951
  uncertain. Resume at `default` ID 6600; 58,535 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
