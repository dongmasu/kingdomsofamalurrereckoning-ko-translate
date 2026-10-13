# Disposition and Edit Batch: `default` IDs 26701-26750

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26701-26750, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and two uncertain.
- Accepted correction at ID 26705 is applied to the active Korean CSV.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26705 | Gadflow's errant-thread image | Accepted: revise the awkward `베틀에서 풀려난 실처럼 엇나간` to `짜임에서 풀려나 삐져나온 올처럼`. English and Japanese both describe a loose/frayed thread protruding from a weave; the four-line poem's layout and remaining images are unchanged. |
| 26701-26704, 26706-26724, 26726-26729, 26731-26735, 26738-26750 | Dialogue, short labels, and quest wording | Not an issue: the reviewed wording generally preserves English meaning and Japanese-supported voice. Separate name, terminology, and contextual questions remain open. |
| 26737, 26741, 26746 | Dispelling recipe / number phrase / Reckoning Duration | Not an issue: both reagent counts, the deliberately terse number phrase, and the +30% value are preserved. |
| 26704, 26708, 26711-26714, 26717, 26719, 26722, 26725-26726, 26730-26732, 26734-26737, 26742-26743, 26747-26750 | Pledgeshield / Unbound / names / Watchers and Scion / shadow-step / sagecraft / places | Uncertain: canonical proper-name, faction/rank, skill, and place-name forms require corpus-wide alignment; no isolated spelling is approved. |
| 26720 | “loses all protection” | Uncertain: `보호막` can suggest a literal shield, while English, Japanese, and Chinese leave the protection's legal or political mechanism unspecified. Preserve the draft pending context. |

## Verification

- The preliminary report's four-locale key/order, line-break, and runtime-token
  checks were retained. ID 26705 still has three embedded line breaks.
- Only ID 26705's `Texto` wording was edited. Its stanza count, punctuation
  structure, runtime tokens, and all other IDs remain unchanged.
- The active default CSV preserves its UTF-8 BOM and pre-existing newline
  counts (72,046 CRLF endings and 39 bare-LF endings).
- Active default CSV SHA-256:
  `b679fadf9e48b329eb82c12e4353f1b03364ee73cb008072f05668464b79516f`.
- Register totals after this batch: 842 accepted, 2,920 `not an issue`, and
  4,851 uncertain (8,613 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26751; 38,384 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Contextual Re-review (2026-10-11)

D-19322-D-19323 re-reviewed all 25 unique uncertain IDs in this range. The
`부역` wording at ID 26735 was corrected to a source-neutral service
description; the remaining 24 rows were cleared as `not an issue`, including
the figurative protection wording at 26720. The earlier accepted poem edit
at 26705 and validated values at 26737/26746 are linked, not recounted.
See
[`consolidated-context-review-default-26701-26750-20261011.md`](consolidated-context-review-default-26701-26750-20261011.md).
