# Preliminary Language Scan: `default` IDs 44001-44050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44001-44050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44001 | “He looked on them and saw potential” / `옷을 보고 잠재력을 알아본` | Recheck `옷` against the referent of `them`; likely means the named beings/items, not clothing. | English says Ventrinio looked at them and saw potential. Korean's explicit “clothes” changes the object and is unsupported by English/Japanese/Chinese. | High |
| 44002 | crazy old wizard / `괴팍한 늙은 마법사` | Preserve the speaker's dismissive assessment without necessarily softening “crazy” to merely eccentric. | Korean's `괴팍한` is milder than English; Japanese/Chinese also differ in severity. | Medium |
| 44006, 44012 | Adept Ignas; Adept Lerkara Fel / `숙련자 이그나스`; `숙련자 레르카라 펠` | Confirm Adept as an official rank/title and standardize it with the game's terminology. | Japanese uses a mage title, Chinese an adept/disciple title, and Korean a skill-based “adept” term. Aodh and personal names also need glossary consistency. | Medium |
| 44010 | Armor / `방어구` | Confirm whether this UI label means the equipment category (armor) or the defensive stat (armor rating). | Japanese interprets it as defense/defense power; English/Chinese are compatible with either reading. Korean selects the equipment category. | High |
| 44011 | “my liege” / `전하` | Confirm the speaker's rank relationship and choose a Korean form that does not overstate royal status. | English is a formal feudal address; Korean `전하` is explicitly royal. Chinese uses “my lord,” while Japanese paraphrases a farewell. | Medium |
| 44016 | Varani chieftain's barrow; Erathell coast; fateful balance / `바라니 족장`; `고분`; `에라셀 해안` | Standardize Varani and Erathell forms and retain that the shield design reflects Varani beliefs about life's balance of good and bad luck. | Korean preserves the source's full origin and belief statement; the source fragment's opening remains dependent on item context. | Medium |
| 44017 | `TEMP (Pride and Sorrow return)` / `임시 (자부심과 비탄의 귀환)` | Confirm whether TEMP is developer/test metadata and whether Pride and Sorrow are named entities/terms before finalizing the parenthetical. | The historical audit explicitly keeps TEMP provisional. Korean translates TEMP and Sorrow; source context does not settle display status or whether the names are proper. | Medium |
| 44019 | Dispelling Skill / `{*2{1}}` | Preserve the nested runtime marker and variable exactly while verifying the Korean skill term. | The exact nested token `{*2{1}}` is present in all four locales. Korean renders Dispelling as `해제`, a possible gameplay term requiring glossary alignment. | High |
| 44020 | Hammer stats | Retain both lines, +9 Physical Damage, and +10% Damage; use consistent Hammer stat phrasing. | All four locales preserve the two-line layout and both values. | High |
| 44022 | fate spirits speak and turn on the player “in a cinematic” | Preserve the sequence of speaking then attacking and clarify that the event is shown in a cinematic. | Korean follows English. Japanese appears malformed, and Chinese changes the ending to reviving the player. | High |
| 44024 | St. Eadric's burial pall; Ealfwig Grilricas; Didenhil | Standardize the religious site/title and character/place spellings; retain the theft instruction and source-fragment style. | Korean preserves the medallion and burial-shroud objectives, but locale forms of names and Mission differ. | Medium |
| 44040 | three-line Tala-Rane poem | Reassess the final line's antecedents and preserve the land's abandonment, once-pure state, and “mark of mortal sins” image without resolving uncertain referents by invention. | Korean keeps all three source lines but says the people left and the sinful trace disappeared; the English pronouns and sequence are ambiguous. Historical review specifically flags the poem. | High |
| 44043 | “fashions himself a liberator” / `스스로 해방자라고 생각하는` | Preserve the public self-presentation/claim to be a liberator rather than reducing it to a private belief. | English says he fashions/presents himself as a liberator; Korean says he seems to think himself one. Chinese is closer to “portrays himself.” | Medium |
| 44048 | “live off the Weave” / `운명의 직조에서 벗어나 산다` | Confirm the capitalized Weave's lore meaning and standard Korean term; keep the speaker's avoidance of attention. | Korean preserves the “outside the Weave” interpretation. Historical notes explicitly leave the exact Weave referent open. | High |
| 44049 | Fae emerging from “their ruin” / `페이들이 폐허에서 ... 쏟아져 나왔다` | Clarify whether the ruin belongs to the Fae or is simply the place they emerged from; retain that the group had stopped so someone could catch his breath. | Korean preserves the causal timing and sudden emergence; historical notes flag the quest-context-dependent referent. | Medium |

IDs 44003-44005, 44007-44009, 44013-44015, 44018, 44021, 44023,
44025-44039, 44041-44042, 44044-44047, and 44050 generally retain the
English meaning on this first reading. Names, rank/UI terms, and lore
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43990-44049 was checked for
  the seer's verse, Fatesworn, Erathi tomb, Scion, Curran, Ealfwig Grilricas,
  Aodh, Adept Ignas, Varani barrow/shield, TEMP, nested dispelling marker,
  Terenia/Fynn, Zungars/Darkvari, House of Ballads, Urlik, Tirin's Rest,
  Telogrus, Secandra, Weave, and Fae ruin.
- The historical audit explicitly identifies the three-line Tala-Rane poem
  at 44040, `{*2{1}}`, and the uncertainty around the Weave/ruin referents.
  These remain open preliminary questions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44001-44050 once
  and in identical ascending order; each default CSV has 65,135 records.
- Line-break counts match across all locales: ID 44020 has one separator
  between its stat lines, ID 44040 has two separators for three poem lines,
  and no other selected row has embedded line breaks.
- ID 44019 retains the exact nested `{*2{1}}` marker. The +9 Physical
  Damage and +10% Damage values at 44020 and XP/Gold values at 44004 match.
- No hidden formatting characters were found in this range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44001-44050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44051.
