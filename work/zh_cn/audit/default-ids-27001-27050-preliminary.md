# Preliminary Language Scan: `default` IDs 27001-27050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27001-27050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27001-27019, 27022-27029, 27031-27042, 27045-27050 | Dialogue, lore, quest, and concise UI/item text | Recheck register, idiom, names, and short-string context during integrated review. | Korean generally retains English meaning and Japanese tone. Values and the `{1}` mana-potion control marker at 27039 are preserved. | Medium |
| 27014 | `Fallen Hall` -> `폴른 홀` | Align this place name with recurring `Fallen Hall` forms elsewhere in the Korean draft. | Earlier active rows use translated forms such as `몰락의 전당` and `쓰러진 전당`; this row instead transliterates the name. Historical reports already flag the same location and inconsistent forms. | High |
| 27020-27021 | `Codex` -> `사전`; `Codex of Destiny` -> `운명의 서` | Recheck the artifact title and use a consistent term rather than the generic dictionary sense. | English calls the object a Codex and ID 27021 names the same `Codex of Destiny`; Korean translates `Codex` in ID 27020 as `사전`, then uses `운명의 서` in the adjacent row. Prior reports also identify `Codex of Destiny` as a named lore object. | High |
| 27030 | Fragmented three-part passage / quotation boundaries | Preserve the seven embedded line breaks and verify the poem-like wording and opening/closing quotation marks against the source context. | All locales have seven actual embedded line breaks, but Korean's quote boundaries differ: its first passage lacks the opening quote visible in English/Japanese/Chinese style, and the final passage's closing boundary is unclear. The English sentence “Do you hear its the earthly moans of time?” is itself syntactically irregular. | High |
| 27043 | “I am beyond rescue” -> `난 구제할 수 없어` | Recheck the direction of agency; the source means that the speaker cannot be rescued, not that the speaker cannot rescue someone. | Japanese says `救いようがない` (“beyond saving”), supporting the English. Korean `구제할 수 없어` ordinarily means “cannot rescue [someone/something],” which reverses the relationship. This is a high-confidence preliminary meaning candidate, not an applied correction. | High |
| 27044 | “There's a storm brewing” -> `큰일이 벌어질 거야` | Check whether the English signals a literal storm, impending trouble, or both. | Korean conveys that something serious is coming but loses the storm image; Japanese retains a storm metaphor. The cargo and landing-party context does not fully resolve the intended sense. | Medium |
| 27050 | bag of gold for each worker -> `매수했어` | Check whether the Korean makes the implied bribe more explicit than the source. | English says the group arrived with a bag of gold for each competitor's worker; Korean summarizes this as bribing each worker. The context supports that inference, but it is still more explicit than the source wording. | Medium |

## Historical Audit Reconciliation

- The historical audit identifies IDs 27000-27099 as an unrecorded range;
  there is no prior row-specific disposition for this batch. Its earlier
  `Fallen Hall`, Oreyn, and `Codex of Destiny` reports were consulted as
  cross-corpus terminology evidence, not treated as approval of these rows.
- The name `Fallen Hall` has prior Korean forms `몰락의 전당` and
  `쓰러진 전당`; the Codex is elsewhere rendered `운명의 서`. Both remain
  consistency candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27001-27050 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. ID 27030 has seven actual embedded line breaks in each
  locale.
- The `{1}` marker at ID 27039 is preserved. No unexpected Unicode format
  character was found in this range.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27001-27050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27051.
