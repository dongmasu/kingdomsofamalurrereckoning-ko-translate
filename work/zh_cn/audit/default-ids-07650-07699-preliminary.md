# Preliminary Language Scan: `default` IDs 7650-7699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7650-7699.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions from
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7651 | `charge the lines` → `적진으로 돌격하겠소` | Retain the commitment to lead an attack into the enemy line; verify the military context and speaker voice. | English explicitly says the speaker will charge the lines personally. Japanese instead says they can approach, while Korean follows English's stronger commitment. | Medium |
| 7653 | `Praetorian Watch` / `the Isles` → `근위 감시대` / `섬들` | Confirm canonical Korean names and keep the organization distinct from an ordinary watch. | Both are capitalized setting terms; Korean currently renders the organization descriptively and marks Isles as a name. | Medium |
| 7661 | `The Sins of the Past` → `과거의 죄` | Confirm the Korean title form and retain the distinction between Anokatos's confessions and Primos as recorder. | The English title is plural and its syntax makes Primos the recorder; Korean preserves the roles, but singular `죄` and the title wording merit consistency review. Japanese recasts the relationship. | Low |
| 7665 | `carapace armor` → `등딱지 갑옷` | Consider a natural, consistent Korean term for hard outer-shell armor; preserve that it is improvised heavy armor and includes this helm. | English and Japanese describe armor made from bone and shell. Korean preserves the materials and survival context, but `등딱지 갑옷` may sound colloquial for equipment prose. | Medium |
| 7667 | `Argine, Queen of Staves` → `지팡이의 여왕 아르긴` | Confirm title/name ordering against other card and royal titles. | English is name-first; Korean is title-first. Chinese and Japanese also place the title before the name, so this is a consistency question rather than a clear meaning error. | Low |
| 7670 | `Hospitalis` | Determine whether this is a proper name, category, or intentionally untranslated UI term; retain pending context. | All four locales leave the Latin-form label unchanged, so the references do not establish its function. | Low |
| 7675 | `The Chantry` → `예배당` | Check whether this capitalized institution/location needs a distinct established name rather than a generic chapel label. | English uses a capitalized named term; Japanese and Chinese also use generic chapel wording, leaving the proper-name status unresolved. | Low |
| 7681 | `by the Widow's mercy` → `과부의 자비` | Preserve this as an in-world oath/reference and verify its canonical Korean form and parenthetical-name convention. | The line uses the phrase as an exclamation, not a request for mercy. Korean retains the Widow reference and adds its English spelling. | Medium |
| 7689 | `Scion` → `사이온` | Keep the specific role distinct from generic priesthood and reconcile its spelling/meaning with other active occurrences. | English capitalizes `Scion`; Chinese renders it as a priest, while Japanese transliterates it. Historical audit already flags this office as an unresolved terminology variant. | High |
| 7693 | `Impulse` → `충격파` | Verify the skill's established Korean term and keep it consistent across the per-Impulse damage and cost clauses. | English uses `Impulse`; Japanese uses “wave.” Korean conveys the repeated hit as a shockwave. Values 70, 540, 160, and +10 are preserved. | Medium |
| 7698 | `Auto-Attempt` → `자동 시도` | Confirm the exact lockpicking UI label and retain the percentage placeholder. | English and Chinese support an automatic attempt; Japanese instead says forced dispel. Korean retains `{1}%` and follows English. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 7651, 7653, 7665, 7667, 7671,
  7681, 7685, 7689, 7693, and 7698.
- ID 7651 follows the English commitment to charge the enemy line; Japanese
  weakens this to being able to approach. ID 7653 retains the capitalized
  organization and region as unresolved naming questions.
- ID 7665 retains both bone and carapace armor and its survival context.
  ID 7667 preserves Argine and the Queen of Staves title; title order remains
  open. ID 7671 retains all four peoples in English order and the comparison
  that they are less bad than the guards.
- ID 7681 keeps the Widow's mercy as an oath-like phrase. ID 7685 preserves
  the parallel “swift and sly” description without identifying the creatures.
  ID 7689 retains `Scion` as a specific role, not a generic priest.
- ID 7693 preserves all damage and Mana values and the line break. ID 7698
  retains the `{1}%` placeholder; the Japanese wording conflicts with English
  and Chinese on the action being attempted.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys in the same order.
- Actual CSV record line-break counts match across all four locales for every
  ID, including ID 7693.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales. The `{1}%` placeholder at ID
  7698 is preserved.
- No active CSV structure or text was changed.

## Batch Status

IDs 7650-7699 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
