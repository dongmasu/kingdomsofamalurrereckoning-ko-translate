# Candidate Reconciliation: IDs `21250`-`21499`

- Date: 2026-11-14.
- Compared all 22 candidate IDs with current English, Japanese, Chinese,
  and Korean. `21389` was already counted in a linked review; 21 IDs are
  newly counted.
- No speaker or playback order was inferred.

## Candidate Decisions

| ID(s) | Decision and evidence |
| --- | --- |
| `21252` | Retained the paired Aster clan, Ratofer, Kents, and Scaiths names and the four verse lines. |
| `21279` | Retained the consistent conversational plain register and the threat that only the speaker's team will return. |
| `21283` | Retained `자메이카(Jamaica)` without inferring the entity type. |
| `21299` | Retained `하수도 경주(The Sewer Run)`; exact duplicate `28229` matches. |
| `21321` | Retained `유골함을`; Japanese specifies ash-filled urns, consistent with the related urn entries. |
| `21338` | Retained `빅터의 양조주(Victor's Brew)` and the conversational question. |
| `21348` | Retained the Marga pairing and the plea not to disclose finding the speaker. |
| `21353` | Retained the Marches and Fyragnos pairings and the duty to prevent another opportunity. |
| `21356` | Retained `병원 구역` and completion after handling two petitions. |
| `21359` | Retained `용맹의 집(House of Valor) 경비병(Valor Guard)`, supported by the Japanese faction label. |
| `21360`, `21367` | Retained the complete Concert Shopping List and Lord of Beasts title pairings. |
| `21388` | Retained Gordon Lot's name, the delivery instruction, and the question of covering the speaker's tab. |
| `21389` | Retained the explicitly named `떠도는 샘(The Well that Wanders)`; not counted twice. |
| `21396` | Retained `허바르의 문턱(Hurvar's Doorsill)` and its location north of the river. |
| `21406` | Corrected both this objective and duplicate `42577` to `크라스트 형제(Krast brothers) 처치하기`. |
| `21438` | Retained the paired Shalarein name and the journal's explanation of the failed escape scheme. |
| `21439`, `21458` | Retained the complete Death of Solsvard and Sceptre Ground Wave labels. |
| `21465` | Retained the paired pirate-journal heading and all paragraph breaks; duplicate `36835` matches. |
| `21485` | Corrected all 26 exact-English Argine labels to `지팡이 여왕(Queen of Staves) 아르진(Argine)`, pairing the title and name separately. |
| `21492` | Retained `신탁자(Oracle) 할리다이트(Hallidite)` and the altar/guardian instructions. |

## Historical Report Discrepancy

The earlier `dialogue-context-edit-batch-20261114-21250-21499.md` says
the Argine labels were already correct and the Krast objective correction
was applied. The active CSV did not match those statements when this
reconciliation began. This pass corrected those 28 rows using the
ID-scoped preservation tool; the old report is retained as historical
evidence, not current-state proof.

Argine IDs: `1043`, `1174`, `3307`, `3501`, `6044`, `7667`, `8663`,
`11172`, `12593`, `14564`, `16655`, `21485`, `30045`, `30190`, `31796`,
`33892`, `38694`, `40340`, `41255`, `43684`, `47099`, `52596`, `53842`,
`55720`, `56433`, `62000`.

## Separate Holds And Verification

- `21366` remains held for the health-siphon label; `21384` and `21425`
  for the scope of Archsage pairing; `21409` for the unidentified Order;
  `21417` for the runtime meaning of Socketed Items; `21436` for the
  English Hughes/Hugues discrepancy.
- Refreshed only the 28 changed IDs' four-language fingerprints, retaining
  all other ledger bytes, statuses, and order.
- All 65,135 ledger fingerprints and 20 preservation/index tests passed.
  The default CSV retains its BOM, 65,135 ordered IDs, 71,838 CRLFs, and
  244 LF-only newlines.
- Cumulative candidate reconciliation: 1,209 / 4,015 (30.11%);
  2,806 not yet reconciled. A disposition does not close a held issue.
- No commit, source edit, extracted-asset edit, or build was performed.
