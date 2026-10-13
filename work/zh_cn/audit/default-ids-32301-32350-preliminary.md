# Preliminary Language Scan: `default` IDs 32301-32350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32301-32350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32302 | `운명의 직조` for `the Weave` | Confirm whether the capitalized Weave is the named fate-tapestry concept and standardize its Korean title. | English, Japanese, and Chinese describe the Weave unraveling. Korean uses the established `운명의 직조` form, while other active rows also use shorter `직조` forms for the same lore concept. | Medium |
| 32303 | `아래 땅` / `콜로사이` for `lands below` / `Kollossae` | Confirm whether Lands Below is a named region and standardize Kollossae spelling. | English capitalizes Kollossae and describes the lower-land marauders as no longer Kollossae. Korean preserves the disdain and identity distinction, but active rows vary among `콜로사이`, `콜로세`, `콜로새`, and `콜로사이족`; the regional phrase's proper-name status is unclear. | High |
| 32305 | `갈라테이아` / wife killed by a troll | Preserve the source's “my Galataea... or what I have left of her” ambiguity; do not add the Japanese-only troll name without evidence. | English says the speaker's wife died years earlier at a troll's hands. Japanese inserts the name Kahn, absent from English and Chinese. Korean follows English/Chinese and retains the emotional self-correction, without identifying the troll. | High |
| 32310 | Lever/knob direction-combination puzzle | Retain only the source's general instruction; do not invent an actual direction sequence. | English says the knob must point to directions in a specific combination but supplies no sequence. Japanese and Chinese are similarly generic. Korean accurately describes a particular directional combination without fabricating controls. | High |
| 32312 | `에라시족` for `Erathi` | Standardize Erathi and preserve the speaker's speculation that their travel weakened the barrier. | All locales make the same speculative connection between frequent travel across worlds and a weakened barrier. Korean preserves the hedge (`것 같아`) and the causal claim. The historical log flags Erathi terminology. | Medium |
| 32317 | `애블리어` for `Abblier` | Standardize the character/name spelling against active-corpus forms. | English, Japanese, and Chinese identify Abblier as the source of task information and rewards. Korean has `애블리어` here but uses `아블리에` elsewhere. | Medium |
| 32318 | `도크알브 군` for `Dokkalfar Army` | Standardize Dokkalfar spelling and the formal army name. | All locales identify an official military seal. Active Korean alternates between `도크알브` and `도칼파르`; the row preserves the institution and official-mark meaning. | Medium |
| 32324 | `스콜리아 아르카나의 창립에 관하여` | Preserve the book title and standardize the institution name. | English, Japanese, Chinese, and Korean agree that reading a book about the Scholia Arcana's founding is the recommended alternative to joining. Korean follows the corpus-standard institution name and uses book-title brackets. | High |
| 32325 | `머드홀드 패스팅(Mudhold Fasting)` | Determine whether this is a named location or a malformed source label; do not silently replace it with “passage.” | English says `Mudhold Fasting`; Japanese interprets it as an underground passage and Chinese as a mud-rock passage. Korean retains the English label bilingually, leaving the place type unresolved. | Medium |
| 32330 | `장비에 덧붙이는 가죽 허리띠` for `A hide belt, meant to be added to gears` | Determine whether `gears` means machinery or equipment and translate the item's function accordingly. | English can describe a belt added to mechanical gears or to gear/equipment. Japanese explicitly reads machinery gears; Chinese and Korean read equipment. Korean preserves the hide-belt item but commits to the equipment sense. | Medium |
| 32342 | `네미우스 페리굼스` / `크리네우스` and two book titles | Standardize the scholars' names and retain the bibliographic/title relationship. | English lists Nemius Perigums' and Crinneus' historical works. Korean preserves both titles and the offer of reading materials. Active spelling and reference-language transliterations should be checked before normalization. | Medium |
| 32343 | `그레이브홀 무기고` for `Gravehal Armory` | Standardize Gravehal's Korean spelling and confirm Armory as a named location label. | English and the supporting locales name the fortress armory. Active Korean uses both `그레이브홀` and `그레이브할` for Gravehal; the current row chooses the former. | Medium |
| 32345 | `대순환` for `the cycle` | Confirm whether “the cycle” is the named Great Cycle and preserve the speaker's condemnation. | English and Chinese use a capitalized/setting-specific Cycle concept; Korean uses established `대순환`. Japanese also treats it as the cycle. Korean retains the claim that the tower's work mocks it and the speaker's refusal to participate. | Medium |
| 32346 | `탐구자들의 모임` / `초자연 현상` | Preserve the collective's broad, exploratory scope and the source's hesitation. | English describes mages and others intent on unraveling ethereal phenomena in the Faelands and beyond. Korean renders this as mages and seekers investigating supernatural phenomena, retaining the ellipsis and scope. The exact technical sense of `ethereal` remains open. | Medium |
| 32348 | `여름의 요람` / Summer Court Fae | Preserve Cradle of Summer as a named sacred place and keep the protection mechanism clear. | All locales agree that its inhabitants sleep to protect the sacred place, drawing energy from their homeland to sustain barriers against beasts and humans. Korean's `여름의 요람` is established in the active corpus and retains the causal sequence. | High |

Rows 32301, 32304, 32306-32309, 32311, 32313-32316, 32319-32323,
32326-32329, 32331-32341, 32344, 32347, and 32349-32350 generally retain
the English meaning on this first reading. Proper-name spelling, item
terminology, and setting concepts remain candidates for the integrated pass;
no separate high-confidence wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32300-32399 flags Moon Camp, the
  Weave, Kollossae, Erathi, Dokkalfar Army, Scholia Arcana, Mudhold Fasting,
  the belt/gears ambiguity, the Great Cycle, and Cradle of Summer. These were
  checked against the four locale rows and active Korean usages.
- At ID 32305, only Japanese supplies the troll name Kahn; the Korean draft
  correctly does not import that unsupported detail.
- At ID 32325, the source/locales disagree about the nature of Mudhold
  Fasting. The Korean draft leaves its source name visible rather than
  deciding that it is a passage.
- At ID 32330, English is genuinely ambiguous between mechanical gears and
  equipment. The locale readings conflict; retain this as an open question.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32301-32350 once and in identical order.
- Embedded line-break counts match throughout the range.
- `#NAMED_ICON_360_LB#` at ID 32311 and `{1}`, `{2}`, `{LINE_SPACE}`, and
  `{3}` at ID 32315 are preserved in identical order. The `{1}` placeholder
  at ID 32329 is also preserved.
- No other runtime-marker identity/order discrepancy was detected.
- No CSV text or source file was edited.

## Batch Status

IDs 32301-32350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32351.
