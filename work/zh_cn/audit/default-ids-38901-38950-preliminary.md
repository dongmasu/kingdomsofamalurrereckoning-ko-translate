# Preliminary Language Scan: `default` IDs 38901-38950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38901-38950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38909 | Domus Politica / `정치회관(Domus Politica)` | Standardize the established Korean institution name and use one convention for retaining/parenthesizing the source name. | Korean preserves both a translated label and the Latin-style name. Earlier preliminary reports at 38018, 38073, and 38258 already record this institution's unresolved form. | Medium |
| 38918 | Scurvy / `비열한 놈` | Confirm that this is the insult/adjective sense rather than the disease name, and record the source-locale divergence. | English uses the standalone label “Scurvy”; Japanese gives a villain/scoundrel, Korean a vile person, while Chinese translates the disease. Korean appears to follow the English insult sense. | Medium |
| 38934 | the Sorrows / `소로우즈(House of Sorrows)` | Determine whether the branch locates the House/faction or another named entity called the Sorrows, and keep this consistent with other occurrences. | English capitalizes Sorrows; Japanese says “power of sorrow,” Chinese names a sorrow spirit, and Korean explicitly identifies the House of Sorrows. Earlier audits leave the Sorrows referent open. | Medium |
| 38941 | Orison / `오리슨(Orison)` | Align with ID 38699, where the same term is rendered as generic `기도`; verify whether both refer to the same named place/rite. | English capitalizes Orison in both rows and Japanese transliterates it in both. Korean uses a phonetic proper-name form here but translated “prayer” at 38699; Chinese uses the generic prayer reading here too. | High |
| 38950 | Ratofer's Charter / `라토퍼의 인가장` | Confirm whether Charter is an official charter, authorization, or named quest document; standardize its document type. | English and Chinese identify a new-item Charter/document; Korean's `인가장` is specifically an authorization certificate. No local description establishes the exact document function. | Low |

IDs 38901-38908, 38910-38917, 38919-38933, 38935-38940, and 38942-38949
generally retain the English meaning on this first reading. ID 38923 follows
the English mortality metaphor, although Japanese diverges to a different
interpretation. Proper names, lore, register, and UI context remain subject
to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented gap covering
  IDs 37700-40349. Existing Domus Politica, Sorrows, Orison, and proper-name
  notes were consulted; no earlier candidate is treated as approved.
- The current Orison rendering is internally inconsistent across IDs 38699
  and 38941; defer normalization to the integrated terminology review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38901-38950 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales. ID 38915 preserves `{LINE_SPACE}` and the
  nested `{*5{1}}` structure; ID 38937 preserves `{1}` and its separate
  maximum-skill line.
- ID 38925 retains +6 Staff physical damage and +5% Staff damage.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 38901-38950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 38951.

## Subsequent Working Disposition

The separate disposition pass is recorded in
`disposition-batch-default-38901-38950-20261010.md`: zero accepted, two
`not an issue`, and four uncertain findings. The source-sense reading of
`Scurvy` was retained; Domus Politica, Sorrows, Orison, and Charter
terminology remain open. This preliminary scan is not independent final
review.
