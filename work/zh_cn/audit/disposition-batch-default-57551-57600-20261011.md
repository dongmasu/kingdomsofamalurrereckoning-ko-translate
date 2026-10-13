# Disposition Batch: `default` IDs 57551-57600

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and values. These are working
  dispositions, not independent final linguistic approval.
- One accepted correction, 41 `not an issue` IDs, and eight uncertain
  findings.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57582 | `시니릭 형제들은 이걸 장난으로 여겨. 지금은 웃고 있지만, 자기들이 저지른 것과 똑같이 잔혹한 일을 당하면 어떤 기분일지 두고 보자고.` | `시니릭 쪽 녀석들은 이걸 장난으로 여겨. 지금은 웃고 있지만, 자기들이 저지른 것과 똑같이 잔혹한 일을 당하면 어떤 기분일지 두고 보자고.` | English `Cynric boys` does not establish a brother/family relationship; Japanese says `シンリックの連中`. Use a broad group address without adding kinship. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17329 | 57553 | The crafting component is clear, but the Frosted Grip material/affix sense and canonical Korean term remain unsettled. |
| D-17330 | 57562 | English says hall, Japanese says cave, and Chinese says hall; the place type and proper-name form need context. |
| D-17331 | 57570 | The home of the Unseelie Fae and Court of Winter is clear; the faction/court transliterations need corpus-wide alignment. |
| D-17332 | 57574 | The air/light focus is retained, but the relation between the place and “one such pattern” remains syntactically unclear across the isolated line. |
| D-17333 | 57585 | The forced war, displayed bodies, desecration, and rot image are present; whether Korean `성스러운 땅` over-localizes the source's `sanctity` needs context. |
| D-17334 | 57593 | Minor armor damage and repair are preserved; the Pledgeshields faction name needs alignment. |
| D-17335 | 57595 | The intended larger-scale repeat and Fellfire Pit plant essence are preserved; English/Japanese `with/on the Almain` versus Chinese/Korean recipient readings leave treatment context open. |
| D-17336 | 57599 | The +20% Evade and 5% Health/Mana per Combo Point are preserved; English/Chinese/Korean say detonation while Japanese says hit. Keep the trigger unresolved. |

## Not an Issue

The 41 IDs are 57551-57552, 57554-57561, 57563-57569, 57571-57573,
57575-57581, 57583-57584, 57586-57592, 57594, 57596-57598, and 57600.
They preserve evident meaning, register, values, and source ambiguity. At
57551 all three `{*1}` markers remain in order; localized labels follow the
Chinese/Korean sentence order rather than English/Japanese label order.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57551-57600 once
  and in ascending order.
- The three markers at 57551 have matching identities and sequence in all
  locales. Their visible label order differs by locale pair (English/
  Japanese versus Chinese/Korean) to fit the localized sentence syntax;
  this is a recorded localized-order exception, not a missing-marker defect.
- The +20% Evade Chance and 5% Health/Mana values per Combo Point at 57599
  are retained. The source disagreement is specifically hit versus
  detonation timing, not the values.
- Rechecked the source-keyed historical entry for `57550-57649`, including
  Mitharan Frosted Grip, left-block/right-key wording, Brigand Hall,
  Unseelie, scavs, Cynric boys, Gallows Tree, Pledgeshields, Almain
  treatment, and Gambit scaling. These remain recorded where context or
  terminology cannot be established from the row.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57551/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `b0636ddaf2ef52ac466f0e9bc800197e0444238e09bfdd76f48ebccbff8e83e6`).
  Only the accepted `Texto` cell at ID 57582 changed. The UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 bare-LF endings
  are preserved.
- Post-edit active default CSV SHA-256:
  `4f8a74d3805122302e9168a7c35a072078300ca77b302fc077ce297534752163`.

D-17329 through D-17336 record the eight uncertain findings; D-17337 records
the accepted correction; D-17338 records the remaining 41 `not an issue`
IDs. Direct register totals: 1,700 accepted, 12,083 `not an issue`, and
10,758 uncertain (24,541 decisions total); next D-17339.

Resume at `default` ID 57601; 7,534 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57601-57650-preliminary.md`](default-ids-57601-57650-preliminary.md).
These are working dispositions, not independent final linguistic approval.
