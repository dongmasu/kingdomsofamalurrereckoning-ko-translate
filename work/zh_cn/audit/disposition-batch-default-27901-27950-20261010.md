# Disposition and Edit Batch: `default` IDs 27901-27950

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27901-27950, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, four `not an issue`, and two uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27922 | `정말 대단한 결혼식이었어! 초대받지 않아 다행이야.` | Not an issue: the second sentence makes the ironic “What a wedding!” reaction clear. English and Chinese explicitly say the speaker is glad not to have been invited; no additional sarcastic marker is required. |
| 27924 | Britt Hagni letter / destination of unmarked crates | Not an issue: the active Korean explicitly says `상자의 목적지에 관해서는 추후 연락드리겠습니다`, preserving the promised follow-up about the crates' destination. English, Japanese, and Chinese support that reading. The preliminary concern that the destination was omitted does not match the active row. |
| 27928, 27931, 27939 | Crudok trigger / 50% armor / `<Unnamed Region>` | Not an issue: the trigger number `1`, total-armor value `50%`, and literal source placeholder are preserved. |
| 27902, 27906, 27910-27912, 27914-27916, 27918, 27920-27921, 27925-27927, 27930-27934, 27940, 27942, 27945, 27948-27949 | Dialogue, quest instructions, and short UI text | Not an issue: wording generally preserves the English meaning and conversational intent. ID 27943's clipped past-tense fragment is also retained without inventing its missing context. |
| 27909 | Six-line Tirin/Jottun/Keloren/Bayala poem | Uncertain: preserve the six-line structure and named groups, but defer poetic voice, imagery, and the compressed battle narrative to integrated literary review. |
| 27901, 27903-27905, 27907-27908, 27913, 27917, 27919, 27923, 27929, 27935-27938, 27941, 27943-27944, 27946-27947, 27950 | Flashing Blade / peoples and names / unnamed “she” / Lyria / Murghan / Crossing Keepers / chapterhouse and stones / Windstones / Arcadium / speech potion / pronoun and source fragments / Sanctuary box / Seelie and Unseelie / winter's decline | Uncertain: retain current meaning and relationships while deferring canonical terminology, lore referents, source-fragment context, and localized names to integrated review. The clear placeholder, numeric, and letter-destination checks are separately dispositioned above. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The preliminary key/order, embedded-line-break, and normalized
  runtime-token checks remain valid. The poem at ID 27909 retains its
  six-line structure; the `50%` armor value, trigger number, and literal
  `<Unnamed Region>` marker are intact.
- No Korean `Texto` value, ID, variant, row order, or source CSV changed.
- Register totals after this batch: 863 accepted, 2,983 `not an issue`, and
  4,952 uncertain (8,798 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27951; 37,184 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
