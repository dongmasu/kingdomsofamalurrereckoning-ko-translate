# Disposition and Edit Batch: `default` IDs 4300-4349

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 4300-4349.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Seventeen findings were dispositioned: two accepted, nine `not an issue`,
  and six uncertain. Two accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4300 | Firstsworn forge / Mystic Hammer names | Keep the supported names and consistent Mystic Hammer form. | D-1004: not an issue. |
| 4301 | `What are titles?` / `칭호란 무엇인가?` | Defer the exact UI/tutorial sense of `titles`. | D-1005: uncertain. |
| 4304 | `Wine Raething` name | Defer the name's identity and canonical Korean form. | D-1006: uncertain. |
| 4307 | `You feel lucky` | Defer whether this is a prompt, status label, or incomplete string. | D-1007: uncertain. |
| 4310 | Winter Fae and Tuatha kinship claim | Keep the supported faction statement. | D-1008: not an issue. |
| 4313 | `Savant Reen` title | Defer whether `Savant` is an academic rank or common description. | D-1009: uncertain. |
| 4315 | Events described as `crafted intent` | Keep the supported deliberate-orchestration reading of the malformed source. | D-1010: not an issue. |
| 4318 | Brattigan's survivor-search request | Keep the request and destination. | D-1011: not an issue. |
| 4319 | `Unvanquished Company` | Defer whether this is a military unit, fellowship, or other group. | D-1012: uncertain. |
| 4321 | Hallam's location in the House of Ballads | Restore the place where the speaker left Hallam. | D-1013: accepted. |
| 4325 | `Frame the Hierophant` | Keep `모함하기` for falsely implicating someone. | D-1014: not an issue. |
| 4328 | Augur's preaching and the speaker's sarcasm | Keep the supported preaching/skeptical contrast. | D-1015: not an issue. |
| 4334 | Apology and rebuilding responsibility | Keep the supported responsibility and schedule detail. | D-1016: not an issue. |
| 4336 | Unspecified `They` / lightning, fire, and ice | Defer the unnamed antecedent and exact entity type. | D-1017: uncertain. |
| 4338 | `I'm done hearing requests` | Restore the speaker's first-person refusal. | D-1018: accepted. |
| 4340 | Relentless Assault condition and values | Keep the +20% chance, 22 Health, and two-line layout. | D-1019: not an issue. |
| 4348 | Crossfire / Talon Strikes descriptions | Keep both marked ability labels, their separation, and effects. | D-1020: not an issue. |

Historical same-numbered `base` questions remain separate and were not
merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4321 | `할럼은 내가 떠났던 그 자리에 하우스 오브 발라드(House of Ballads)에 있을 것이다.` | `할럼은 하우스 오브 발라드에서 내가 두고 온 자리에 있을 거야.` | D-1013 |
| 4338 | `부탁은 이제 그만 들어줄래.` | `이제 더는 부탁 안 들어줄 거야.` | D-1018 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 4300-4349 once and
  in identical order.
- ID 4340 retains its two-line condition/effect display, `+20%`, and `22`.
  ID 4348 retains both `{*1...}` markers and the blank paragraph break.
- Only the two approved Korean `Texto` cells were changed. Keys, row order,
  and other cells remain unchanged.
- The active Korean CSV parses as 65,135 rows and retains its UTF-8 BOM,
  semicolon delimiter, and CRLF physical line endings.
- Active Korean `default` CSV SHA-256:
  `b2099fae24ad8a432e9656372919bbd984fab371974f7870d9596b4998237699`
- Cumulative dispositions: 220 accepted, 218 `not an issue`, and 582
  uncertain. Resume at `default` ID 4350.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
