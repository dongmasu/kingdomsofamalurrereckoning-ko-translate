# Five Small-Asset Revalidations

- Date: 2026-11-11.
- Scope: all 73 unique `default` IDs linked to five previously unrecorded
  assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Six IDs carry correction candidates and two remain on evidence-limited hold.
  No translation CSV was changed.

## Grouping Evidence and Limits

`1304720.quest_bxml` contains 19 keys about Galenun Hegem's memoir chapters
and treasure, with no explicit quest ID, NPC symbol, or dialogue handler.

`1370376.quest_bxml`, `1375390.quest_bxml`, `1375392.quest_bxml`, and
`1476188.quest_bxml` contain respectively 16, 14, 12, and 12 matched keys.
They have dialogue handlers but no explicit quest ID or NPC symbol. Their
handler names do not map individual keys to a speaker, callback, branch, or
playback order. The quest/topic labels below are asset-level grouping clues,
not per-key character attribution.

All 73 rows were compared in English, Japanese, Chinese, and active Korean.
Repeated quest-status labels and the repeated armband-trade option already
match in Korean. No Korean CSV was changed.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `31355` | Terminology / naturalness | `skill book` is rendered `기술 책`, which reads as a generic book about skills. Japanese `スキルブック` and Chinese `技能书` identify an in-game book item. Prefer the more natural item term `기술서`. | Medium-high |
| `30374` | Terminology | English `Fair Folk` is rendered `요정족`, while Japanese explicitly uses `フェイ達` and the project uses `페이(Fae)` for this people. Consider `페이(Fae)` to preserve the in-world reference. | Medium |
| `64054` | Speech level / naturalness | The line uses the honorific subject marker `께서` for `my champion`, then shifts to casual `무슨 일이지?`. Japanese keeps a teasing, conversational line without a comparable honorific shift. Remove the unsupported honorific and keep the whole line conversational. | High |
| `44671` | Title / naturalness | The title `Rogue Harvest` is rendered literally as `도적의 수확`; Japanese `悪党狩り` frames it as hunting rogues. Reconsider a natural title such as `악당 사냥`, while retaining the quest-title sense. | Medium-high |
| `32283`, `35147` | Name consistency | The same bandit is rendered `캐스터 레드핸드(Castor Redhand)` in several rows, but `카스토르` in these two references. Align the name to the established `캐스터` form. | High |

## Evidence-Limited Hold

| ID | Question | Reason and disposition |
| ---: | --- | --- |
| `29609` | `Warden of Ayten` | English names an office, Japanese uses `衛士` (guard), and Chinese uses `典狱长` (prison warden). Korean `관리인` is broad, and this asset gives no additional role evidence. Keep provisional rather than choosing a specific title. |
| `32226` | `Begone with you.` | English and Chinese are dismissive, but Japanese `じゃあね` is a casual farewell. Korean follows the dismissive readings; the intended force is not settled by this asset. |

## Retained Text

The other rows were retained after source comparison. The repeated
quest-status labels and the repeated armband-trade option already match in
Korean. The established `패란즈(Faelands)` and `트래블러(Travelers)` forms
were preserved. No individual speaker or playback order was inferred from
handler presence.

## Complete ID Sets

- `1304720.quest_bxml`: `588`, `1639`, `5354`, `8769`, `11019`, `27951`,
  `27979`, `31355`, `31868`, `32760`, `35127`, `35191`, `41188`, `42572`,
  `46858`, `47883`, `59335`, `61240`, `62246`
- `1370376.quest_bxml`: `9953`, `10198`, `11331`, `13532`, `17518`, `23105`,
  `25539`, `30374`, `32226`, `37624`, `43654`, `59385`, `59522`, `61918`,
  `63894`, `64054`
- `1375390.quest_bxml`: `12468`, `15145`, `19445`, `25557`, `29609`, `34245`,
  `35106`, `37084`, `42342`, `44671`, `56959`, `59690`, `62764`, `64926`
- `1375392.quest_bxml`: `3569`, `4896`, `6770`, `8067`, `17858`, `21073`,
  `26743`, `30658`, `31731`, `32283`, `35147`, `60826`
- `1476188.quest_bxml`: `3921`, `5266`, `8286`, `10253`, `12463`, `17627`,
  `26177`, `30689`, `38424`, `48117`, `48376`, `59897`

All 73 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
