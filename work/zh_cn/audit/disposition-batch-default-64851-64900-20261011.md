# Disposition Batch: `default` IDs 64851-64900

- Date: 2026-10-11. Rechecked all 50 Korean rows by aligning the English,
  Japanese source, Chinese source, Japanese draft, and Korean working CSVs
  on `ID_Linha`; reconciled historical questions and accepted terminology.
- Three accepted targeted corrections, 37 `not an issue` IDs, and ten
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18146 | 64852 | `내가 도울 일은 없어?` | `내가 도울 일 있어?` | The English, Japanese, and Chinese offer help; the negative Korean question risks implying there is nothing to help with. |
| D-18146 | 64862 | `일찍부터 제멋대로 행동하기로 유명했던` | `조숙하기로 유명했던` | English `precociousness` means unusual maturity, not willful behavior from an early age. This is a targeted phrase correction only; the literary entry's heading/title and other lore wording remain open for integrated review. |
| D-18146 | 64887 | `그래, 아니라가 죽었다고. 놈의 살이 찢어지는 소리를 들었다면 좋았을 텐데.` | `그래, 아니라(Anira)가 죽었다고. 그 여자의 살이 찢어지는 소리를 들었다면 좋았을 텐데.` | English and Japanese identify female Anira. Parenthesize the name to distinguish `아니라` from the Korean negation and remove the masculine/generic `놈` where the source explicitly says `her`. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18147 | 64861 | Japanese identifies Sandstone Villa, while English uses only `the Villa`; the Korean generic `별장` is retained pending the location's canonical name/context. |
| D-18147 | 64871 | Fynwick Ive is transliterated differently in Japanese; the character's canonical Korean spelling is not established. |
| D-18147 | 64877 | Dverga/Gallows End name forms and the relation between the curse and the `deathly pallor` remain lore/context questions. |
| D-18147 | 64878 | `Orison` may name a rite, prayer, or ceremony; `기도회` is retained without asserting a canonical term. |
| D-18147 | 64883 | Lowercase `sorrows` may refer to spirits, a supernatural force, or ordinary grief; Korean follows the grief reading provisionally. |
| D-18147 | 64884 | The six-line poem is preserved, but Faehunter and personified Seasons/virtues need corpus-wide terminology review. |
| D-18147 | 64885 | The item/referent and `put a part of himself out for sale` remain unclear; Chinese alone reads this as discounting, unlike English/Japanese/Korean. |
| D-18147 | 64889 | Warden's Bridge may be a named location/title, and the exact attachment of the patrol's assembly point is not settled across locales. |
| D-18147 | 64891 | `Trickster Fae` may imply a deceptive schemer rather than merely a prankster; Korean retains the source's plots and torment while deferring the title nuance. |
| D-18147 | 64900 | `First Sword` may be a formal Alfar office/rank; the current transliteration is retained pending terminology review. |

## Not an Issue

Decision D-18148 records these 37 IDs: 64851, 64853-64860, 64863-64870,
64872-64876, 64879-64882, 64886, 64888, 64890, 64892-64893, and 64894-64899.
Their current translations preserve the available meaning, voice, and
structure, including the waiting instruction, quest text, verse lineation,
and intentionally unclear rolled-object clue.

## Structural and Historical Reconciliation

- The direct ID-aligned comparison found 65,135 rows in each of the five
  locale/draft CSVs and all 50 reviewed IDs in ascending order.
- ID 64862 retains its 12 embedded newlines and ID 64884 its five; values,
  variables, and runtime markers remain unchanged.
- Rechecked historical questions for the Villa, Fynwick Ive, Frozen Net,
  Orison, Sorrows, Ratofer, Faehunter verse, Canneroc, and Alfar titles.
- Only the `Texto` cells at IDs 64852, 64862, and 64887 changed. UTF-8 BOM,
  65,135 data rows, key order, and existing 72,012 CRLF/72 bare-LF endings
  are preserved. Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64851/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `320843d3272835813e15512503ba4ac6a41a91ab6a06825161c461337eef6d7e`.
  Post-edit SHA-256:
  `c30ad5460e23b8ed0e4783e07cffd0a703f0da264d335e605f53942739d631dc`.

- D-18146 records three accepted corrections, D-18147 records ten uncertain
  findings, and D-18148 records 37 `not an issue` IDs. Cumulative register
  counts through D-18148: 1,854 accepted, 17,047 `not an issue`, and 12,804
  uncertain (31,705 dispositions); next D-18149.

Resume at `default` ID 64901; 234 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
