# Disposition Batch: `default` IDs 58851-58900

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 36 `not an issue` IDs, and 12 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The pre-batch CSV matched the preceding checkpoint and was backed up
  byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17807 | 58872 | `그들이 뒤쪽의 작은 격자문으로 돌아가는 것도 봤어.` | `그들이 뒤쪽의 작은 격자문으로 돌아가는 것도 들었어.` | English, Japanese, and Chinese say the speaker heard the return; remove the unsupported visual observation. |
| D-17808 | 58891 | `과부의 지시대로 캐너록의 주민들을 모두 없앴다.` | `과부의 지시대로 캐너록의 주민들을 모두 죽였다.` | English `wiped out` and Japanese/Chinese explicitly say the residents were killed; make the completed killing unambiguous. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17795 | 58851 | The eastbound Rathir-coast route and enlistment are preserved; whether the Didenhil `station` is a garrison or another post needs context. |
| D-17796 | 58852 | The structure's placement in the creature's breeding ground is clear; `murghan` spelling and Korean creature term remain provisional. |
| D-17797 | 58857 | Conditional extra payment and poisoned-wine handoff are retained; Coriana, Mallion, Rhewani, and Pryderi identities/relations need alignment. |
| D-17798 | 58858 | Barracks and Officer's Hall locations are retained; capitalized `the Burn` may be a named district or generic burned area. |
| D-17799 | 58866 | The 15% recovery on item destruction is preserved; whether `gold value` means sale value depends on unverified UI mechanics. |
| D-17800 | 58868 | `Tinkerer here` is translated literally; vendor callout versus self-identification and intended register need scene context. |
| D-17801 | 58880 | The Fallen Son's patrol, captivity, and Akara-related hope are retained; title/place-name treatment varies. |
| D-17802 | 58882 | All three verse lines and the mortal-sin image are retained; English leaves the antecedent of `Once pure` ambiguous, and Korean selects one reading. |
| D-17803 | 58887 | The killing is explicit; capitalized `Scion` may be a formal entity/title, while Korean `후계자` reads generically. |
| D-17804 | 58894 | Korean says the boots are not being worn now; English/Chinese can mean they have never been worn, while Japanese instead reads not damaged. |
| D-17805 | 58895 | Rorid's contrast and identity are preserved; `Tenders of the Midden` may be a formal role with unresolved Korean terminology. |
| D-17806 | 58898 | The gladiator is directed to the capitalized `Pit`; whether this names an arena or literal pit is unclear. |

## Not an Issue

Decision D-17809 records these 36 IDs: 58853-58856, 58859-58865, 58867,
58869-58871, 58873-58879, 58881, 58883-58886, 58888-58890, 58892-58893,
58896-58897, and 58899-58900. These rows preserve evident meaning,
voice/register, structure, markers, and values. The `{1}` interaction token
at 58854 and resource counts at 58888 (10 wood, 10 clay, 5 metal) are
preserved.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58851-58900 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The `{1}` interaction token at 58854 retains its identity and placement.
  The 15% recovery at 58866 and the 10 wood/10 clay/5 metal counts at 58888
  are preserved.
- Reconciled the source-keyed historical prompts for IDs 58850-58949.
  Unresolved prompts are recorded above; the two accepted changes are
  limited to the supported meaning shifts at 58872 and 58891.
- The preliminary scan's stored active-default hash differs from the actual
  pre-batch checkpoint. The checkpoint and byte-identical backup both
  verified as `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`;
  the scan hash was not used as the review baseline.
- Pre-edit CSV SHA-256:
  `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
  Post-edit CSV SHA-256:
  `ff2bbb1c0f40ddc1ff78cc5834f4d479416ec3cbdc9a8b7e65325d295ff1a01e`.
  Diff verification found only the two accepted `Texto` cells changed.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58851/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`).

D-17795-D-17806 record 12 uncertain findings; D-17807-D-17808 authorize
two edits; D-17809 records the remaining 36 `not an issue` IDs. Direct
register totals: 1,718 accepted, 12,753 `not an issue`, and 11,205 uncertain
(25,676 total); next D-17810.

Resume at `default` ID 58901; 6,234 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
