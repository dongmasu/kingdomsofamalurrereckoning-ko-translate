# Disposition Batch: `default` IDs 46401-46450

- Date: 2026-10-10. Compared active Korean against English meaning, Japanese
  voice/register and terminology, Chinese supporting evidence, source-keyed
  historical questions, and prior accepted decisions. This is a working
  disposition pass, not independent final linguistic approval.
- Decisions: one accepted, nine uncertain, and one grouped `not an issue`
  disposition covering the other 30 IDs.
- CSV edit: ID 46405.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 46401-46402, 46410, 46412, 46418-46419, 46426, 46436, 46440, 46446, 46449 | Uncertain | The people, creature/group, role, and place names are retained, but Helyc Crosse, Leanashe, Carrag, Stebic, Tyrn, Daughter of Lyria, Experiorati, Wyl Rendig, Gertern, Agarth, and Mel Senshir need canonical spelling or lore-role alignment. |
| 46404 | Uncertain | `live on your feet` is rendered as `두 발로 버티며 살아남는 게 이득`; English is idiomatic, and the Japanese/Chinese readings differ. Preserve the resilient-survival meaning pending context rather than force a more specific interpretation. |
| 46405 | Accepted | Change `소중한 종교적 성물` to `내 소중한 가보이자 종교적 증표`. English says a cherished religious token; Japanese says a religious mark/token and Chinese says a religious keepsake/token. `성물` narrows the object to a sacred relic without support. The inheritance chain and theft remain explicit. |
| 46407 | Uncertain | Keep the four slash-separated clauses. The line's “in name of spite,” curse, night, and Love/heart causality are literary and not safely resolved by the divergent locale versions. |
| 46420 | Uncertain | The `DEV` ranged-monster string appears developer-facing. Korean conveys the development label, but its intended audience and whether it should remain an internal label are not established. |
| 46423 | Uncertain | `A sum of gold?` is rendered as `제법 큰돈이라고?`, which implies a sizable amount; Japanese and Chinese are more neutral. Scene context is needed to determine whether the speaker reacts to the sum's size. |
| 46429 | Uncertain | The question-and-answer structure is retained, but the compound `Roilwence` and the claim about who possesses it differ across locale references. Keep the established traceable name provisionally. |
| 46432 | Uncertain | English capitalizes `Master Makers`; Korean `명장들` can be generic. Japanese/Chinese readings do not establish whether this is a formal group or a descriptive plural. |
| 46445 | Uncertain | English `Completing the Rite` can be a process label or completion state; Japanese uses an instruction and Chinese an in-progress form, while Korean `의식 완료` reads as a completed state. UI context is needed. |
| 46448 | Uncertain | The easy-death/revival contrast and wartime problem are preserved, but the antecedent of `their` is not established by this row. |
| 46401-46450 excluding the IDs above | Not an issue | The remaining meaning and structure are preserved. In particular, the `fence` idiom at 46408 means disposing of stolen goods; the nested `{1}/{*1{2}}` sequence at 46417 is intact; established House of Ballads and Scholia Arcana names are retained; and the extermination/Fate joke remains recognizable. No other supported row-local correction was found. |

Decision IDs D-14194 through D-14204. Direct register totals after this
batch: 1,431 accepted, 4,588 `not an issue`, and 8,179 uncertain (14,198
categorized dispositions). The next decision ID is D-14205.

CSV SHA-256 before editing:
`e34ea1c3ae0044a9dd0ba7e706caa308cfc6465227b49ae5c94a1c1c09623301`.
CSV SHA-256 after editing:
`b4e59a2232b279bdd137db7913920735fc89acb59d2d4d89a05de7b628853d53`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
are preserved. English, Japanese, Chinese, and Korean each contain IDs
46401-46450 once in ascending order; line-break counts and runtime-token
identities match. The four-clause poem separators and nested marker at
46417 are retained.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 46405 | `조부모님에게서 부모님에게, 그리고 내게 대대로 전해진 소중한 종교적 성물이 도둑맞았어.` | `내 소중한 가보이자 종교적 증표가 조부모님에게서 부모님께, 부모님에게서 내게 대대로 전해졌는데, 도둑맞았어.` | Restore the source's heirloom and religious-token meanings without changing the inheritance chain or theft. |
