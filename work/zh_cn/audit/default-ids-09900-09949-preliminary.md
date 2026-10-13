# Preliminary Language Scan: `default` IDs 9900-9949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9900-9949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9900 | `Chaos Portal` / `endlessly changing depths` → `혼돈 차원문` / `끝없이 변하는 깊은 곳` | Align the portal term with other Chaos/portal uses and preserve that the companion is lost, not confirmed dead. | Korean retains the companion's disappearance as being lost inside the shifting depths; it does not assert death. | High |
| 9903 | eye meter / `{*1stealth skill}` | Preserve the eye-meter condition, `{LINE_SPACE}`, and localized skill marker; align `stealth` with the project's established Korean UI term. | Korean explicitly identifies the eye-shaped indicator and retains the hidden-approach benefit. Marker sequence matches all locales. | High |
| 9907 | Walen's mother / Forstid Traders / frying-pan idiom | Verify the merchant organization's name and keep the idiomatic escalation from one danger into a worse one; preserve the mother's protective motive. | Korean renders the “out of the frying pan and into the fire” idiom and retains her position and concern. | Medium |
| 9910 | `Scholar` / `Livrarium` → `학자` / `리브라리움` | Confirm the formal occupation and the institution/library name; preserve the child's enthusiasm and the father's need to drag her away. | Korean retains the repeated visits and humorous exaggeration. The proper institution name is transliterated. | Medium |
| 9913 | `Red Legion` → `붉은 군단` | Align the faction name with other occurrences and preserve that it has been present for weeks and residents fear going out after dark. | Korean translates the faction name rather than retaining an English parenthetical; its established corpus form should be checked. | Medium |
| 9914 | `Pledgeshield Bolton` → `서약방패병 볼턴` | Verify `Pledgeshield` as a formal rank/title and align it with other occurrences rather than treating it as a descriptive compound. | Japanese reads it as a second-class mercenary, while English/Chinese present it as part of Bolton's name/title. Korean uses a coined rank form. | Medium |
| 9915 | `Sprite Primal Champion` → `스프라이트 원초 챔피언` | Determine whether this is a creature subtype, formal combat rank, or named unit; align `Primal` terminology with the game's magic/effect terms. | The references use parallel combinations of Sprite and Primal Champion; Korean retains both terms but their hierarchy is unclear. | Medium |
| 9916 | `Tender` → `수호자`; `Delvers` → `탐굴자`; `Tuatha` → `투아타` | Align the House of Sorrows roles with recurring uses and standardize the Tuatha ethnonym; preserve Cadoroc's former role, brother's murder, possible Tuatha aid, and Taibreah's trip to the Midden. | Japanese uses different role terms, and Chinese treats Tender as a keeper/guardian. Korean's `수호자` may narrow the formal `Tender` role. `Tuatha` also varies between `투아타` and `투아사` elsewhere. | High |
| 9918 | Eye of Amman / Syl / Cradle of Summer | Verify the artifact and place names and whether `hollow` names a Fae site; preserve that cleansing is possible only at Syl, Amman's resting place. | Korean retains the curse, location restriction, Amman's relation to Syl, and Cradle of Summer. Name spellings remain provisional. | Medium |
| 9919 | Ayten soldier's account / intended death | Preserve the restrained, despairing first-person voice, all three paragraphs, and the distinction between seeking a deserved death and making reparations. | Korean retains the speaker's shame, battlefield return, inability to pay for passage without selling possessions, and exhaustion from waiting for an answer. The three paragraph breaks match all references. | High |
| 9920 | `his tower` | Preserve the unspecified antecedent; do not assign the tower to a named person without surrounding context. | Korean retains “his tower” as a pronoun and the warning to prepare for further dangers. | High |
| 9926 | `assemble allies` / `forces arrayed against you` → `동맹` / `병력` | Determine whether `forces` means armies or broader opposing powers; retain the progression from seeking allies to resisting opposition. | Korean interprets the forces militarily as troops. English/Chinese are broader; Japanese also gives a military reading. | Medium |
| 9927 | `the Marches` → `행진지` | Confirm whether this capitalized term is a named region and align its Korean place-name form; preserve the casual invitation to enjoy the peace. | English capitalization indicates a place/region; Korean reads like a generic “marching ground,” which may obscure the proper name. Japanese/Chinese also translate it differently. | Medium |
| 9930 | `10 - 12` → `10~12` | Retain the numeric range without adding units or interpreting it as age, level, or quantity. | The isolated label provides no unit; Korean preserves the endpoints. | High |
| 9931 | victims of Fate / Lyria's doing | Preserve both theological alternatives as questions and do not answer whether their presence was caused by Lyria. | Korean retains the repeated yes/no framing and the speaker's challenge. | High |
| 9935 | `the Isles` → `군도` | Determine whether the capitalized Isles names a specific region (for example, the Gravehal Isles) or is generic; preserve the construction role and distinction between drafting and realizing plans. | Korean preserves that gnomes make plans and the speaker executes them, but translates the place generically as an archipelago. | Medium |
| 9940 | `the Testament` → `테스타먼트` | Determine whether this is a named order, faith, or institution; preserve that Giran should be persuaded to leave it. | English capitalizes Testament and Chinese uses a specific proper-like title. Korean transliterates the name but does not establish its type. | Medium |
| 9945 | Chaos Weapons / Chaos Damage / Chaos Armor / cores / salvage / Blacksmithing | Align system terminology with earlier combat/crafting rows; preserve every acquisition rule, quality condition, number-free paragraph layout, and all markup. | Korean retains the rule sequence and four `{LINE_LEFT}`/two `{LINE_SPACE}` layout markers, and localizes the `*1` title. `Salvage` is rendered as “disassemble,” while earlier `salvage` rows use context-dependent cleaning/reclaiming; distinguish the item-specific mechanic from ordinary recovery. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9900, 9903, 9907, 9910,
  9914-9916, 9918-9920, 9926, 9930-9931, 9935, 9940, and 9945 against
  the active rows.
- Added active-row checks for IDs 9913 and 9927.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales,
  including the three-paragraph journal at ID 9919 and tutorial at ID 9945.
- Runtime-marker IDs/order and other brace tokens match throughout this
  range; ID 9903 and ID 9945 retain their localized markers and layout tags.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name and term questions above as
  settled.

## Batch Status

IDs 9900-9949 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
