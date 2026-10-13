# Disposition Batch: `default` IDs 34051-34100

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary report with English meaning,
  Japanese register, Chinese supporting evidence, active Korean, historical
  questions, established terminology, and structure.
- Decisions: three accepted, three `not an issue`, and ten uncertain findings,
  plus one `not an issue` disposition for remaining ordinary text.
- CSV changes: IDs 34066, 34075, and 34076 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34054 | Barten / spider's den / Garaner's control | Uncertain: the discovery, kill, uncontested control, and reward objective are preserved; exact Shade River cave naming and relation wording need context. |
| 34056 | `dustling` / the Telling | Uncertain: `먼지 인간` is literal but may be an in-world mortal category; Japanese transliterates Dustling and Chinese uses “mortal.” The Telling also lacks a settled Korean lore term. |
| 34059 | Seven-line arrow-miss reflection | Uncertain: retain the full sequence, self-effacing rationale, and six line breaks; the repeated knowing/not-knowing construction and voice require surrounding context. |
| 34066 | `used to dust on your feet` | Accepted: change to `여행길이 익숙해 보이는군. 늙은 땜장이가 철을 모으는 걸 도와주겠나?` Japanese and Chinese make the travel idiom explicit; the literal dust image is unnatural in Korean. |
| 34068 | `however long I wish that to be` | Uncertain: lifetime-long guilt is clear, but the English wish clause and whether it refers to desired lifespan are not fully resolved by the locale references. |
| 34072 | Red / handover and death | Uncertain: Korean preserves the surrender threat, but “Red” may be an individual or faction and its canonical form remains open. |
| 34073 | `a good Traveler` | Uncertain: the skilled-traveler reading is supported, but capitalized Traveler may identify the faction/class; standardize only after the corpus-wide term decision. |
| 34075 | `{*1block}` tutorial payload | Accepted: change the payload to `{*1막아}` so the full Korean reads naturally as “적의 공격을 막아낼 수 있습니다.” Japanese and Chinese localize this action payload; retain both wrapper identities and their order. |
| 34076 | `Word about the Court` / House of Ballads | Accepted: change `네 궁정 소식` to `궁정에 관한 소식`. English does not say “your,” and this restores the stated relation without deciding whether Court has a canonical institutional translation. |
| 34077 | Lock-picking questions / Customs House | Uncertain: retain both teasing questions and the ledger objective; the exact first question's wordplay and location terminology need context. |
| 34081 | `oddity, an omen` / Hallam | Not an issue: Korean preserves both the mortal's unusual presence and Hallam's omen expertise. |
| 34083 | Premature resettlement / seeing things through | Not an issue: Korean retains the admission, arrival timing, and concession that some matters must be seen through. |
| 34087 | Idylla hymn / Ethene / Ouranos | Uncertain: retain all six verse lines and the blank separator; deity, people, and city-name forms remain terminology questions. |
| 34092 | `pariah` | Uncertain: Korean conveys being shunned and preserves the speaker's irony, but the strength of the social-outcast sense needs dialogue context. |
| 34098 | Fateweaver Order | Uncertain: founding place and century-long absence are retained; `교단` may over-specify the institution, as in other unresolved Order references. |
| Remaining ordinary text in IDs 34051-34100 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was identified; all 50 ordered IDs and inspected structures align. |

## Historical Audit Reconciliation

- The source-keyed historical entry covering IDs 34000-34199 flags Dustling
  and Telling, the arrow-miss reflection, the iron-tinker idiom, Red,
  Travelers, the block token, Court/House, lock-picking wordplay, omen logic,
  resettlement, the Idylla hymn, pariah, and Fateweaver Order. Those candidates
  were checked against the four locale rows and current Korean.
- ID 34075's wrapper order remains `{1}` then `{*1...}`. Only the localized
  payload was changed, following Japanese and Chinese, and its Korean verb
  form was selected to fit the surrounding sentence.
- The edit at ID 34076 removes the unsupported possessive but deliberately
  does not settle the broader Korean rendering of “Court.”
- No historical question was treated by itself as authorization to edit.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 34051-34100 once
  and in identical order.
- Embedded line-break counts and runtime-marker wrapper identities align
  across all four locales. ID 34059 retains six line breaks; the poem at
  ID 34087 retains the same stanza break. No numeric-value discrepancy was
  detected.
- Active default CSV SHA-256:
  `c832bfa68406b60d4b47607691f233a26b8ade04a69569ad8ca4b6b2413373b0`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 34101; 31,034 default IDs remain through ID 65134.
