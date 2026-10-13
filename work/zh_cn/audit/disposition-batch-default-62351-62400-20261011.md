# Disposition Batch: `default` IDs 62351-62400

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Four accepted corrections, 28 `not an issue` IDs, and 19 uncertain findings.
  ID 62397 has separate accepted structure and uncertain terminology findings,
  so it is included in both disposition categories. These are working
  dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

Decision D-17997 authorizes these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 62372 | `신들께 기도드린 지 오래됐지만... 기도문이 다시 노래하는 게 느껴져.` | `신들께 기도드린 지 오래됐지만... 기도문이 다시 울려 퍼지는 게 느껴져.` | Render the litanies' return naturally while preserving the sense of hearing/feeling them again. Japanese describes the chanting resuming; Chinese says the prayers sound again. |
| 62383 | `발러(Balor)? 신경 안 써.` | `발러(Balor)? 걱정할 것 없어.` | English `I'm not concerned` and Chinese indicate lack of worry, not indifference. |
| 62394 | `이 일에 필요한 나이는 정확히 됐어.` | `이 일을 하기에 딱 맞는 나이야.` | Preserve the age-eligibility joke/assurance in natural Korean; Japanese explicitly refers to meeting the age limit. |
| 62397 | Internal marker/text separator was CRLF. | Internal marker/text separator is LF. | English, Japanese, and Chinese all use a single LF between the localized passive marker and description. Normalize only this embedded separator; retain one break, marker order, and all outer CSV record separators. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17998 | 62355 | `Anokatos gone` is rendered as having left; Japanese and Chinese imply death. The succession meaning and historical context are unresolved. |
| D-17998 | 62356 | Korean conveys passing instructions to Bisarane; Japanese says convey information and Chinese says teach. The English `must be instructed` is underspecified. |
| D-17998 | 62360 | The Crows tradition and first Champion are preserved; whether `Crows` names a standing team or roster, and its canonical Korean form, need context. |
| D-17998 | 62361 | The childhood memory and claim that Hill surpasses her father are retained; Hill's identity and Gastyr genealogy are not established here. |
| D-17998 | 62362 | Map layout and inscription languages are preserved; the official Korean spellings for Dvergan, Alfar, and Cape Solace remain provisional. |
| D-17998 | 62363 | The item label is translated literally; the category and canonical rendering of `Flawless Mitharan Slaughtering Shaft` are unresolved. |
| D-17998 | 62365 | All three institutions/places are retained; Japanese and Chinese diverge on Scholia Arcana and Orbocant, so canonical names remain open. |
| D-17998 | 62368 | `축복받은 이` preserves the neutral phrase; the isolated row does not identify whether it is a title, person, or divine referent. |
| D-17998 | 62371 | The promise, relinquished powers, fair battle, and army passage are retained; the status and canonical Korean name of House of Pride remain open. |
| D-17998 | 62373 | Grilricas and the medallion are retained; the proper-name spelling and exact item category need context. |
| D-17998 | 62379-62380 | The small Winter Fae band and Sihtric Vorm's haven are preserved; Sidhe's status as a realm/place and the group's formal name remain uncertain. |
| D-17998 | 62384 | Korean follows English and Chinese `Fomorous`; Japanese says Professor Hugues. The apparent source-name conflict cannot be resolved from this line. |
| D-17998 | 62385 | Korean selects a route/travel reading for `traffic`; Japanese supports movement and Chinese trade. The antecedent of `it` is also unclear. |
| D-17998 | 62386 | The Quartermaster's role and inventory are conveyed; canonical role and Warsworn terminology need corpus alignment. |
| D-17998 | 62389 | All nested markers and values are preserved in order; actual UI rendering and spacing cannot be verified from the source row. |
| D-17998 | 62391 | Korean preserves the glass/stone imagery and wealth contrast; English's final elliptical `it was` leaves the exact implication context-dependent. |
| D-17998 | 62397 | The passive effect and marker are retained; canonical Korean names for Storm Bolt and Shocking Damage remain glossary questions. The line-break correction is separately accepted under D-17997. |
| D-17998 | 62398 | Korean says tunnels; Japanese says underground passage and English/Chinese say tunnels. Exact infrastructure type remains unclear. |

## Not an Issue

Decision D-17999 records these 28 IDs: 62351-62354, 62357-62359, 62364,
62366-62367, 62369-62370, 62374-62378, 62381-62382, 62387-62388, 62390,
62392-62393, 62395-62396, and 62399-62400. These rows preserve available
meaning, voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean contain IDs 62351-62400 once and in
  identical ascending order.
- At 62397, all four locales contain one embedded break and matching runtime
  marker order. The three reference locales use LF; Korean previously used
  CRLF inside the text field. This batch normalized that separator to LF.
- Nested UI markers `{*3}`, `{LINE_LEFT}`, `{1}`, both `{2}` occurrences, and
  `{LINE_SPACE}` at 62389 remain in order. The `{*1[Passive]}` marker and
  one-line description break at 62397 are preserved.
- Rechecked source-keyed questions for Anokatos succession (62355), Bisarane
  instruction (62356), Crows tradition (62360), Hill/Gastyr (62361), Dvergan
  map (62362), Mitharan item (62363), Orbocant (62365), blessed one (62368),
  House of Pride (62371), litanies (62372), Grilricas (62373), Winter Fae/
  Sidhe (62379-62380), Fomorous/Hugues (62384), traffic (62385), Quartermaster
  (62386), nested UI (62389), wealth contrast (62391), age joke (62394),
  Storm Bolt (62397), and tunnels (62398).
- Only the `Texto` cells at IDs 62372, 62383, 62394, and 62397 changed.
  Pre-edit SHA-256:
  `936e4e0283aded4087ef9eedbb5125f05e29f3d58aed47cdcc8d40aa98c4213`.
  Post-edit SHA-256:
  `a41a7a89e28b3d42c9856ce05e6626aa6950475b401f30635c4eee7becdfaf39`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62351/locatexts_zh_cn.koalocatext_default.csv`.
- The UTF-8 BOM, 65,135 records, key order, and total 72,084 LF characters
  are preserved. The embedded-break normalization changes aggregate counts
  from 72,045 CRLF/39 bare LF to 72,044 CRLF/40 bare LF; no outer CSV record
  separator changed.

D-17997 records four accepted corrections, D-17998 records 19 uncertain
findings (one overlaps an accepted ID), and D-17999 records 28 `not an issue`
IDs. Direct register totals: 1,776 accepted, 15,349 `not an issue`, and
12,058 uncertain (29,183 dispositions total); next D-18000.

Resume at `default` ID 62401; 2,734 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
