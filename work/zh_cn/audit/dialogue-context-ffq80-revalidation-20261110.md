# FFQ80 / Bera Grastar Dialogue and Quest-Text Revalidation

- Date: 2026-11-10.
- Scope: all 17 `default` keys found in `756361.quest_bxml` (`FFQ80`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ80`, the symbol
`NPC_DET_VAR_BeraGrastar`, and six serialized `dialog_line_*` handlers.
All 17 exact-key matches were compared across active Korean, English,
Japanese, and Chinese `default` tables. This establishes a strong association
with the FFQ80 quest resource, but does not map a localization key to a
specific callback.

Content separates the rows into ten dialogue/choice strings and seven
quest-log, objective, or UI strings. Seven dialogue strings are attributable
to Bera from their content and the quest context; three are player response
choices. The other seven are not dialogue. Individual callback numbers,
branch order, and playback order remain unknown. No gender or additional
speaker identity is inferred.

## Revalidation Findings

These are review candidates, not approval to edit the CSV.

| IDs | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `25301` | Naturalness | `몇 개는 팔게` treats uncountable meat as countable pieces. The choice `I'll sell some` / Japanese `いくつか売ろう` can be expressed naturally as `좀 팔게.` | Medium-high |
| `11728`, `37057` | Terminology and reference consistency | Both rows render `animal meat` as `짐승 고기`, while the same quest's objective and UI use `동물 고기`. `37057` also omits the English pairing for the same named inn paired at `11728`. Consider using `동물 고기` consistently and adding `(Thirsty Birch)` to the inn name at `37057`. | High |
| `45030` | Naturalness / pragmatic tone | `고기를 좀 서둘러 가져와!` is more abrupt than the Japanese request `早く肉を持ってきて頂戴`, while keeping the urgency. Consider `고기 좀 빨리 가져다줘. 안 그러면 저들이 내 뼈를 뜯어 먹게 생겼어!` This remains informal without adding politeness or weakening the threat. | Medium-high |
| `51001` | Naturalness | `네게서 고기 냄새가 난다고 생각했어` is understandable but stiff. English and Japanese support a more conversational line such as `역시 네게서 고기 냄새가 난다 싶었어.` | Medium |

The other rows showed no clearly supported meaning, naturalness, register,
address, honorific, or formatting problem. The Bera-attributed lines retain a
consistent informal voice. The player choices remain distinct from Bera's
speech. The repeated `Sell Animal Meat` rows (`51780`, `53459`) have identical
English, Japanese, Chinese, and Korean text.

All 17 Korean rows and aligned source rows have no embedded line breaks,
runtime variables, or formatting markup. No structural or line-break change
is indicated.

## Coverage and Limits

All 17 asset-linked IDs were reviewed for content type, meaning, naturalness,
register, address, honorifics, and format. Findings remain separate from CSV
application under the review/editor workflow. The per-ID dispositions and
four-language fingerprints are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The key-to-callback mapping and exact conversational sequence remain
unresolved; callback serialization order is not treated as playback order.
