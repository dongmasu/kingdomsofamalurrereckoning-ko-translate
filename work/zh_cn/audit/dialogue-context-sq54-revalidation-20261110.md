# SQ54 / Family Rivalry Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 114 `default` keys associated with `588388.quest_bxml`
  (`SQ54`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ54`, the asset-level symbol
`NPC_DET_ALM_Beorn`, and 46 serialized `dialog_line_*` handlers. The text
covers Steg Darkvari and Hrindi Zungar, the rival mining families, Beorn and
the Whitestone cage, and related quest, journal, objective, and UI text. The
asset-level NPC symbol and handler count do not map individual localization
keys to speakers, callbacks, branches, or playback order. Speaker attribution
and dialogue order therefore remain unknown at the key level.

The name-consistency pass also found ID `26210` in
`589493.quest_bxml`, outside this asset's 114-key set. Its line names both
Steg and Hrindi, so it is tracked below as a supplemental cross-asset
reference, not as evidence that the key belongs to `SQ54` or to a specific
speaker.

## Correction Candidates

These are read-only findings and proposed text, not permission to edit the
active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `3838`, `22868`, `23863`, `27382`, `37649`, `38842`, `43259`, `59769` | meaning / terminology consistency | The same human-sized cage is variously called `우리`, `새장`, `철창`, and `감방`. Prefer `철창` for this physical cage and reserve `감옥` for the prison institution. Examples: `3838` → `철창 열쇠가 필요해.`; `22868` → `철창 열쇠가 필요하다고? 정말 웃기는군.`; `23863` → `화이트스톤(Whitestone) 마을 한가운데 있는 철창에 갇힌 죄수... 철창 문 열쇠는...`; `37649` → `철창에 갇혀 지내는 동안...`; `43259` → `철창 문 열기`; `59769` → `스테그(Steg)에게 돌아가 철창 문을 열고...` | Medium-high |
| `37567` | format | Quest objectives use the established `-하기` form, but `Steal the cage key` is imperative `철창 열쇠를 훔쳐라`. Prefer `철창 열쇠 훔치기`. | High |
| `5462` | meaning / naturalness | `Family Rivalry` is rendered `가족 간의 경쟁`, which suggests competition within a family. The quest concerns hostile mining clans; prefer the title `가문 간의 갈등`. | High |
| `9421` | meaning / title | `Runaways` is rendered `도망친 자들`, while Japanese `駆け落ち` and the quest's two lovers point to elopement. Prefer `사랑의 도피`. | Medium-high |
| `20440`, `25417`, `30354`, `43903`, `44635`, `59386` | format / name consistency | These rows name Steg or Hrindi without the English form, while comparable uses in the same group include it. Add the name in parentheses: `스테그(Steg)는 어때?`, `흐린디(Hrindi)에게 줄...`, `스테그(Steg)가 그걸 갖고 있다는 걸 안 순간...`, `흐린디(Hrindi)는 떠났어.`, `흐린디(Hrindi)를 못 봤어?`, and `스테그(Steg)에게 돌아가기`. | High |
| `57573` | meaning / name consistency | `Zungar` is consistently `중가르` elsewhere in the working localization; this row has `준가르` and omits the English form. Prefer `중가르(Zungar)라는 성`. | High |
| `37431` | meaning / naturalness | The hated name `Zungar` is Hrindi's family name. Korean `내 이름` is less precise than the context and Chinese `姓氏`; prefer `내 성을 큰 소리로 부르지 마. 듣기 싫어. '중가르(Zungar).' ...`. | Medium-high |
| `54137` | meaning / place-name consistency | `Snaketail Trench` is `스네이크테일 참호`, but related references describe the Snaketail canyon/river trench as a natural ravine. Prefer `스네이크테일 협곡(Snaketail Trench)`. | Medium |
| `15752` | naturalness | `흐린디 중가르가 내게 말했을 때, 의도를 아주 분명히 밝혔어` is grammatically understandable but stiff. Prefer `흐린디 중가르(Hrindi Zungar)는 내게 속내를 분명히 밝혔어. 은신처에 있는 스테그(Steg)에게 돌아가 무슨 일이 있었는지 알려야겠어. 은신처는 스네이크테일 강(Snaketail River) 협곡 아래에 있어.` | Medium-high |
| `15276` | meaning / naturalness | `Try to catch him alone` is translated `혼자 있을 때 잡아`, which can sound like physically capturing Beorn. Japanese `一人になった時を狙え` supports waiting until he is alone. Prefer `베오른(Beorn)의 부하들은 충성심이 지나칠 정도야. 부하들 눈을 피해 베오른이 혼자 있을 때를 노려. 그러지 않으면 우리 약속도 금방 깨질 거야.` | Medium-high |

Supplemental cross-asset candidate:

| ID | Linked asset | Finding and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `26210` | `589493.quest_bxml` | `You mean Steg? ... so he and Hrindi can be together.` The translation is natural, but both names lack the English forms used elsewhere. Prefer `스테그(Steg) 말이야? 착한 애야. 나무토막처럼 멍청하긴 해도 정말 다정하지. 어서 풀려나서 흐린디(Hrindi)와 함께 지낼 수 있으면 좋겠어.` This is a cross-asset name reference only, not proof of SQ54 membership or speaker identity. | High |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `14051` | meaning | `the only part of my name I wish to hold onto` may refer to the family name or to the parchment as the remaining piece of family identity. Chinese specifies surname, but the English and Japanese do not settle the metaphor. Retain the current Korean provisionally. | Uncertain |

## Coverage

All 114 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology, proper-name rendering, repeated English text,
runtime markers, markup, and line breaks. The six exact-English duplicate
groups (12 rows) already have matching Korean translations. The
`$SQ54.bribe_value$` token is preserved in both matching gold-offer rows; no
embedded line breaks or other markup were found.

Ten correction findings affecting 22 of the 114 asset keys, one supplemental
cross-asset name finding, and one unresolved meaning question were recorded.
No key was mapped to a specific speaker, callback, branch, or playback
position, and no Korean CSV edit was applied.
