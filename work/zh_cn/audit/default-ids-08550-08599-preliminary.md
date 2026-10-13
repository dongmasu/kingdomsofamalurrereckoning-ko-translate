# Preliminary Language Scan: `default` IDs 8550-8599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8550-8599.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8550 | Fateless One / Fateweavers | Align the epithet and faction forms with related dialogue while preserving the respectful address. | Korean uses `운명 없는 자` and `페이트위버`; English and Chinese use the Fateless/Fateweaver terms, and the Korean honorific register is respectful. | Medium |
| 8551 | Kiftal / Prismere “taking her” | Preserve the feminine referent and the speaker's uncertainty about whether anything can be done. | Korean omits the pronoun naturally, retains Prismere as the agent, and leaves the possibility of intervention uncertain. | High |
| 8552 | `dustling` / `먼지의 자손` | Align this creature/address term with the epithet at ID 8492 and determine whether Hallam's hearing of it is a threat or report. | Korean uses the same `먼지의 자손` form as ID 8492 and retains the warning. | Medium |
| 8554 | dagger modifiers | Preserve both numeric bonuses, their dagger scope, and the line break. | Korean retains +8 physical damage and +25% dagger damage on separate lines. | High |
| 8560 | Kollossae `insight` wordplay | Preserve the explanation that the name puns on “insight” and evokes exposing an enemy's guts; check whether the weapon name supplies a Korean pun. | Korean retains the source explanation but cannot reproduce the English/Kollossae wordplay without the item's name/context. | Medium |
| 8563 | `Circle of Engard` → `엥가드 교단` | Confirm whether `Circle` denotes a magical circle/order and whether `교단` is too specifically religious; align the proper name. | English, Japanese, and Chinese retain Circle/circle-type wording, while Korean interprets it as a religious order. | Medium |
| 8564 | Bisarane / Niskaru Lord / Mystic Hammer / Fahrlang | Preserve the plan, the return to Tine Delfric, and the historical parallel; verify the names and whether the repeated `it` clearly refers to the hammer. | Korean retains the sequence and weapon reference. The surrounding lore is needed to settle name forms and antecedents. | Medium |
| 8565 | Alfar / Dvergan / `Eastern Passage` | Preserve the two languages/scripts and the exact number of missing fragments; verify established people/language names. | Korean retains the Alfar inscription, Dvergan writing, and two required fragments. | High |
| 8567 | `reach the Sorrows` → `비탄의 힘에 닿는` | Determine whether capitalized `Sorrows` names a group, place, or power. Preserve the key delivery to Bisarane and the plan to stop Saturnyn and the Tuatha. | English says `reach the Sorrows`; Japanese interprets it as a power, while Chinese refers to a sorrow-spirit. Korean follows the power reading, which is not settled by English alone. | Medium |
| 8570 | `Higher` → `높음` | Confirm the intended comparative/stat tier and reconcile the Japanese “very high” against English `Higher` and Chinese “relatively high.” | Korean selects “high” but loses the explicit comparative; the isolated UI/stat context is not available here. | Medium |
| 8571 | `wisdom of the slumber` / `Reverie` | Determine whether `slumber` and the capitalized `Reverie` are the same named realm/concept; keep both traceable pending context. | Korean distinguishes `깊은 잠` from `몽환계`; Japanese also distinguishes Deep Slumber from Reverie, but the relation is unresolved. | Medium |
| 8578 | `I guess it's just me` | Clarify whether the speaker concludes the concern was mistaken or was one-sided. | Korean reads it as “I must have worried for nothing”; that is plausible but not the only reading. | Medium |
| 8582 | `the Marches` / Tomb of Fyragnos | Confirm whether `Marches` is a named region and whether `행진령` is an established Korean form; preserve the underground extent and tomb name. | Capitalization and the region's role suggest a proper place name; Korean's literal-looking `행진령` may be misleading without map/lore context. | Medium |
| 8585 | `The Hierophant` → `대주교` | Standardize against ID 8466, where the same office is `대사제(Hierophant)`, and determine the game's religious/magical rank. | English repeats the same title; Japanese and Chinese suggest guide/high priest, while Korean uses two different church ranks. | Medium |
| 8587 | `{LINE_CENTER}`, `{1}`, `{*1...}`, `{LINE_SPACE}`, `{2}` | Preserve the target marker order; document the Japanese structural exception and do not normalize without runtime evidence. | English, Chinese, and Korean use `{LINE_CENTER}`, `{1}`, localized `{*1...}`, `{LINE_SPACE}`, `{2}`, localized `{*1...}`. Japanese omits `{LINE_CENTER}` and puts its first `{*1...}` before `{1}`. Korean matches English/Chinese. | High |
| 8589 | Cape Solace → `케이프 솔라스` | Verify and standardize the place-name form against other Cape Solace references. | Korean uses a phonetic form; the historical audit raises Cape Solace as a proper-name consistency item. | Medium |
| 8590 | `$M0_SQ06.hankie_cost$` | Preserve the variable exactly and retain the sale notification and currency label. | Korean preserves the full variable, the sale, and “gold”; no token or line-layout difference was found. | High |
| 8594 | capitalized `Hirelings` → `용병들` | Determine whether this is a named class/rank or generic hired help; align the term with related mercenary references. | Korean uses a generic mercenary term; English capitalization may indicate a game category, but does not settle that by itself. | Medium |
| 8598 | House of Ballads | Standardize the faction form against `발라드의 집(House of Ballads)` at ID 8428 and `하우스 오브 발라드` at ID 8537. | The same proper name appears in three differing Korean forms within nearby rows. | Medium |
| 8599 | Tuatha → `투아타` | Standardize against `투아사(Tuatha)` in nearby rows, including ID 8387 and ID 8443; retain the insult and self-correction. | English, Japanese, and Chinese identify Tuatha; active Korean uses inconsistent transliterations. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8551, 8560, 8570-8571, 8578, and
  8594 against all four language rows.
- The structural comparison at ID 8587 found a Japanese-specific marker
  difference. The active Korean sequence matches English and Chinese; record
  the exception and do not normalize it during this read-only pass.
- Added cross-row terminology questions for `Hierophant`, `House of Ballads`,
  `Tuatha`, and the dustling epithet. Candidate wording remains unapproved.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- At ID 8587, the target Korean marker sequence matches English and Chinese;
  Japanese omits `{LINE_CENTER}` and orders the first localized `{*1...}`
  marker before `{1}`. The `$M0_SQ06.hankie_cost$` variable at ID 8590 is
  unchanged in all four locales.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.

## Batch Status

IDs 8550-8599 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
