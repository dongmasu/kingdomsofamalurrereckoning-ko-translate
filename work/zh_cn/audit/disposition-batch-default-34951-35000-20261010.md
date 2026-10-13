# Disposition Batch: `default` IDs 34951-35000

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with the active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: three accepted, five `not an issue`, and eight uncertain.
- CSV changes: IDs 34977, 34999, and 35000 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34952 | `Mitharan Immunity Trim` | Uncertain: the item parts and stat are preserved, but `Trim` may be a crafting component/category, and historical decisions leave the Mitharan form/component name unresolved. |
| 34953 | `Snowmelt pass` | Uncertain: the migration and promised settlement are retained; English lowercases `pass` while Japanese/Chinese treat it as a name. Do not standardize the landmark without context. |
| 34954 | Monster and nymph as one being, then a “delusion” | Not an issue: Korean preserves the source's unusual sequence and the subsequent persuasion; all locales contain the same apparent contradiction. |
| 34957 | Sorrows / Gallows Tree / two realms | Uncertain: the branch-as-bridge and delivery to Bisarane are retained, but the entity, tree name, and realm relation are setting-specific and unresolved. |
| 34961 | Thirty-nine days and guiding voices | Not an issue: the duration, voices eclipsing thought and guiding the speaker, forgotten language/song comparison, and friendship are retained. |
| 34962 | `Fahrlangi` | Uncertain: Korean preserves the hesitant recollection and accusation, but locale renderings differ on whether the term is a group/name; no spelling is approved. |
| 34969 | Blood `layout` as forensic evidence | Not an issue: `흔적의 모양` reasonably conveys the blood pattern used to infer recent southbound passage and severe injury. |
| 34970 | `Taiwan` | Not an issue: `대만` is the Korean rendering of the same standalone label used in English and Japanese. The Chinese row's “China Taiwan” is not authority to reinterpret the source. |
| 34977 | Capitalized `House` | Accepted: replace `이 하우스가` with `비탄의 집이`. English capitalization and the Japanese/Chinese references identify House of Sorrows; reuse accepted D-9869, D-9965, and D-10186. Leave `Eldest` provisional. |
| 34979 | `Air Shrine` | Uncertain: the place label is preserved as `공기의 성소`, but elemental Air versus ordinary air and the canonical landmark name remain unresolved. |
| 34993 | Harem of Fogun Hral narrative | Uncertain: the two-paragraph structure and frank sexual premise are preserved; tone, euphemism level, and literary voice remain for integrated review. No sanitizing or intensifying edit is approved. |
| 34994 | `Bloody` / `Bloody Bones` | Uncertain: English says `Bloody`, while Japanese/Korean expand it to Bloody Bones and Chinese uses a literal blood/bones name. Keep the current form pending identity and canonical-name resolution. |
| 34998 | `Kandrian Guard` | Uncertain: Korean conveys a guard that no one dared challenge, but whether this names a formal order or generic royal guard and the canonical spelling remain open. |
| 34999 | `Mitharu` in the afterlife phrase | Accepted: change `미타루의 곁` to `미사루의 곁`, following the official Korean manual and accepted D-152 spelling `Mitharu = 미사루`. |
| 35000 | `Century Plants` | Accepted: replace `세기초의 꽃` with `백년초의 개화`, matching the plant reading in Japanese/Chinese and accepted D-10383 / established active rows. |
| Remaining ordinary text in IDs 34951-35000 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 35 IDs. |

## Historical Audit Reconciliation

- D-10383 establishes `Century Plants = 백년초`; it supports the correction
  at ID 35000 without resolving other plant names.
- D-9869, D-9965, and D-10186 establish `House of Sorrows = 비탄의 집`;
  English capitalization and the locale references identify that House at
  ID 34977. The Eldest title remains uncertain.
- D-152 and the official Korean manual establish `Mitharu = 미사루`; apply
  only to the deity reference at ID 34999. Do not conflate Mitharu with the
  unresolved Mitharan ethnonym/material at ID 34952.
- Sorrows/Gallows Tree, Snowmelt Pass, Fahrlangi, Air Shrine, Bloody Bones,
  Kandrian Guard, and the Harem passage remain open; no global terminology
  change is inferred.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. ID 34993's blank-line paragraph division
  and ID 34973's `{1}{2}` marker sequence are preserved.
- Numeric values remain unchanged: 500 enemies at 34956, 39 days at 34961,
  and ten years at 34967.
- Accepted corrections are limited to IDs 34977, 34999, and 35000.
- Active default CSV SHA-256:
  `bb85a67d11dc13b2ce0a0444c789f08e19f6ebe4fa2ba36024eba6f6d2ab070e`.
  UTF-8 BOM, 72,046 CRLF, and 39 pre-existing bare-LF endings are preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 35001; 30,134 default IDs remain through ID 65134.
