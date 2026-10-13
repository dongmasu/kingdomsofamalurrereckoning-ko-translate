# Preliminary Language Scan: `default` IDs 1150-1199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1150-1199.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1178 | 투기장은 원래 음모가 판치는 곳이야! | Recheck whether `Underhandedness` means general dirty/unfair tactics rather than conspiracies. | English says the Arena is about underhandedness; Japanese and Chinese describe fraud/dirty dealings. Korean `음모` narrows this to conspiracies. The broader Korean “비열한 술수” sense may fit better, but retain as a candidate. | Medium |
| 1189 | +26% 방어 효율 | Verify whether `Block Efficacy` is the specific block stat, not general defense efficacy. | English and Japanese name block efficacy; Chinese says parry/block efficacy. Korean `방어 효율` may broaden the mechanic to defense generally. Preserve the 26% value and confirm the in-game stat label. | Medium |
| 1196 | 이제 이 집은 네 것이야, 챔피언. | Translate `The House` as the named House of Valor, not an ordinary house. | English capitalizes `The House`; Japanese explicitly says House of Valor, and the quest command is to fight challengers. Korean `이 집` loses the faction/arena identity. Compare with the established project form for House of Valor. | High |

## Historical Audit Reconciliation

- ID 1163's ambiguous `increases your persuasion skill by 3` was rechecked.
  Korean adds no unit (`3 증가`), so it does not silently choose between
  points and levels; leave that question open.
- ID 1170's personified Jory's sword is still referred to without a Korean
  gender marker; this remains a language-structure/context question, not a
  confirmed omission.
- ID 1185 uses the established `대순환` and `윈더미어의 시녀` forms and
  preserves the “hero” versus “heartless tyrant” contrast; the historical
  lore/role question remains open.
- ID 1192's capitalized `Font` is translated as `샘`. Japanese and Chinese
  identify it as a sacred source/fountain, but its status as a proper lore
  term remains unresolved.
- ID 1196's earlier question about an arena/faction location is clarified by
  the Japanese row: it is House of Valor, as recorded above.

## Other Checks

- ID 1161 retains `$SQ30.forgery_cost$`; ID 1189 preserves `+26%`.
- IDs 1151, 1156, 1164, 1169, 1173, 1181, 1184, and 1194 preserve their main
  meaning and dialogue intent; no additional high-confidence defect was found.
- Proper-name display, specialized stat wording, and unresolved lore terms
  remain candidates for consolidated review; no CSV edits are authorized.

## Batch Status

IDs 1150-1199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
