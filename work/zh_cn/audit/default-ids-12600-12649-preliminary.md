# Preliminary Language Scan: `default` IDs 12600-12649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12600-12649.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12600 | Wyl / Gwalchmai / `chain of keys` | Verify both name forms and whether the lost `chain of keys` is a key ring or a linked set of keys. | Korean preserves the lost keys and ledger handoff, but the English relationship between key-chain and storeroom access is context-dependent. Japanese/Chinese name spellings differ. Historical question remains open. | Medium |
| 12601 | `Rathir Chapter` → `라시르 지부` | Determine whether `Chapter` is an organization branch, chapter title, or district. | Korean selects an institutional branch, matching Japanese/Chinese branch readings, while English leaves the category ambiguous. Historical question remains open. | Medium |
| 12606 | `what is likely the last battle` → `마지막 전투` | Preserve the source's uncertainty that this is likely the final battle, not certainly the last. | Korean states the battle as final; English retains `likely`, while Japanese and Chinese also treat it more definitively. | Medium |
| 12609 | `transfixed upon the page` → `책장을 들여다보며` | Verify whether this is promotional/bookshop copy, what `page` refers to, and whether the line should address a visitor as a question. | Korean changes the fragment into polite visitor-facing copy and uses `책장`, which may mean a bookcase rather than a page. Historical question remains open. | Medium |
| 12610 | `Their greatest song` → `가장 유명한 노래` | Check whether “greatest” means most celebrated/famous or the band's best song, and preserve the relationship to the listed works. | Korean chooses “most famous”; Japanese describes a poem honoring them, while Chinese says they appear in other works. Historical context remains open. | Medium |
| 12617 | `The Crows` → `까마귀단` | Align this faction/team label with the established proper-name form `크로우즈(The Crows)` or document a deliberate translated form. | Many active rows use `크로우즈`; this isolated label translates the name literally. | Medium |
| 12624 | long Ettin/cave/lamplight journal | Preserve the disoriented voice, dark humor, injured-leg detail, and three-paragraph progression; verify what the lights represent. | Korean retains the speaker's uncertainty, night/pitch simile, left leg, cliff, and builders' height joke. Historical question remains open. | Medium |
| 12628 | `Blood Plague` → `혈역병` | Confirm the disease's canonical Korean term and align it with earlier Blood Plague/Plagueshield entries. | The active corpus also uses `피의 역병` and `혈액 역병`; this row additionally retains the boggarts as spreaders. Historical question remains open. | High |
| 12633 | `Preordained` → `예정된 자들` | Standardize this named faction/title without conflating it with generic predestination. | The row is clear about night patrols, but the corpus has both `예정된 자들` and `정해진 자들`. Historical question remains open. | Medium |
| 12634 | `The Hierophant willing` | Preserve the elliptical “if the Hierophant wills it” construction and clarify whether the second clause offers an alternative explanation. | Korean retains the two possibilities, but the English is fragmentary and its punctuation does not fully settle the relation. Historical question remains open. | Medium |
| 12637 | `Scourge Armor [DO NOT USE]` | Keep the unused/debug warning visible in the audit and verify the official term for `Scourge`/armor. | Korean retains `[사용 금지]`; other locales likewise mark the entry unusable, with differing terminology. Historical question remains open. | Medium |
| 12638 | House of Ballads / Court of Enchantments | Confirm the canonical Korean rendering of `Court of Enchantments` and the honorific/register for the king. | Korean uses `마법의 궁정`, consistent with many active rows; Japanese instead says `英雄院`, while Chinese uses an enchanting-court form. | Medium |
| 12642 | `Alyn Shir` → `앨린 쉬어` | Check the character-name form against established project usage and the manual. | Korean preserves the source spelling parenthetically; Japanese and Chinese phonetic forms differ. | Low |
| 12643 | `past life` → `전생` | Determine whether this means a previous incarnation or the speaker's life history before the current event. | Korean follows Chinese's explicit past-life reading; Japanese says “life up to now,” leaving a meaningful reference difference. | Medium |
| 12645 | `Aethan Engar` → `에이던 엥가르` | Align this name with established spellings such as ID 12483 `에이선 엥가르`. | The English name and requested action are clear, but the Korean first-name form varies in the active corpus. | High |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12600-12601, 12609, 12624, 12628,
  12633-12634, and 12637 against the active Korean and all three source
  locales. They remain open.
- Added current-pass candidates at IDs 12606, 12610, 12617, 12638, 12642,
  12643, and 12645 after checking meaning and related corpus occurrences.
- IDs 12616, 12630, and 12640 retain the numeric values and line structure
  for damage, block, cost, and ability effects.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range; the
  multiline journal at ID 12624 preserves its three-paragraph structure.
- Runtime-token signatures match. No structural or marker-order exception
  was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12600-12649 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12650-12699.
