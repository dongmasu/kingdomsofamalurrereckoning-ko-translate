# Preliminary Language Scan: `default` IDs 39151-39200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39151-39200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39159 | Navigation Warning / `항해 경고` | Confirm what navigation state/action this UI label describes before standardizing the Korean label. | English is a general navigation warning; Chinese specifies an off-course warning, while Japanese instead reads as confirmation of an interruption. Korean follows the English wording, but the references conflict materially. | Medium |
| 39191 | Silkfarmers / `비단 채집꾼` | Align the occupation/group term with the recurring Silkfarmer entries while preserving uncertainty over whether they grow, harvest, gather, or process silk. | The same English term has appeared as `비단 농부`, `비단 수확자`, `비단 채집꾼`, `양잠업자`, and `실크파머`. Earlier audits at IDs 35368 and 36815 explicitly leave the occupation unresolved. | Medium |
| 39198 | `A couple of mountain goats smuggled me through the narrow pass` / `산양 몇 마리를 몰고 ... 통과한 뒤` | Preserve the English grammatical agent: the goats carried or conveyed the speaker through the pass, rather than the speaker leading the goats. | English makes the goats the subject of “smuggled me through.” Korean makes the speaker the subject of leading the goats and passing through. Japanese has a similar “using goats” reading; Chinese agrees with English. | High |

IDs 39151-39158, 39160-39190, 39192-39197, and 39199-39200 generally
retain the English meaning on this first reading. Names, titles, UI labels,
and register remain subject to integrated review.

## Historical Audit Reconciliation

- No source-keyed historical question entry was found for IDs 39151-39200;
  this range falls within the documented 37700-40349 gap.
- The existing Silkfarmers questions and terminology differences at IDs
  35368 and 36815 were reviewed; neither is treated as an approved
  terminology disposition.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39151-39200 once
  and in identical order.
- Embedded line-break counts and runtime-marker identities/order match
  across all four locales. ID 39152 retains the `{1}`, `{*1...}`, `{2}`,
  `{*1...}` sequence; localized marker labels differ by locale as expected.
- No numeric gameplay-value exception was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39151-39200 received one preliminary reading. Findings were later
dispositioned in `disposition-batch-default-39151-39200-20261010.md` and
registered as D-12537-D-12540. This remains preliminary work, not independent
Reviewer approval. Continue the disposition pass at `default` ID 39201.
