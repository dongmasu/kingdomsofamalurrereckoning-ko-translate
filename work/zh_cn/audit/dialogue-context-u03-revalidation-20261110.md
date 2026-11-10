# U03 / Coilsbain Cavern Context Revalidation

- Date: 2026-11-10.
- Scope: all 82 `default` keys associated with `616680.quest_bxml`.
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains the NPC symbol `NPC_DAL_ALM_ThaddeusHoln`, 19 serialized
`conditional_quest_u03_quest_target_*` handlers, and 32 serialized
`conditional_quest_u03_dialog_line_*` handlers. Its strings include
U03-prefixed identifiers such as `U03_Jottun03`, `U03_BossTroll`, and
`U03_Jottun12`. The asset index's `QUEST_ID` extraction reports `ACTOR`;
therefore, this report treats U03 as a context supported by the serialized
U03-prefixed handlers and identifiers, not as a parsed `QUEST_ID U03`.

The NPC symbol and handler counts are asset-level evidence only. They do not
map individual localization keys to speakers, callbacks, branches, or
playback order. All 82 keys were absent from the review ledger before this
pass.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `18293` | speech level | The Korean starts and ends politely (`떨어졌어요`, `물어보세요`) but shifts to the plain `왔어야 하는데`. Japanese is consistently polite. Prefer `비축분이 거의 다 떨어졌어요. 오늘 아침에 더 들어왔어야 하는데요. 궁금하면 그 사람한테 물어보세요.` | High |
| `32525` | naturalness | `clear out the cave` is rendered literally as `동굴을 깨끗이 정리해 주세요`, which sounds like cleaning rather than clearing enemies from the cave. Prefer `좋아요. 북쪽 코일스베인(Coilsbain)에 있는 보가트(Boggart) 소굴로 가서 동굴을 소탕해 주세요.` Japanese `掃除` and Chinese `清理` support clearing out the cave. | Medium-high |
| `38292` | meaning | In `They drove the boggarts out... and right into our town`, the Jottun drive the boggarts from the caves into town. `그놈들이 우리 마을로 쳐들어왔지` can instead make the Jottun the ones who invaded. Prefer `얼마 전 요툰(Jottun) 몇 놈이 동굴 안을 파헤치기 시작했어. 보가트(Boggart)들을 몰아내 우리 마을까지 내몰았지.` Japanese explicitly says the boggarts were driven out and came toward town. | High |
| `42063` | meaning | `We weren't going to stop them` describes having no intention of stopping them; `우린 막지 않았어요` can say only that the group did not stop them. Japanese says they did not even try, and Chinese says they did not plan to stop them. Prefer `우린 막을 생각이 없었어요.` | High |
| `45360` | meaning | `It won't likely kill you` is probabilistic, while `죽지는 않을 거예요` sounds more certain. Japanese likewise says it is very unlikely to be fatal. Prefer `죽을 가능성은 거의 없어요. 하지만 새끼 고양이처럼 기운이 빠지죠. 이 근방에선 그 정도면 죽은 거나 다름없어요.` | Medium-high |
| `48880` | naturalness | `무례하게 굴려던 건 아닙니다` is awkward Korean, and the last clause shifts from `-습니다` to `-군요`. Prefer `케스터 바클레이(Kester Barclay)입니다. 무례하게 굴 생각은 아니었습니다. 죄송합니다. 이번 위기 때문에 조금 예민해졌습니다.` | High |
| `62168` | speech level / naturalness | `당신이야` shifts to casual speech despite the respectful address and the polite Japanese `なのです`. Prefer `당신은 이 마을의 가장 큰 희망이에요.` | Medium-high |

## Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `34102`, `35542`, `54031`, `59689` | speech level | The Korean is casual while the Japanese is polite. The key-to-dialogue-node mapping does not establish each line's speaker or conversational stage, so keep these as register questions rather than changing them on asset-level NPC evidence alone. |

## Coverage

All 82 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Seven correction findings affect seven unique IDs;
four possible register mismatches remain unresolved. The three exact-English
duplicate groups already match across all four locales: `1475` / `14757`,
`11015` / `12489`, and `13287` / `14952`. No embedded line breaks or runtime
placeholders were found. The vocalization marker at `18396` is present in all
four locales and was retained.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
