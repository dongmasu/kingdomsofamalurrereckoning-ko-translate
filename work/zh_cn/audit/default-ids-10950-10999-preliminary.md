# Preliminary Language Scan: `default` IDs 10950-10999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10950-10999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10953 | Adessa / “rise of magic” | Preserve the researcher's long tenure and the time relation between beginning the study and the rise of magic. | Korean says the research began around the time magic flourished; the source's “It coincided with the start of my study, on the rise of magic” is grammatically awkward, so the precise relation remains provisional. | Medium |
| 10955 | suitable beast master to `run it` | Keep the referent of `it` unspecified until context identifies what must be run. | Korean says “operate this place,” choosing a location/operation reading not explicit in the English. | Medium |
| 10956 | Flawless Mitharan Rallying Bindings → `완벽한 미타란 집결 결속구` | Confirm the equipment type and canonical Korean forms for `Rallying Bindings`. | The translated label preserves the quality, Mitharan affiliation, and rallying/binding terms, but the item's slot/function is not given. | Medium |
| 10959 | `Five-and-nine by night` → `밤에는 다섯과 아홉` | Retain the phrase as an unresolved code/riddle and align its number formatting with recurring instances. | Prior historical questions at IDs 3527 and 21075 treat the phrase as opaque. Active ID 3527 uses `밤에는 5와 9`; this row spells the numbers out. Meaning and formatting remain unresolved. | High |
| 10960 | future wonders / their arrival | Preserve the plural “wonders” and the speaker's thanks without deciding what arrives. | Korean refers broadly to “that event” enabling their arrival; the exact referent remains unstated. | Medium |
| 10961 | `Movement #NAMED_ICON_360_LS#` | Preserve the icon token exactly and confirm the UI context of “Movement.” | Korean localizes the label and retains the named-icon token. | High |
| 10962 | `Spire-top` → `첨탑 꼭대기` | Confirm whether this is a location/level label or a descriptive phrase. | Korean gives a clear literal location reading; no surrounding context defines the map/UI category. | Low |
| 10964 | Barten / Billis Aideh / house-repair service | Align the character spellings and preserve that Billis is the village blacksmith offering house repairs. | Korean retains the service and quest objective but leaves both names without English parentheticals, unlike many nearby proper-name entries. | Medium |
| 10966 | Grim / Missives of Sable / Jottun / Ohn's Stand | Verify the book title and location; retain the planned theft's source and target. | Korean preserves that Grim planned to steal a book from a Jottun troop at Ohn's Stand. `Missives of Sable` becomes `세이블의 서신`; the canonical title remains open. | Medium |
| 10967 | Alyn Shir → `앨린 시어` | Align the proper name with the corpus-wide provisional spelling. | Active rows use several forms, including `알린 시어`, `앨린 시어`, `앨린 시르`, `앨린 셔`, and `앨린 쉬어`. This row adds to a previously identified consistency issue. | High |
| 10972 | `Localization Tools & Support` | Confirm whether this is a player-facing heading, internal label, or credit string before translating. | Korean retains the English phrase; Chinese translates it and Japanese also retains English. The resource type is not clear from this row. | Medium |
| 10974 | Bristletongue / mockingbird / Font's only yield | Preserve the wordplay and determine whether Bristletongue is a plant, bird, or another named resource. | Korean identifies the mockingbird as the Font's only yield, following a plausible reading, but the English construction is cryptic and may rely on an earlier question. | Medium |
| 10976 | 520 Lightning / 50 Shocking damage / 175 Mana | Preserve all damage values, area behavior, and cost. | Korean retains 520, 50, 175, and the source's line break before the cost. | High |
| 10978 | Witchknight Anira / `Child of Dust` | Reconcile with the historical title/name question and preserve the warning. | The active Korean matches the archived candidate `마녀 기사 아니라(Anira)` / `먼지의 자식`. Because `아니라` is also a common Korean negation, the parenthetical English spelling is useful for traceability; the title's spacing/canonical form remains open. | High |
| 10979 | `A unassuming letter` | Treat the English article as a source typo and preserve the letter as unremarkable and sealed. | Korean naturally renders “an unassuming letter, sealed tightly”; Japanese and Chinese support that apparent meaning. | Low |
| 10982 | barghests / cages / training | Preserve that the captive beasts may still be in training and releasing them could cause chaos. | Korean follows the English uncertainty and proposed action without changing the beasts' status to confirmed trained combatants. | Medium |
| 10987 | nobles / “layer of filth” from Apotyre | Preserve the insulting metaphor and verify whether “filth” is literal grime or a figurative quality. | Korean uses `때` to retain the dirt/grime image; Japanese instead interprets it as cunning acquired while growing up in Apotyre. | Medium |
| 10994 | Seaflax / `{*3Armor}`-like quality | Preserve the material, armor-like comparison, and localized marker wrapper. | Korean retains the drying/braiding process and `{*3...}` marker class; the protective effect is expressed without altering the wrapper. | Medium |

## Historical Audit Reconciliation

- Rechecked the archived question at ID 10978 against the active English,
  Japanese, Chinese, and Korean rows; the active Korean matches the prior
  provisional form.
- Rechecked recurring `Five-and-nine by night` questions at IDs 3527,
  21075, and the grouped historical notes around ID 26193. The phrase remains
  unresolved; no interpretation is imported into this row.
- Compared all active occurrences of Alyn Shir spellings; variation is
  confirmed and remains a consistency candidate.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across all four locales. ID 10976 retains one line break.
- The icon marker at ID 10961, `{1}` at ID 10968, damage/cost values at
  ID 10976, and `{*3...}` armor marker at ID 10994 are retained.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10950-10999 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 11000-11049.
