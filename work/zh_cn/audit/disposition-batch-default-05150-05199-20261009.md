# Disposition and Edit Batch: `default` IDs 5150-5199

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 5150-5199.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Fourteen findings were dispositioned: two accepted, three `not an issue`,
  and nine uncertain. Two accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5152 | `Docent Augra Tenet` title | Defer the role and canonical Korean rank. | D-1255: uncertain. |
| 5153 | `You have chosen` / `You were chosen` | Defer the conflicting agency readings. | D-1256: uncertain. |
| 5154 | `Half Way Halibalt` name/pun | Preserve the source spelling pending pun/pronunciation context. | D-1257: uncertain. |
| 5155 | `first circle` | Defer whether this is a trial stage, magical circle, or round. | D-1258: uncertain. |
| 5157 | `murghan` creature term | Defer the canonical Korean form and number handling. | D-1259: uncertain. |
| 5160 | `Warden of Gorhart` | Defer the office's exact function. | D-1260: uncertain. |
| 5165 | `your kind` | Defer whether this means species, Fae, or another group. | D-1261: uncertain. |
| 5171 | `our honored sorrow` / `the House` | Defer the faction and capitalized-House interpretation. | D-1262: uncertain. |
| 5182 | `That's mine!` | Keep the supported ownership claim. | D-1263: not an issue. |
| 5184 | One-head greeting / sanity joke | Keep the literal image and dry humor. | D-1264: not an issue. |
| 5186 | Chakram mastery tutorial | Use a natural result statement for mastery, damage, and newly available attacks. | D-1265: accepted. |
| 5193 | Unlocalized crafting/inventory marker labels | Localize both visible marker payloads, preserving wrapper IDs and control token. | D-1266: accepted. |
| 5195 | Capitalized `House` in the trials passage | Defer the faction-versus-household reading. | D-1267: uncertain. |
| 5197 | Unaware NPC sight-range modifier | Keep the source-supported target, condition, and 15% value. | D-1268: not an issue. |

All uncertain rows remain unchanged. Historical questions for other resource
keys were kept separate.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5186 | `차크람 사용법을 숙달해 피해를 높이고 강력한 새 공격을 해금하세요.` | `차크람 사용을 숙달하면 피해량이 증가하고 강력한 새 공격을 사용할 수 있습니다.` | D-1265 |
| 5193 | `잘했어요! 아이템을 {*1crafted}했습니다.{LINE_SPACE}이제 {*1inventory}에 들어 있습니다.` | `잘했어요! 아이템을 {*1제작}했습니다.{LINE_SPACE}이제 {*1인벤토리}에 들어 있습니다.` | D-1266 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs.
- IDs 5150-5199 occur once per locale in matching order. Explicit line-break
  counts and runtime-token identities/order match; localized `*1` payloads
  are allowed to differ.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF bytes. Only the two approved Korean text cells
  changed.
- Active Korean `default` CSV SHA-256:
  `39516c084ce3535adfb33ea6bfdb4000010a3010c22d4f97dfd398d455af671a`
- Cumulative dispositions: 264 accepted, 296 `not an issue`, and 708
  uncertain. Resume at `default` ID 5200; 59,935 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
