# Disposition and Edit Batch: `default` IDs 12000-12049

- Decision date: 2026-10-09.
- Scope: twelve findings in the preliminary report plus linked duplicate
  lodging-option ID 41330.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Thirteen findings received dispositions: four accepted, three `not an issue`,
  and six uncertain.
- Applied supported corrections only to Korean `Texto` cells at IDs 12000,
  12024, 12037, and linked row 41330.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 12000 is accepted: change `에세네(Ethene)` to the established
  `에테네(Ethene)` form approved at IDs 870, 4616, and 11612. The `Kollossae`
  spelling remains `콜로세(Kollossae)`.
- ID 12004 remains uncertain: `Bag parent. Not for actual use.` looks like
  an asset/category placeholder, but the row does not show whether players
  can see it.
- ID 12008 is `not an issue` for the active row: `There are rumblings in the
  Court of Winter` is faithfully rendered as `겨울 궁정에 술렁임이 일고
  있다`. The preliminary finding's references to the House of Sorrows and
  “the cycles” do not occur in this English row or its Korean text; this
  report-to-source mismatch is recorded rather than treating the unrelated
  wording as an active defect.
- ID 12014 is `not an issue`: `연결에 실패했습니다` is a clear, standard
  formal Korean rendering of `Connection failed.` and suits an error message.
- ID 12024 is accepted: replace `침대 구매` with `숙박하기`. Japanese and
  Chinese explicitly express wanting lodging/staying overnight, so the
  literal English wording does not indicate buying furniture.
- ID 12031 remains uncertain: the weekly pay and “weight” metaphor are
  retained, but the English does not establish whether the weight is literal,
  emotional, or a figure for reluctance.
- ID 12035 remains uncertain: the Eyes of Tirnoch, attack, and Gadflow image
  are retained, but “none ... have escaped my attack” does not specify
  whether the Tuatha were killed, repelled, or otherwise defeated.
- ID 12037 is accepted: replace the misleading `공동` (“cavity”) with
  `동굴`, following the cave/lair reading supported by English context,
  Japanese `洞穴`, and Chinese `洞穴`. The partnership metaphor and feeding
  relationship are retained in natural Korean.
- ID 12042 remains uncertain: `seemed sorry to kill us` can indicate remorse,
  reluctance, or pity; the locale readings do not fully resolve the nuance.
- ID 12044 is `not an issue`: all three diary days, the abrupt unfinished
  “Looks like” fragment, the editorial note, and the source lineation are
  retained. English source typos are not expanded into new plot.
- ID 12046 remains uncertain: `Getting Your Hands Dirty` can mean doing
  unpleasant/manual work or personally getting involved; `몸소 나서서` is
  plausible, but the isolated title does not settle the intended sense.
- ID 12047 remains uncertain: the enchanted-armor meaning is conveyed, but
  the canonical Korean spelling of `Dokkalfar` remains open; the English
  source's malformed `enchantmented` is not copied as a Korean error.
- Linked ID 41330 is accepted with ID 12024: change `침대 구매` to
  `숙박하기`, preserving the gold-cost variable and value order. English,
  Japanese, and Chinese identify the same paid lodging option. This
  cross-range decision is recorded now and must not be counted or edited
  again when the sequential scan reaches ID 41330.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 12000 | `에세네(Ethene)` | `에테네(Ethene)` | D-3515: match the accepted deity form. |
| 12024 | `침대 구매` | `숙박하기` | D-3519: translate the lodging action, not furniture purchase. |
| 12037 | `...Gorguath...공동...공동...` | `...Gorguath...동굴...동굴...` | D-3522: render the lair/cavern sense. |
| 41330 | `침대 구매 ($Ayten_NQD.m_inn_cost$ 골드)` | `숙박하기 ($Ayten_NQD.m_inn_cost$ 골드)` | D-3527: align the linked paid-lodging option. |

## Verification

- English, Japanese, Chinese, and Korean contain IDs 12000-12049 in
  identical key order. The preliminary structural comparison found matching
  runtime-token sequences and line-break counts in this range.
- ID 12044 retains its three dated entries, unfinished final sentence, and
  editorial note. The linked ID 41330 retains its cost variable and ordering.
- Only the approved Korean `Texto` cells at IDs 12000, 12024, 12037, and
  41330 changed. Keys, variants, line breaks, and runtime tokens are
  unchanged.
- The active default CSV retains its UTF-8 BOM, CRLF endings, 65,135 ordered
  ID records, and 72,085 physical lines.
- Active default CSV SHA-256 after the edits:
  `4b53ccb5c48a1fbed65b00593044bcd0489823cc06fa65a54e7780a324f7e9ae`.
- Before this batch: 507 accepted, 1,125 `not an issue`, and 1,882 uncertain.
  After this batch: 511 accepted, 1,128 `not an issue`, and 1,888 uncertain
  (3,527 dispositions total).
- Direct findings and carried historical questions through ID 12049 now have
  dispositions. Resume at ID 12050; 53,085 `default` rows remain. The linked
  ID 41330 decision is already recorded separately.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
