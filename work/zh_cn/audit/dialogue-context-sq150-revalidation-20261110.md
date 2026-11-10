# SQ150 / Lina Ardeen Context Revalidation

- Date: 2026-11-10.
- Scope: all 61 `default` keys in `1637499.quest_bxml` (`SQ150`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ150`, the asset-level symbol
`NPC_DET_LJO_LinaArdeen`, and 22 serialized `dialog_line_*` handlers. The
quest concerns Lina Ardeen, the Travelers, Mayor Eswin, and a stolen document
in Whitestone. Its keys include NPC dialogue, player choices, quest-log
sentences, objectives, and UI labels. The NPC symbol and handler count do not
map individual localization keys to speakers, callbacks, branches, or
playback order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. Ledger statuses correspond to the listed
review dimensions.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `6916` | format | English names Bera, and Japanese ベラ and Chinese 贝拉 corroborate the name. The Korean has `베라` without the English annotation; elsewhere the active translation uses `베라(Bera)` for this short name. | High |
| `30375` | format | English names the Snaketail and Japanese uses スネークテイル; Chinese renders the place as 蛇尾河. The existing Korean `스네이크테일` omits the English annotation used for this name elsewhere. Preserve the source-local short form rather than expanding it to `Snaketail River`. Prefer `스네이크테일(Snaketail)에서 벌어진 일은 트래블러(Travelers) 탓이 아니야. 노움들 탓이지. 우린 공황이 번지는 걸 막았어!` | High |
| `40510` | naturalness | English uses the idiom `A boot full of vipers` for a hostile place; Japanese and Chinese retain the image, but the current Korean `장화 속에 독사가 가득한 꼴` reads as a literal, awkward comparison. Prefer `여기서도 사람들이 성가시게 굴어? 화이트스톤(Whitestone)은 독사 소굴이나 다름없어. 정말 질색이야.` | Medium-high |
| `42461` | naturalness, format | English `Job well done, Lina` and Japanese `ご苦労なことね` are sarcastic in context. The current `수고했어, 리나` can read as sincere, and the short name lacks its English annotation. Prefer `그래, 문서를 읽었어? 그러지 말았어야지. 아무도 보지 못하게 여기서 빼내야 했는데. 참 잘했네, 리나(Lina).` | Medium-high |

## Hold

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `44521` | meaning | English `I should have said that`, Chinese 我应该那么说的, and the current Korean mean the speaker regrets not saying it. Japanese `言わなければよかったわ` instead means the speaker regrets saying it. Do not choose or harmonize these opposite meanings without more context; retain the current Korean provisionally. | Uncertain |

## Coverage

All 61 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, and formatting.
Four correction candidates and one source-conflict hold were recorded. No
exact English-duplicate group occurs within these 61 keys. The clearly
non-dialogue title, objective, status, and journal rows are marked
`not_assigned` in the ledger; the remaining keys retain unknown speaker
attribution. No embedded line breaks, runtime tokens, or markup were found.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
