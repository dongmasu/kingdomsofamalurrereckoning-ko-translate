# SQ108 / Decanus Paige Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 128 `default` keys found in `1332203.quest_bxml` (`SQ108`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ108`, the asset-level symbol
`NPC_DET_GNO_DecanusPaige`, and 64 serialized `dialog_line_*` handlers. Its
text concerns Orsinian Paige's plan to exploit the conflict between the
Jottun and Kobolds around Tearscotter Mine, along with quest objectives,
journal entries, labels, and player choices.

All 128 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map individual keys to Paige, other speakers, callbacks, branches,
addressees, or playback positions. The NPC symbol and callback count are
asset-level evidence only.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV. `candidate` means an editor decision is warranted; `uncertain` preserves
an unresolved reading rather than proposing a speculative correction.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `10365` | Naturalness / register | `My beautiful, beautiful plan!` is translated as `나의 아름다운, 아름다운 계획이여!`. Japanese uses `見事な` and Chinese `出色`, supporting a boastful `멋진`/`훌륭한` reading rather than the archaic vocative `계획이여`. Consider `내 멋진, 멋진 계획!`, preserving the repeated, self-congratulatory emphasis. No individual speaker is assigned from the asset symbol. | Medium-high |
| `15964` | Naturalness | English says the new Ragnarr will see an unignorable challenge and a battle he thinks he can win; Japanese says he will notice them and Chinese also uses “see.” `도전과 ... 싸움을 발견하게 될 거야` is understandable but awkward Korean. Recast the clause naturally while retaining both ideas; do not infer a specific battle or sequence. | Medium |
| `18902` | Meaning | `orchestrated, bloody battle` is rendered as a bloody battle that occurred through Paige's carefully laid plan, but the deliberate staging is muted. Japanese says the plan succeeded in causing the battle. Consider making the engineered provocation explicit, e.g. that Paige planned or staged the bloody clash between Ragnarr and the local Kobolds. | Medium-high |
| `412`, `18902`, `19797`, `28142` | Terminology | The same source title `Praetorian` varies among `근위대장`, `프레토리안`, and `군단병`. A related reviewed group already uses `프레토리안 근위대(Praetorians)` for the organization. Consider using the established `프레토리안` form for this title while preserving each row's sentence and name structure; confirm the singular rank/title rendering before applying. | Medium-high |
| `16171`, `16988`, `63399` | Name/term pairing | Capitalized `the Chosen` is rendered as `선택받은 자(들)` without its English label, while this group already pairs `Chosen` at `61364` and pairs the full title `Ragnarr's Chosen` at `35183`, `43071`, and `63954`. Consider adding `(Chosen)` only to the standalone title references, retaining the full-title wording where present. | High |
| `18902`, `29627`, `63399` | Name pairing | Paige is identified elsewhere in this group as Orsinian Paige and his name is paired at `16988`; these rows leave one or more explicit `Paige` references unpaired. Add `Paige` to the corresponding name annotations without changing the sentence or asserting a callback-level speaker. | High |
| `28142` | Naturalness | `played out like clockwork` is translated literally as `시계처럼 정확하게 진행됐다`. Japanese and Chinese describe the plan as succeeding or proceeding smoothly. Consider a natural Korean equivalent such as `계획은 빈틈없이 들어맞았다`, preserving the success and precision. | Medium |
| `54573` | Meaning / terminology | `Delicate, hm?` responds to `delicacy` at `40274`, where Korean already uses `섬세함`; `민감하다고?` shifts the meaning to sensitivity. Japanese `微妙` and Chinese `精致` support the context's finesse/subtlety reading. Consider `섬세하다고? 그게 무슨 뜻이지?` | High |

The `Praetorian` item is a consistency candidate, not a claim that every
source use denotes the same individual rank or unit. `14043`'s polite
honorific ending and `47710`'s formal address were reviewed as isolated text;
without a proven speaker-to-key mapping, they are not treated as voice
inconsistencies.

Three exact-English duplicate groups occur within the asset, and all have
identical Korean text:

| IDs | English |
| --- | --- |
| `9745`, `19484` | `Coaxing the Ragnarr to show his face requires a subtlety that our local Castellan lacks.` |
| `25022`, `26895` | `Clan Totem` |
| `29265`, `31699` | `Why not ask the Warsworn here?` |

All four locales have zero embedded line breaks and no runtime markers or
markup in the 128 rows. The remaining 117 rows showed no clearly supported
correction in this pass.

## Coverage and Limits

All 128 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. The findings are
recorded with four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`412`, `1218`, `1220`, `1787`, `1844`, `2165`, `3171`, `3725`, `5577`,
`5812`, `5916`, `6175`, `7036`, `8634`, `9705`, `9745`, `10098`, `10358`,
`10365`, `10427`, `11886`, `11924`, `13257`, `13275`, `14043`, `15268`,
`15964`, `16171`, `16215`, `16225`, `16565`, `16906`, `16988`, `17218`,
`17839`, `18902`, `19208`, `19484`, `19744`, `19797`, `19952`, `20183`,
`20307`, `20771`, `22425`, `23522`, `24269`, `25022`, `25339`, `25477`,
`25845`, `26229`, `26895`, `27195`, `28142`, `29265`, `29482`, `29627`,
`30011`, `31088`, `31497`, `31699`, `31712`, `33325`, `35183`, `37732`,
`37840`, `38137`, `38840`, `38946`, `39155`, `39259`, `39434`, `40033`,
`40274`, `40869`, `41579`, `41721`, `42792`, `43071`, `43112`, `43784`,
`43806`, `44252`, `44259`, `44480`, `44586`, `44724`, `45439`, `45441`,
`45887`, `46030`, `46454`, `46870`, `47688`, `47710`, `48270`, `48355`,
`48379`, `49079`, `49197`, `50027`, `50204`, `52925`, `54517`, `54573`,
`55259`, `55576`, `55592`, `56201`, `56523`, `56601`, `56891`, `57090`,
`57155`, `57801`, `58581`, `59264`, `60219`, `60977`, `60978`, `61364`,
`61382`, `61410`, `61981`, `63399`, `63954`, `64028`.
