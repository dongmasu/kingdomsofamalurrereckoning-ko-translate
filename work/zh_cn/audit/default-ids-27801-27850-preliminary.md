# Preliminary Language Scan: `default` IDs 27801-27850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27801-27850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27801-27802, 27804-27808, 27810-27814, 27816-27825, 27827-27828, 27830-27832, 27834-27842, 27844-27850 | Dialogue, lore, objectives, proper names, and concise UI text | Recheck tone, faction and item terminology, and recurring proper-name forms during the integrated pass. | Korean generally conveys the English and uses Japanese for voice/register. The Nareen relationship and several setting terms remain context/glossary questions. | Medium |
| 27803 | Fate tutorial control/marker order | Preserve the displayed action, button placeholders, marker wrappers, and runtime order; investigate the Japanese-only ordering difference without normalizing it prematurely. | English, Chinese, and Korean order the localized `Pull and hold` marker before `{1}` and `{2}`, followed by the `reckoning mode` marker. Japanese places `{1}` and `{2}` before both localized markers. Korean matches English/Chinese. | High |
| 27809 | `그냥 좀 내버려 둬` for “Just bleedin' leave me alone” | Preserve the irritated, mildly profane voice without making the speaker more hostile than the references support. | English includes the intensifier `bleedin'`; Japanese and Chinese omit an equivalent. Korean preserves the blunt request but not the intensifier. | Medium |
| 27815 | Nix/Creth/Airmer troll poem | Review names, rhyme, quote boundaries, and the “Maid Windemere at play” line while retaining the narrative sequence. | Korean preserves all ten verse lines and the challenge to a duel to the death. The “at play” line is rendered as something the Maid plotted, a plausible but more explicit interpretation; source punctuation and rhyme differ across locales. | Medium |
| 27817, 27820, 27827, 27838, 27840, 27843, 27845 | House of Sorrows / Energizing Bindings / House of Ballads / Indre's kinship / Cadoroc report / Fate bonus / Domus Politica | Reconcile faction, crafting, kinship, item, and institution terms; preserve the gameplay relationship and source ambiguity. | Korean retains the faction and item references, but the project-wide renderings remain unsettled. ID 27838's sibling-age detail conflicts across references and is isolated below. | Medium |
| 27829 | `힐리 맥힐러슨` for `Healie McHealerson` | Preserve the comic healer-name wordplay in a Korean-appropriate form if possible. | The Korean transliteration preserves the sound/name but not the transparent English `Healie` / `McHealerson` healing joke. The historical audit explicitly flags the pun. | Medium |
| 27831 | `날 되살렸다고?` for “brought me back?” | Confirm whether “brought me back” explicitly means resurrection or is intentionally broader. | Japanese explicitly says revived, while English and Chinese use the broader “brought me back.” Korean follows the likely resurrection context but makes that reading explicit. | Medium |
| 27838 | `인드레의 여동생` for “Indre's sister” | Do not specify older/younger until the source conflict is resolved. | English gives no relative age; Japanese says younger sister, while Chinese says older sister. Korean follows Japanese with `여동생`, so the relationship detail remains unresolved. | High |
| 27842 | Pilgrims praying to a deity whose voice is suddenly silent | Preserve the contrast between audible prayers and the deity's silence; confirm whether the deity's “voice” is literal or a setting-specific effect. | Korean retains both details without adding a cause. The historical inventory flags the deity clause for context. | Medium |

## Historical Audit Reconciliation

- The 27800-27899 source-keyed inventory includes the `Socketed` suffix,
  Quarters, Fate tutorial markers, Spinning Blades, the Jottun role, magic
  circle, portents, city options, the troll poem, House of Sorrows, Energizing
  Bindings, Templar line, monster count, Healie pun, Brighthelm, Syllareta,
  Wildfrold, Indre kinship, Cadoroc, deity voice, Shadow Strike, and Domus
  Politica.
- The historical notes specifically require preserving variables and
  control wrappers and resolving the kinship/deity questions. These remain
  open candidates, not approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27801-27850 once,
  in identical order.
- Actual embedded line-break counts match. The normalized marker-order
  signatures match EN/ZH/KO at 27803 and differ in Japanese as described
  above. No other runtime-token order exception was found.
- ID 27838's older/younger-sister reading differs between JA and ZH; the
  English source is nonspecific.
- No unexpected Unicode format character was found.
- No key/order or line-break structural exception was found. Korean wording
  and all CSVs were not edited.

## Batch Status

IDs 27801-27850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27851.
