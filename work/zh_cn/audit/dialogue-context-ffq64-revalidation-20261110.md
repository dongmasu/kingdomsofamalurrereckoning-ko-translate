# FFQ64 / Agraivin Hand Dialogue and Quest-Text Revalidation

- Date: 2026-11-10.
- Scope: all 23 `default` keys found in `1507672.quest_bxml` (`FFQ64`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ64`, `TRSQ01`, the asset-level symbol
`NPC_DAL_ALM_AgraivinHand`, and 12 serialized `dialog_line_*` handlers. The
quest concerns buying prison keys to help imprisoned Travelers. All 23
exact-key matches were compared across active Korean, English, Japanese, and
Chinese `default` tables.

Content separates 16 dialogue-like rows from four quest-journal records and
three objective or UI labels. The NPC symbol is asset-level evidence and the
keys have not been mapped to individual callbacks. Dialogue content strongly
associates Agraivin with the exchange, but exact key-to-speaker turns and
playback order remain unverified.

## Revalidation Findings

These are review candidates, not approval to edit the CSV.

| IDs | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `20347` | Naturalness | `I'm not one to sit around with my mouth agape` means he will not just sit idle in surprise. Current `난 그저 입 벌리고 앉아 있을 사람이 아니라고` follows the English/Japanese image too literally. Consider `난 놀라서 입만 벌린 채 가만히 있을 사람이 아니라고.` | Medium-high |
| `32612` | Naturalness / narration consistency | The journal line switches from `죽었어` to `도와줄 수 없겠군`, mixing endings in one short first-person entry. Consider a consistent plain narration, e.g. `애그레이빈 핸드(Agraivin Hand)가 죽었어. 이제 그의 일을 도와줄 수 없어.` | High |
| `36783` | Naturalness | `좋은 여행 되게` is an awkward rendering of the farewell `Pleasant travels`. Consider the more conversational `여행 잘 다녀와, 멍청아.` | Medium-high |
| `47154` | Speech level / naturalness | The sentence ends in `필요하네`, a marked `하게체` form against the project's conversational rendering of Japanese plain speech. English is colloquial and Japanese uses plain `あんた ... 借りたい`. `자네` itself also appears in this quest and is not the issue. Consider `또 왔나? 돈이 필요하다면, 영리한 트래블러(Traveler)의 도움이 아직 필요해.` | Medium-high |
| `56245` | Naturalness | `줄 열쇠가 있어` is understandable but compressed for the player-choice line `I have some keys for you` / Japanese `鍵を渡したい`. Consider `열쇠를 건네고 싶어.` | Medium |
| `60408` | Naturalness | `받을 자격이 있는 만큼 보상하지` is stiff for `pay you all you deserve`. Consider `이리 주면 네가 받아 마땅한 만큼 보상하지.` | Medium |

The repeated English insult `berk` is rendered mostly as `멍청아`, with
`얼간이` or `멍청이` in some lines (`32419`, `51222`, `57769`). These are
plausible Korean insults, so the variation is recorded as a consistency note,
not treated as a confirmed error or globally standardized without review.
Other rows showed no clearly supported meaning, register, or formatting
problem. No embedded line breaks, runtime variables, or formatting markup
were found in the checked Korean rows.

## Coverage and Limits

All 23 asset-linked IDs were reviewed for content type, meaning, naturalness,
speech level, address, honorifics, and format as applicable. Findings remain
separate from CSV application under the review/editor workflow. The per-ID
dispositions and four-language fingerprints are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The mapping from localization keys to callbacks, branches, individual
speakers, and playback sequence remains unresolved; callback serialization
order is not treated as playback order.
