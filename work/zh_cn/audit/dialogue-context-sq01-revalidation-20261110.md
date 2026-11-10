# SQ01 / Ainmhi and the Wandering Well Context Revalidation

- Date: 2026-11-10.
- Scope: all 71 `default` keys in `438799.quest_bxml` (`SQ01`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ01`, the asset-level symbol
`NPC_SQ01_StrangePrisoner`, and 28 serialized `dialog_line_*` handlers. The
quest text concerns Ainmhi, a cursed wolf in human form, the sprites, and the
Wandering Well in Yolvan. Its keys include dialogue, player choices,
objectives, journal entries, and status labels. The NPC symbol and handler
count do not map individual localization keys to speakers, callbacks,
branches, or playback order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. The ledger has no separate terminology
dimension, so term-consistency findings are recorded under `meaning`.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `2958` | meaning / naturalness | Japanese explicitly identifies the strong odor as Leechwood, while the Korean `이것의 냄새` leaves the referent vague. In this group the magical `Well` is otherwise called a `샘`, not an ordinary `우물`. Prefer `샘에서 리치우드 향이 짙게 났어. 샘이 찾는 게 바로 이거야!` | High |
| `5790`, `18322`, `39730`, `48830`, `56054` | meaning / terminology | These refer to the same magical Well, consistently rendered as `샘` in other rows such as `4847`, `5329`, and `21389`, but currently use `우물`. Prefer `샘` (e.g. `샘이 사라졌어`, `샘은 찾았나?`, `샘`, `샘은 이 숲보다 오래됐고`, and `스프라이트의 샘 찾기`). | High |
| `17598`, `22432` | meaning / terminology | `Leechwood` appears elsewhere in this group as `리치우드`, including `11942`, `40448`, `59140`, and `63146`; these two rows use `거머리나무`. Prefer the established `리치우드(Leechwood)` form. | High |
| `35453` | meaning / format | `Wandering Well` is already `떠도는 샘(Wandering Well)` at `11942` and `15496`, while this journal row says `방랑하는 샘`. Prefer `떠도는 샘(Wandering Well)` for consistency. | High |
| `3707` | meaning | Japanese describes the scent and shade of a tree (`木`), while Korean broadens `this wood` to `이 숲`. Prefer `냄새와 그늘을 지닌 이 나무는 사냥에 도움이 된다.` | Medium-high |
| `5329` | naturalness | Japanese says to obtain the Well's water, and Chinese says to find it. `샘의 물 회수하기` is stiff and can mean retrieving it. Prefer the objective-style `샘물 얻기`. | High |
| `8128`, `50475`, `64633` | meaning / terminology | The same source term `meat-birds` is variously rendered `고기새`, `고깃덩이`, and `먹잇감 새`. Japanese consistently identifies chickens/chicken meat. Prefer natural, context-sensitive forms such as `맛있는 닭`, `닭고기처럼`, and `멍청한 닭`. | Medium-high |
| `26866` | speech_level / naturalness | English `Hunt well` and Japanese `うまくやれよ` are casual. `사냥 잘하게` sounds stiffer and more directive. Prefer `사냥 잘해.` Speaker attribution for this exact key is not established. | Medium |
| `56512` | naturalness | `두 발 달린 자들 무리가` is cumbersome Korean for `A pack of two-legs`. Prefer `두 발 달린 자들이 내게 이 이름을 붙였지. 그래도 도와주진 않았어!` | Medium-high |
| `63146` | format | This is the objective `Harvest Leechwood Bark`. The Korean has a bare action noun (`수확`) while other objectives in this group use action forms ending in `-기`. Prefer `리치우드 나무껍질(Leechwood Bark) 수확하기`. | High |

## Coverage

All 71 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers, and
formatting. Ten correction findings affecting 17 IDs were recorded. The only
exact-English duplicate group, `Return to the Ainmhi` at `5542` and `8854`,
already has identical Korean. No embedded line breaks or runtime markers were
found. Speaker attribution and dialogue order remain unknown at the key
level.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
