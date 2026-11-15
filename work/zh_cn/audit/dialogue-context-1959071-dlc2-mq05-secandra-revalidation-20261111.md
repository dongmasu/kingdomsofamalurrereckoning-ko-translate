# `DLC2_MQ05` / Secandra and Nyxaros Revalidation

- Date: 2026-11-11.
- Scope: all 185 `default` IDs linked to `1959071.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Eleven correction-candidate IDs and ten evidence-limited IDs are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC2_MQ05`, the asset-level NPC symbol
`DLC2_NPC_TON_KOL_Secandra`, 66 serialized `dialog_line_*` handlers, and 185
distinct localization keys. These asset-level clues do not map individual
keys to Secandra, another speaker, a callback, branch, or playback order.
Per-key speaker attribution remains unassigned and playback order unknown.

The text covers Anokatos, the Hyperian, the Cipher, Nyxaros, the Counsel,
Arkes and Secandra, and the choice between rescuing the Jottun slaves and
reaching the Counsel. The 185 keys include dialogue, quest text, labels, and
punctuation-only entries; asset association does not prove that every row is
spoken dialogue.

There are 11 groups of identical English source text, covering 32 rows. Each
group already has identical Korean text. No reviewed row contains an embedded
line break, runtime token, or markup.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `24471` | Meaning / naturalness | `curs` is a contemptuous insult; `건달` is comparatively mild and means a ruffian. Japanese says cowards and Chinese uses a stronger insult. Consider `이 비겁한 놈들을 해치우자` or another comparably forceful, natural insult. | High |
| `24589` | Naturalness | `시달린 것만으로도 충분히 고통받았을 거야` is redundant, and `시간도 남겨 둔 채` is awkward. Recast the line to say that the slaves have already suffered enough and that the speaker hopes to help them without losing the time needed to reach the Counsel. | High |
| `14894` | Speech level / naturalness | The line shifts from `더 큰 일이군` to `확대됐어` and `남겨 줬지`. Use one conversational register throughout; the Japanese source remains plain. | High |
| `20274` | Meaning / speech level | `I do not like the implications of this` is rendered as `불길한 징조`, which adds a specific portent not stated in English or Japanese. The `-로군` ending also shifts abruptly to casual speech in the next sentence. Express unease about what the discovery means in a consistent register. | High |
| `32020`, `40355` | Meaning / terminology | Both translate `travesties` as `참극` / `만행`, while Japanese and Chinese support a farce, mockery, or sham. Reconsider the sense in each full sentence instead of treating it as tragedy or atrocity by default. | Medium-high |
| `46492` | Meaning / naturalness | `그 전의 아르케스도 그랬다고 생각했지` leaves the antecedent of `그랬다` unclear. State explicitly that the speaker previously thought the same apathy was Arkes's sin. | High |
| `56318` | Meaning / speech level | `our quarry` is singular in this context and Japanese also uses a singular target, but Korean says `우리가 찾는 자들은`. The line also switches from `있을 것 같군` to polite `서두릅시다`. Recast as one target and keep a consistent register. | High |
| `57221` | Naturalness | `우리 민족의 미래라는 수수께끼` is awkward and can sound as if “the future” itself is the riddle. Prefer `우리 민족의 미래에 관한 수수께끼` or equivalent. | High |
| `57845` | Naturalness | `목소리가… 무너진 듯했어` is an unnatural rendering of a voice sounding broken or weakened. Japanese says the voice sounded weak; consider `목소리에 힘이 없어 보였어` or another natural equivalent. | Medium-high |
| `4390` | Format | `The Perpetual Desolations` is presented as a title but appears only as `끝없는 황폐`. The identical source at ID `61986` has the same Korean form. Consider pairing the translated title with its English title, subject to the project's title-format convention; ID `61986` is outside this asset's review set. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `55029` | Meaning / agent | The English leaves the subject of `putting their people to the sword` implicit. Korean can be read as saying the departing slaves slaughtered their own people, though the surrounding quest context may mean that another group did so and the slaves consequently fear the player. Keep the current text pending stronger line-level context; do not assign the action to a group from asset membership alone. |
| `7839`, `16675`, `52955` | Terminology / place context | `hidden wing` is rendered as `숨겨진 구역` in the two questions and `숨겨진 별관` in the objective. Japanese uses a hidden area; the Chinese wording varies. The available evidence does not establish whether this is an internal architectural wing or a separate annex, so defer unification pending stronger map/scene context. |
| `27330`, `31999`, `35871`, `40586`, `44709`, `46128` | Speech level / speaker | These rows use polite `-요`, formal `-소/-오`, or `-군` phrasing while their Japanese text is plain, or shift register within a line. The asset does not map these keys to individual speakers or dialogue stages. Keep them unresolved rather than imposing one voice across the group. |

The repeated `travesties` terms at `32020` and `40355` have other uses
elsewhere in `default`; this report records only these two asset-linked rows
and does not authorize a corpus-wide replacement.

## Complete Reviewed ID Set

`264`, `356`, `374`, `684`, `772`, `996`, `1273`, `1337`, `1595`, `2669`,
`3270`, `3687`, `3771`, `4390`, `4429`, `5736`, `5964`, `6084`, `6483`,
`6623`, `6840`, `7235`, `7480`, `7488`, `7701`, `7839`, `8020`, `8097`,
`8915`, `9101`, `9271`, `9335`, `9631`, `10755`, `11090`, `11381`, `11585`,
`11601`, `11686`, `12079`, `12658`, `12862`, `12900`, `13562`, `13955`,
`14074`, `14180`, `14384`, `14879`, `14894`, `16675`, `17057`, `17091`,
`17124`, `17219`, `17358`, `17405`, `17539`, `17633`, `18956`, `18975`,
`19763`, `19891`, `20274`, `20299`, `20685`, `21452`, `21576`, `21832`,
`21868`, `21870`, `22104`, `22246`, `22445`, `22919`, `23265`, `23289`,
`23318`, `23804`, `24471`, `24589`, `25252`, `25519`, `26717`, `27043`,
`27051`, `27120`, `27330`, `27480`, `27636`, `28092`, `28146`, `30184`,
`30233`, `30471`, `30988`, `31999`, `32020`, `32587`, `34171`, `34707`,
`35306`, `35871`, `37249`, `38032`, `38069`, `38478`, `38515`, `38661`,
`39742`, `39888`, `40196`, `40236`, `40355`, `40520`, `40586`, `41162`,
`41259`, `41387`, `41508`, `41761`, `42635`, `42824`, `43246`, `43330`,
`43428`, `43456`, `43581`, `43690`, `44044`, `44046`, `44335`, `44709`,
`45436`, `45811`, `45996`, `46128`, `46159`, `46461`, `46492`, `46936`,
`47091`, `47171`, `47374`, `47537`, `47618`, `48435`, `48658`, `49293`,
`49577`, `50004`, `51556`, `52246`, `52955`, `53419`, `54261`, `54793`,
`55029`, `55457`, `56247`, `56318`, `56480`, `56775`, `56926`, `56991`,
`57221`, `57334`, `57845`, `58382`, `58798`, `59009`, `59450`, `60380`,
`60624`, `61598`, `62335`, `62342`, `62366`, `62489`, `62728`, `62798`,
`63158`, `64169`, `64461`, `64554`.

All 185 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
