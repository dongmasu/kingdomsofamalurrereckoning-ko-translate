# Disposition Batch: `default` IDs 37601-37650

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, five `not an issue`, and ten uncertain.
- CSV changes: IDs 37604, 37629, and 37636.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37603 | sorrows / `슬픔의 정령` | Uncertain: the louder cries and condemnation of Taibreah remain, but whether `sorrows` names spirits, creatures, or another lore entity is unclear. |
| 37604 | `ancient` / `산전수전 다 겪은 노장` | Accepted: change to `그 사람은 정말 나이가 많아. 저 갑옷을 입고 돌아다니는 것도 놀라운데, 싸우기까지 하다니.` English and Chinese describe great age, and Japanese's “living fossil” supports age; the old line adds an unsupported battle-tested-veteran emphasis. |
| 37610 | Prismere Chantries | Uncertain: the religious-site sense is retained, but the formal institution/place name and Korean rendering need glossary context. |
| 37615 | Luck / personified punchline | Not an issue: Korean's `행운` preserves the exclamatory reveal and personification without requiring English-style capitalization. |
| 37619 | Crilgarin / Grim observer chain | Uncertain: the three linked observers and two-paragraph structure remain, but the intimate emotional nuance of the narrator's final reflection needs literary review. |
| 37622 | Plagueshield | Uncertain: the speaker plans to obtain some later while guarding the town; identity as item, remedy, or protection remains unresolved in prior decisions. |
| 37629 | older magic / `큰 혼란` | Accepted: change to `막대한 피해를 일으킬 수 있어`. English says the combined magic can wreak havoc; Japanese and Chinese explicitly support major destruction, not confusion. |
| 37630 | Apotyre families / `광산 가문들` | Uncertain: Japanese and Chinese supply mining context absent from the English wording; retain without normalizing until lore context settles the occupation. |
| 37631 | `dove` / `그대` | Uncertain: waiting and the reassurance are preserved, but the affectionate vocative is omitted; speaker relationship and a suitable Korean endearment need context. |
| 37632 | Gravehal Keep | Uncertain: the keep/place type is retained; canonical Korean spelling remains a corpus-wide naming question. |
| 37633 | Ohn's Stand / `어둠 속에 숨어 지냈어` / `dove` | Uncertain: the apology and prior help remain, but `off in the dark` and the affectionate address admit more than one natural Korean rendering; Ohn's Stand is also unresolved. |
| 37634 | `{1}{2}{3} ({4}){5}` | Not an issue: all five variables, their order, and punctuation are identical across locales. |
| 37636 | Red Legion / `적군단` | Accepted: change to `레드 리전`. English and Japanese identify the named faction; prior accepted decisions D-2554 and D-10678 establish `레드 리전`, while `적군단` reads generically. |
| 37638 | `him or her` / `그 사람` | Not an issue: Korean preserves the unresolved gender-neutral referent, inability to find them, and pointed inclusion of the addressee. |
| 37641 | Adessa loan variable | Not an issue: `$NQD_City_Adessa.borrowed_amount$` and the Gold unit are retained in the repayment line. |
| 37647 | Testament | Uncertain: holding back the named force is retained, but English differs from Japanese/Chinese on the group's name/form. |
| 37648 | capitalized collective `We` | Uncertain: the collective voice and immortality rationale remain; the source capitalization may signal a ruler or formal collective. |
| Other rows in IDs 37601-37650 | Dialogue, names, values, objectives, and labels | Not an issue: remaining rows preserve source meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed questions at IDs 37600-37699 were checked, including
  Plagueshield, Ohn's Stand, Red Legion, the Weave, and the save/loan
  variables.
- The Red Legion correction reuses the established accepted form in
  decisions D-2554 and D-10678; no global replacement was performed.
- `{1}{2}{3} ({4}){5}` at 37634 and
  `$NQD_City_Adessa.borrowed_amount$` at 37641 remain unchanged.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37601-37650 once and in identical order.
- Only active Korean `Texto` at IDs 37604, 37629, and 37636 changed.
- The two-paragraph narrative at 37619, all runtime markers, and values
  remain unchanged.
- The UTF-8 BOM and existing mixed line endings are preserved; exact counts
  and the resulting SHA-256 are recorded in the current checkpoint documents.

## Checkpoint

Disposition is complete through ID 37650. Resume at ID 37651; 27,484
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37651-37700-preliminary.md`. The next unused decision ID is
D-12216.
