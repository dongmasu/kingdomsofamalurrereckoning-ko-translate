# FFQ67 / Vulgar Donnoh Dialogue and Quest-Text Revalidation

- Date: 2026-11-10.
- Scope: all 27 `default` keys found in `1511550.quest_bxml` (`FFQ67`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ67`, `NPC_POE_LJO_VulgarDonnoh`, the `PLAYER`
symbol, item-count checks for peasant clothing, and 13 serialized
`dialog_line_*` handlers. All 27 exact-key matches were compared across the
active Korean, English, Japanese, and Chinese `default` tables. The quest
concerns collecting peasant clothes for Vulgar Donnoh, a tailor in Moon Camp.
Each of the seven English `peasant clothes` occurrences in the full English
`default` table is in this asset.

Content separates 19 dialogue-like rows from eight journal, objective, or UI
strings. This supports grouping by quest and topic, but does not map keys to
individual callbacks or prove the exact speaker for each dialogue line.
Speaker turns and playback order remain unknown.

## Revalidation Findings

These are review candidates, not approval to edit the CSV.

| IDs | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `7123`, `39711` | Meaning / terminology | The repeated source `peasant clothes` is rendered `농부 옷` at both IDs, while the other five occurrences use `농민 옷`. Japanese `農民の服` and Chinese `农民的衣服` support `농민 옷` as the consistent form. | High |
| `20674` | Naturalness / format | The objective `Collect Peasant Clothes` is imperative `농민의 옷을 모아라`, unlike the source-language action label and the project's usual `-하기` objective form. Consider `농민 옷 모으기`. | Medium-high |
| `28032` | Naturalness | `길에서 벗어난 사람이군` is a literal, awkward rendering of the conversational opener `Someone off the road` / Japanese `道を外れた奴か`. Consider the more natural `길손이군.` | Medium |
| `39185` | Speech level / naturalness | The short farewell `즐거운 여행 되시길` adds polite honorifics absent from Japanese `良き旅路を` and is more formal than the surrounding exchange. Consider `즐거운 여행 되길.` | Medium |
| `62029` | Meaning / naturalness | `내게 팔 천은 좀 찾아왔어?` can be read as asking whether the player found “eight thousand to sell me”; the intended object is cloth. Consider `내게 팔 옷감은 좀 구해 왔어?` | High |
| `62402` | Speech level / naturalness | One utterance shifts among `정말인가?`, `써 보지 못했어`, and `기다리겠네`. English and Japanese use conversational plain speech. Consider `정말? 한동안 제대로 된 옷감을 써 보지 못했어. 조사 결과를 기다릴게.` | High |

The remaining rows showed no clearly supported meaning, register, or
formatting problem in this pass. The seven `peasant clothes` rows were checked
as a term set; the other five already use `농민 옷`. “Clothes” and “cloth”
remain contextually distinct (`옷` / `옷감` or `천`) rather than being
mechanically unified. No embedded line breaks, runtime variables, or
formatting markup were found in the Korean rows.

## Coverage and Limits

All 27 asset-linked IDs were reviewed for content type, meaning, naturalness,
speech level, address, honorifics, and format as applicable. Findings remain
separate from CSV application under the review/editor workflow. The per-ID
dispositions and four-language fingerprints are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The mapping from localization keys to callbacks, branches, individual
speakers, and playback sequence remains unresolved; callback serialization
order is not treated as playback order.
