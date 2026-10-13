# Preliminary Language Scan: `default` IDs 6200-6249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6200-6249.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6204 | `Deadeye` → `명사수` | Confirm whether this isolated label is a skill, title, or item before selecting a Korean rendering. | Japanese transliterates `Deadeye`, Chinese gives a literal “dead eye,” and Korean chooses “marksman”; the row alone does not establish which sense applies. | Medium |
| 6208 | `Mitharan` → `미사란` | Keep the adjective provisional and resolve corpus-wide Mitharan/Mitharan-people spelling consistently. | The official manual establishes `Mitharu` as `미사루`, not the adjective `Mitharan`; active rows vary between forms such as `미사란` and `미타란`. | Medium |
| 6212 | `Ruin of Aodh` → `애오드의 폐허` | Confirm the canonical Korean place-name and preserve the fire-element location description. | English/Japanese/Chinese give incompatible phonetic forms for Aodh; they agree on the southern ruin and fire element. | Low |
| 6215 | `hired her to ferry us` → `데려다 달라고 선장에게 부탁했지` | Candidate: restore the explicit paid hiring arrangement rather than a general request. | English says the couple hired Captain Brattigan; Japanese and Chinese also explicitly say they hired her. Korean softens this to asking her to transport them. | High |
| 6220 | `Master's Pick` → `장인의 자물쇠 따개` | Do not settle this as a lockpick without context; verify the named object/quest item. | English and Japanese leave `Pick` ambiguous; Chinese reads it as a choice, while Korean commits to a lockpick. The historical question remains unresolved. | Medium |
| 6231 | `Preordained` → `예정된 자들` | Determine whether the capitalized standalone term is a faction/title or descriptive label; align with other uses. | Japanese and Chinese use destiny-related names, and the Korean is semantically plausible, but capitalization/context do not resolve its status. | Medium |
| 6248 | `The Fae have taken my husband` → `페이들이 남편을 데려갔어요` | Clarify that the Fae abducted the speaker's husband, not merely accompanied or escorted him. | English says “taken,” while Japanese and Chinese explicitly say “kidnapped.” Korean's `데려갔어요` can imply a less forceful action. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6203-6204, 6208, 6212,
  6220, and 6231 against active Korean and matching source rows.
- ID 6203 (`taint of Prismere`) follows the English corruption sense; no
  additional candidate was identified in this pass.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts, brace-delimited runtime-marker identities, and
  numeric sequences match across all four locales in this range.
- No active CSV structure or text was changed.

## Batch Status

IDs 6200-6249 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
