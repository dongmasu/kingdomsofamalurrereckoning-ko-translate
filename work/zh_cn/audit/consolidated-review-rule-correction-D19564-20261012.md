# Review Rule Correction and Source-Only Checkpoint (D-19564)

- Date: 2026-10-12.
- Scope: correct the active review instructions, verify the in-progress
  default edit at ID 62755, and re-evaluate ID 62869 without PAK evidence.
- Evidence order: English determines meaning; Japanese informs voice and
  register; Chinese is a supporting cross-check. No PAK or PAK-derived
  material was used for the ID 62869 decision.

## Corrected Review Rules

- Do not inspect, extract, search, compare, or cite PAKs or PAK-derived files
  as translation evidence.
- A source-faithful Korean translation is `not an issue` even when no exact
  Korean precedent exists. Accept a correction when the evidence supports a
  specific improvement.
- For game-specific Korean terminology, ranks, titles, or names whose
  established rendering may appear in the official Korean manual, consult
  the manual's overall setting and relevant sections, not just exact-string
  matches. Record relevant sections/pages. Exact-string search is a
  supplement only; the manual is not exhaustive, and a no-hit alone does not
  require an uncertain disposition.
- Reserve `uncertain` for materially different plausible readings that would
  change the Korean and remain unresolved after one focused review.
- Do not repeat negative searches or carry forward a hold merely because no
  new evidence appeared. Review by unique term/context and give each
  completed item a definite disposition.
- A partial correction does not automatically resolve a separate ambiguity;
  document both outcomes independently.

These rules supersede the PAK-dependent rationale recorded for D-19560 and
the PAK-extraction search recorded for D-19563. Those historical actions are
out of scope and must not be repeated or relied on.

The full 11-page manual
`references/manual/Kingdom of Amulur 공식 한글 설명.pdf` was read for
overall background, not just searched for terms. Its overview and races
section (page 1) uses `아말러` and `바라니` and describes the Varani as
merchants; later sections cover the game's deities, skills, factions,
crafting, combat, and world concepts. This background is compatible with
the Varani merchant-princess in ID 62755. The exact strings
`Adept`/`숙련자`, `Kezar`/`케자르`, `Ten-Fingers`/`텐핑거스`, and
`Balla Lach`/`발라 라치` do not appear. The manual's lack of those exact
entries does not negate its broader contextual value or itself require a
hold.

## Default Review

| ID | Result | Evidence and rationale |
| ---: | --- | --- |
| 62755 | Partial correction; epithet question remains open | English `blades` and Chinese `利刃` support the plural blade wording. The `Ten-Fingers` epithet is a separate unresolved display choice and must receive a disposition during the next focused review. |
| 62869 | `not an issue`; close D-18038 | English `Balla Lach`, Japanese `バラ・ラッチ`, and Chinese `巴拉·拉奇` identify the same proper name. Korean `발라 라치` is a reasonable source-faithful rendering. The sentence also preserves elemental ice weapons, elite Fae warriors, and their patrol between worlds. An exact prior Korean spelling is not required to close this row. |

ID 62755 was changed from `이 우아하고 화려한 칼은` to
`이 우아하고 화려한 칼날들은` in the active `Texto` cell. The edit does
not settle the separate epithet question, so it does not change the
disposition tally.

## Integrity and Tally

- Pre-edit default SHA-256:
  `539e1d1a1473a229ba218b853d514ba0f25a68083e4ed19dff389c33adb6067f`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-default-blades-D19564/locatexts_zh_cn.koalocatext_default.csv`.
- Active default SHA-256:
  `8eb5623adb48bd86ed5cc48bc61ddf92ec8ff2b808e3a9bb7c6fddab1aa48027`.
- Reversing the exact substitution reconstructs the backup byte-for-byte.
  The UTF-8 BOM, row order, 72,011 CRLF endings, and 73 bare-LF endings are
  preserved.
- Default tally: **2,458 accepted / 25,352 not an issue / 10,714 uncertain**
  (38,524). Remaining default holds: 62755, 62792, 62796, and 62867.
- The 55 Chinese-only affix fallback keys remain **10 / 10 / 35**; all 140
  fallback keys remain **10 / 95 / 35**. The 35 unresolved Chinese-only
  rows are grouped under IDs 101, 115, 117, 124, 255, 341, and 496; IDs 115
  and 117 remain linked to D-18173/D-18175 and are not double-counted.
- Active affix SHA-256:
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- Fallback inventory SHA-256:
  `8554f891ccf10edfbd259e95d44a3de608e354ecce6ec90d64aae367f44aec09`.

## Resume

Resolve the four default holds and 35 Chinese-only affix fallback rows using
the corrected disposition threshold. Do not repeat the D-19560/D-19563 PAK
work. Group affix rows by unique term, review linked decisions without
double-counting IDs 115 and 117, and record the exact next item after each
completed batch. Do not mark the overall review complete while any default
or affix hold remains.
