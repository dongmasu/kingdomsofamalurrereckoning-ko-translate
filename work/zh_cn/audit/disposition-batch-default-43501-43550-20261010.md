# Disposition Batch: `default` IDs 43501-43550

- Date: 2026-10-10. Compared all 50 active Korean rows with English,
  Japanese, Chinese, source-keyed historical questions, and prior
  terminology decisions. This is a working disposition pass, not independent
  final linguistic approval.
- Decisions: two accepted, six `not an issue`, and ten uncertain.
- CSV edits: IDs 43520 and 43525.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 43502 | Uncertain | Gallows End is correctly distinct from the Gallows Tree, but active Korean uses several place-name forms. Keep this instance pending a corpus-wide canonical spelling decision. |
| 43506 | Uncertain | English is register-neutral, Japanese/Chinese are courteous, and Korean uses strongly archaic masculine-coded `-오` with `그대`. Speaker context is insufficient to authorize a voice change. |
| 43507 | Uncertain | `FAIL LINE` may be internal/test text. Preserve the exact source label until player-facing status is known. |
| 43508 | Uncertain | Korean adds `상자` (“box”), but English/Japanese/Chinese do not establish a container. The exact reward/UI object is unknown, so do not substitute a guessed category. |
| 43509 | Uncertain | The named `Circle of Engard` may be a formal organization or religious group; Korean `모임` may be too informal, but a safe canonical replacement is not established. |
| 43511 | Uncertain | `Temp Lore` may be metadata or player-facing text. The Korean translates it as `임시 로어`; retain pending display-context confirmation. |
| 43517 | Uncertain | Three Master Makers and release from Anira's control are retained. The group's formal status and the English's unusual `relinquish us from` relation need context. |
| 43532 | Uncertain | `Corporate Controller` is a company role with differing locale renderings and possible metadata status. The exact Korean job function/display intent is unknown. |
| 43541 | Uncertain | Capitalized `Quarters` may be a named location. Korean keeps the name phonetically; Chinese reads it generically, and no canonical Korean place form is established. |
| 43548 | Uncertain | Capitalized `Slumber` may name a rite/event; Japanese explicitly says ritual, while Korean/Chinese read ordinary sleep. Preserve pending lore context. |
| 43520 | Accepted | Change `이전 계약자 찾기` to `이전 계약 보유자 찾기`. English and Chinese specify a former contract holder, not necessarily a contractor; the revised wording matches the established parallel objective at ID 64742. |
| 43525 | Accepted | Replace `아르카나 학술원` with `스콜리아 아르카나(Scholia Arcana)`. This proper institution name follows the established spelling and accepted prior decisions; the founder/history meaning is unchanged. |
| 43501 | Not an issue | Korean preserves the English subject and inability. The Chinese adds an agent (“cannot let the leader succeed”), which is not adopted. |
| 43512 | Not an issue | `Nesta` is the active English/Japanese spelling and Korean `네스타` follows it; the historical grouped `Nestar` spelling is inconsistent with the keyed source row. |
| 43516 | Not an issue | The Janick family collectively treats the player as a valued customer, with cheaper goods for the “Spider Slayer”; the Korean preserves both meaning and nickname reading. |
| 43538 | Not an issue | The Gallows Tree symbol is kept distinct from Gallows End and follows the established `교수대 나무` rendering. |
| 43545 | Not an issue | The exact `[Placeholder, currently unused]` source string is preserved; no translation edit is warranted for this explicitly unused placeholder. |
| Remaining IDs 43501-43550, excluding listed findings | Not an issue | No additional supported correction. Row order, quantities, marker identities/order, icon token, and line structure are retained. |

Decision IDs D-13353 through D-13370. Direct register totals after this
batch: 1,351 accepted, 4,396 `not an issue`, and 7,617 uncertain (13,364
categorized dispositions). The next decision ID is D-13371.

CSV SHA-256 before editing:
`cf2dc35c527f72c6b6111a108e5c31769a0a7c49a986f3ed84e0f9f75be7736f`;
afterward:
`169ebab71f7c9d0e337c5b282a875704b77bb5dbb4994ae5914f9402c5f3d074`.
UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
preserved. Disposition is complete through ID 43550; resume at ID 43551
(21,584 `default` IDs remain through ID 65134).
