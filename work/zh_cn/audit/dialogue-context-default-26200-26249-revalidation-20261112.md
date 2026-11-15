# Sequential `default` Revalidation: IDs `26200`-`26249`

- Date: 2026-11-12.
- Compared all 50 Korean entries with same-ID English, Japanese, and Chinese
  for meaning, naturalness, register, terminology, and format.
- Rechecked 11 existing ledger entries and added 39 unrecorded IDs. Two new
  correction candidates and two evidence-limited holds were recorded. One
  previously unflagged existing entry was reclassified as a candidate.
- No translation CSV or extracted asset was changed.

## Correction Candidates

These findings are not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26202` | Naturalness / register | `자네의 도움이 꼭 필요했어. 고맙네` mixes conversational and stiff address forms. Japanese is a direct, appreciative farewell; consider a consistent style such as `네 도움이 꼭 필요했어. 고마워. 네가 여기에 남아야 한다니 안타까워.` | Medium-high |
| `26224` | Naturalness | `자랑스러운 선택받은 증인인 나는` awkwardly stacks modifiers. The speaker is proud to be the chosen witness; consider `선택받은 증인인 나는 자랑스럽게도` while retaining the poem's tone and meaning. | Medium |
| `26248` | Register / text type | This quest journal entry uses spoken `했어` / `기도해야 해`, unlike the Japanese narrative and nearby Korean quest-log style. Consider `...다시 도둑질을 해 달라고 했다. 일을 시작하려면 ... 기도해야 한다.` The earlier ledger entry was reclassified as a candidate. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26203` | Meaning | English `principles` can be a wordplay or a mistake for `principals`; Japanese reads `礎` and Chinese takes principles literally. The precise organizational meaning is unclear without context, so do not replace `원칙` on assumption alone. |
| `26212` | Meaning | `Mind the refugees` can mean watch out for or look after the refugees; Japanese favors caution while Korean `잘 살펴봐` allows more than one reading. Hold pending scene context. |

## Duplicate And Structural Checks

- The range touches 11 exact-English duplicate groups comprising 34 corpus
  rows; Korean matches within each group.
- Embedded line-break counts agree across all four languages. The icon marker
  `#NAMED_ICON_360_A#` at `26240` occurs once in each language.
- `26209` has a trailing U+FEFF in the immutable Chinese source only; it is
  absent from the Korean text. The source was not modified.
- Asset association and ID adjacency do not establish speaker or order.

After recording this range, the ledger contains 36,430 of 65,135 IDs
(55.93%), leaving 28,705. Sequential coverage reaches ID `26249`; the next
range is `26250`-`26499`.
