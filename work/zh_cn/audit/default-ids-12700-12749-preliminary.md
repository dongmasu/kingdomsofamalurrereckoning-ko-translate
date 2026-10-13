# Preliminary Language Scan: `default` IDs 12700-12749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12700-12749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12700 | `Notices of Duty` → `임무 소집 공고` | Determine whether this is a call-up/quest notice or a notice describing assigned duties. | Korean chooses a recruitment/muster reading; English is a short UI label and Japanese says “summons notice.” | Low |
| 12708 | `How quaint` → `세련된 수법이군` | Preserve the likely sarcasm/self-importance without turning `quaint` into “sophisticated trick.” | Korean sounds like praise of a clever method; the English is likely a dismissive/sarcastic aside before the speaker asserts her own fitness to lead. Historical question remains open. | High |
| 12714 | `Valor Arena` → `용맹의 투기장` | Align the location name with other forms, including `용맹 투기장` and `발러 아레나`. | Korean preserves the arena meaning but adds another variant to an existing proper-name consistency issue. | Medium |
| 12715 | `our only choice` → `우리의 유일한 희망` | Check whether “only choice” should remain a choice/option rather than become “only hope.” | Korean conveys the speaker's trust and the mission context, but shifts the noun from choice to hope. | Medium |
| 12717 | `of Displacing` → `위치 이동의` | Keep this incomplete fragment unresolved until its parent label is identified. | Korean retains a possessive fragment rather than inventing a head noun. Historical question remains open. | Medium |
| 12720 | `I'm sorry` → `안됐군` | Determine whether this is an apology or an expression of sympathy. | Korean follows Japanese's condolence reading; English and Chinese can read as an apology. Historical question remains open. | Medium |
| 12725 | Hera Orhelm / keeper of the Bone Wall | Resolve whether Hera keeps a literal Bone Wall or is the quest-board keeper in Whitestone. | English and Chinese say keeper of the Bone Wall; Japanese says quest-board keeper. Korean follows the English/Chinese wording. Historical question remains open. | High |
| 12727 | Ysa / Ohn / `that pattern` | Verify the spellings/titles and whether `pattern` refers to the Fae cycle or a broader natural order. | Korean preserves the 500-year date, seasonal rulers, battle, and land scars. Historical question remains open. | Medium |
| 12735 | Fae Lorestone / source typo `Loretones` | Preserve the established Lorestone term while noting the source typo and confirm the quest-log referent. | Korean uses `로어스톤` consistently and does not reproduce the likely typo. Historical question remains open. | Low |
| 12738 | Priestess Aurela / wand | Follow the English/Chinese character identity unless game context establishes otherwise. | English and Chinese name Priestess Aurela; Japanese instead names a different priest. Korean follows English/Chinese. Historical question remains open. | High |
| 12739 | `{1}` / localized `{*1block}` | Verify the Korean tutorial verb for blocking while preserving the button marker and highlighted-action wrapper. | Korean retains `{1}` followed by `{*1막으세요}`; wrapper/order match all locales. The most suitable UI term/register remains open. | Medium |
| 12742 | Sparrows / Rathir Quays / Orwin Dunn | Confirm whether the Sparrows are a named faction and whether Rathir Quays is a named district or simply the docks. | Korean preserves the suspected killer question and location. The corpus uses translated, transliterated, and parenthetical Sparrows forms. Historical question remains open. | Medium |
| 12746 | `prepare commentary` → `해설을 준비하고 있어` | Confirm the speaker is preparing event/arena narration and reconcile the parallel line at ID 12888. | Korean chooses event commentary rather than online comments, consistent with the likely game context. Historical question remains open. | Medium |
| 12748 | `Don't suppose there are any more interesting stories` | Preserve the English speaker's doubtful/negative expectation and check the polarity conflict. | Korean follows English and Japanese: the speaker doubts there are more stories. Chinese reads as expecting that there are interesting stories to share. | Medium |
| 12749 | church of the Unbound | Retain the church reading while noting the temple/church source difference and the Unbound group's identity. | English and Japanese say church; Chinese says temple. Korean follows English/Japanese and preserves the self-chosen path clause. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12708, 12710, 12717, 12720, 12725,
  12727, 12735, 12738-12739, 12742, and 12746 against the active Korean and
  all three source locales. They remain open.
- Added current-pass candidates at IDs 12700, 12714-12715, and 12748-12749
  after checking UI wording, name consistency, and conflicting source senses.
- ID 12739 retains `{1}` before the localized `{*1...}` control wrapper.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token wrapper/class and order match; no structural exception was
  found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12700-12749 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12750-12799.
