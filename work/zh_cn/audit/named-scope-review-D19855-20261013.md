# Default Scope Review D-19855

2026-10-13. Reviewed all active `default` IDs 37951-38050 against English
meaning, Japanese voice/register, supporting Chinese, active Korean,
historical exact-key decisions, recurring terminology, and the official
Korean manual. No PAK or PAK-derived material was consulted.

All fourteen D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. ID 37961's accepted `친구` correction
is already present; the other thirteen keys retain their terminal `not an issue`
dispositions. These keys were validated without duplicate classification
or recounting.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 37963 | Subsequent Maid-title terminology correction | English names the Maid's lair; replace generic `아가씨` with the established named-figure term `시녀`, retaining the entry sequence. |
| 37964 | Not an issue; closes D-12338 | The current `패란즈` matches the official Korean manual's Faelands form (PDF p. 1). |
| 37966 | Subsequent proper-name correction | English capitalization and Japanese `マディング・ウィンド` identify Madding Wind as a name; use the established corpus form `매딩 윈드`, not the semantic gloss `광풍`. |
| 37985, 37998, 38023 | Subsequent Kollossae spelling normalization | Apply the later accepted `콜로사이` spelling from D-19573, superseding older `콜로세`/`콜로새` variants. The English typo `sandalds` at 37985 is source-only. |
| 37995 | Subsequent lore-term correction | Render capitalized `Ballads` as the established `발라드`, supported by Japanese `物語`, Chinese `歌谣`, and nearby Korean lore usage; `서사시` overstates the source's genre. |

The other 94 active rows retain their English-led meanings and prior
dispositions, including the D-19667 keys, without reclassification. The
remaining prior name/lore questions in the range were resolved from the
English-led local context and accepted terms; no material uncertainty
remains in this scope. No current global category total is asserted.
Separate affix 55 remain closed by D-19565.

## Verification

All four active default CSVs contain the 65,135 ordered IDs 0-65134, and
all 100 scope IDs align. Exact inverse reconstruction confirms all pre-edit
bytes outside the six target `Texto` cells are preserved. The UTF-8 BOM,
72,011 CRLF endings, and 73 pre-existing bare-LF endings remain unchanged.
The fourteen D-19667 source keys were independently matched against the
three current source locales (14/14).

Pre-edit SHA-256:
`fe43cb27539ac59cb30a1cfc1c497bd5ba1aabe2d179baa48bf71b25a9ef6f42`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19855/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`3443677a4e91afe8b3376c1c1aa9dc38e9bd4dc01574fd3a12fff7efa8cc598c`.

D-19855 is reviewed; overall default review remains incomplete. Last
reviewed ID 38050; next D-19856 / IDs 38051-38150; 27,084 actual default
rows remain through 65134.
