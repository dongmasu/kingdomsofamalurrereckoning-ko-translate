# SQ102 / Aluck Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 58 `default` keys found in `1310265.quest_bxml` (`SQ102`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ102`, the asset-level symbol
`NPC_ALA_UNS_Aluck`, and 23 serialized `dialog_line_*` handlers. Its text
concerns Aluck, the Ashmoor survivors, Gask, and the Tuatha camp Cadsymyr in
Twilight Pass. The exact key matches associate these rows with the asset, but
do not map individual keys to callbacks, speakers, branches, addressees, or
playback positions. The Aluck symbol therefore does not establish that Aluck
speaks every row.

All 58 rows were compared at the same ID across the active Korean, English,
Japanese, and Chinese `default` tables. The group includes quest-log entries,
objectives, labels, and dialogue-like text; the asset scan does not establish
which specific keys are spoken. Speaker attribution and dialogue order remain
unknown.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4778` | Formatting / terminology | `Witch Knights` is written `마녀 기사` elsewhere in this group, including `39398`, but this row has the closed compound `마녀기사들`. Consider `그의 카드시미르(Cadsymyr) 야영지는 북쪽에 있어. 하지만 페이(Fae)와 그의 마녀 기사들까지 물리쳐야 해. 널 믿는다.` The source and aligned Japanese/Chinese preserve the same objective and direct reassurance. | High |
| `9016` | Name pairing | English, Japanese, and Chinese all identify Aluck as the person the player should return to. Add the established English pairing: `알럭(Aluck)에게 돌아가`. No speaker is inferred from this journal-like first-person text. | High |
| `12225` | Name spelling | The active form `카즈시미르(Cadsymyr)` conflicts with the established `카드시미르(Cadsymyr)` at `4778`, `38816`, and `46978`. Japanese `カジミーア` and Chinese `卡德斯米尔` support the same proper name. Standardize only this occurrence's Korean spelling. | High |
| `17207` | Name spelling; meaning held | `캐드심어(Cadsymyr)` is inconsistent with the established name. Consider `카드시미르(Cadsymyr)` for the name only. The prior sentence-level uncertainty remains open; this pass does not certify the rest of the sentence or infer its speaker. | High for the name; unresolved for the full sentence |
| `25185` | Name spelling / pairing | `앨럭` differs from the established `알럭(Aluck)` at `10538`, `24992`, and `46831`. Consider `알럭(Aluck)에게 돌아가기`, preserving the objective-label form. | High |
| `37772` | Meaning | English `The first of Gask's soldiers` and aligned Japanese `第一陣` / Chinese `第一批` specify the first wave or vanguard. The current Korean omits that detail. Consider `가스크(Gask)의 선발대가 고갯길을 점령해 이븐타이드(Eventide)와 애시무어(Ashmoor)를 갈라놓고, 우리 사이의 모든 연락을 끊었다.` | High |
| `44431` | Meaning / naturalness / name pairing | `Aluck and the other survivors of Ashmoor` is compressed into `애시무어 생존자 알럭과 일행`, which obscures that Aluck and the other Ashmoor survivors made the request. Cadsymyr and Aluck also lack English pairings here. Consider: `알럭(Aluck)과 애시무어(Ashmoor)의 다른 생존자들이 카드시미르(Cadsymyr)라는 거대한 투아사(Tuatha) 야영지를 파괴해 달라고 했다. 그 야영지는 고갯길 위에 있으며, 가스크(Gask)라는 투아사(Tuatha)와 그의 마녀 기사(Witch Knight) 장교 둘이 다스리고 있다. 우선 마녀 기사들을 찾아 쓰러뜨려야 한다.` Japanese and Chinese support the Aluck-plus-survivors relationship and the same sequence of objectives. | High |
| `45244` | Naturalness / name pairing | `카즈시미르` is inconsistent with the established Cadsymyr spelling, and the clause `그의 행동이 곧 그를 규정하지` is stiff. Consider `가드플로(Gadflow)의 수하이자 카드시미르(Cadsymyr)의 우두머리 마녀 기사(Head Witch Knight). 행동만 봐도 어떤 자인지 알 수 있지.` Japanese's final clause differs from the English “one whose acts define him,” so the suggestion follows English meaning and is not treated as a speaker-voice finding. | Medium |
| `46978` | Name pairing | The Korean meaning is supported by the source, but `카드시미르` lacks its English pairing. Consider `카드시미르(Cadsymyr)` without otherwise rewriting the sentence. | High |
| `51682` | Formatting / terminology | `Kill the Witch Knights` is rendered `마녀기사 처치하기`, while the same group uses `마녀 기사`. Consider `마녀 기사 처치하기`. | High |
| `60546` | Naturalness / speech level | `승리는 그대의 것이 될 것이다` is more literary and elevated than English `Victory will be yours` and Japanese `勝利は君のものだ`. Consider `승리는 네 것이 될 거야.` The suggestion follows the aligned plain-style wording; the specific speaker remains unconfirmed. | Medium |

The other 47 rows showed no clearly supported correction in this pass.
Within the group, the exact duplicate English label `Gask` occurs at `5787`
and `33676`; both Korean rows consistently read `가스크(Gask)`. All four
language rows are free of embedded line breaks, runtime placeholders, and
markup.

## Coverage and Limits

All 58 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names, and formatting. Eleven rows have findings:
ten are correction candidates, while `17207` retains its earlier
sentence-level uncertainty alongside the separate name-spelling proposal.
The per-ID dispositions and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. No translation CSV or extracted game asset was
changed.
