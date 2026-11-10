# SQ140 / Colm and Giran Alba Context Revalidation

- Date: 2026-11-10.
- Scope: all 76 `default` keys in `1576008.quest_bxml` (`SQ140`).
- Read-only review: no translation CSV or extracted resource was modified.
- English anchors meaning; Japanese guides voice/register; Chinese supports
  the comparison. Glossary decisions remain authoritative for established names.

## Grouping Evidence

The index records `QUEST_ID SQ140`, `NPC_DET_LJO_ColmAlba`, and 25
serialized `dialog_line_*` handlers. The text covers Colm's search for his
twin brother Giran, Belen's Testament, and the Tomb of Fyragnos.
The group contains dialogue, player choices, objectives, journals, labels,
and the source debug string `FAIL LINE`; it is not one character's monologue.
The NPC symbol does not establish speaker-at-key or callback/order mapping.
Four-language comparison was performed for every ID listed below.

## Correction Candidates

Proposals require a separate accepted editor pass. Dimensions in this table
also supply the per-ID ledger statuses; IDs not flagged remain `not_flagged`.

| IDs | Dimensions | Evidence, current text, and proposed correction | Confidence |
| --- | --- | --- | --- |
| `1587`, `2524`, `3751`, `9940`, `12102`, `21894`, `24462`, `25576`, `36557`, `38081`, `50834`, `50980`, `55857`, `58555`, `62510`, `63895`, `63906` | meaning, format | English `the Testament` refers locally to the same cult explicitly named `Belen's Testament` at `2445`/`27592`. Japanese repeatedly uses `ベイレン結社`, Chinese `贝伦神约`. Korean instead varies between `테스타먼트`, `테스타먼트(Testament)`, `테스타먼트(The Testament)`, `테스타먼트 교단(Testament)`, and `벨렌의 테스타먼트`. Use established `벨렌의 성약단(Belen's Testament)` at these source-local faction mentions. This is not a global alias for every English `testament`; deity-only references at `17935`, `26471`, and `28395` stay unchanged. | High |
| `9940`, `30747`, `31532`, `44520`, `59156` | format | English explicitly names `Colm`; Japanese `コルム` and Chinese `科姆`/`科尔姆` confirm it. Korean has bare `콜름` in these rows, unlike paired `콜름(Colm)` elsewhere in this group. Pair the short name without expanding it to `Colm Alba`. In `44520`, `콜름이 형제인 ...을 찾도록 도왔다` also obscures the possessor; prefer `콜름(Colm)이 자신의 형제인 기란(Giran)을 찾도록 도왔다.` for the first sentence. | High |
| `44520` | naturalness | English `I was forced to slay him`, Japanese `殺すしかなかった`, Chinese `我只能杀了他` explicitly express lack of choice. Current ending `나는 그를 베어야 했다` is less direct and adds a blade-specific image. Prefer `안타깝게도 기란(Giran)은 죽음의 교단인 벨렌의 성약단(Belen's Testament)에 빠져 있었고, 나는 어쩔 수 없이 그를 죽여야 했다.` | Medium-high |
| `46748`, `58818` | meaning | Exact English duplicates: `Those of us in camp trust each other, but aid is not as... forthcoming.` Japanese `あまり助け合いはしない` makes the mutual assistance explicit; Chinese suggests incoming reinforcements but does not override English/Japanese. Current `야영지 사람들은 서로 믿지만, 지원은... 좀처럼 오지 않아.` implies help coming from outside. Both: `야영지 사람들은 서로 믿긴 하지만... 선뜻 서로 도와주지는 않아.` | High |
| `8582` | naturalness | English `I have reason to believe he is hiding ...`, Japanese `隠れていると信じる根拠がある` and Chinese `我有理由相信他就藏在...` are dialogue, not a journal statement. Current `그가 변경지 지하로 뻗은 유적, ...에 숨어 있다고 믿을 만한 근거가 있다.` is conspicuously report-like. Prefer `그가 마치스(Marches) 지하로 뻗은 유적, '피라그노스의 무덤(Tomb of Fyragnos)'에 숨어 있다고 볼 만한 근거가 있어.` This also aligns the local named-region reference with `2524`, without asserting its exact geographical boundary. | Medium-high |
| `22956` | naturalness | English `Because of his command of magic, he was selected to join the Scholia Arcana.` Japanese `魔法の才能があったため、アルカナ大学に選ばれた`; Chinese also describes selection for magical proficiency. Current `마법을 다루는 능력 덕분에 ...에 합류하도록 발탁되었다.` is administrative narration in an account of a brother. Prefer `마법에 능해서 스콜리아 아르카나(Scholia Arcana)에 들어갈 기회를 얻었어.` No polite/plain switch is alleged solely from the asset association. | Medium-high |
| `24144` | naturalness | English objective `Speak with Giran`, Japanese `ガイランと話す`, Chinese `和基兰交谈`; current `기란(Giran)과 대화` differs from the `-하기` objective form in `7637`/`13255`/`31532`. Prefer `기란(Giran)과 대화하기`. | High |
| `57294` | naturalness, address | English `It might lead us to him`, Japanese `そこが彼へつながるかも知れん`, Chinese `这可能会引领我们找到他` refer to finding the missing brother. Current `그곳이 그자에게 이어질지도 몰라` is literal and introduces a distancing `그자`. Prefer `피라그노스의 무덤(Tomb of Fyragnos)은 협곡 아래에 있는 지하 유적이야. 그곳으로 가면 그를 찾을 수 있을지도 몰라.` | Medium-high |

