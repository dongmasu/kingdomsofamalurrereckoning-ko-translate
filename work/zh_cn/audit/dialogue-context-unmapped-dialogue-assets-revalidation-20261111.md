# Unmapped Dialogue-Handler Asset Revalidation

- Date: 2026-11-11.
- Scope: 12 `default` IDs across four assets with dialogue handlers but no
  quest ID or NPC symbol.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are one wording proposal and one evidence-limited hold. No
  translation CSV was changed.

## Grouping Evidence and Limits

`1392303.quest_bxml` has three matched IDs and three
`dialog_line_*` handler names; `580435.quest_bxml` has four IDs and four
handlers; `592788.quest_bxml` has two IDs and two handlers; and
`695920.quest_bxml` has three IDs and two handlers. None has an explicit
`QUEST_ID` or `NPC_` symbol. Their English strings include conversational
greetings, farewells, and remarks, but asset-level handler counts do not map
any ID to a specific speaker, callback, or playback position. The four assets
are therefore recorded separately, not treated as one character or
conversation.

All 12 rows were compared in English, Japanese, Chinese, and active Korean.
No embedded line breaks, runtime placeholders, or markup occur in these IDs.
Register was judged row by row; no speaker identity or cross-row voice
consistency was inferred.

## Correction Candidate

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `55398` | Meaning / naturalness | `dealt with the Headsman` means the player defeated him; Japanese explicitly uses `倒してくれた`. `처리해 준` is understandable but vague and slightly bureaucratic for this conversational line. Consider `우릴 대신해 형리(Headsman)를 쓰러뜨려 준 뒤로 상황이 조금 진정됐어.` | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `28769` | Naturalness / vocalization | The English `Hkkhnt...`, Japanese `ううん...`, and Chinese `呼……` suggest a non-lexical vocalization but do not agree on its sound. The Korean `흐크크……` may read as laughter. Without audio or surrounding scene evidence, hold rather than guess a replacement. |

## Retained Text

The other ten rows were retained. In particular, `또 만났네`, `잘 가`, and
`야영지에 돌아온 걸 환영해, 나그네` are natural conversational lines, but
their presence in the same asset does not prove they share a speaker. The
poetic vocative `아, 나의 빛을 가져오는 자여` was retained because the
available sources support that address and do not establish a less elevated
speaker voice.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

- `1392303.quest_bxml`: `18671`, `25998`, `56691`
- `580435.quest_bxml`: `11853`, `23196`, `28769`, `62085`
- `592788.quest_bxml`: `7786`, `50370`
- `695920.quest_bxml`: `23388`, `43093`, `55398`
