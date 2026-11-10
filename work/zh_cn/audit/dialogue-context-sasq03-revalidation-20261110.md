# SASQ03 / Jorum Quintus Context Revalidation

- Date: 2026-11-10.
- Scope: all 68 `default` keys in `1800357.quest_bxml` (`SASQ03`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SASQ03`, the asset-level symbol
`NPC_DAL_GNO_JorumQuintus`, and 28 serialized `dialog_line_*` handlers. The
quest concerns three missing Scholia Arcana initiates, an attempted gem
theft, and their fate in the Sidhe. Its keys include NPC dialogue, player
choices, objectives, journal entries, and status labels. The NPC symbol and
handler count do not map individual localization keys to speakers,
callbacks, branches, or playback order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. Ledger statuses correspond to the listed
review dimensions.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `8735`, `15627`, `35317`, `58090` | meaning | English `initiates`, Japanese `入門者`, and Chinese `启蒙者` consistently refer to initiates. Korean varies among `수련생`, `수련자`, and the established `입문자` already used at `18787` and `33498`. Use `입문자` consistently: `8735` “조럼 퀸티스(Jorum Quintus)가 찾아보라고 한 입문자들의 시신을 발견했다. 각 시신에서는 실종 경위가 일부 기록된 일지가 나왔다. 조럼(Jorum)에게 돌아가 발견한 사실을 알려야 한다.”; `15627` “입문자들은 어디 있지?”; `35317` use `우리 입문자 세 명도 사라졌다`; `58090` use `입문자 세 명이 지부에서 달아났어`. | High |
| `44360` | speech_level | English and Japanese use plain speech. The parallel reward line at `37913` is also casual, but `44360` switches to polite `받으세요` / `할인해 드리겠습니다`. Prefer `그래, 네가 할 수 있는 건 다 했군. 고맙다는 뜻으로 이 금화를 받아. 필요하면 내 서비스도 할인해 줄게.` The asset does not independently prove the exact speaker, so this is a line-level register finding, not a speaker-wide rule. | High |
| `15581`, `30936`, `42559`, `44457` | naturalness | All four English sources use the same `Beasts killed [name]` construction; Japanese and Chinese use parallel wording. Korean alternates between passive `살해당했다`, `짐승들이 ... 죽였다`, and casual `야수들이 ... 죽였어`. Use one concise form: `야수들이 카세라(Cassera)를 죽였어`, `야수들이 버트런(Bertran)을 죽였어`, and `야수들이 알로렌(Aloren)을 죽였어`. Exact English duplicate IDs `42559`/`44457` already match. | Medium-high |

## Holds

| ID(s) | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `100` | meaning | The quest title `Order of Operations` is translated literally as `작업 순서` in Korean and Chinese, while Japanese uses `捜索依頼` (“search request”). The quest is about missing initiates and a theft, but the title may be wordplay. Do not silently replace the title without resolving that intent. | Uncertain |
| `2600`, `2975`, `20615` | meaning | The parallel labels are English `Found Cassera` / `Found Aloren` / `Found Bertran`, Japanese search-action labels, and Chinese find labels. Korean mixes completed `카세라를 찾았다` with action labels `알로렌 찾기` and `버트런 찾기`. Their UI stage is not established, so preserve them provisionally rather than assuming all three are either completed events or objectives. | Uncertain |

## Coverage

All 68 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, and formatting.
Three correction findings and two unresolved findings were recorded. The
exact-English duplicate `Beasts killed Aloren.` at `42559`/`44457` already has
identical Korean. Clear objectives, titles, journal, and quest-status rows
are marked `not_assigned` in the ledger; the remaining keys retain unknown
speaker attribution. No embedded line breaks, runtime tokens, or markup were
found.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
