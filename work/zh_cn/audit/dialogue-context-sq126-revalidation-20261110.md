# SQ126 / Gwenna Hand Quest Dialogue and Text Revalidation

- Date: 2026-11-10.
- Scope: all 111 `default` keys found in `1485448.quest_bxml` (`SQ126`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ126`, the asset-level symbol
`NPC_YSA_ALM_GwennaHand`, 15 quest-target handlers, and 41 serialized
`dialog_line_*` handlers. All 111 exact-key matches were checked across the
active Korean, English, Japanese, and Chinese `default` tables. The resource
covers the conflict over Ysa, the Varani plot, coded daggers, and the
assassination choices involving ambassadors Keen and Brenner.

These links establish a quest-resource association, not a speaker assignment.
The NPC symbol is asset-level, and none of the localization keys has been
mapped to an individual callback, branch, addressee, or playback position.
The serialized callback order is not treated as dialogue order. The asset
also contains objectives, quest-journal text, and UI labels; dialogue-register
checks are not applied to those text types.

## Revalidation Findings

These are review proposals, not approval to edit the active translation CSV.
The candidate statuses identify rows needing an editor decision; they are not
claims that every row is a confirmed error.

| IDs | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `396` | Meaning / terminology | In this quest, `salvage` means recovering materials by dismantling the daggers, as the later journal entry at `50048` makes explicit. `재활용` can suggest reusing or recycling them rather than salvaging their parts. Consider `그다음엔 그것들을 처분해. 부수든 분해하든 난 상관없어. 끝나면 돌아와.` | High |
| `2732`, `18639`, `21147` | Shared-source consistency | The sentence `They believe that his Fae subjects could be convinced to march with us on the battlefield.` is identical in English at all three IDs, but the Korean sentence differs at `2732`. Consider using the same sentence at all three: `그의 페이(Fae) 신민들을 설득해 우리와 함께 전장에 나서게 할 수 있다고 믿고 있지.` | High |
| `3178`, `17650` | Shared-source consistency / naturalness | Both rows share the same first two English sentences, but the Korean varies in sentence structure and wording. Consider aligning the shared passage as `이 한 쌍의 단검에는 이사(Ysa)의 방어 체계가 담겨 있다고 봐. 어디가 강하고 약한지 말이야.` Keep the following Brenner/Varani clauses distinct because their English subjects differ. | High |
| `18242`, `23342` | Shared-source consistency | The first English sentence is identical, but the Korean differs. Consider using `지금 행동해야 이 일을 막을 수 있어.` for that shared sentence. This does not reopen the already-applied meaning correction at `23342`; it is only a consistency proposal. | High |
| `18242`, `48994` | Shared-source consistency | `If gold is an issue, we Dokkalfar can pay well.` is identical in English, but the Korean varies between `돈` / `골드` and `치르다` / `지불하다`. Consider one shared sentence: `돈이 문제라면 우리 도크알파르(Dokkalfar)가 후하게 치르지.` | High |
| `23648`, `23919`, `26916` | Shared-source consistency | The final English sentence, `There are plans being made to seize this city.`, is identical, but `23648` uses a passive construction while `23919` and `26916` use an explicit subject. Consider aligning it as `누군가 이 도시를 장악할 계획을 세우고 있어.` The previously approved meaning correction at `23648` remains intact; this proposal concerns only the shared final sentence. | High |
| `25157`, `31547`, `35655` | Shared-source consistency / terminology | The identical sentence `I believe this, as well, but I would never resort to violence.` has different Korean at `35655`; align it with `나도 이 점은 믿어. 하지만 폭력을 쓰진 않겠어.` The same Japanese `軍事キャンプ` and English `military camp` are rendered `군사 기지` at `25157`/`31547` but `군사 야영지` at `35655`. Consider `군사 기지` consistently; for the last sentence, `이제 이사(Ysa)는 군사 기지로 바뀔 위험에 처했어.` | High |
| `27683`, `31127` | Shared-source consistency | The English sentences `Cowardice drives her ambition, a fear of being discovered.` and `We Varani make our own outcomes.` are identical at both IDs but translated differently. Consider the shared forms `그녀의 야망은 들통날까 두려워하는 비겁함에서 나와.` and `우리 바라니(Varani)는 스스로 결과를 만들어 내지.` Keep the surrounding Alfar and future statements distinct where their English differs. | High |
| `37421` | Meaning / naturalness | `단검과 검날` leaves the relation between swords and their blades unclear, while `흔한 수색` does not express the source's ordinary/standard inspection as naturally as the parallel wording at `35130`. Consider `이곳의 바라니(Varani) 지도자들은 무기를 이용해 비밀리에 연락을 주고받아. 단검과 검의 칼날에 암호를 새기면 통상적인 수색을 피할 수 있거든.` | High |
| `39465` | Meaning / location reference | The English capitalizes `Worship Circle`, while the other references to this same place in the quest use generic `예배 장소` or `기도 장소`. The current `예배의 광장` additionally specifies a plaza. The sources do not establish whether this is a formal location name, so hold rather than silently standardizing it. If generic, `기도 장소` is supported by the other quest entries. | Uncertain |

The current rows at `21702` and `48033` already follow the approved
name-and-title form for Ambassador Keen/Brenner objectives. The current rows
at `23342` and `23648` also retain the earlier approved meaning corrections.
`57904` was retained: colloquial `들었어` is an acceptable rendering of
“was led to believe” here; the Japanese and Chinese make the implied belief
more explicit, but do not establish a clear Korean meaning error.

Ten groups with fully identical English strings occur within this asset;
their Korean translations are already identical within each group. The
shared-sentence proposals above concern repeated English sentences inside
otherwise different rows. The remaining rows showed no clearly supported
meaning, naturalness, register, address, honorific, or formatting defect in
this pass.

No embedded line breaks, runtime variables, or formatting markup were found
in the 111 Korean rows.

## Coverage and Limits

All 111 asset-linked IDs were reviewed against the same-ID English,
Japanese, Chinese, and active Korean rows. The 18 candidate IDs and one
uncertain ID are recorded with four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV edit was applied.

The mapping from localization keys to callbacks, branches, individual
speakers, and playback sequence remains unresolved; callback serialization
order is not treated as playback order.
