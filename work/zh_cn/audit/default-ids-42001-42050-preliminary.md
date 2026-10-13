# Preliminary Language Scan: `default` IDs 42001-42050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42001-42050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42001 | House of Seasons / Great Cycle / `계절의 집`, `대순환` | Confirm whether House of Seasons is a formal faction/institution and standardize the Great Cycle term. | Korean preserves the House as a place for those attuned to the Cycle; the exact institutional sense is not resolved by this isolated sentence. | Medium |
| 42007 | `great dwarf fastings` / `거대한 드워프 요새` | Preserve the eight-line poem while resolving whether `fastings` is a source typo or an unfamiliar fortification term; do not silently normalize it. | English says “great dwarf fastings,” Korean chooses fortresses, Japanese describes underground passages, and Chinese says passages. The historical log flags the source phrase. | High |
| 42009 | Orison / Sojourn; three sacred springs / `오라이슨`, `순례`, `세 곳` | Confirm the formal name and meaning of the Sojourn rite and retain all three spring locations. | Korean retains the first task, amphora, three springs, and locations. References diverge on whether Sojourn is a rite, stay, or pilgrimage; Japanese uses digits for one/three where Korean uses words. | Medium |
| 42010 | Travelers / `여행자단` | Confirm the faction-name form and distinguish the group from ordinary travelers. | English capitalizes Travelers; Korean identifies a group, consistent with the faction context, but the canonical Korean term remains a corpus-wide question. | Medium |
| 42020 | Straton's theater / `극장`; Kollossae life/history | Confirm whether the theater is a named institution and preserve that the plays explore Kollossae life and times. | Korean retains the emerging cultural-center role and the plays' subject; institution and proper-name forms remain open. | Medium |
| 42026 | Maid of Windemere / `시녀` | Preserve the full title/place association rather than reducing the named figure to “Maid” alone. | English names the Maid of Windemere, while Korean says only `시녀`; this omits the Windemere identifier. The line concerns her attempt to overpower the Court of Enchantments. | High |
| 42028 | Pyhril tree; four-line poem | Confirm `Pyhril` and retain the four-line structure, images, and loss progression. | Korean preserves all four source lines and the falling-away sequence. Pyhril transliteration remains provisional. | Medium |
| 42029 | `I have cast Zotikus` / `조티쿠스를 시전했어` | Determine whether `cast` means assigning an actor to a role or casting a spell; avoid resolving the ambiguity without context. | Korean selects the spell-casting sense, while Japanese and Chinese read the line as choosing/casting an actor for the role of Zotikus. | High |
| 42030 | `FAIL LINE` (unchanged) | Preserve the literal diagnostic label unless game context confirms it should be localized. | Korean retains the exact English label, matching the source-keyed historical instruction. | Medium |
| 42039 | Firstsworn Champions / Second Oath / `초대 서약`, `제2서약` | Clarify the chronology and formal relationship between Firstsworn Champions and the Second Oath. | Korean renders `Second` as ordinal `제2`, an equivalent value; the relationship among Eamonn, Eagonn, Caerwyn, and the Oath still needs lore context. | Medium |
| 42044 | Dara and Diden / `다라와 디든` | Confirm whether this is a named tale and standardize character spellings. | Korean preserves the lake origin and unrequited-love premise; capitalization and name forms remain open. | Medium |
| 42048 | Whitestone; Apotyre / `화이트스톤`, `아포타이어` | Verify the canonical place-name forms and whether the sentence describes two distinct communities. | Korean retains both destinations and the salvation claim; proper names remain provisional. | Medium |

IDs 42002-42006, 42008, 42011-42019, 42021-42025, 42027, 42031-42038,
42040-42043, 42045-42047, 42049, and 42050 generally retain the English
meaning on this first reading. Proper names, register, and recurring
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 41983-42006 and 42007-42049
  were checked. They specifically flag the Grand Bursar/Great Cycle, the
  Solsvard/Ulfsten poem and `great dwarf fastings`, the Orison/Sojourn rite
  and three springs, Travelers/Warsworn, the Straton theater, the Maid/Court
  relation, Pyhril, Zotikus, `FAIL LINE`, move-set category, Fear in the
  religious text, Second Oath chronology, and Dara/Diden/Apotyre.
- The archived progress record reports the eight-line poem and three-spring
  count preserved. Both were checked against the active four-locale rows.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42001-42050 once
  and in identical ascending order.
- Embedded line-break counts match across all four locales. ID 42007 retains
  eight lines and ID 42028 retains four.
- Numeric meanings are retained: ID 42007's four treasures, ID 42009's first
  task/three springs, ID 42032's “never opened” (Japanese writes `1` under
  negation), and ID 42039's Second Oath (`제2서약`). Locale-specific digit
  versus word forms are not value changes.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42001-42050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42051.
