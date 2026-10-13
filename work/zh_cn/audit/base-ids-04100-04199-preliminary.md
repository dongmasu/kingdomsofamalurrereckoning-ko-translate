# Preliminary Language Scan: `base` IDs 4100-4199

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4100-4199.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for source disagreements and item-category terms,
  and reconciled historical `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4105 | 참나무 서리 막대 | Confirm the shape/function of the crafting component `Dowel`; `막대` may be too broad. | Historical question: English/Chinese use “dowel,” while Japanese transliterates the component. The Korean is plausible but does not establish whether this is a peg, pin, or rod. | Medium |
| 4110 | 클리프브레이크(Cliffbreak) 지하 통로 | Resolve the English/Japanese/Chinese source conflict before choosing a final name or translation. | English says `Cliffbreak Fasting`, while Japanese/Chinese and most European/Russian locales identify a passage or location. Korean follows the passage reading but retains `Cliffbreak`; this is a source-data question, not a settled correction. | High |
| 4112 | 원초의 주검 | Replace or verify `주검`, which ordinarily reads as “corpse,” and clarify the structure of `Main Sword of Primality`. | Japanese says “main sword”; Chinese and sibling locales also support a sword, with varying placement of “primal.” The Korean looks like a lexical collision with “corpse” and is not a natural item label. | High |
| 4114 | 망각의 장막 | Confirm whether `Omission` means concealment, forgetting, or omission. | Historical question remains: Japanese reads a disguise/concealment, while Chinese supports forgetting. Korean commits to “forgetting,” which may not describe the item effect. | Medium |
| 4116 | 타이탄의 팔 보호대 | Confirm whether `Cuff` is a wrist cuff/bracelet or a restraint/handcuff. | English and Chinese support a protective cuff; Japanese says handcuff. Korean chooses an arm guard and may overstate the covered area. | Medium |
| 4119 | 상급 현자 손잡이 | Determine whether `Sage` denotes a person, named discipline, or Sagecraft property. | This repeats a historical component-term question. Japanese/Chinese transliterate or use a broad “sage” reading; the Korean may be inconsistent with the project's established crafting terminology. | Medium |
| 4120 | 모투스 광업 주요 광산 | Clarify whether `Primary Site` means the main mine, first site, or a formal named worksite. | English, Japanese, and Chinese all support a primary/main site, but the Korean's `주요 광산` changes “site” to “mine.” | Medium |
| 4127 | 대지 파괴자 | Decide whether `Earthcrushers` is a named item/weapon group or plural entities, and preserve its number/category. | English is plural; Japanese/Chinese describe earth-splitting/crushing and other locales vary. Korean singular `대지 파괴자` can imply one person/agent. | Medium |
| 4150 | 번개 개발용 활 | Confirm whether `Dev` is internal/developer metadata or an intended player-facing item name. | English and Japanese explicitly retain a developer label; Korean expands it to `개발용`. Preserve the source label decision consistently across developer/test assets. | Medium |
| 4172 | 버려진 건물 | Translate `Wing` as a building wing/section rather than the whole building if the source refers to architecture. | English, Japanese, and European locales all say an abandoned wing; Chinese also uses a wing. Korean `건물` broadens the object and loses that structural detail. | High |
| 4187 | 길조의 건틀릿 | Determine whether `Auspice` means omen or protection/support. | Japanese says support/aid, while English and sibling locales retain auspice/omen-like language. Korean chooses a favorable omen, which may be unnatural for a gauntlet effect. | Medium |
| 4196 | 크리스탈 워 IV | Align `Crystal War` with the corpus form used elsewhere, likely `수정 전쟁`, and decide how to render the named historical event. | English/Japanese/Chinese identify the same event. Korean transliterates `Crystal War`, while `default` ID 1978 translates it as `수정 전쟁`; keep this as a resource-aware terminology consistency issue. | High |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4100/4107, 4105, 4110-4112,
  4114, 4116, 4119-4120, 4122, 4124, 4127, and 4187 against the active Korean
  and source locales. The place-name, component, source-conflict, item-type,
  and word-sense questions remain open or provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` item/location rows.

## Other Checks

- ID 4151 `House of Sorrows` is rendered `비탄의 집`; keep its possible
  faction-name sense tied to the corpus-wide House terminology.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4100-4199 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
