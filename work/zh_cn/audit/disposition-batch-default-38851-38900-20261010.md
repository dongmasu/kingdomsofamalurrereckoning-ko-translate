# Disposition Batch: `default` IDs 38851-38900

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, two `not an issue`, and four uncertain.
- CSV changes: IDs 38871 and 38877.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38865 | `they may bet his way` / `자기 이름으로 내기를 걸 수 있어` | Uncertain: the English pronoun/construction is unclear. Japanese says others may bet on the gladiator; Korean can imply the gladiator bets under their own name. The addressee and transaction remain unsettled. |
| 38871 | mediciner / `약초 치료사` | Accepted: change to `의사`. English's unusual `mediciner` means a practitioner of medicine; Japanese and Chinese both use doctor. Korean's current text adds an unsupported herbal specialization. |
| 38874 | the Offering / `봉헌 의식` | Uncertain: English asks where the Offering is; Japanese asks where it is performed and Chinese where the sacrifice occurs. Prior decisions leave it open whether this names a rite, sacrifice, place, or object. |
| 38877 | late-night liaisons / `밤늦게 만난 걸` | Accepted: change to `밀회를 나눈 걸`. English implies an affair; Japanese explicitly says secret relations and Chinese says the speaker was involved with the jarl's wife. The current Korean reduces this to a late-night meeting. |
| 38885 | Blood Rite / `혈맹의 의식` | Uncertain: source locales identify a blood ritual, but earlier decisions explicitly leave its formal Korean name unresolved and document active variants. Do not normalize this occurrence independently. |
| 38889 | The Cipher / `암호` | Uncertain: the English capitalizes the label and Japanese transliterates it, while Chinese and Korean use descriptive terms. The row does not establish whether it is a named object or a generic cipher. |
| 38891, 38899 | quarter-inch gap / `손가락 너비도 안 되는 틈`; Unlocked! / `잠금 해제!` | Not an issue: Korean gives a reasonable approximate width, as Japanese does, and preserves the intended completed-unlock status supported by Japanese and Chinese. No user-facing context supports a more specific rewrite. |
| Other rows in IDs 38851-38900, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- Prior decisions at ID 14523 leave `mediciner` unresolved as a terminology
  question; this row's English/Japanese/Chinese alignment supports the broad
  occupation `의사`, without resolving every historical occurrence.
- Prior Offering decisions (including IDs 14229, 30163, 32249, and 38303)
  leave the entity type open. Blood Rite decisions at IDs 32295 and 36317
  explicitly defer canonical terminology; no global term is approved here.
- The historical source-keyed log has a documented gap covering IDs
  37700-40349. These are working dispositions, not independent linguistic
  approval.

## Verification

- The two accepted changes were checked against immutable English,
  Japanese, and Chinese rows. Runtime markers and values were not modified.
- The preliminary structural comparison reports matching ID order,
  embedded breaks, and marker identities/order; ID 38875 retains its
  duration, armor reduction, and Mana cost.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `45b41507cbcbce6468e5f18194e71a870b6f6c1e955774299f9b3c3de25ddc5a`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38900. Resume at ID 38901; 26,234
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38901-38950-preliminary.md`. The next unused decision ID is
D-12507.
