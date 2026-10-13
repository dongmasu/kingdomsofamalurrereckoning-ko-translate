# Disposition Batch: `default` IDs 58201-58250

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 32 `not an issue` IDs, and 16 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

| ID | Previous Korean / affected text | Applied Korean / replacement | Rationale |
| ---: | --- | --- | --- |
| 58210 | `제값을 쳐 줄 구매자들에게` | `평판이 좋은 구매자들에게` | English `respected`, Japanese `立派な`, and Chinese `享有信誉` describe the buyers' reputation, not the price they pay. |
| 58219 | `사투르닌이 널 원한다` | `사투르닌은 이것을 원한다` | English `Saturnyn wants this`, Japanese `これを狙っている`, and Chinese's “wants this” reading refer to `this`; Korean incorrectly changes the object to the addressee. Keep the antecedent unspecified. |

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17572 | 58201 | The gates, Virki's fall, and rubble are preserved; Virki's Korean spelling and whether the water-gates name a specific structure remain open. |
| D-17573 | 58203 | The wish to visit Ysa and meet gnomes/Alfar is retained; the English fragment `to live` does not specify living in the Gardens, as Korean does. |
| D-17574 | 58204 | The great-ballads warning and witch's role are retained; Korean narrows `rise up` to rebellion, and the lore status of the ballads is unclear. |
| D-17575 | 58207 | The formal service greeting is retained; Domus Politica may be an institution, office, or place, and the locales differ on its function. |
| D-17576 | 58209 | Employment and progression toward Pledgeshield are retained; its formal rank meaning and the climbing metaphor need context. |
| D-17577 | 58217 | English `I'm down!` can signal willingness, while Japanese/Chinese indicate defeat or inability to continue; scene context is missing. |
| D-17578 | 58218 | The Windemere song setting and travel instruction are preserved; the capitalized Maid's identity/title and Korean honorific need corpus-wide alignment. |
| D-17579 | 58221 | The speaker's hesitant repetition is preserved; Mairu's identity as a people, role, or other lore term is not established. |
| D-17580 | 58224 | The Great Cycle threshold and Hallam are retained; English, Japanese, and Chinese differ on the return/revival action. |
| D-17581 | 58234 | The standalone Tuatha Ladder Support label is translated descriptively; its referent and whether it is an internal/UI label are unknown. |
| D-17582 | 58237 | The standalone Tenders role is retained bilingually; its formal relationship to the House of Sorrows and canonical Korean title remain open. |
| D-17583 | 58238 | The institution's policy purpose and three groups are retained; Domus Politica's scope and whether `Isles` is a proper name remain unresolved. |
| D-17584 | 58241 | Habitat clue and northward route are preserved; Searstalk's plant identity and canonical Korean name remain open. |
| D-17585 | 58243 | The wall and urgent route are preserved; English/Chinese say dry land while Japanese interprets inland, so the terrain meaning is unsettled. |
| D-17586 | 58247 | The wine-before-illness clue is retained; Mallion/Coriana spellings and the unnamed gift-giver need wider context. |
| D-17587 | 58250 | The speaker's sailing authorization and gratitude are retained; English's figurative `charter, as it were` does not establish a literal permit. |

## Not an Issue

The 32 IDs are 58202, 58205-58206, 58208, 58211-58216, 58220, 58222-58223,
58225-58233, 58235-58236, 58239-58240, 58242, 58244-58246, and 58248-58249.
They preserve evident meaning, voice/register, structure, and values.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58201-58250 once
  and in identical ascending key order; each full default file contains
  65,135 records.
- No embedded line breaks, runtime tokens, or numeric values occur in this
  range.
- Reconciled the historical source-keyed prompts for IDs 58150-58249 and the
  boundary prompt beginning at 58250. Applicable questions are retained
  above. Earlier reports also flag Searstalk (ID 1635), Mairu, Pledgeshield,
  Tenders, and the `I'm down!` interpretation; none supplies unsupported
  context for this batch.
- The byte-identical pre-edit backup is
  `/private/tmp/ko-translate-backups/20261011/before-58201/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `5b21c9f2dea2df846c0845dc6ff26bdc72aa5145dd7cf498197e9c918aadf93f`).
  Only the Korean `Texto` cells at IDs 58210 and 58219 changed. The active
  CSV retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings.
- Post-edit active default CSV SHA-256:
  `b3df129cd0f225781f6337a2d643e90a67d7ab5f3ec9168c3cab0b8ea27ca1fb`.

D-17570-D-17571 record the two accepted corrections; D-17572-D-17587 record
16 uncertain findings; D-17588 records the remaining 32 `not an issue` IDs.
Direct register totals: 1,708 accepted, 12,314 `not an issue`, and 11,004
uncertain (25,026 total); next D-17589.

Resume at `default` ID 58251; 6,884 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
