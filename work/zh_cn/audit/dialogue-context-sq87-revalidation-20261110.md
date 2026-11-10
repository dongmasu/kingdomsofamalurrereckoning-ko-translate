# SQ87 / Adessa Prison Letter Revalidation

- Date: 2026-11-10.
- Scope: all 22 `default` keys found in `1272538.quest_bxml` (`SQ87`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ87`, the asset-level symbol
`NPC_DET_ALM_Abblier`, and nine serialized `dialog_line_*` handlers. All 22
exact-key matches were compared across active Korean, English, Japanese, and
Chinese `default` tables. The quest text concerns delivering a letter to
Esklad Teiner in Adessa Prison and claiming a reward from Abblier.

Content separates 11 dialogue-like rows from 11 journal, objective, or UI
labels. The actor symbol and handler count describe the asset, not the
individual keys. The dialogue includes references to a prisoner and the
player, but no key-to-callback mapping establishes individual speakers or
turns. Speaker attribution and playback order therefore remain unknown.

## Revalidation Findings

These are review candidates, not approval to edit the CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10248` | Naturalness / format | `편지를 전달하라` reads as a direct command, while Japanese `手紙を届ける` and the parallel `Claim your Reward` label (`보상 받기`) use an action/title form. Consider `편지 전달하기` for consistency with Korean objective phrasing. | Medium-high |
| `17030` | Naturalness / nuance | `like to think` carries a cynical “want to believe” nuance that current `생각하지만` softens. Consider `노움들은 자기네 도시에 감옥이 필요 없다고 믿고 싶어 하지만, 우리 쿼털링(Quarterlings) 하나를 여기에 처넣으려고 온갖 핑계를 다 대지.` | Medium-high |
| `18760` | Meaning | `I'm sorry` is an apology, but `그건 잘못했어` only says the theft was wrong. Consider `빵 한 덩이만 훔쳤어. 그건 미안해. 하지만 여기 갇힌 지 벌써 몇 주나 됐다고!` | High |
| `30186` | Speech level / naturalness | English and Japanese `本当か？ ... 忘れられたかと思っていたよ` are plain, but Korean shifts to `정말요? ... 잊었을 줄 알았어요.` Consider `정말? 여기 너무 오래 있어서 다들 날 잊은 줄 알았어.` The line-level register is supported; the speaker's identity and relation to adjacent lines are not assigned. | High |

The remaining rows showed no clearly supported meaning, naturalness, register,
address, honorific, or formatting problem. This is not evidence that all rows
are dialogue or that all dialogue belongs to Abblier. The checked rows contain
no embedded line breaks, runtime variables, or formatting markup.

## Coverage and Limits

All 22 asset-linked IDs were reviewed, including meaning, Korean naturalness,
speech level, address, honorifics, and format as applicable to each row.
Findings remain separate from CSV application under the review/editor
workflow. The per-ID dispositions and four-language fingerprints are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The mapping from localization keys to callbacks, branches, speakers, and
playback sequence remains unresolved; callback serialization order is not
treated as playback order.
