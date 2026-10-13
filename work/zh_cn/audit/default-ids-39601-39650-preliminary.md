# Preliminary Language Scan: `default` IDs 39601-39650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39601-39650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39605 | Primos / `프리모스` | Preserve and standardize the unresolved title/name treatment; determine whether it is a person, office, group, or formal rank. | English and Japanese retain the capitalized term; Chinese interprets it as “leader.” Earlier preliminary reports at IDs 260, 2329, 3035, and 3646 already leave the identity unresolved. | Medium |
| 39619 | `FAIL LINE` / `실패 대사` | Determine whether this is a player-facing label or a test/developer marker; avoid changing the repeated marker globally without evidence. | English and Japanese retain `FAIL LINE`, Chinese renders “failed dialogue,” and Korean translates it. Earlier reports (including IDs 5515, 6848, 7976, and 16425) repeatedly flag the same label family as likely diagnostic/test text with inconsistent localization. | High |
| 39627 | “so... intimately” / `이렇게... 가까이서` | Check whether the line intentionally carries a suggestive double meaning in addition to literal closeness. | English repeats “up close” and then “intimately”; Japanese and Chinese also retain an awkward pause/repetition. Korean communicates physical proximity but may flatten the deliberate or accidental innuendo. | Low |
| 39631 | Scrivener / `필경사` | Confirm the role and preferred Korean term in context; retain the distinction between a formal office and a generic scribe. | English asks about a capitalized/quoted role-name; Japanese uses `書記官` and Chinese uses `代笔人`. `필경사` is plausible but more specifically denotes a copyist/scribe. No surrounding UI context is present in this row. | Medium |
| 39649 | “There's a dear.” / `참 고맙군.` | Reconcile the source/reference conflict before deciding whether the Korean should express gratitude or refer to a person/“dear.” | English is grammatically anomalous and Chinese begins with “有个家伙” (“there is a person/fellow”), while Japanese says `助かったわ` (“that helped”) and Korean follows the gratitude reading. The row may contain a source typo or misaligned text; preserve the ambiguity for contextual review. | High |
| 39650 | The God Storm / `신의 폭풍` | Align this named historical event with the unresolved `God Storm`/`Godstorm` variants already in the corpus. | The active corpus uses both `신의 폭풍` and `신들의 폭풍`, sometimes with `God Storm`/`Godstorm` in parentheses. Historical and preliminary audits at IDs 3411, 30725, and 61425 leave the event's canonical Korean name unresolved. | Medium |

ID 39632 is a long three-paragraph regional description; all paragraph
boundaries are retained. IDs 39601-39604, 39606-39618, 39620-39626,
39628-39630, 39633-39648 generally retain the English meaning on this first
reading. Proper names, established terms, and voice remain subject to
integrated review.

## Historical Audit Reconciliation

- No source-keyed historical question entry was found for IDs 39601-39650;
  this range falls within the documented 37700-40349 gap.
- Related prior audit items were checked for Primos, `FAIL LINE`, and the
  God Storm/Godstorm event. They remain unresolved and are not treated as
  approved terminology decisions.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39601-39650 once
  and in identical order.
- Embedded line-break counts match across all four locales. No runtime-marker
  identity/order or numeric-token mismatch was detected.
- ID 39632 retains all three paragraphs in each locale.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39601-39650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 39651.
