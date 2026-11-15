# Aergase-Associated Asset / `1443829.quest_bxml` Revalidation

- Date: 2026-11-11.
- Scope: all 138 `default` IDs linked to `1443829.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are review proposals or evidence-limited holds. No translation CSV
  was changed.

## Grouping Evidence and Limits

The asset contains the symbol `NPC_DET_SEE_Aergase` and 53 serialized
`dialog_line_*` handlers whose generated names contain the `SQ124` prefix.
There is no explicit `QUEST_ID` value in this asset. The handler prefix and
NPC symbol are asset-level clues only: no localization key is mapped to a
specific speaker, handler, branch, or playback position. The asset is
therefore recorded as Aergase-associated, not as proof that Aergase speaks
every row or that all 138 keys belong to a confirmed `SQ124` dialogue.

All 138 rows were compared in English, Japanese, Chinese, and active Korean.
The English duplicate groups at `8734`/`11234` (`Frama Aedic`),
`25900`/`32296`/`40753` (`Kidnapped`), and
`25930`/`30370`/`32781` (`Alserund`) match across all four languages.
No embedded line breaks, runtime placeholders, or markup occur in these rows.

## Correction Candidates

These are ID-scoped proposals, not approved edits:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `2463` | Meaning / terminology | Japanese identifies the item as the Kora Petal, while Korean says only `꽃잎`. Consider `코라 꽃잎(Kora Petal)` to retain the quest item's identity. | Medium-high |
| `4480` | Terminology | The Korean combines the people and person's names as `알마인 알라드(Almain Alard)`, unlike the separately paired `알마인(Almain) 알라드(Alard)` at `53189`. Consider pairing the two names separately. | Medium |
| `11359` | Naturalness | `페이란 페이(Fae)란 다 있어` is awkward and repeats the topic marker. Consider `온갖 페이(Fae)가 다 있어.` | High |
| `30588` | Terminology | Japanese explicitly identifies the Kora Petal where English shortens it to “the Petal.” Consider `코라 꽃잎(Kora Petal)` if the item name is retained in this line; the current sentence meaning is otherwise sound. | Medium |
| `33813` | Naturalness | `잘 있게` is unnatural for this casual farewell. Consider `다시 한번 고맙네. 잘 있어.` | High |
| `36206` | Terminology | The same `sigil stone` is rendered `문양석` here, but `인장석` at `37473` and elsewhere in this asset. The broader `default` source search also uses `인장석`; align this occurrence to `인장석`. | High |
| `37473` | Name consistency | `Great Spine` is `대척추산` here, while `그레이트 스파인(Great Spine)` is already used at `default:40`. Consider the established paired name. | High |
| `40405` | Terminology | `sigil stone` is rendered `각인석`, unlike `인장석` in the same asset and the broader source search. Consider `인장석`. | High |
| `41281` | Naturalness | `거기 당신!` is stiff in this urgent call for help. Consider a natural attention-getter such as `저기요!` while retaining the polite request. | Medium-high |
| `46716` | Naturalness / register | `나그네여` is marked and archaic against the direct, conversational request in English and Japanese. Consider removing the vocative and using a natural plea. | Medium-high |
| `53929` | Naturalness | `거기 있는 너!` is an awkward literal address for “You there!” Consider `거기요!` or another short attention-getter. | High |
| `57517` | Name consistency | The line uses unpaired `앨러드`, while the same character is `알라드(Alard)` at other IDs in this asset and elsewhere. Use `알라드(Alard)`. | High |
| `57650` | Naturalness / meaning | `내 변호를 해 줬어?` reads as legal representation. Japanese asks whether the speaker's position was explained; Chinese supports pleading on the speaker's behalf. Consider `내 사정을 설명해 줬어?` or `내 편을 들어 줬어?` after checking the surrounding quest context. | Medium-high |

## Holds and Kept Rows

The phrase `Narca affliction` occurs at `15625`, `21616`, `29545`, `32422`,
and `33096`, rendered respectively as `고통`, `병증`, `병증`, `병증`, and
`병`. Japanese consistently uses the curse word `呪い`, while English varies
between “affliction” and “curse” and the lines differ in text type and
sentence context. Keep these five rows on hold as a consistency question;
do not force a single Korean phrase without resolving the quest-specific
meaning and register.

At `43586` and `59556`, the Korean speech level differs, but the individual
speakers and scene relationship are not established by this asset. Keep both
voice judgments unresolved rather than normalizing them based on the shared
asset.

The objective `Retrieve the Petal` at `19540` is a concise UI label and
`꽃잎 회수` is acceptable in that text type. At `54552`, `알마인(Almain)족`
is already paired and the question is understandable; neither row has a
supported correction in this pass.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

`1638`, `2001`, `2463`, `3881`, `4480`, `4890`, `5014`, `5407`, `6045`,
`6277`, `6932`, `7660`, `8734`, `10092`, `10245`, `11234`, `11359`,
`15346`, `15625`, `16061`, `16083`, `16783`, `17115`, `17158`, `17622`,
`17943`, `18030`, `19111`, `19540`, `19767`, `20081`, `20561`, `20627`,
`21148`, `21552`, `21616`, `21896`, `21930`, `22324`, `23399`, `23429`,
`23616`, `23692`, `23795`, `24254`, `24337`, `24450`, `24475`, `25186`,
`25534`, `25900`, `25930`, `26828`, `28823`, `28824`, `28985`, `29035`,
`30370`, `30496`, `30588`, `31135`, `31619`, `32296`, `32364`, `32422`,
`32781`, `33649`, `33723`, `33813`, `34203`, `34544`, `35142`, `35554`,
`36055`, `36158`, `36206`, `36623`, `37222`, `37473`, `38122`, `39344`,
`39945`, `40129`, `40405`, `40431`, `40626`, `40753`, `41281`, `41587`,
`41904`, `42036`, `42231`, `42430`, `43586`, `44049`, `44626`, `44748`,
`44882`, `45075`, `45231`, `45474`, `45651`, `45861`, `46180`, `46658`,
`46716`, `47968`, `48171`, `48273`, `48893`, `49034`, `49955`, `50539`,
`50854`, `52172`, `52839`, `53166`, `53929`, `54329`, `54502`, `54552`,
`54833`, `55166`, `55692`, `56947`, `57517`, `57650`, `59383`, `59556`,
`59977`, `60332`, `60732`, `61047`, `62148`, `62293`, `62396`, `63428`,
`63758`.
