# Preliminary Language Scan: `affix` IDs 0-9

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 0-9 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, and available French, German, Spanish, and
  Italian rows.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 1 | Loot | 전리품 획득: | Confirm the UI composition and whether this fragment labels an action or resulting loot. | Japanese and German/Spanish use a verb-like “obtain/plunder,” Italian uses a noun, and Chinese is closer to “plunder.” Korean is understandable, but its fit depends on the text concatenated after this prefix. | Low |
| 2 | Mount head on | 머리 장착: | Check the full composed UI string; the English and other locales retain the relation “on.” | Korean currently reads as a standalone label and may be acceptable as compact UI text, but the missing relation could make the combined instruction incomplete. | Medium |
| 7 | Feed bugs to | 벌레를 먹이기: | Verify the completed instruction with its following target; consider a form that connects naturally to the recipient. | English, Chinese, and European references explicitly retain “to”; Korean currently ends as a nominalized action without an overt connection. | Medium |
| 8 | of Ice Attenuation | 얼음 감쇄의 | Check the established Korean stat/effect term for `Attenuation`; `감쇄` may be overly technical or unclear in an item name. | Japanese transliterates the full property and European references consistently describe reduction/attenuation. Chinese is abbreviated and does not settle the Korean effect term. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 0-9 were examined; the active Korean text is identical across variants for each ID.
- The Japanese and Chinese rows have the same six target variants for these IDs. The en_us source contains one `FF` row per ID rather than these six variants, so English meaning was matched by ID, not by exact variant code.
- French, Spanish, and Italian do not provide every Chinese variant; German provides all six for these IDs. No target variant was dropped or merged.
- IDs 0 (`Rallying`), 3 (`of Fire Warding`), 4 (`of Justice`), 5 (`Linen`), 6 (`Open`), and 9 (`Studded Leather`) had no additional high-confidence semantic concern in this pass.

## Batch Status

All 60 target variant rows for IDs 0-9 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
