# D-21730 Edit Addendum

## Latest Verified Proper-Name Batch

Latest verified proper-name batch: D-21730 (2026-10-18).
Reviewed 23 distinct candidate row keys across 6 groups: {"uncertain"=>15, "not-an-issue"=>8}. No new entity-index matches or global tally changes.
Last reviewed candidate key: default:54012: / The Well.
Next batch: D-21731; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D21730.tsv` (191 bounded groups; not exhaustive or a completion estimate).
Indexed matches: 47039; accepted=31603, excluded=3078, not-an-issue=12255, uncertain=103.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 103, in 98 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `1f71903645c7a67e2ffd7290255813feafbe305b5ab185a8d3ae0b957dff7a67`.
- default: `f75cd91ce76313906841c51dc67a2b6236436437cfec9a7c9a0272b39628b07c`.
Last batch pre-edit backups and byte validation:
No CSV edits; all active bytes, BOM, mixed line endings, keys, and row order unchanged. No new backup required.
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `aa9455910107236afec4fa5268df8e888037cb514f734f540703540e17ce3c1e`; post `1f71903645c7a67e2ffd7290255813feafbe305b5ab185a8d3ae0b957dff7a67`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21729/locatexts_zh_cn.koalocatext_base.csv`.
- default: 25 cells; pre `3c452c81290756a30e27ef25b1f6a36cff38a41c90b00914469a87344b80ec85`; post `f75cd91ce76313906841c51dc67a2b6236436437cfec9a7c9a0272b39628b07c`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21725/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `8db73c7a93415046a757a871f6aacec8805c43d69c03451d61c1b53fcd8df813`.
Occurrence index: 47039 rows; SHA-256 `3592e767aba34d01081abf0c813eaea4d13f865d7e35710c219c99e1c028a481`.
Proper-name glossary: 2244 entries; SHA-256 `2f2c8a262027522a6d94123e18354975629ac6082ab7f0ced0be89c9ba88d618`.
Report: `work/zh_cn/audit/named-scope-review-D21730-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21730-20261018.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D21730.tsv`.

No CSV edits or new backups. Prior last-edit backup paths are retained above.

## D-21730: No-Edit Short-Label Review

- Wyle (2 keys): uncertain. Exact remaining keys: default:24979 is an English-only Wyle label also untranslated in Japanese and Chinese; base:662 already pairs Wyle in Wyle Home. Existing full-name rows identify Guenfear Wyle, Harit Wyle, and Narit Wyle, but the bare label does not identify which referent or whether it is a person/family/place. Preserve base:662 and all prior person/family decisions, including person:harit at default:16616. Do not invent an identity or a global Wyle alias.
- Ysa Chapter (3 keys): not-an-issue. Exact remaining rows default:51857, 53366, and 55296 identify the Scholia Arcana branch in Ysa; the standalone chapter label already pairs Ysa as 이사(Ysa), and the remaining two labels pair the complete phrase. Japanese イーサ支部 and Chinese 伊萨分会 corroborate the branch meaning. Preserve existing place:ysa and Scholia Arcana dispositions; no duplicate place or organization is registered.
- Witch Knight (3 keys): not-an-issue. Exact candidate-queue keys: default:27698, default:45250, default:54621 only; the 61-key global title scan is intentionally out of scope. English uses Witch Knight as a role/title, Japanese 魔騎士 and Chinese 女巫骑士 corroborate, and Korean already renders the title in context. Preserve the overlapping organization:alfar-army, people:alfar, place:mel-senshir, and place:shadow-pass dispositions; do not register a character or title entity from these candidate hits.
- Witch Knight Khleran (2 keys): not-an-issue. Exact remaining rows default:1631 and 21938 identify the already registered person Khleran; the Korean labels already include 클레란(Khleran), while 마녀 기사 translates the generic rank. Japanese 魔騎士クレラン and Chinese 女巫骑士克勒兰 corroborate. Preserve person:khleran and all prior row dispositions; do not create a second titled-person entity.
- Well (11 keys): uncertain. Exact candidate-queue keys: default:15905, default:27506, default:28162, default:5017, default:52402, default:52634, default:52715, default:53524, default:57375, default:6055, default:61903. English spans generic wells and Well of Souls lore; Japanese 泉 and Chinese 井/灵魂之井 vary by context, while Korean includes 우물, 샘(Well), and the full 영혼의 샘(Well of Souls) label. Do not add a global Well alias or conflate physical/revival referents. Preserve the documented default:6055 hold and every existing entity disposition, including person:octienne and construct:well-of-souls.
- The Well (2 keys): uncertain. Exact candidate-queue keys: default:39730,54012. English, Japanese 泉, and Chinese 井 do not establish whether the short label is a specific Well concept or a generic reference in both contexts. Preserve default:54012's documented D-20155 uncertainty and existing text; do not register a separate The Well entity or widen Well of Souls.

Exact aligned English/Japanese/Chinese/Korean and prior entity decisions are preserved in `proper-name-short-label-dispositions-D21730.tsv`. Prior terminal keys and historical global totals were not reopened or recounted. No CSV, glossary, or occurrence-index bytes changed; full discovery remains incomplete.
