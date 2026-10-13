# Disposition and Edit Batch: `default` IDs 27001-27050

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27001-27050, checked against English,
  Japanese, Chinese, active Korean, recurring-name evidence, and historical
  questions.
- Decisions: three accepted, two `not an issue`, and three uncertain.
- The three accepted corrections were already present in the active CSV at
  the start of this disposition pass; this report reconciles and records them.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27020 | Named `Codex` artifact | Accepted: replace the generic dictionary sense `사전` with `운명의 서`, matching the named `Codex of Destiny` at ID 27021 and established lore usage. The active row already contains the correction. |
| 27043 | “I am beyond rescue” | Accepted: change `난 구제할 수 없어` to `난 구제받을 수 없어`. English and Japanese describe the speaker as beyond saving; the old Korean incorrectly made the speaker unable to rescue someone else. The active row already contains the correction. |
| 27044 | “There's a storm brewing” | Accepted: restore the storm image with `폭풍이 몰려오고 있어` rather than the generic `큰일이 벌어질 거야`. Japanese retains the metaphor, and the English explicitly says a storm is brewing. The active row already contains the correction. |
| 27014 | `Fallen Hall` naming | Uncertain: the draft uses competing translated and transliterated forms. Preserve the existing `폴른 홀` until the corpus-wide place-name form is decided. |
| 27030 | Fragmented passage and quotation boundaries | Uncertain: preserve all seven embedded line breaks. The English is syntactically irregular and locale quote boundaries differ; runtime rendering context is needed before changing punctuation. |
| 27050 | Gold offered to each competitor's worker | Uncertain: `매수했어` makes the implied bribery explicit, while the source describes bringing a bag of gold for each worker. Preserve pending confirmation of the scene's exact action. |
| 27001-27013, 27015-27019, 27022-27029, 27031-27042, 27045-27049 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed Korean generally preserves the English meaning and Japanese-supported voice. Separate terminology questions remain open. |
| 27039 | Mana-potion control marker | Not an issue: `{1}` remains intact and in the expected position. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks from the
  preliminary report remain valid. ID 27030 retains seven embedded line
  breaks, and `{1}` at ID 27039 is unchanged.
- No CSV text was changed during this disposition batch; its three accepted
  corrections predate this report. No IDs, variants, or row order changed.
- Active default CSV SHA-256 at this checkpoint:
  `efd7e58202bb7744a2949fb6e2580a397901077813a20171dcd6f9ae4b73c11d`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 848 accepted, 2,932 `not an issue`, and
  4,867 uncertain (8,647 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27051; 38,084 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

D-19340 and D-19341 accepted narrow corrections at IDs 27030 and 27050;
D-19342 retains ID 27014 as uncertain due to the unresolved corpus-wide
`Fallen Hall` form. Totals after the re-review are 2,221 accepted /
24,646 `not an issue` / 11,657 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27001-27050-20261011.md).
