# Consolidated Context Review: `default` IDs 25501-25550

- Date: 2026-10-11.
- Scope: the ten original uncertain finding groups in IDs 25501-25550,
  compared by ID against English, Japanese source and draft, Chinese, active
  Korean, prior accepted terminology, and the original disposition. This
  covers 27 previously uncertain unique keys; already-resolved keys are
  linked without recounting.
- Result: 26 keys resolved (two accepted corrections and 24 `not an issue`);
  ID 25523 remains uncertain because the standalone `Leanashe1` suffix does
  not establish whether `1` is part of the displayed name or an identifier.
- English is the semantic authority; Japanese informs register and provides
  supporting terminology evidence; Chinese is a secondary cross-check.

## Decisions D-19188-D-19197

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19188 | 25501, 25503-25506 | not an issue | The gem/weapon/Anira objective, crystal question, Xerastes reward, Hierophant loyalty versus guide reference, Moon Camp restoration, and Anira weapon are represented. English and Chinese support the Korean distinction between Hierophant and guide; no unsupported name normalization is needed. ID 25502 was already `not an issue` at D-8362 and is linked without recounting. |
| D-19189 | 25507-25508 | not an issue | Brit Codgan is a traceable name form; the storage in town cellars and covert entry/exit when unobserved are retained. |
| D-19190 | 25512 | not an issue | The question asks for Captain Brattigan; rank and person are preserved, and phonetic spelling variation does not show a row-level meaning error. |
| D-19191 | 25513-25519 | mixed | Renevel, Rathir, Alarane, Einar Longnose, the Ruins, and the search of Nyxaros to stop Anokatos remain identifiable. Accept 25515: replace deity `미타루` with manual-backed `미사루` per D-152. |
| D-19192 | 25522-25524 | mixed | Black Arick/Ettin Shaman and the `Request` label are represented; ID 25523 remains uncertain because all references retain a trailing `1`, but its display-name versus identifier function is unavailable. Keep unchanged. |
| D-19193 | 25525-25528 | mixed | Scholia Arcana, Varen, junk transfer, Savant Engar, and Tala-Rane are preserved. Accept 25526: change `미스란` to `미타란`, preserving English `Mitharan` and reusing accepted distinctions in D-18122/D-18158. |
| D-19194 | 25534 | not an issue | Japanese and Chinese explicitly identify the Guardian's body, supporting Korean `몸`; the Kora Thresh, Rite of Valor, and awakening after the Long Winter remain. |
| D-19195 | 25542 | not an issue | The two-paragraph tutorial retains Chaos enemies/armor/weapons, the damage exception, strategy, and every control/link wrapper. Localized link contents differ by locale as expected; wrapper ID and order match. |
| D-19196 | 25544-25545 | not an issue | The incomplete Tuatha clause remains fragmentary, and the Lapidus Leaf acquisition objective is preserved. |
| D-19197 | 25549 | not an issue | The Fae first-arrival claim and its proposed explanation for their number in Detyre remain. The Korean generic people-name does not impose an unsupported individual referent. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25515 | `하루하루가 미타루께서 내리신 축복이지.` | `하루하루가 미사루께서 내리신 축복이지.` | Apply the official Korean manual and accepted D-152 deity form `Mitharu = 미사루`. |
| 25526 | `미스란 영혼베틀 옷감` | `미타란 영혼베틀 옷감` | English explicitly says `Mitharan`; preserve its distinction from deity `Mitharu` using accepted D-18122/D-18158 terminology. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  active Korean, and the byte-identical pre-edit backup each contain 65,135
  unique ascending IDs. IDs 25501-25550 occur exactly once and in identical
  order in each file; decisions were joined by `ID_Linha`.
- All five files have matching embedded line-break counts and normalized
  runtime/markup signatures for this interval. At 25542, localized text
  inside the `{*1...}` link differs as expected; wrapper identity/order,
  `{LINE_LEFT}`, and `{LINE_SPACE}` controls match. `{1}` at 25543 is
  unchanged.
- The active CSV retains its UTF-8 BOM, 72,011 CRLF record endings, and 73
  existing bare-LF record endings. Reversing only the two approved `Texto`
  substitutions reproduces the pre-edit backup byte-for-byte.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25501-25550-D19188/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `7946e66523bc683030526c87e02d792cc4d3063e501f7301c9e2b242ceefc662`.
- Post-edit SHA-256:
  `05c2b3ef6c6214576a41a6b34a0c7e29fd1ae2411ad1d5d9d23ac81e53521fdb`.
- Cumulative context-review totals: 2,169 accepted / 24,161 `not an issue`
  / 12,194 uncertain (38,524 counted keys). Resume at D-19198, ID 25551.
  The remaining sequential interval is 25551-65134 (39,584 IDs), in
  addition to earlier specific holds and the D-18422-D-18452 register
  reconciliation.
