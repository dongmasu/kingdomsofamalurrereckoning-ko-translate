# Preliminary Language Scan: `default` IDs 27201-27250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27201-27250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27201, 27203-27207, 27209-27213, 27215-27216, 27219-27222, 27225-27236, 27238, 27240-27242, 27244-27248 | Dialogue, quest, lore, and concise UI/item text | Recheck voice, idiom, and proper names during integrated review. | Korean generally retains the English meaning and Japanese tone. Place, character, and faction names remain subject to cross-corpus standardization. | Medium |
| 27202, 27227, 27250 | the First / Scion / great Houses / the Maid | Standardize title, order, cosmology, and faction terminology; distinguish the Maid as a named role from a generic maid. | Korean renders “the First” as `초대(First)`, Scion as `사이온`, great Houses as `위대한 가문들`, and the Maid as `시녀(The Maid)`. The source-keyed log flags each term cluster; no form is approved here. | High |
| 27208, 27239 | Demo title / `{*1...}` display markers / `{LINE_SPACE}` | Preserve marker wrappers and order while checking visible payloads and Korean UI phrasing. | At 27208, the game-title payload is localized in Chinese but retained in English/Japanese/Korean; `{*1...}` and `{LINE_SPACE}` stay in order. At 27239, both minimap/options payloads are localized, while their wrapper order is preserved. These are payload differences, not structural exceptions. | High |
| 27214 | 75% Freeze chance when attacked | Check whether “temporarily gives a 75% chance” should be expressed as granting a temporary chance rather than increasing an existing chance. | Korean says the chance “temporarily increases to 75%”; Japanese and Chinese also state a 75% chance when attacked. English is the semantic anchor, but the game-effect phrasing deserves review. | Medium |
| 27217-27218, 27223, 27237 | Theater of Andronikos / Plant Snapper / Revival Prison / Trellis | Standardize the named venue, creature, prison, and structural/place name. | Korean transliterates Theater of Andronikos, Trellis, and Revival Prison, while translating Plant Snapper as `식인 식물`. The historical log explicitly groups these UI/creature terms and requests transliteration/context review. | Medium |
| 27224, 27243, 27249 | The Tree / dark arm of justice / Aurenda's lantern and “my light” | Preserve named-entity status and the metaphor's agent/action relationship. | Korean translates “The Tree” generically as `나무`. At 27243, `어둠 속의 정의를 수호하는 자` may shift “the dark arm of justice” from an agent of justice to justice operating in darkness; Chinese has a “black hand of justice” reading. At 27249, Aurenda's name and the object/light relation remain terminology candidates. | High |
| 27230 | sleeping woman / magic barrier | Preserve which party can cross the barrier and which cannot reach her. | Korean retains that she can cross it while the speakers cannot get through to her; the English and Chinese emphasize the barrier's relation to her sleep, so the scene context remains worth checking. | Medium |

## Historical Audit Reconciliation

- The source-keyed log groups IDs 27202, 27227, 27243, and 27250 for the
  First, Scion, justice metaphor, great Houses, Font, and Great Cycle.
- It also flags the demo title/wrappers, Plant Snapper, Revival Prison, Tree,
  Trellis, Reckoning UI, and control-marker syntax; Theater of Andronikos and
  Aurenda receive separate transliteration/context checks.
- These entries remain issue inventory, not approved translation decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27201-27250 exactly
  once and in identical order.
- Actual embedded line-break counts match. Runtime-marker wrapper identity
  and order match; display payloads are localized in the locale files.
- At ID 27214, the `75%` value is retained. No unexpected Unicode format
  character was found in this range.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27201-27250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27251.
