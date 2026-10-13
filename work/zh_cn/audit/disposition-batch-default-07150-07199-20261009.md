# Disposition and Edit Batch: `default` IDs 7150-7199

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 7150-7199.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Nineteen findings were dispositioned: four accepted, eight `not an issue`,
  and seven uncertain. This remains an in-progress disposition pass, not
  independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 7155 | `겨울 궁정(High Court of Winter) 고위 인사` | `겨울 궁정(High Court of Winter)의 구성원` | D-1932: follow English/Chinese `member`; do not add a high-ranking office. |
| 7157 | `홀로랜드(Hollowlands) 지점의 아풀 비르` | `홀로랜드(Hollowlands) 본사의 아풀 비르` | D-1934: follow English `headquarters`; retain the separate Adessa home-office return destination. |
| 7168 | `아르진(Argine)이 좌지우지해. 일도 꽤 잘하고.` | `아르진(Argine)이 맡아 운영해. 운영도 꽤 잘하고.` | D-1939: describe neutral management rather than imply improper control. |
| 7198 | `이 지역의 군사 통치권은 우리가 맡았다.` | `이 지역의 치안은 우리가 맡고 있다.` | D-1947: preserve the security authority without adding a claim of political government. |

## Other Dispositions

- IDs 7151, 7161, 7164, 7166's quest sequence, 7172, 7189, 7193, and 7196
  are `not an issue`. Names in the 7151 line match related Korean usage; the
  repeated source sentence, token, values, and line break are retained.
- IDs 7150, 7153, 7155's `God Storm`, 7166's `Rathir` spelling, 7183, 7186,
  and 7190 remain uncertain. The unresolved lore referent, canonical names,
  isolated UI label, speaker register, and architectural/office terms were
  not changed.
- The long passage at 7190 retains its three source paragraphs. Numeric and
  runtime-marker content across this range remains unchanged.

## Verification

- The four locale CSVs contain the same 65,135 `default` IDs in identical
  order.
- Preliminary structural comparison found matching line-break counts and
  runtime-marker identities/order for all 50 IDs. The named icon at 7193,
  the 50% value at 7189, and the values/line break at 7196 are preserved.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF
  record endings.
- Active Korean `default` CSV SHA-256:
  `66903d7b26385feafc5ea30004423627cd8e0764d583e54fe1afd1357c0dff1d`.
- Cumulative dispositions: 342 accepted, 582 `not an issue`, and 1,023
  uncertain. Resume at `default` ID 7200; 57,935 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
