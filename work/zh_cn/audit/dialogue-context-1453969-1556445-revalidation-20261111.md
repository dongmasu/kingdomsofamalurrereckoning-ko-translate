# SQ123 Ledger Quest / SQ133 Fellfire Quest Revalidation

- Date: 2026-11-11.
- Scope: all 78 previously unrecorded `default` IDs linked to
  `1453969.quest_bxml` (39) and `1556445.quest_bxml` (39).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Eight correction candidates and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`1453969.quest_bxml` explicitly identifies `SQ123` and contains 18
serialized `dialog_line_*` handlers with the same prefix. It has no `NPC_`
symbol. Its text concerns Wyl Werrenir, a lost keyring, an old red ledger,
and Gwalchmai. The asset supports an SQ123 ledger-quest group, but does not
map any of these 39 keys to Wyl, Gwalchmai, another individual speaker,
handler, branch, or playback position.

`1556445.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 11
serialized `dialog_line_*` handlers use the `SQ133` prefix, which is an
asset-level clue only. The text concerns Florion, the Fellfire Bloom, the
Fellfire Pit, and the Narca curse. The prefix does not establish a key-to-
handler mapping, an individual speaker, branch, or playback position.

All 78 rows were compared in English, Japanese, Chinese, and active Korean.
This set contains no exact repeated English strings, embedded line breaks,
runtime placeholders, or markup. It includes dialogue-like lines as well as
quest titles, objectives, journal entries, and status labels; those text
types were assessed individually rather than treated as one speaker's voice.

## Correction Candidates

| ID | Asset / dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6239` | `1453969` / naturalness | Japanese renders “What a great turn of fate!” as an exclamation about good fortune. Korean `운명의 멋진 반전` is a stiff literal phrase. Consider `정말 기막힌 행운이로군!` while retaining the following thanks and reward offer. | Medium-high |
| `13148` | `1453969` / naturalness | `down on his luck` is rendered `운이 나쁜`, which sounds translated and does not carry the idiomatic sense of having fallen on hard times. Consider a conversational plea such as `운에 버림받은 불쌍한 사람 하나 안 도와줄 거야?` | Medium |
| `17522` | `1453969` / meaning / naturalness | The surrounding quest text identifies “they” as Wyl's missing keys. `그들이 어디 있을까` reads as though it refers to people. Name the keys or omit the pronoun, e.g. `열쇠가 어디 있을까…` | High |
| `23164` | `1453969` / naturalness | `be a good sort` is an amiable request, not a claim about moral character. `착한 사람답게` sounds preachy here. Consider `그 낡은 장부를 찾으면 바로 내게 가져다줘. 부탁이야, 알겠지?` | Medium-high |
| `29034` | `1453969` / name consistency | This repeats the same Wyl quest journal entry as `17623`, but renders `Pryderi` as `프리데리` rather than `프라이데리(Pryderi)`. Align the local duplicate, while noting that other corpus occurrences also have variant spellings and need a separately scoped terminology decision. | High |
| `40127` | `1453969` / meaning / naturalness | `창고는 건물 날개 중 한쪽에 있어` is awkward for “the storeroom's off one of the wings,” and `안쪽 자물쇠` does not express “down there.” Consider `상공회의소는 부두로 가는 길에 있고, 창고는 건물 한쪽 날개에 있어. 아래쪽에서 자물쇠를 하나씩 따다 보면 낡은 장부를 찾을 거야.` | High |
| `24359` | `1556445` / name consistency | `Great Spine` is rendered as the descriptive `거대한 등뼈`, unlike `그레이트 스파인(Great Spine)` at `40`. Consider using the established paired proper-name form here. The already-reviewed `37473` also has a separate candidate for this same term in `dialogue-context-1443829-revalidation-20261111.md`; it was not duplicated in this asset's ledger rows. | High |
| `37508` | `1556445` / speech level | Japanese uses a plain, masculine assertion (`立派に遂行したな`), while Korean shifts to marked deferential `치렀소`. Consider a plain-style ending such as `용맹의 의식(Rite of Valor)을 훌륭히 치렀군.` This is an ID-level register observation only; no individual speaker is inferred from the asset. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `28454` | Meaning / place-name consistency | English says `Chamber of Trade Storeroom` and Chinese says `贸易屋`, while Japanese says `収税局` (“Customs House/Office”). Nearby SQ123 text also refers to the `Custom House`. The Korean `무역 회관` follows the English/Chinese reading, but the source-language place-name conflict prevents confident normalization with the Chamber of Trade references at `36272` and `40127`; retain pending stronger evidence. |

## Retained Text

The remaining 69 rows were retained after four-language comparison. The
localization consistently renders `Fellfire Bloom` as
`펠파이어 꽃(Fellfire Bloom)` and `Fellfire Pit` as
`펠파이어 구덩이(Fellfire Pit)`. The unqualified `The Pit` wording at `40`
and `41381` is understandable in context and was not mechanically expanded.
The spelling discrepancy at `29034` is recorded as a candidate rather than
globally corrected because `Pryderi` has additional variants elsewhere in
`default`.

For cross-reference only, `Pryderi` also appears elsewhere as `프라이더리`
and `프라이데리`; the broader occurrences were not included in this asset
review. `Chamber of Trade` likewise has other renderings elsewhere, so this
report does not claim a corpus-wide terminology pass.

## Complete Newly Reviewed ID Sets

- `1453969.quest_bxml` (`SQ123`; 39 IDs): `1126`, `6239`, `12600`,
  `12691`, `13148`, `14617`, `15011`, `15050`, `16591`, `17522`, `17623`,
  `19098`, `22637`, `23164`, `24684`, `25428`, `27775`, `28454`, `29034`,
  `33713`, `33818`, `34077`, `34099`, `34868`, `34996`, `36272`, `37951`,
  `39508`, `40127`, `40951`, `45281`, `53127`, `53184`, `55830`, `56174`,
  `57450`, `59246`, `60351`, `64756`.
- `1556445.quest_bxml` (`SQ133` handler-prefix clue; 39 IDs): `40`, `3678`,
  `5096`, `7313`, `10402`, `12631`, `12808`, `13046`, `16502`, `18696`,
  `19212`, `19699`, `20443`, `22804`, `24141`, `24359`, `26144`, `34057`,
  `35877`, `37508`, `41302`, `41381`, `43509`, `43901`, `44032`, `44076`,
  `44873`, `45373`, `50298`, `50534`, `51054`, `52530`, `53042`, `55497`,
  `57595`, `59278`, `60445`, `62146`, `65114`.

All 78 newly reviewed IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
