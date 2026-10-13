# Preliminary Language Scan: `default` IDs 1050-1099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1050-1099.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1071 | 워스원(Warsworn)에서 추방당했어. | Reconcile the faction's Korean name with the dominant `워스워른` form already used throughout the active corpus. | The same English `Warsworn` appears as `워스워른` in many other active rows, including base IDs 21, 78, and 509 and default IDs 77, 82, and 1317; this line shortens it to `워스원`. Preserve the faction identity consistently after a terminology decision. | Medium |
| 1073 | 틸린의 안식처(Tirin's Rest) | Recheck whether the place-name `Rest` means an inn/waystation rather than a spiritual refuge. | English and Chinese allow a resting-place reading, while Japanese `宿場町` means a post town/waystation. Korean `안식처` may imply sanctuary or afterlife; compare the in-game map/place function before deciding. | Medium |
| 1081 | 콜로세(Kollossae)족 | Confirm the established Korean spelling for the people `Kollossae`. | This spelling is already a historical terminology question: the English form and Japanese/Chinese transliterations differ, and other active rows use the same `콜로세` form. Check the official manual and the corpus-wide term decision before normalization. | Low |
| 1091 | 아메신(Amethyn) | Retain the historical question about `Amethyn` as a named realm and verify its referent. | English spells `Amethyn`; Japanese and Chinese support a pronunciation close to the current `아메신`. The Korean spelling is internally reused elsewhere, but the lore meaning (“between this world and the world of magic”) remains unresolved. | Low |

## Other Checks

- The earlier Japanese-derived audit's open question for ID 1091 was checked
  against the active row and carried forward; it is not treated as an
  approved name decision.
- ID 1063 preserves all three attack descriptions, damage values, mana costs,
  slowing effect, and paragraph breaks.
- ID 1052's `well-worn old almanac` is rendered with redundant age wording
  (`낡고 오래된`); this is readable but can be tightened if an Editor pass is
  later authorized.
- IDs 1055, 1059, 1065, 1068, 1074, 1083, 1084, and 1097 preserve the main
  dialogue meaning and generally match the Japanese conversational register.
- Proper-name bilingual marking remains inconsistent; no global name-display
  changes are made here.

## Batch Status

IDs 1050-1099 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
