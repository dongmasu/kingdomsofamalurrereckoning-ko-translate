# Asset Revalidation: `1367283.quest_bxml` (`Haxhi_NQD` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 104 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- Four correction-candidate IDs and one evidence-limited hold.
- No translation CSV or extracted asset was changed. Proposed corrections
  require separate approval.

## Context Evidence and Limits

The asset has 62 `Haxhi_NQD`-prefixed dialogue handlers, but no explicit
`QUEST_ID`, NPC symbol, or per-key handler mapping. Its rows cover regional
greetings, St. Eadric's, Motus Mining, Splitrock Depths, the Warsworn, the
Travelers, and several named people. This is a regional/topic grouping only,
not evidence that all rows belong to one quest or speaker. Individual
speakers, addressees, and playback order remain unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `30225` | Meaning / naturalness | “Step with a light foot, out there” is a cautionary farewell. `밖에 나가서는 발걸음을 가볍게 하게` can suggest walking quietly rather than being careful. Consider `밖에 나가서는 조심히 다니게.` | High |
| `55981` | Naturalness | The same sentence repeats `워스원(Warsworn)` in adjacent clauses. Consider `난 워스원(Warsworn)의 서약방패병(Pledgeshield)이야. 그들 이름으로 계약이나 별난 의뢰를 맡지.` | Medium |
| `57198` | Format | `The Vorm Brothers` is a proper group name but Korean has no English pairing. The same brothers are rendered `보름(Vorm) 형제` at `28748`; add the English name here, e.g. `보름 형제(The Vorm Brothers)`. | High |
| `64768` | Format | “the Storyteller” is capitalized as an epithet, but Korean `이야기꾼` is unpaired. Consider `이야기꾼(Storyteller)` while retaining the sentence's qualification that the name is used only among his own people. | Medium-high |

## Evidence-Limited Hold

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `59023` | Meaning | `St. Eadric's` is rendered `성 이드릭(St. Eadric) 성소`, while nearby references use `성 이드릭(St. Eadric's)` and `성 이드릭 선교원(St. Eadric's Mission)`. The source does not identify whether this refers to the whole mission or a sanctuary within it; hold the place-type choice rather than forcing a global replacement. |

## Retained Decisions and Structural Checks

- Father Etair references vary in honorific wording, but no per-key speaker or
  addressee mapping supports a cross-line register judgment.
- Asset-level handlers do not establish individual speakers or playback order.
- Two exact-English duplicate groups have identical Korean. All 104 IDs match
  across four languages in line-break, runtime-token, and markup signatures.
- All linked IDs are listed below; each receives a four-language source
  fingerprint and an ID-level disposition in
  [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Complete Asset ID Set

`398`, `494`, `1362`, `1715`, `2599`, `3058`, `3796`, `3848`, `4939`,
`5050`, `7502`, `7894`, `8004`, `8259`, `8414`, `10136`, `10516`, `10553`,
`11737`, `12252`, `13728`, `13815`, `13838`, `14056`, `14817`, `15157`,
`15251`, `17593`, `19006`, `21092`, `21506`, `22184`, `23186`, `23810`,
`24529`, `25086`, `25515`, `25583`, `26514`, `27890`, `28072`, `28234`,
`28748`, `28964`, `29571`, `30225`, `30511`, `30886`, `31210`, `31408`,
`31434`, `31801`, `32530`, `33296`, `34219`, `35424`, `36570`, `37147`,
`37330`, `38365`, `39207`, `41148`, `42122`, `42719`, `42930`, `43749`,
`44497`, `44754`, `45307`, `46780`, `46902`, `48240`, `50981`, `51035`,
`51338`, `51515`, `51919`, `52111`, `52196`, `52720`, `53125`, `53188`,
`55981`, `56639`, `57198`, `57606`, `57741`, `57893`, `57964`, `58269`,
`58331`, `59023`, `60289`, `61311`, `61452`, `63134`, `63282`, `63498`,
`63594`, `63754`, `63918`, `64295`, `64768`, and `64842`.
