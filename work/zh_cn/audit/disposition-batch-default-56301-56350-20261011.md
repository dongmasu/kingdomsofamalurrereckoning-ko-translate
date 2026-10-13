# Disposition Batch: `default` IDs 56301-56350

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English,
  Japanese, Chinese, the preliminary scan, source-keyed historical notes,
  prior decisions, line layout, runtime markers, and numeric values. These
  working dispositions are not independent final linguistic approval.
- Two accepted corrections, 40 `not an issue` IDs, and eight uncertain
  findings. Uncertain name, lore, and verse questions remain unchanged.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56325 | `저는 결계 해제를 수련하는 보잘것없는 마법사일 뿐입니다. 배우고자 하는 분이라면 누구에게든 제 지식을 나눕니다.` | `저는 마법 해제를 수련하는 보잘것없는 마법사일 뿐입니다. 배우고자 하는 분이라면 누구에게든 제 지식을 나눕니다.` | English `arts of dispelling`, Japanese `解呪`, and Chinese `驱散法术` describe magical dispelling, not specifically removing a barrier. Reuse the accepted game-skill term `마법 해제` from D-341 and D-1526. |
| 56342 | `분화구 아래쪽에 있어. 건물들이 물 위에 떠 있는 것처럼 보여.` | `분화구 한가운데에 있어. 건물들이 물 위에 떠 있는 것처럼 보여.` | English says `in the belly of the crater`; Japanese and Chinese explicitly say its center. The draft's `아래쪽` loses that location. The floating-building observation remains intact. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56303 | Uncertain | English capitalizes `The Glass` and addresses the listener as `dove`; Japanese omits the address and renders the Glass differently, while Chinese uses a peace-related address. Keep the current text pending the entity and speaker context. |
| 56320 | Uncertain | The Rhyderk verse's compressed syntax and internal rhyme are not reproduced in Korean. The sword's forging/duty, the green-and-blue knights, and the Bolgan defeat are present, but the subject attachment and a supportable Korean verse form need integrated review. |
| 56321 | Uncertain | English capitalizes `The Walls` and Japanese phoneticizes it, while Korean says `성벽`. Prior decision D-1434 leaves named-location versus generic-wall status open. |
| 56329 | Uncertain | The English introduction is malformed and the formal senses of `Imperator` and `Guardian of Arms` are unclear. Japanese and Chinese differ on commander/army-guard meanings; do not impose `무구` or a rank without context. |
| 56330 | Uncertain | English and Japanese name `Faer Gorta`, while Chinese generalizes it as a summoned skeleton soldier. The current phonetic form is retained pending canonical creature terminology. |
| 56333 | Uncertain | `Gemstone Tavern` is a named family business in English and Japanese, but the Korean corpus alternates between phonetic and semantic venue forms. Earlier decisions D-9310 and D-12789 leave the canonical Korean display unresolved; do not normalize this occurrence alone. |
| 56344 | Uncertain | `Revival` is capitalized in English, transliterated in Japanese, and identified as a camp in Chinese. Its place/event category and Korean form remain unresolved in prior decisions including D-237. |
| 56346 | Uncertain | The gameplay description is retained, but `Rogue` is used as an archetype/class label. Prior decisions leave the canonical class term unresolved; retain `도적` for now. |

## Not an Issue

The remaining 40 IDs are 56301-56302, 56304-56319, 56322-56324,
56326-56328, 56331-56332, 56334-56341, 56343, 56345, and 56347-56350.
Their current Korean preserves the evident source meaning and voice. In
particular, the Avicenn/dagger relation at 56311 is supported across the
locales; `quarry` at 56318 means the pursued people in context; the recruit
screening at 56339 is consistent with Japanese; and the names/forms that
remain provisional do not establish a specific local mistranslation.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56301-56350
  once in ascending order. The four files contain the same 65,135-ID key
  order. No target row was skipped or duplicated.
- The inspected rows have no runtime-variable or markup tokens, no numeric
  values, and no embedded line breaks. The existing single-line layout is
  preserved.
- Rechecked historical prompts for IDs 56250-56349, including the Glass and
  `dove`, Rhyderk verse, Imperator, Faer Gorta, and Revival. Existing
  unresolved decisions for `The Walls`, `Gemstone Tavern`, and `Rogue` were
  retained rather than locally overridden.
- The preliminary scan's recorded CSV hashes predate later active-file
  edits. The current active files and source rows were checked directly.
- Pre-batch active CSV SHA-256:
  `787cc7ca3afcaef02a1b5c937c9a4c4f154b7372fe48eef81ccec40b561188f9`.
  Post-edit active CSV SHA-256:
  `1a5b33cf9783fd63e408de9741903e115e281ed75bbed11aaa478cd320fff5f2`.
  Only the two accepted `Texto` cells above changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56301/locatexts_zh_cn.koalocatext_default.csv`.
- A strict Ruby CSV parse still stops at a pre-existing unquoted line break
  near physical line 11029; this batch did not alter that region. The target
  range was checked directly by ID in all four locale files.

Decisions D-16995 through D-16996 record the two accepted corrections;
D-16997 through D-17004 record eight uncertain findings; D-17005 records the
remaining 40 `not an issue` IDs. Direct register totals: 1,650 accepted,
11,467 `not an issue`, and 10,499 uncertain (23,616 total); next D-17006.

Resume at `default` ID 56351; 8,784 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56351-56400-preliminary.md`](default-ids-56351-56400-preliminary.md).
