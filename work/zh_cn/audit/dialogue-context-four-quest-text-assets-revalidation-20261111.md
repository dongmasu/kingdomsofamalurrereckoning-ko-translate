# Four Quest-Text Asset Revalidation

- Date: 2026-11-11.
- Scope: 36 unique `default` IDs across four quest-text assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Seven correction-candidate IDs were recorded. No evidence-limited holds and
  no translation CSV changes.

## Grouping Evidence and Limits

`1985677.quest_bxml` contains two `conditional_quest_ffq87_*` handlers and
nine linked IDs about Sandstone Villa upgrades. `1987173.quest_bxml`,
`1988191.quest_bxml`, and `1991466.quest_bxml` contain conditional-handler
prefixes for `DLC2_SQ11`, `DLC2_SQ12`, and `DLC2_SQ13`, with nine linked IDs
each about the Stowaway bounty, the missing surveyor, and the Idylla cisterns,
respectively. None has an explicit `QUEST_ID`, an `NPC_` symbol, or a
`dialog_line_*` handler. These are quest/journal/objective records, not
evidence for a speaker or dialogue order.

All 36 rows were compared in English, Japanese, Chinese, and active Korean.
Repeated English strings match across the reviewed IDs: the four `Quest
Complete` rows, four `Quest Failed` rows, three contract-failure rows, and
the two `Turn in the contract` rows. No embedded line breaks, runtime
placeholders, or markup were found.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `11536`, `44143`, `49479`, `60389` | Naturalness / terminology | Within the Sandstone Villa quest, the same house-upgrade action alternates among `개량`, `업그레이드`, and `개조`. The surrounding journal entries `10464` and `10866` already use `개량`. Align these rows with the established local wording; for the objectives, use the project's `-하기` form, e.g. `샌드스톤 저택(Sandstone Villa) 개량하기` and `샌드스톤 저택(Sandstone Villa) 추가 개량하기`. | High |
| `25333` | Terminology / format | `silver-back troll, the Stowaway` is rendered as `은등 트롤` and `밀항자` without English pairings, while other active rows use `실버백 트롤(Silverback Troll)` and `밀항자 트롤(Stowaway Troll)`. Align with the established troll-type form and pair both the type and the named Stowaway; the four-language sources identify the same creature. | High |
| `3971` | Format | The quest title `Stowaway` is rendered `밀항자` without its English title. Add the English pairing if retaining the bilingual title convention for this named quest. | High |
| `37189` | Naturalness / format | `Find and kill the Stowaway` is rendered `밀항자를 찾아 처치하라`, unlike the project's `-하기` quest-objective form, and lacks the English pairing used for the same named troll elsewhere. Consider `밀항자(Stowaway)를 찾아 처치하기`. The row is a quest objective, not dialogue. | Medium |

## Retained Text

The remaining 29 rows were retained after source comparison. Proper-name
spellings for Idylla, Pinadike, Suner Pome, and Sandstone Villa are consistent
within these assets. The three contract-failure rows and repeated quest
completion/failure labels also match in all four languages.

## Complete ID Set

- `1985677.quest_bxml` (`FFQ87` handler prefix): `10464`, `10866`, `11536`,
  `18011`, `33931`, `34575`, `44143`, `49479`, `60389`
- `1987173.quest_bxml` (`DLC2_SQ11` handler prefix): `1615`, `3971`, `6716`,
  `19973`, `23061`, `25333`, `37189`, `54454`, `62607`
- `1988191.quest_bxml` (`DLC2_SQ12` handler prefix): `13297`, `25773`,
  `26723`, `29515`, `41713`, `44295`, `47837`, `50117`, `59904`
- `1991466.quest_bxml` (`DLC2_SQ13` handler prefix): `1874`, `5800`, `11235`,
  `20579`, `25448`, `28810`, `31168`, `40543`, `44719`

All IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
