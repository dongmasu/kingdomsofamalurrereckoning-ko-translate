# Preliminary Language Scan: `default` IDs 12500-12549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12500-12549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12503 | `gnomish scrivener` / Courdan Passant / missing letter | Verify the name/title and whether the courier caused the letter to go missing or was otherwise involved. | Korean preserves the gnome clerk, missing letter, suspected courier, and location. English only says the courier is somehow involved; the exact role is unresolved in context. Historical question remains open. | Medium |
| 12505 | `The War's out there` → `전쟁은 저 밖에서 벌어지고 있어` | Clarify whether the speaker means the war is literally elsewhere or that it is someone else's concern. | Korean follows the spatial English reading. Japanese says war is somebody else's affair, while Chinese says the war has begun; the references diverge materially. Historical question remains open. | High |
| 12506 | `collaborators` → `협력자들` | Determine whether this means political collaborators, allies, or people cooperating with the current group, and preserve the contrast with citizens. | Korean keeps the broad “collaborators” reading. Chinese uses a term that can mean collaborators with the enemy; Japanese leaves the label more general. Historical question remains open. | Medium |
| 12508 | `Dvergan Raider` → `드베르가 약탈자` | Determine whether this is an enemy/person label, a raiding role, or a ship name/type. | Korean and Chinese read it as a raider; Japanese reads a Dvergan pirate ship. The isolated label lacks context. Historical question remains open. | Medium |
| 12512 | Thresh lair direction | Resolve the east-versus-south location conflict and identify the referent of `this great house`. | English and Chinese place the lair east of the great house; Japanese says south of the House of Ballads. Korean follows English and keeps the Gorguath hollow. Historical question remains open. | High |
| 12515 | `Warsworn` → `워스원` | Align with the dominant `워스워른` spelling or record a deliberate alternate form. | This instance shortens the faction name; the active corpus has both forms, and earlier preliminary reports already flag the inconsistency. | High |
| 12517 | `Sagrell's seat` / contest | Clarify whether `seat` is an office, title, or literal chair, and what contest continues without the king. | Korean preserves the contest and the king's absence but does not resolve the meaning of `seat`. Historical question remains open. | Medium |
| 12520 | Mithros “giants” / four targets | Verify whether `giants` is a named category and which four creatures count toward the hunt. | Korean retains the quotation marks, Mithros, Wild Fae, trophy-taking, and promised reward. The English gives no list identifying the four targets. Historical question remains open. | Medium |
| 12522 | `blind it` / `its gaze` | Identify what `it` refers to and whether extinguishing the torches disables a statue, creature, or magical watcher. | Korean preserves the blindness/gaze mechanic and torch action, but the target is not named in the row. Historical question remains open. | Medium |
| 12523 | `Saturnyn` → `새터닌` | Align the name spelling with recurring `사투르닌`/`새터닌` forms and verify the canonical form. | The name is recognizable and the command preserves both targets, but the Korean transliteration varies across the corpus. | Medium |
| 12526 | Codex of Destiny / High King of the Fae / Fateweavers | Verify official title terms and whether `distilled knowledge` means concentrated knowledge or collected wisdom. | Korean preserves the source's contrast between an ordinary Lorestone and the Codex, plus the grant to the first Fateweavers. Japanese/Chinese phrase the title and knowledge metaphor differently. Historical question remains open. | Medium |
| 12528 | `Preordained` → `예정된 자들` | Standardize the named group without conflating it with generic uses of predestination. | Other active rows use `정해진 자들`; both forms occur for the same group. The current sentence correctly preserves that the group exploits recruits' zeal rather than kidnapping them. | Medium |
| 12537 | `mercy in Ynadon` → `위나돈의 자비` | Determine whether Ynadon is a person, place, or deity, and whether mercy means clemency or divine favor. | Korean preserves the conditional threat/request. English, Japanese, and Chinese do not settle the name's referent or the sense of mercy. Historical question remains open. | Medium |
| 12538 | `Would that I could leave me, too` → `나도 나 자신을 두고 떠날 수 있으면` | Preserve the deliberately archaic or awkward self-directed lament without over-resolving its implication. | Korean retains the paradoxical self-reference. Japanese and Chinese also preserve the unusual construction, with no context to settle its intended nuance. Historical question remains open. | Medium |
| 12539 | `proud to share a name` / Maid's army | Clarify whether the shared name is personal, a title, or a faction identity; preserve the contrast between the Maid's army and the Maid herself. | Korean keeps the speaker's pride and the victory over the army, but the shared-name referent remains unstated. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12503, 12505-12506, 12508, 12512,
  12517, 12520, 12522, 12526, 12537-12539 against the active Korean and all
  three source locales. They remain open.
- Added current-pass consistency candidates at IDs 12515, 12523, and 12528
  after checking related corpus occurrences.
- ID 12509 retains `{1}` then `{2}`; ID 12518 retains the full
  `$NQD_City_Adessa.upgrade_price$` token.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token signatures match; numeric and named variables remain intact.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12500-12549 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12550-12599.
