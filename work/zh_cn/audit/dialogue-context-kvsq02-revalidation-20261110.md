# KVSQ02 / Khamazandu's Gift Context Revalidation

- Date: 2026-11-10.
- Scope: all 59 `default` keys associated with `540798.quest_bxml`
  (`KVSQ02`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID KVSQ02`, the asset-level symbol
`NPC_KV10_Khamazandu`, and 28 serialized `dialog_line_*` handlers. Its keys
cover Khamazandu's offer to the player, the murder of Gwyn Anwy and other
Warsworn leaders, Besin's helm, and the Heart of Sibun. The localization keys
are not mapped to individual handlers, speakers, branches, or playback
order; the NPC symbol does not prove that every key is spoken by Khamazandu.

All 59 keys are unique to this asset in the current index. They were absent
from the ledger before this pass and have since been added with four-language
fingerprints and per-ID review dispositions.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `7589`, `15148`, `19510`, `21922`, `54076`, `64167`, `64664` | meaning / naturalness / consistency | These seven journal entries repeat the exact English sentence `Upon the peak of Cloudcrest Mountain, the Niskaru Lord Khamazandu offered me its gift if I would be its instrument in the world.` Its Korean rendering varies between working for Khamazandu, becoming its representative, and becoming its tool; some versions also change `gift` to `power`. Align the shared sentence to `클라우드크레스트 산(Cloudcrest Mountain) 정상에서 니스카루(Niskaru) 군주 카마잔두(Khamazandu)는 내가 이 세상에서 자신의 뜻을 이루는 도구가 되어 준다면 선물을 주겠다고 제안했다.` Preserve each entry's following progress update. | High |
| `7589`, `21922` | terminology / consistency | Both repeat `I have slain the highest of the Warsworn`, but Korean alternates between `최고 지휘관` and `최고 지도자`. Japanese uses the same leader term in both and Chinese identifies the highest leader. Prefer `워스원(Warsworn)의 최고 지도자` in both clauses. | High |
| `15222`, `42683`, `50460` | naturalness / consistency | The same address `little one` appears as `작은 필멸자여` and `꼬마야`; the former adds `mortal`, while the latter can imply a child. Given Khamazandu's elevated, condescending voice, use `작은 자여` consistently. At `15222`, the following sentence also shifts abruptly to casual `유감이야` and describes the imprisoned being's inability to act literally as stretching limbs. Prefer `작은 자여, 내가 마음껏 움직일 날은 아직 멀었나 보군. 그 마법사는 내 뜻을 이루는 도구로는 너무... 나약했다니, 안타깝군.` Use `작은 자여.` at `42683` and `생각을 바꾸었나, 작은 자여?` at `50460`. | Medium-high |
| `40264` | speech level / address | `자네` is an honorific address in Korean, but the same utterance immediately commands `그 여자를 죽인 뒤 ... 돌아와라`; Japanese uses informal `お前` throughout. Prefer `아래에서 네 친구이자 동료가 기다리고 있다. 그 여자를 죽인 뒤 내게 돌아와라.` | High |
| `49934` | naturalness | `눈에 있는 그건 뭐죠?` is awkward Korean for `what is that in your eyes?`. Prefer `첫서약자 전당(Hall of the Firstsworn)에서 만나기로 했어요. 괜찮아요? 뭔가... 눈빛에서 타오르는 건 뭐죠? 혼돈의 불꽃! 배신자!` | High |
| `5299` | meaning / naturalness | Japanese `手駒` and Chinese `工具` indicate a subordinate or agent, not an abstract `수단`; in the surrounding context this is Khamazandu's would-be instrument. Prefer `더 나은, 더 강한 수하가 있었더라면 좋았을 텐데.` | Medium-high |
| `38770` | meaning | `Earn your right` is rendered `네 자격을 증명해`, changing the source's `right` into proof of merit. Japanese and Chinese both say to claim one's right. Prefer `가라, 나아가 네 권리를 쟁취해라.` | High |
| `58139` | format | The objective `Return to Cloudcrest` omits the English pairing used for named locations elsewhere in the group. Prefer `클라우드크레스트(Cloudcrest)로 돌아가라.` | High |

## Holds

No additional source-conflict or insufficient-evidence hold was identified in
this bounded pass. Proposed corrections remain unapplied.

## Coverage

All 59 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Eight correction findings affect 15 unique IDs. The
repeated Khamazandu offer above appears in seven longer entries; there are no
fully identical English-row groups. No embedded line breaks, runtime markers,
or markup were found.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
