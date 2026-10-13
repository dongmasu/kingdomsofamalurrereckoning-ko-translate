# Disposition and Edit Batch: `default` IDs 28051-28100

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28051-28100, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, three `not an issue`, and five uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28068 | `Venris ... 어딘가에서 죽었다` for `Venris perished` | Not an issue: Korean leaves the cause unspecified, matching English. Chinese says he was murdered and Japanese says he disappeared; neither divergence is a reason to make Korean more specific than English. |
| 28086 | `아직 문을 열 수 없어?` for `Can you open the gate yet?` | Not an issue: this is gate dialogue, not a gameplay-value string. Korean preserves the question. The preliminary report's reference to a value at this ID is corrected separately. |
| 28051-28054, 28060-28061, 28063-28065, 28067, 28069, 28071-28072, 28078, 28083-28085, 28087, 28089, 28091-28095, 28099-28100 | Tutorial, dialogue, objective, and concise UI wording | Not an issue: the Korean generally preserves source meaning, register, and structure; no specific wording correction is better supported. |
| 28056 | `주변을 정리해` for `Clear the area.` | Uncertain: the English lacks context. Japanese suggests keeping away, Chinese says evacuate the crowd, and Korean can mean clearing or tidying the area. Do not choose one action without scene context. |
| 28055, 28057-28059, 28062, 28066, 28070, 28074-28077, 28079-28081, 28088, 28090, 28096, 28098 | Akara essence / Deda-Nanne / Hireling / Sweetspot / Testament / Savant / Jottun armor / Sparrows / widow's knowledge / Irminsul-Aesir Dannin / Garaner / rent shirt / item label / harvest metaphor / Sagecraft / Kandrian High Lords / Preordained poachers | Uncertain: retain current identities and gameplay relations while deferring recurring faction, title, creature, item/stat, mythic-name, and idiom forms to corpus-wide review. |
| 28073 | Gwynedds / deadly scavs | Uncertain: Japanese supports a couple, English uses a plural family name, and Chinese does not settle the relationship. Retain the existing line pending confirmation of the named household and creature term. |
| 28082 | Journal's owner and “He will probably want to read this” | Uncertain: English's pronoun may refer to the warrior or Aedran Tyr; Japanese selects Aedran, while Korean leaves the referent unresolved. Keep the current ambiguity until scene context settles it. |
| 28097 | `House of Sorrows` for “where the Sorrows are housed” | Uncertain: English, Japanese, and Chinese differ on whether the Sorrows are a faction/House or a force. Korean's explicit House reading remains provisional. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The preliminary Shift marker check at ID 28051 remains valid. IDs 28054
  and 28086 contain no numeric gameplay values; an erroneous preliminary
  statement about such values is documented in that report.
- No Korean `Texto` value, ID, variant, row order, or source CSV changed.
- Active default CSV SHA-256 remains
  `88eee19175ebc4d89ddd9849e634d1cb620c25e8c4760b463c948d12a17cbc4b`.
- Register totals after this batch: 867 accepted, 2,990 `not an issue`, and
  4,963 uncertain (8,820 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28101; 37,034 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
