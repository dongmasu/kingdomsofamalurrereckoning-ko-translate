# HP02 / Erion Raff Context Revalidation

- Date: 2026-11-10.
- Scope: all 84 `default` keys associated with `545970.quest_bxml`
  (`HP02`).
- After the user's approval, all 14 correction-candidate IDs below were
  corrected and rechecked against the four locale rows. The unresolved
  meaning question remains unchanged.
- No extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID HP02`, the asset-level symbol
`NPC_POE_DOK_ErionRaff`, five quest-target handlers, and 37 serialized
`dialog_line_*` handlers. Its text covers the three Fae staffs, their
recovery and reforging, the Deep Slumber, and exchanges with several
characters. The asset-level NPC symbol and handler count do not map any
localization key to a speaker, callback, branch, or playback order. All 84
keys were absent from the review ledger before this pass.

## Correction Candidates

These source-checked corrections were approved and applied. The table records
the final ID-specific wording and evidence used for revalidation.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `15816` | format | The objective `Retrieve the staff pieces` uses a bare noun phrase, while the established objective form is `-하기`. Use `지팡이 조각 회수하기`, without terminal punctuation to match objective labels. | Medium-high |
| `21794` | naturalness / speech level | `Of course you do. Who wouldn't? But let's talk price, shall we?` switches from deferential `그러시겠지` to casual speech within one utterance. Japanese and Chinese are casual throughout. Prefer `당연히 그렇겠지. 누가 싫어하겠어? 자, 가격 얘기나 해 볼까?` | High |
| `25204` | naturalness | `I did invest many hours of my life in its construction` is awkward as `내 인생의 몇 시간을 쏟았어`. Use `하지만 이걸 만드는 데 내 인생에서 꽤 많은 시간을 쏟았어. 손에는 아직 굳은살이 남아 있지. 돈을 받고서라면 넘길 수 있어.` | Medium-high |
| `29148` | naturalness | `우리가 네게 이미 빼앗기지 않은 것 중에` is a difficult double-negative construction for `that you haven't already taken`. Use `네가 이미 가져간 것 말고 우리가 뭘 더 내놓을 수 있겠어? 여름의 요람(Cradle of Summer)은 꺾어 갈 꽃이 아니야.` | High |
| `39341`, `39451`, `43632` | meaning / consistency / format | `Lord Callor` is variously rendered `캘러 경` and `칼러 경`, while other active rows use `칼로르 경`; Japanese consistently has `カロール卿`. Standardize these three rows to `칼로르 경(Lord Callor)`. This spelling is also supported by active rows `30061`, `30563`, and `56981`; other Callor references need their own scoped disposition. | High |
| `39451` | naturalness | `찾아 ... 되돌리도록 그를 도울 수 없게 됐다` obscures who is doing what after the player killed Callor. Use `칼로르 경(Lord Callor)을 죽였다. 이제 그가 리베너 타르수스(Rivener Tarsus), 글룸프로스트(Gloamfrost), 엔더의 불꽃(Ender's Fire)이라는 강력한 지팡이 세 자루를 찾아 여름의 요람(Cradle of Summer)으로 돌려놓도록 도울 수 없게 됐다.` | High |
| `43548` | meaning | Capitalized `the Slumber` refers to the named Deep Slumber, rendered as a ritual in Japanese. `잠을 깨우려` loses that reference. Prefer `감히 깊은 잠(Deep Slumber)을 방해하려는가?` | Medium-high |
| `46799` | meaning / naturalness | `do not flinch from the Winter` means the speaker's people do not fear winter; `겨울에도 물러서지 않지만` instead suggests they do not retreat during it. Prefer `우리 종족은 겨울을 두려워하지 않지만, 밤은 유난히 추워지고 공기에는 썩은 냄새가 가득하군. 필멸자들이 우리 모두보다 오래 살아남을 모양이야.` | High |
| `51806` | meaning / terminology | `Child of the Dust` is `먼지의 아이`, while the same group's `Children of the Dust` at `5097` and `44927` is `먼지의 자식들`. Use the singular form `먼지의 자식(Child of the Dust)` to preserve the established term. | High |
| `54396` | naturalness | `놀랍군, 돌아왔어` combines a stiff exclamation with a softer casual ending. Japanese supports `驚いたな。戻ってきたか`. Prefer `놀랍군. 돌아왔구나.` | Medium-high |
| `5782` | format | `Crack of Dawn` is a named title but appears only as `새벽의 균열`, unlike the paired English names for the staffs and other named items in this group. Prefer `새벽의 균열(Crack of Dawn)`. | Medium-high |
| `32610`, `55662` | naturalness / speech level | The English differs only in capitalization of `gold`/`Gold`; Japanese and Chinese are identical, but Korean uses `돈은 내가 내지` and `돈을 낼게`. Align the player responses to `돈은 내가 낼게. ($HP02.bribe_value$ 골드)`. | Medium-high |

## Hold

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `33002` | meaning | `May it bring clarity to the Deep Slumber` is rendered literally as `깊은 잠을 밝히는 데 도움이 되길`. Japanese describes the ritual becoming clearer, while Chinese refers to bringing wakefulness to those asleep. The exact sense of `clarity` is not established; do not choose between these readings without stronger context. | Uncertain |

## Coverage

All 84 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Twelve correction findings affect 14 unique IDs;
one meaning case remains unresolved. Four exact-English duplicate groups
already match across all four locales: `Rivener Tarsus` (`493` / `23947`),
`I will return it.` (`15691` / `30102`), `I still want your staff.`
(`20714` / `22895`), and `I'd like your staff.` (`36983` / `38892`).
No embedded line breaks or markup were found. The two bribe choices preserve
the `$HP02.bribe_value$` runtime token.

All 14 correction-candidate IDs were applied and rechecked for meaning,
naturalness, register, name pairing, markers, and formatting. The uncertain
reading at `33002` remains on hold.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
