# Preliminary Language Scan: `default` IDs 27451-27500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27451-27500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27451-27453, 27455-27468, 27470-27486, 27488, 27493-27495, 27497-27500 | Dialogue, lore, quest, and concise UI/item text | Recheck register, names, and gameplay terminology during integrated review. | Korean generally retains English meaning and Japanese tone. The trade-cost variable, Gold icon, +17% modifier, and placeholder are preserved as noted below. | Medium |
| 27452, 27454, 27463, 27468, 27471, 27475, 27482, 27484-27487, 27493-27495 | Mistress Scathe / Mull-Rane / Anecitus / Coilsbain / Skoria Mine / Agarth / Wulf / Caerwyn / St. Odwig's Mission / Cryamor / Idylla | Standardize character, place, creature, and institution forms against the terminology inventory. | These names and settings occur in the source-keyed historical range. Korean preserves their identity in transliteration or established localized forms; all remain cross-corpus candidates. | Medium |
| 27457, 27469, 27496 | Map Tutorial / `PLACEHOLDER MESSAGE` / VP Functionality QA | Confirm which labels are player-facing and retain internal/developer text unchanged unless a project decision says otherwise. | Korean translates Map Tutorial, preserves `PLACEHOLDER MESSAGE` literally, and leaves `VP Functionality QA` in English. The visible `PLACEHOLDER MESSAGE` value matches the source and all locale rows. | Medium |
| 27476, 27478-27480, 27485, 27487, 27491-27492 | final rites / altar instruction / peace and faith / St. Odwig's Mission / wandering black pool / “abuse of drink” / Flowering rite | Preserve the ritual and lore referents; check register and named-place semantics. | Korean retains the rite, altar placement, peace dilemma, and black pool history. `술을 지나치게 남용했다` is a literal rendering of the quoted expulsion reason and may be less idiomatic than a concise substance-abuse label. | Medium |
| 27483 | `Cur` -> `잡종견` | Confirm whether English uses a literal dog or a contemptuous insult for a person. | English provides only the isolated noun. Korean selects “mongrel dog”; Japanese transliterates it and Chinese renders a vicious dog. Keep the referent open without importing a person-reading unsupported by this row. | Low |
| 27489-27490 | trade-cost variable / Gold icon / `+17% Melee Attack Damage` | Preserve marker identities/order and exact stat value; verify the display spacing after localized text. | The DLC variable and `#NAMED_ICON_GOLD#` occur in source order in every locale. The +17% value matches all four. Korean adds localized spacing around the marker consistently with the English display phrase. | High |

## Historical Audit Reconciliation

- Historical questions in the 27400-27499 range cover Hireling,
  Praetorians, Arrivus Engine, Interest, Maid, Risbergs, Silkfarmer remains,
  Midden, chapterhouse, Blades and Seal, Sister Zelda, the contradictory
  investigation line, Hierophant, until-then, greatsword stats, furnace
  room, pronouns, and fragment context.
- The present rows at 27452, 27454, 27457, 27463, 27468, 27471, 27475-27476,
  27479, 27481, 27483, 27485, 27487, and 27489-27499 were checked against
  the source-keyed inventory. Findings remain preliminary.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27451-27500 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match.
- `$DLC1_Diplomacy.trade_cost_medium$` and `#NAMED_ICON_GOLD#` are preserved
  at 27489 in the same order. The +17% value at 27490 matches. ID 27469's
  `PLACEHOLDER MESSAGE` is unchanged; no unexpected Unicode format character
  was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27451-27500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27501.