## Holds and Source Differences

| IDs | Dimensions | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `48067` | naturalness | The existing Giran name review explicitly retained an ambiguity in the opening `Have I...?` / `私が...？` / `我…?`. Current `내가...? 물론 그렇지.` is not changed on the strength of the asset alone. The local player choice at `3452` suggests an elliptical response about trying to speak to Giran, but there is no proven reply edge. Hold a rewrite such as `얘기해 봤냐고...?` until the link is established. | Uncertain |
| `62309` | meaning | English `You're better than this.` supports current `이런 식으로 굴 사람은 아니잖아.`; Japanese `他の連中より優秀そうだな` instead compares Giran to other cultists, matching the subject of response-like `21894`. Chinese `你能做得更好` follows English more closely. Retain current English-led wording and flag the reference conflict; do not invent a branch connection or flatten it to the Japanese reading. | Uncertain |
| `50834` | meaning | English `In Giran's name` is rendered `기란(Giran)의 이름을 걸고`; Japanese `ガイランのためにも` suggests acting for his sake. Chinese follows the name construction. `기란(Giran)을 위해서라도` is a plausible improvement, but the literal oath versus memorial nuance is not settled by the asset. The separate faction-name correction remains a candidate. | Uncertain |

## Other Checks

- All four exact-English duplicate pairs already have identical Korean:
  `25576`/`63906`, `26471`/`28395`, `46748`/`58818`,
  `50893`/`54257`. Any accepted changes should preserve the matching pairs.
- `brother` is not expanded into older/younger brother. The explicit
  twin statement at `39009` is preserved.
- `subjects` at `55857` can denote experimental subjects in the necromancy
  context; no automatic replacement with political subjects is proposed.
- `28308`'s reward availability and `56627`'s grief-stricken recollection do
  not justify a confident new meaning correction in this pass.
- `FAIL LINE` at `31138` is the same debug text in English/Japanese and is
  not treated as untranslated player-facing dialogue without further evidence.
- No embedded line breaks, runtime braces, or markup occur in these 76 rows
  in any of the four locales. Speech level, address, and honorifics were
  checked individually; changing recipients and speaker identities must not
  be flattened into a single NPC voice. No proven polite/plain continuity
  error is asserted.

## Coverage

All 76 IDs were checked for meaning, naturalness, speech level, address,
honorifics, terminology, and structure as applicable. Source fingerprints
and per-dimension statuses are stored in `dialogue-context-review-ledger.tsv`.
Speaker-at-key, branch flow, and playback order remain unknown.

`120`, `1587`, `2445`, `2524`, `3378`, `3452`, `3751`, `5603`, `7466`,
`7637`, `8582`, `9800`, `9940`, `11097`, `12102`, `13255`, `13390`,
`17935`, `19893`, `21084`, `21894`, `22732`, `22869`, `22956`, `23325`,
`24144`, `24462`, `25576`, `26471`, `26485`, `27340`, `27592`, `28308`,
`28395`, `30747`, `31138`, `31532`, `32756`, `35932`, `36557`, `37570`,
`37824`, `38081`, `39009`, `41806`, `44241`, `44301`, `44520`, `46126`,
`46748`, `47992`, `48067`, `50834`, `50893`, `50980`, `51621`, `52459`,
`52863`, `53149`, `54257`, `55698`, `55857`, `56244`, `56627`, `57294`,
`57609`, `57712`, `58555`, `58818`, `59156`, `62309`, `62510`, `62791`,
`63466`, `63895`, `63906`.
