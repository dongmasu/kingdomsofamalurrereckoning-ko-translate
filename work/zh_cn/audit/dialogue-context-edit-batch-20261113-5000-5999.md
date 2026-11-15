# Dialogue Context Translation Edit Batch: IDs `5000`-`5999`

- Date: 2026-11-13.
- Scope: adjudicate the 20 correction candidates in the `5000`-`5999`
  revalidation reports against the current English, Japanese, Chinese, and
  Korean rows; then check exact duplicates and related terminology.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from IDs or asset
  associations. Evidence-limited findings remain unchanged.

## Candidate Decisions

| ID | Applied decision |
| ---: | --- |
| `5017` | Changed the familiar, teasing letter salutation from a formal `친애하는` to `오랜 친구`; retained the letter's paragraphs and voice. |
| `5027` | Recast the awkward “ruled as allies alongside us” phrase as ruling together in alliance. |
| `5036` | Replaced stiff passive prose with a direct vow to catch the beast and make it pay. |
| `5043` | Removed the stray punctuation and extra `정말`; retained the source's unfinished warning. |
| `5070` | Replaced the awkward `대챔피언` with the full `Grand Champion of Valor Arena` rank, distinct from `Champion of Valor`. |
| `5095` | Removed the unsupported specification that Lyria's “covering” is underwear; used the broader `아름다운 옷`. |
| `5156` | Recast the written-sounding passive as a natural direct statement about what a soldier must do. |
| `5195` | Smoothed the phrase about facing the group's problems while leaving the exact referent of `House` broad. |
| `5237` | Identified `the Missives` as the established book `세이블의 서신(Missives of Sable)` and clarified catching Argine with it. |
| `5245` | Rendered the named `Crownhold Guardhouse` as a building, not the guard unit. |
| `5296` | Replaced abstract `불안정함` with the natural `불안`, preserving the predatory metaphor. |
| `5309` | Made the hesitant, comic speech consistently conversational and preserved its pauses. |
| `5341` | Replaced `고쳐 줄게` with `치료해 줄게` for healing a person. |
| `5527` | Recast the ritual actions as completing a pilgrimage, performing a service, and giving an offering; retained all three source labels. |
| `5543` | Standardized both mentions to the full title form `엘스윈 경(Sir Elswin)`. |
| `5657` | Restored the deduction from Ivan's note that Goyen ordered the church attack; kept the journal's plain style. |
| `5705` | Standardized the visible label and explanatory text to `부가 퀘스트`, preserving both wrappers. |
| `5754` | Replaced the vague `새로운 변화` with a new turn in the Telling without specifying the lore as prophecy or story. |
| `5871` | Changed `권력` to the broader `힘`; the sources do not require a political-authority reading. |
| `5949` | Removed repeated 하오체 and used natural, courteous speech for the City Watch greeting. |

## Related Occurrences

- `Side Quests` also appears in the five-category description at ID `56687`.
  It now uses the established `부가 퀘스트`; other unsettled category names
  in that sentence were left unchanged.
- The standalone `Grand Champion` remains `그랜드 챔피언(Grand Champion)`.
  ID `5070` is the distinct full rank `Grand Champion of Valor Arena`, not
  the `Champion of Valor` title.
- Exact-English duplicate checks in the four range reports found no
  additional Korean mismatches requiring edits.

The complete ID-scoped application manifest is
[`dialogue-context-edit-batch-20261113-5000-5999.json`](dialogue-context-edit-batch-20261113-5000-5999.json).

## Verification

- The 20 candidate IDs were rechecked against the four language rows before
  editing. Existing evidence-limited findings were not converted into edits.
- Exactly 21 Korean rows were edited: the 20 candidates plus the related
  `Side Quests` occurrence at `56687`.
- Runtime markers at `5705` and `56687`, all paragraph breaks, and all
  unaffected source terms were preserved.
- Ledger fingerprints are refreshed only for the 21 edited IDs. Existing
  dispositions, row order, and all unrelated ledger bytes remain unchanged.
- The 65,135-row ledger validation, index/catalog reproducibility checks, all
  nine context-index tests, all 11 CSV-preservation tests, and the CRLF-aware
  diff check passed. The CSV retains its UTF-8 BOM and 71,845 CRLF / 244
  LF-only newline inventory.
