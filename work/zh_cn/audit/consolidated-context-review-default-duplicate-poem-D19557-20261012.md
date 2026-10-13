# Consolidated Context Review: Duplicate Arcane Veil Poem (D-19557)

- Date: 2026-10-12; decision D-19557.
- Scope: default ID 62867, the five-line poem previously retained under
  D-18038.
- Compared the English source with Japanese voice/lineation, Chinese support,
  active Korean, the exact duplicate source row at ID 19963, and D-18267/
  D-18269's decision record.

## Decision

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 62867 | partial accepted; retain uncertain under D-18038 | English, Japanese, and Chinese contain the same five-line poem at IDs 19963 and 62867. D-18269 found ID 19963's layout and `비전의 장막` rendering aligned, leaving only the image in `the fools who fell` unresolved. The prior Korean at 19963 therefore supports aligning the other wording at 62867, including `충고`, `참혹한 만행`, `넘어진 어리석은 자들`, and `장막 너머`. The source still does not establish whether `fell` means literal falling, defeat, or spiritual ruin, so retain the uncertainty. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 62867 | `어리석은 필멸자들이여, 귀 기울여라\n이 이야기의 교훈에,\n우리가 들려줄 잔혹한 만행,\n넘어진 바보들에겐 공포가 기다리고,\n비전의 장막 뒤에서 쇠락하리라` | `어리석은 필멸자들이여, 귀 기울여라\n이 이야기의 충고를,\n우리가 들려줄 참혹한 만행을,\n넘어진 어리석은 자들에겐 공포가 기다리고,\n비전의 장막 너머에서 쇠락하리라.` |

The uncertainty is limited to the source's compressed `fools who fell`
image. No meter or lore interpretation was added.

## Integrity and Tally

- Pre-edit SHA-256:
  `b35edaa0b7c2ff6424481f03dbab58897e7a1a846982d8a9dc675a6a2fbfbfd6`.
- Post-edit SHA-256:
  `539e1d1a1473a229ba218b853d514ba0f25a68083e4ed19dff389c33adb6067f`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-duplicate-poem-alignment-D19557/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing only ID 62867's five-line `Texto` substitution reproduces the
  backup byte-for-byte. The UTF-8 BOM, all 65,135 ordered IDs, 72,011 CRLF
  endings, and 73 pre-existing bare-LF endings are preserved.
- The partial correction does not change the working disposition count:
  **2,458 accepted / 25,351 not an issue / 10,715 uncertain** (38,524).
  Five default uncertainties remain: 62755, 62792, 62796, 62867, and 62869.
- The separate 55 Chinese-only `affix` fallback keys remain 10 / 10 / 35;
  all 140 fallback keys remain 10 / 95 / 35. Active `affix` SHA-256:
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
  Fallback inventory SHA-256:
  `d9bfb5934c1216d718134374ffdd74f75b903a2d42e01a713a94f652dab279cc`.

These are working dispositions, not independent final linguistic approval.

## Resume

Resume D-19558 at default ID 62869 in D-18038. Recheck only for new
canonical `Balla Lach` naming evidence; otherwise retain the hold. The
remaining D-18027 keys are 62755, 62792, and 62796.
