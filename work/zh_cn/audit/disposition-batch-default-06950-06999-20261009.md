# Disposition and Edit Batch: `default` IDs 6950-6999

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 6950-6999.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twelve findings were dispositioned: three accepted, six `not an issue`,
  and three uncertain. This remains an in-progress disposition pass, not
  independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6964 | `모투스(Motus)가 들어왔을 때, 아론 채굴사(Aron Excavations)는 더 높은 임금을 약속해 노동자들을 빼갔어. 그 뒤로 아론 채굴사는 회복하지 못했지.` | `모투스(Motus)가 들어왔을 때, 더 높은 임금을 약속해 아론의 노동자들을 빼갔어. 아론 채굴사(Aron Excavations)는 그 뒤로 회복하지 못했지.` | D-1870: make Motus, not Aron Excavations, the actor luring workers away. |
| 6987 | `...지금은 순환의 흐름을 어지럽혀선 안 된다.` | `...지금은 순환(Cycle)의 흐름을 어지럽혀선 안 된다.` | D-1875: align the capitalized setting concept with the established Korean term. |
| 6990 | `그럼 드라우그(Draug)의 이쑤시개는 줄 수 없다는 사실에 놀라겠군.` | `그럼 내가 드라우그의 이쑤시개(Draug's Toothpicks)를 네게 주지 않겠다고 하면 놀라겠군.` | D-1876: express refusal rather than inability and align the repeated item-name display. |

## Other Dispositions

- IDs 6950, 6974, 6980, 6986, 6994, and 6999 are `not an issue`; the
  surveillance threat, Dead Kel attribution, lack-of-life-signs statement,
  four occupations, awkward innuendo, and exact control-token template are
  preserved.
- IDs 6954, 6958, and 6967 remain uncertain because the pronoun/fragment
  readings, canonical name spellings/title status, and apparent source typo
  cannot be safely resolved from these rows. Their text remains unchanged.
- All preliminary candidates and the source-keyed historical questions for
  IDs 6950-6999 were checked against English, Japanese, Chinese, and active
  Korean. The English meaning governs; Japanese and Chinese support rather
  than override it.

## Verification

- The four locale CSVs contain 65,135 `default` IDs in identical order.
- Edited rows have no embedded line breaks or runtime markers; ID 6999's
  `{LINE_CENTER}{1}` token sequence remains unchanged.
- The active Korean CSV has a UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and no bare LF/CR bytes.
- Active Korean `default` CSV SHA-256 at this checkpoint:
  `558b8b3dd85c306fc80acf74e34ec994cb1cfc9823b272ce493cc5136f6b2e9f`
- Cumulative dispositions: 329 accepted, 554 `not an issue`, and 995
  uncertain. Resume at `default` ID 7000; 58,135 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
