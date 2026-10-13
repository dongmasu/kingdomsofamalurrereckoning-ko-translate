# Disposition and Edit Batch: `default` IDs 5200-5249

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 5200-5249.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Nineteen findings were dispositioned: two accepted, seven `not an issue`,
  and ten uncertain. Two accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5200 | `Sinsear` identity/name | Defer the name-versus-description reading. | D-1269: uncertain. |
| 5203 | Suggestive `anyone of... anything` double entendre | Preserve the innuendo and hesitation in natural Korean. | D-1270: accepted. |
| 5204 | Ancient inscription poem lineation | Keep the 12 English/Japanese/Korean line breaks; record the Chinese source's one-break difference. | D-1271: not an issue. |
| 5206 | Letter's grief-to-threat progression and final image | Keep the English-supported progression and five-paragraph layout. | D-1272: not an issue. |
| 5213 | Arcadium merchants' profit-sharing task | Defer the place and coercion readings. | D-1273: uncertain. |
| 5215 | `Odi Speaks (1480)` title | Defer whether this is a work, speech, or record. | D-1274: uncertain. |
| 5219 | Thresh / Gorguath relationship | Defer the entities' exact identities/categories. | D-1275: uncertain. |
| 5220 | Marriage-ring contract objective | Keep the supported transfer to another person and immediate completion. | D-1276: not an issue. |
| 5224 | `every last favor in my book` | Render the idiom as using all available contacts/favors. | D-1287: not an issue. |
| 5225 | Helius's smile/warmth metaphor | Keep the personification and respectful flattering voice. | D-1277: not an issue. |
| 5226 | Bandit held `as an example` | Keep the likely warning/example sense without specifying an audience. | D-1278: not an issue. |
| 5229 | `Maid of Windemere` title | Defer the canonical role/title rendering. | D-1279: uncertain. |
| 5237 | `pulling the short straw` / `Missives` | Defer the named-object status and exact nature of the Missives. | D-1280: uncertain. |
| 5239 | `Maid of Fortune` vessel name | Mark the translated ship name as a vessel with `호`. | D-1281: accepted. |
| 5241 | Capitalized `The Telling` | Defer the setting-specific event/concept reading. | D-1282: uncertain. |
| 5243 | Pagination/debug test markup | Keep Korean's English/Japanese-matched markers; document the Chinese source exception. | D-1283: not an issue. |
| 5246 | `Antiquarian` / `Child of Dust` | Defer the formal title and setting-term readings. | D-1284: uncertain. |
| 5247 | `Third leg` label | Defer anatomy/point/round interpretation. | D-1285: uncertain. |
| 5248 | `Combo Point` terminology | Keep the verified mechanic; defer the canonical Korean resource term. | D-1286: uncertain. |

All uncertain rows remain unchanged. Historical questions for other resource
keys were kept separate.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5203 | `설득은 됐어. 네 용기만으로도 누구든 뭐든 확신하게 만들 수 있지. 무슨 뜻인지 안다면 말이야. 누구든... 뭐든.` | `설득은 됐어. 네 용기면 누구든 뭐든 하게 만들 수 있지. 무슨 뜻인지 알겠다면 말이야. 누구든... 뭐든.` | D-1270 |
| 5239 | `행운의 시녀(Maid of Fortune)` | `행운의 시녀호(Maid of Fortune)` | D-1281 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs.
- IDs 5200-5249 occur once per locale in matching order. English, Japanese,
  and Korean runtime-token identities/order match. At ID 5243, the Chinese
  source omits an initial `{LINE_LEFT}` and differs in wrapper order; this
  recorded source-locale exception was not changed.
- Line-break counts match across English, Japanese, and Korean. At ID 5204,
  those three locales have 12 poem line breaks while Chinese has 11; this
  recorded source-locale exception was not changed.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF bytes. Only the two approved Korean text cells
  changed.
- Active Korean `default` CSV SHA-256:
  `3b41bda74d7e7bbd9b1c103025a8cece4a3f6eff987151487650b4657b2693d4`
- Cumulative dispositions: 266 accepted, 303 `not an issue`, and 718
  uncertain. Resume at `default` ID 5250; 59,885 rows remain.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
