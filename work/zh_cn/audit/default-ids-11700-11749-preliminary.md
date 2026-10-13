# Preliminary Language Scan: `default` IDs 11700-11749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11700-11749.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11707 | Scholia Arcana stipend → `장학금` | Determine whether `stipend` here means a scholarship, grant, or other payment and align the institution name. | Korean preserves the recognition/reward but specifically calls it a scholarship. Japanese agrees; English `stipend` and Chinese `津贴` can mean a broader allowance. No payment context is supplied in this line. | Medium |
| 11712 | Wreath of Absolution → `면죄의 화환` | Reconcile `화환` with the existing active form `면죄의 화관` at ID 4616; preserve the gods' purpose and the requirement to complete the artifact. | Korean retains that the gods sent the player to witness atonement and that completion of the Wreath is required. `Wreath` is rendered as `화관` in the earlier item/lore entry and `화환` here. The proper artifact term remains undecided. | High |
| 11715 | Beckoned → `선택받은 자` | Align the title and preserve that the speaker is disappointed but willing to wait. | Korean retains the speaker's disappointment and patience. The title has several active Korean candidates and remains a corpus-wide question; the English line alone does not resolve the canonical form. | Medium |
| 11717 | prison galley / “all hands went down. All but one.” | Preserve the crash and everyone-but-one outcome without narrowing “went down” beyond the source evidence. | Korean says the ship struck rocks and everyone fell into the sea except one person. Japanese says everyone went down, while Chinese likewise suggests they all fell off; the exact fate implied by the idiom remains contextual. | Medium |
| 11719 | Gloamthicket / Banshaen Priestess / Telemachus Rasp | Verify the spellings and quest sequence; preserve that the priestess preyed on local initiates and was killed. | Korean retains the instruction, target, completion, and thanks. Japanese and Chinese differ on the Gloamthicket rendering and the creature description, so these names remain provisional. | Medium |
| 11720 | `Lower` → `낮음` | Determine whether this is a low-value stat label, comparative rank, or another UI category. | Korean follows the prior broad “low” reading; Japanese transliterates “Low” and Chinese says “lower.” The isolated label cannot establish its dimension. Historical notes already flag it. | Medium |
| 11732 | Wreath of Absolution → `면죄의 화환` | Keep the ritual requirement clear and reconcile the artifact term with ID 4616 (`면죄의 화관`) and ID 11712. | Korean retains that a formal ritual involves the Beckoned crafting the Wreath. Japanese and Chinese support the ritual, though they differ in the strength of “holy.” The Wreath spelling varies in active Korean. | High |
| 11734 | `Blacksmithing` → `대장장이` | Confirm whether this is a skill/category label and whether Korean should name the craft rather than the practitioner. | Korean gives the profession noun “blacksmith”; English/Japanese/Chinese name smithing/forging as a craft or skill. No UI context is provided. | Medium |
| 11735 | Cipher / Primos / Teeth of Naros / Beckoned | Preserve the four embedded line breaks and the quoted archaic speech; verify the artifact and title forms. | Korean retains the discovery, the woman's voice, the Cipher reaching the Beckoned, the instruction to seek Primos, and the opening of the way to the Teeth of Naros. English, Japanese, Chinese, and Korean all have four line breaks. Proper-name and register choices remain provisional. Historical notes already flag this passage. | Medium |
| 11737 | House of Ballads → `발라드의 집` | Align the institution name with the competing active forms `하우스 오브 발라드` and `발라드 가문`. | The row is an isolated faction/institution label. Korean uses the literal form, while other active entries use phonetic retention or `발라드 가문`; this repeats the corpus-wide naming question. | High |
| 11742 | `{1}` / `{*1sprint}` → `{1}` / `{*1질주}` | Preserve the button placeholder and localized sprint label in source order. | Korean retains both markers and the run/hold instruction. All four locales have the same normalized marker classes and order (`button-placeholder`, then `localized-label`); only the localized label text differs by locale. | High |
| 11743 | Bayala Tirin poem / “true-hearted Alfar” / Opposition | Restore the omitted sharing/Alfar knowledge contrast in a later accepted edit; keep the poem's syntax and attribution provisional. | Korean preserves the initial “not mine but ours,” but omits that the words are shared with all willing listeners and known only to true-hearted Alfar. It also has a difficult final attribution with a repeated `에게서`. English/Japanese/Chinese retain the sharing/knowledge contrast, while the middle lines remain syntactically ambiguous. All six source line breaks are preserved. Historical notes already flag the poem. | High |
| 11748 | Ohnshan's protection / enchantments | Verify the deity and equipment terms; preserve that the legging enchantments protect against lightning from storms and storm-born creatures. | Korean retains the protection relation and source threats but renders `enchantments` generally as `마법`. The proper name and technical terms remain provisional. | Medium |
| 11749 | `pull up a stump` / rubble | Preserve the casual invitation to sit despite the rubble-filled surroundings. | Korean interprets `stump` as a log/seat and retains the invitation to get comfortable on rubble. Japanese supports this reading; Chinese's literal “pull up a stump” is less clear. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11720, 11735, and 11743. They remain
  open; historical candidates were not treated as approved.
- Compared Wreath of Absolution at IDs 4616, 11712, and 11732. The active
  Korean has both `면죄의 화관` and `면죄의 화환`.
- Compared House of Ballads at ID 11737 with the recurring active forms
  `하우스 오브 발라드`, `발라드 가문`, and `발라드의 집`.
- ID 11742's normalized marker classes/order align across all four locales;
  ID 11735's four and ID 11743's six embedded line breaks are also aligned.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- ID 11735 has four embedded line breaks; ID 11743 has six. ID 11742 contains
  `{1}` followed by a localized `{*1...}` marker in every locale. No
  structural exception was found.
- Official Korean manual terminology could not be independently searched
  during this pass. Active CSV hashes match the recorded baseline; no active
  CSV was edited.

## Batch Status

IDs 11700-11749 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 11750-11799.
