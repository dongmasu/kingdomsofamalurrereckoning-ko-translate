# Preliminary Language Scan: `default` IDs 6550-6599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6550-6599.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6553 | `believed himself one of Belen's Testament` → `자신이 벨렌의 테스타먼트라고 믿으며` | Candidate wording should express that he believed himself to be a member/one of the Testament, not the Testament itself. Keep the group's exact identity provisional. | English explicitly says “one of”; the current Korean drops the membership relation and can make him the whole group. The historical question also leaves the Testament's identity open. | High |
| 6562 | `Reckoning Mode` → `운명 역전 모드` | Align with the project's established `레코닝 모드` terminology unless a separate localized mode name was intentionally chosen. Preserve the source marker order. | English calls the UI option Reckoning Mode; the draft elsewhere uses `레코닝 모드` (for example ID 21488). Korean marker order follows English/Chinese, while Japanese places the Fate Meter marker first. | High |
| 6566 | `Maid of Windemere` → `윈더미어의 시녀` | Confirm whether capitalized `Maid` is the character's title/name rather than an ordinary household attendant; standardize across the corpus. | English capitalizes the title; Japanese and Chinese interpret it differently. Korean's `시녀` may imply a generic servant. | Medium |
| 6591 | trailing `\u00a0` | Verify the literal six-character backslash-u sequence against the source's actual U+00A0 nonbreaking space; preserve intentional trailing whitespace only in the correct representation. | English and Chinese end in an actual NBSP. The Korean CSV cell contains the literal characters `\u00a0`, so the payload is not the same whitespace character and may display as text. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6553-6554, 6561-6562,
  6566, and 6580.
- IDs 6554, 6561, and 6580 yielded no clear additional Korean meaning or
  register issue in this preliminary scan.
- The visible stat at ID 6562 retains its marker identities. Japanese orders
  the two styled labels differently from English/Korean; Korean follows the
  English order. At ID 6583, Japanese orders `{2}`, `{3}`, `{1}` while
  English/Chinese/Korean use `{1}`, `{2}`, `{3}`.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist exactly once in English, Japanese, Chinese, and active
  Korean.
- Line-break counts match across all four locales, including four breaks at
  ID 6570.
- Marker identities are present; the Japanese marker sequence differs at
  IDs 6562 and 6583, while Korean follows the English sequence.
- Numeric values match, including `+30%` and recipe quantities `(2), (2),
  (1)`.
- No active CSV structure or text was changed.

## Batch Status

IDs 6550-6599 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
