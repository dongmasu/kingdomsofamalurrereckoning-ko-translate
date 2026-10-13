# Disposition Batch: `default` IDs 36751-36800

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: three accepted, eleven `not an issue`, and eleven uncertain.
- CSV changes: IDs 36760, 36763, 36778, and 36796.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36751 | Rathir / leaving and new life | Uncertain: departure, new-life promise, and gratitude are preserved, but `라시어` conflicts with other active spellings and needs global alignment. |
| 36754 | The Rake / `난봉꾼` | Uncertain: English is ambiguous between the tool and the dissolute-person sense; Japanese and Chinese disagree, and the isolated key cannot resolve it. |
| 36759 | Pledgeshield / `서약방패병` | Uncertain: the blessing and direct address are retained, but formal rank/title status and canonical Korean form remain open. |
| 36760 | Sour taste / cave-slime joke | Accepted: replace `씁쓸한 맛` with `시큼한 뒷맛` so the sour taste setup connects naturally to the cave-slime punch line, as in all three references. |
| 36761 | Ljosalfar / Dokkalfar / Faelands War | Not an issue: Korean uses established `료스알브` and `도크알브` forms and preserves Fiona's death beside her kin and her staff's continued fighting. |
| 36763, 36778 | Gallows End spelling / `갤로우스 엔드` | Accepted: align both occurrences to `갤로스 엔드`, the established place-name form authorized by D-5672. |
| 36763 | “end up on Gallows End” | Uncertain: Korean retains arriving at the named place, but the source's possible end/death wordplay cannot be resolved confidently from the line alone. |
| 36764 | Backpack and Equip Requirements tutorial | Not an issue: both sections, their order, six marker identities, and localized `{*2...}` headings are preserved. The level and/or Ability-point requirements remain intact. |
| 36766 | Teeth of Naros / `나로스의 이빨` | Not an issue: D-1147 establishes `나로스의 이빨`; this row matches that approved form despite an earlier provisional `송곳니` variation. |
| 36767 | High King / grand Telling | Uncertain: the High King's guidance and Fae tradition/story meaning are retained, but the capitalized formal tradition and Korean term remain unresolved. |
| 36771 | Scuttle Beach / planned trip | Not an issue: the speaker's plan to send someone there and request for help are retained; Korean does not turn it into a direct order to the player. |
| 36774 | Rose-of-Shadows / Wending / Daltan | Not an issue: the item acquisition, destination, report, and readiness message remain in the source order. |
| 36779 | Eagonn / legendary weapon / Niskaru | Uncertain: the legendary weapon and many defeated Niskaru are retained without adding the Chinese-only warhammer type; Eagonn's canonical spelling remains open. |
| 36783 | `berk` / `멍청아` | Not an issue: Korean preserves the casual farewell and direct insult supported by English and Chinese. |
| 36787 | Master of Gravehal / `그레이브홀의 주인` | Uncertain: the greeting and title are present, but Master may be a formal rank and Japanese specifies Gravehal Keep. |
| 36789 | `No more delays.` | Not an issue: Korean follows English's urgent command; Japanese and Chinese diverge, but do not support changing the English-based meaning. |
| 36790-36791 | Vorms / Activity Test | Uncertain: the name and activity-test label are retained, but their referents and whether the test label is player-facing or internal/debug text are unknown. |
| 36792 | +6% Damage Resistance / 30% Sustained Cost | Uncertain: both values and labels are preserved, but whether sustained cost is 30% of maximum Mana is not specified consistently across the references. |
| 36794 | `Beastiary` / `생물 도감` | Not an issue: Korean renders the intended bestiary meaning without reproducing the English source typo. |
| 36795 | `formula` / `처방` | Uncertain: Korean conveys a solution/prescription to end conflicts, while Japanese/Chinese suggest a compounding formula or recipe; the intended literalness is unclear. |
| 36796 | `We'll see him avenged.` / `그의 복수는 우리가 해 주겠어` | Accepted: change to `우리가 그의 원수를 갚아 주겠어` to state naturally that the group will avenge him, as supported by all three references. |
| 36798 | Chapter 17 / `제17장` | Not an issue: chapter number 17 is preserved; localized numeral style is acceptable. |
| 36799 | ESC continuation / Chinese-only platform markup | Not an issue: Korean follows English/Japanese's generic ESC instruction. Chinese-only platform tags are a documented source divergence, not a Korean omission established by the other two references. |
| 36800 | Locked Destinies / `잠긴 운명` | Uncertain: the locked-fate image is preserved, but formal quest/title status and whether Korean should make the plural concept explicit need context. |
| Other rows in IDs 36751-36800 | Dialogue, names, values, objectives, and labels | Not an issue: the remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The historical questions at IDs 36754, 36759, 36767, 36774, 36779,
  36790-36792, and 36794 were checked against the locale texts.
- The Teeth of Naros decision at 36766 follows D-1147; Gallows End follows
  D-5672. The paragraph/token and Chinese-only platform-markup exceptions
  remain explicitly documented.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36751-36800
  once and in identical order.
- ID 36764 preserves all six runtime-marker identities in order, including
  the two `{*2...}` wrappers. ID 36792 retains +6%, 30%, and both lines;
  ID 36798 retains Chapter 17.
- No runtime-token or embedded-line-break mismatch was introduced.
- Only active Korean `Texto` cells at IDs 36760, 36763, 36778, and 36796 changed.

## Checkpoint

Disposition is complete through ID 36800. Resume at ID 36801; 28,334
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-36801-36850-preliminary.md`. The next unused decision ID is
D-11859.
