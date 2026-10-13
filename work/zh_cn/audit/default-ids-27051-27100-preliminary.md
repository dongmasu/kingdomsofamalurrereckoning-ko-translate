# Preliminary Language Scan: `default` IDs 27051-27100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27051-27100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27051, 27053-27070, 27072-27090, 27091-27097, 27099-27100 | Dialogue, lore, quest, and concise UI/item text | Recheck voice, idiom, proper names, and short-label context during integrated review. | Korean generally retains English meaning and Japanese tone. Combat values and markers are preserved; ID 27061's `{*1[...]}` wrapper is intact, with only its visible label localized. | Medium |
| 27052 | `House of Sorrows` -> `슬픔의 가문` | Align the recurring named group with the broader Korean naming inventory and distinguish “House” as an institution/faction from a family or residence. | The draft elsewhere uses forms including `비탄의 집` and `하우스 오브 소로우`; `슬픔의 가문` adds another lexical and structural form. Historical review has left the House's identity and Korean naming convention open. | High |
| 27061 | `{*1[Passive]}` -> `{*1[지속]}` | Confirm the established Korean display label for a passive ability/effect while preserving the localized marker payload. | The marker wrapper and order match all locales. Japanese and Chinese translate the visible label as “passive”; Korean `지속` can read as ongoing/continuous, so its user-facing clarity remains a terminology candidate rather than a structural defect. | Medium |
| 27067, 27071, 27098 | Savant / Testament / Missives / Praetorians | Standardize institutional ranks, faction/document names, and the Praetorians' official Korean term. | Korean preserves the conspiracy, unfinished Testament threat, and plan to frame Grim. At 27098 `들키지 않게` means avoiding detection generally, while English specifically says Grim must not know; the readings overlap but are not identical. | Medium |
| 27078, 27099 | Deep Gloam poem / Rathir founding poem | Preserve imagery, speaker, and stanza layout; verify difficult metaphors during integrated review. | The five embedded line breaks at 27078 and three at 27099 match all locales. Korean retains both narrative sequences and lineation. | Medium |
| 27089 | `Just Fight` -> `그냥 싸워` | Recheck whether this is an imperative/title or a named challenge; other locales give a “righteous fight” reading. | Korean follows the literal English wording; Japanese and Chinese instead translate the phrase as “righteous fight.” English remains the semantic anchor, but the source's UI/context should be checked before disposition. | Medium |

## Historical Audit Reconciliation

- The historical coverage inventory identifies IDs 27000-27099 as an
  unrecorded range. No prior row-specific review was found for IDs 27051-27099;
  these readings are new preliminary coverage, not inherited approval.
- ID 27100 is present in the historical log under the `Plasma`/
  `Dispelling` terminology question. Korean renders it `플라스마`; align it
  with the related effect and item strings during terminology review.
- Earlier House of Sorrows reports flag its faction/institution meaning and
  Korean naming convention; the new form at 27052 is retained as another
  candidate for that consolidated decision.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27051-27100 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token wrappers
  match. ID 27061's visible `[Passive]` payload differs by locale as expected;
  the `{*1[...]}` marker wrapper and order are preserved.
- ID 27078 has five actual embedded line breaks and ID 27099 has three in
  each locale. No unexpected Unicode format character was found in this range.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27051-27100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27101.
