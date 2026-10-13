# Disposition Batch: `default` IDs 56351-56400

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English,
  Japanese, Chinese, the preliminary scan, source-keyed historical notes,
  prior decisions, line layout, runtime markers, and numeric values. These
  working dispositions are not independent final linguistic approval.
- Three accepted corrections, 39 `not an issue` IDs, and ten uncertain
  findings. The two Augur-title questions at IDs 56360 and 56393 are separate
  from the accepted generic Korean term and overlap those accepted IDs.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56359 | `발라드의 전당 문장이자 하프 문장이 새겨진 반지.` | `발라드의 집을 상징하는 하프 문장이 새겨진 반지.` | English, Japanese, and Chinese describe one harp crest belonging to the House of Ballads; the draft's repeated `문장` can imply two emblems. Reuse the accepted House name `발라드의 집` from D-10221 and D-16990. |
| 56360, 56393 | `점술가` | `예언자` | Japanese uses `予言者`; align these bare `Augur` labels with the accepted Korean rendering in D-13012. Whether each capitalized label is a formal office remains separately uncertain. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56351 | Uncertain | `Gallows End` is a named location, but prior decisions record conflicting Korean transliterations and semantic forms. Do not normalize one occurrence in isolation. |
| 56358 | Uncertain | English `upsetting bets left and right`, Japanese bets flying around, and Chinese upset gamblers allow different readings. The current table-turning metaphor is plausible, but the exact gambling idiom is unresolved in the historical audit. |
| 56360 | Uncertain | Separate from the accepted generic term `예언자`, capitalization may identify a formal Augur office/title. The isolated label does not settle that status. |
| 56371 | Uncertain | English `fastidious` and “will not suffer an approach he can see” differs in nuance from Japanese's hard-to-please/ingratiation reading and Chinese caution. The current Korean is plausible; do not choose a narrower interpretation without scene context. |
| 56377 | Uncertain | Literal backslash-quote sequences occur in the Korean cell while other locale cells use quotation marks. Prior decisions D-715, D-8557, D-8570, D-8636, and D-8643 explicitly defer removal until runtime/export behavior is verified; preserve them. |
| 56380 | Uncertain | `Sojourn`, `Service`, and `Giving` may be named rites/concepts. Korean preserves the outward-to-inward and historical-to-present progression, but their lore relation differs across locales. |
| 56392 | Uncertain | English spells the saint `Hadwyn`; a nearby source uses `Hadwin`. Korean `하드윈` may correctly identify the same saint, but the spelling/name relation needs context. |
| 56393 | Uncertain | Separate from the accepted generic term `예언자`, capitalization may identify a formal Augur office/title. The isolated label does not settle that status. |
| 56398 | Uncertain | English `Skull Sprite`, Japanese's phonetic rendering, and Chinese's demon-like creature label differ on the creature category. Keep `해골 요정` pending encounter/context evidence. |
| 56400 | Uncertain | The capitalized `Sorrows` may name a faction, force, or entity. Prior decisions record these competing readings; retain the current wording pending lore context. |

## Not an Issue

The remaining 39 IDs are 56352-56357, 56361-56370, 56372-56376,
56378-56379, 56381-56391, 56394-56397, and 56399. They preserve the evident
meaning and structure. The 100,000-gold wager at 56376 and value `27` at
56385 are retained. `{1}: {2}` at 56372 remains unchanged.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56351-56400
  once in ascending order. All four files have the same default key order;
  no target row was skipped or duplicated.
- The localized marker at 56372 is preserved. No line-break or numeric-value
  correction was needed.
- Rechecked the source-keyed historical entry for IDs 56350-56449 and the
  prior dispositions for Gallows End, Augur, the Sorrows, and backslash-quote
  sequences. Existing uncertainty was retained unless a specific accepted
  term or clear local correction was supported.
- The preliminary scan's recorded CSV hashes predate later active-file
  edits. Current source rows and the active file were checked directly.
- Pre-batch active CSV SHA-256:
  `1a5b33cf9783fd63e408de9741903e115e281ed75bbed11aaa478cd320fff5f2`.
  Post-edit active CSV SHA-256:
  `1df89014fff45dd2484bc50157f47be409e969ba64dc15ad87c497ce647e7c43`.
  Only the three accepted `Texto` cells above changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56351/locatexts_zh_cn.koalocatext_default.csv`.

Decisions D-17006 and D-17007 record three accepted cell corrections;
D-17008 through D-17017 record ten uncertain findings, including the two
separate Augur-title questions; D-17018 records the remaining 39
`not an issue` IDs. Direct register totals: 1,653 accepted, 11,506
`not an issue`, and 10,509 uncertain (23,668 total); next D-17019.

Resume at `default` ID 56401; 8,734 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56401-56450-preliminary.md`](default-ids-56401-56450-preliminary.md).
