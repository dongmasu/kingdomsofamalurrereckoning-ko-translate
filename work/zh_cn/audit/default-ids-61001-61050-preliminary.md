# Preliminary Language Scan: `default` IDs 61001-61050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 61001-61050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 61003 | `Mitharan Prismere Guard` / `미사란 프리즘어 경비병` | Confirm the entity/category and canonical treatment of Mitharan and Prismere in this compound label. | Korean preserves both English terms parenthetically; the historical audit explicitly asks whether this is a name/category label. | Medium |
| 61013 | prayer-poem / 18 Korean line breaks | Preserve the Japanese-derived line layout for now, but treat the cross-locale line-count disagreement as an unresolved structural exception. | English has 11 newline breaks, Japanese 18, Chinese 14, and Korean 18. The active Korean follows Japanese, not English/Chinese; the long poem's line layout needs integrated review rather than automatic normalization. | High |
| 61019 | “pine for her” / Rathir Battlefield simile | Retain the longing and the image of being torn apart like the battlefield; verify the intended historical reference. | Korean preserves the speaker's anguish and wish to be sundered to escape it. Japanese and Chinese also use the battlefield comparison; the source-keyed audit calls out the simile. | Medium |
| 61021 | “if they can afford it” / `돈이 된다면` | Recheck the conditional: English means people should have protection if they can pay for it, not if protection is profitable. | Korean's `돈이 된다면` can imply profitability rather than ability to afford protection. This is a high-confidence possible meaning shift. | High |
| 61026 | Wencen's “final cowardice” | Preserve the contrast between the lasting Telling and the disgraceful final act without resolving the source's fragmentary punctuation. | Korean retains the fragment and the final cowardice; English, Japanese, and Chinese all present the thought as a continuation. | Medium |
| 61028 | flame/frost/storm riddle | Confirm the intended answer from quest context, while retaining all three elemental clues. | Korean preserves flame, frost, storm, and the question; the source-keyed audit asks for the riddle's referent. | Medium |
| 61036 | water-gates / `수문` | Confirm the exact water-gate mechanics and plural antecedent before making the route description more specific. | Korean preserves the gates as the discovered entry route; Japanese/Chinese also describe water gates. Historical context leaves the mechanics open. | Medium |
| 61038 | healing and Mana values | Preserve the cast/charge/completion healing values and the maximum-Mana cost/sustain values exactly. | Korean retains 20%/30%/10% healing, 30% cast cost, and up to 20% sustain cost. The exact charge mechanic remains a context check, not a numeric discrepancy. | Medium |
| 61040 | “greatest of Vengeance” / `가장 위대한 복수자들` | Confirm whether this means the greatest members/champions of the House of Vengeance before treating it as a generic “avengers” title. | Korean reads the phrase as a plural group of great avengers; capitalization and the following Witchknight names suggest a possible faction-specific usage. The historical prompt leaves this phrase open. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Within this range, the 1-Chantry objective, 45%
Elemental Damage, and all healing and Mana percentages are retained.
Provisional names and terms include
Tirnoch, Grim, Banshaen, Gastet, Lyria, Mitharu, the Wharfmaster's Child,
Canwen, Cennar, Gravehal Keep, Paddy, Zefwyn Lan, Wencen, Windemere,
Telling, Jottun, Augur, Victory Games, Mel Senshir, Balor, Faeblade, Ice
Wolf, Hroth Magnus, Oracle, Vlaskar's Forge, Detect Hidden, Chernobog,
Capstan, House of Vengeance, Gadflow, Tuatha, Winter Fae, Malwyn, Khleran,
Vescaine, Witchknights, Lord Ohn, Telogrus, Alrette Rond, and Lucent
Prinn. Existing Korean bilingual-name formatting is retained as found;
this pass does not impose a global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked source-keyed prompts in the archived `61050-61149` range for
  the Mitharan Prismere Guard label (61003), the poem layout (61013), the
  Rathir Battlefield simile (61019), the elemental riddle (61028), the
  water-gate mechanics (61036), the healing/Mana mechanics (61038), and
  “greatest of Vengeance” (61040).
- The 61013 break-count mismatch is recorded as an open structural
  exception, not as evidence that the Korean layout is approved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 61001-61050 once
  and in identical ascending order.
- Runtime-token sequences match; no marker exception was found.
- Newline counts match across locales except ID 61013: English 11, Japanese
  18, Chinese 14, and Korean 18. Korean follows the Japanese-derived
  template for this row.
- Numeric values at IDs 61010 and 61038 are retained.
- No translation CSV edit was made.

## Batch Status

IDs 61001-61050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 61051.
