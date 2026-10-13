# Disposition Batch: `default` IDs 35251-35300

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  line breaks, values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: three accepted, two `not an issue`, and eight uncertain.
- CSV changes: IDs 35258, 35284, and 35299.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35252-35253 | the Telling / the Sidhe | Uncertain: the arrival's significance is retained, but the Telling's lore status and whether Sidhe is a place, realm, or people are unresolved. |
| 35256 | Menri's family / knife initials `C. J.` / Cartery | Uncertain: the bodies, evidence, and plan to confront Cartery are retained without asserting guilt; the initials and localized Chinese syllables do not establish the name expansion. |
| 35258 | `vindicated` / `내 결백을 증명` | Accepted: change the final clause to `드디어 내가 옳았다는 게 밝혀지겠어!`. English promises vindication, and Chinese explicitly says the speaker will be proved right; this line does not establish criminal accusation or innocence. |
| 35259 | `I'll turn them off` | Uncertain: the plural referent and whether the game action is temporary deactivation are not identified by this line. |
| 35264-35266 | Ariad / Travelers / banshaen and murghan | Uncertain: the groups and yearly return/emergence contrast are retained, but group identity and canonical creature/faction spellings remain open. |
| 35269 | legendary woman / `그런 사람` | Not an issue: Korean's gender-neutral nouns are natural and do not contradict the later English `She`; Japanese also generalizes the noun while the accomplishment and mythic reputation are retained. |
| 35276, 35279-35280 | St. Eadric's Bunkhouse / Cape Solace / Mythal Keep | Uncertain: the lodging, communal sharing, and named keep are conveyed; canonical place/building spellings and `Bunkhouse` specificity need corpus context. |
| 35284 | House of Valor's heartfelt invitation | Accepted: change `용맹의 하우스` to the established `용맹의 집(House of Valor)` per D-148/D-650 and recent D-11323; preserve the invitation being entrusted to the speaker. |
| 35285 | Tier 2 Destinies | Uncertain: the tier is preserved, but the exact UI convention for the plural game category is not settled by this label. |
| 35289 | spell sentry in Shadow Pass | Uncertain: the request, removal objective, charge, and joint passage are retained; the sentry may be a magical ward or a guarded/summoned entity. |
| 35290-35291 | Mitharan Slaughtering Bindings / Maid of Windemere | Uncertain: the item modifier and the listener's prior adventure are conveyed, but equipment terminology and the Maid title need glossary/context alignment. |
| 35299 | Kollossae head hoop | Accepted: change `콜로사이` to the established `콜로세` per D-9868 and D-9942; the plain gold hoop's head-worn function is retained. |
| Remaining ordinary text in IDs 35251-35300 | Dialogue, objectives, labels, values, and structure | Not an issue: the other 32 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- D-148/D-650 and D-11323 establish `용맹의 집(House of Valor)`; apply
  that accepted form at ID 35284.
- D-9868 and D-9942 establish `콜로세` for Kollossae; apply it at ID 35299.
- Ariad, the Telling/Sidhe, Banshaen/Murghan, the spell sentry, and Maid
  terminology remain open. No broad normalization is inferred from this batch.

## Verification

- All four locale files contain IDs 35251-35300 exactly once and in the same
  order. No embedded line breaks or runtime variables occur in the range.
- Knife initials at 35256, the Niskaru size comparison, the hearsay at 35294,
  and all values/sequence details are preserved.
- Only the three authorized Korean `Texto` values changed. Keys, row order,
  BOM, and original physical line-ending distribution are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35301; 29,834 IDs remain through ID 65134.
