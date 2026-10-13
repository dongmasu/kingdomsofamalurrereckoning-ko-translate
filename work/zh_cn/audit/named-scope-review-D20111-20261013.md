# Consolidated Context Review D-20111

2026-10-13. Reviewed all 50 active `default` IDs 51801-51850 against
English meaning, Japanese voice/register, Chinese supporting text, active
Korean, exact-key history, and applicable official Korean terminology.
English anchored meaning. No PAK material was consulted.

| IDs | Finding |
| --- | --- |
| 51802 | Correct `아르카나 학회(Scholia Arcana)` to official-manual `스콜리아 아르카나(Scholia Arcana)` (PDF p. 7). The English sentence's sequence is preserved despite Japanese truncating mid-sentence; Chinese supports the complete English. |
| 51803 | Verify structure without editing. English and Korean have identical marker identity/order and line-break count. Japanese omits `{*2}`; Chinese lacks the opening `{LINE_LEFT}` and places `{*1}` before `{*3}`. The old source-keyed note claiming no marker mismatch across 51550-51849 was incorrect; no Korean marker change is supported. |
| 51806 | Follow accepted D-16810 `먼지의 아이(Child of the Dust)` terminology instead of `먼지의 자식`. English, Japanese, and Chinese identify the same epithet; preserve Cycle and Deep Slumber as named concepts. This is a terminology follow-up to the already-terminal D-19680/D-15763 disposition, not a new classification or recount. |
| 51842 | Correct `네가 내 생각을 이해해 주길 바랐어` to `네가 내 관점에 동의해 주길 바랐어`. English idiom `see things my way`, Japanese `私と同じ見方を`, and Chinese `以我的方式看问题` ask for agreement/shared perspective, not merely understanding. This precision follow-up does not reopen D-15767's grouped terminal disposition. |
| 51845 | Correct `여행자들(Travelers)` to official-manual `트래블러들(Travelers)` (PDF p. 7). English names the faction; this terminology follow-up does not reopen D-15767's grouped terminal disposition. |
| 51801, 51803, 51806, 51821, 51824, 51840 | Verify D-19680's already-terminal `not an issue` dispositions without reclassification or recount. The Acolyte label, debug-string source behavior, named concepts, English-led accusation, `Confident` UI label, and Praetorians label remain source-traceable; preserve the Japanese-only positive/help reading at 51821 without overriding English. |
| Other IDs in 51801-51850 | Verify D-15767's grouped terminal disposition without recount. The recipe/tutorial wrappers and `{1}` prompt, proper names, quest and UI labels, object references, values, line structure, and remaining dialogue preserve English-led meaning. |

All 50 active IDs were checked once. Four `Texto` cells received
terminology/precision follow-ups at 51802, 51806, 51842, and 51845.
D-19680's exact-key dispositions for D-15761-D-15766 and D-15767's grouped
disposition were verified without reclassification or recount. No global
tally was updated. D-19565's separate 55 affix findings remain closed.

Pre-edit active default CSV SHA-256:
`d3ba06c446e0405e60d3e24cb5743bd74af4894e2f71ac6c2ef80b1a1beae35b`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20111/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`5ede44c68e3c1337a1bda86a190e4be54ec1b646ce1e99572ef4c27050c66af2`.

The applicator verified exact inverse reconstruction outside the four
target `Texto` cells, UTF-8 BOM, mixed line endings, all 65,135 ordered IDs,
four-locale ID alignment, and line-break identity for all 50 IDs. Runtime
marker identity/order matches across all locales except the documented
source-reference divergence at 51803, where English/Korean match exactly.
Last reviewed 51850; next D-20112 / 51851-51900; 13,284 actual default
rows remain through ID 65134. Overall review remains incomplete.
