# HM01 / House of Ballads Contest Context Revalidation

- Date: 2026-11-10.
- Scope: all 216 `default` keys in `457589.quest_bxml` (`HM01`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID HM01`, the asset-level symbol
`NPC_DAL_SEE_Green`, and 155 serialized `dialog_line_*` handlers. Its keys
cover the House of Ballads, the contest for Sir Sagrell's seat, the Grave
Thresh, and related dialogue, choices, quest text, and status labels. The
single NPC symbol and handler count do not establish that all keys belong to
Green or map individual keys to speakers, callbacks, branches, or playback
order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `1334` | meaning / naturalness | English abbreviates the institution as `the House`; Japanese explicitly says `House of Ballads`, and that is the established name throughout this group. Bare `하우스` is unclear Korean here. Prefer `발라드의 집(House of Ballads)에 온 걸 환영해.` | High |
| `4446`, `24448`, `25441`, `41178` | meaning / terminology | The same plant, `heartvine(s)`, is translated as `심장덩굴` at the first three IDs but as `하트바인` at `35790`, `42911`, and `51076`. Japanese consistently uses `ハートバイン`; Chinese uses `心藤`. Standardize these four references to `하트바인`; for `41178`, phrase the growth as `고르구아스 안에 새로 자라난 하트바인`. The location term at that ID remains under review below. | High |
| `12131` | speech_level / naturalness | Within one utterance, Korean moves from `-는 건가?` to `-말게` and then `-어`. The English, Japanese, and Chinese sustain a rebuking but coherent register. Prefer `필멸자는 교육도 받지 않고, 잔꾀나 예절도 배우지 않는가? 다시는 날 방해하지 말게. 사그렐 경(Sir Sagrell)의 이야기는 아직 끝나지 않았네.` | High |
| `12512` | naturalness | `잠을 방해받은 스레시의 소리가 들릴 거야` is an awkward rendering of hearing the creature's disturbed sleep/cries. Prefer `스레시(Thresh)의 소굴은 이 대저택 동쪽, 고르구아스(Gorguath) 안에 있어. 밤이 되면 잠결에 내는 울음소리가 들려. 그 소리는 섬뜩하지.` The precise rendering of `hollow` is held separately below. | Medium-high |
| `14190` | naturalness | `우리와 함께하든가, 지금 떠나라, 필멸자여` leaves the vocative awkwardly attached after two commands. Prefer `필멸자여, 우리와 함께하든가 지금 떠나라.` | High |
| `22859` | meaning | `contest` is a competition, not a ceremony; `신성한 의식` adds an unsupported ritual. Japanese and Chinese both describe the contest itself as sacred. Prefer `이 경연은 신성해. 필멸자는 참가할 수 없어.` | High |
| `23662` | meaning / terminology | `Mundane` is `평범한 자` at `86`, while `하찮은 존재` adds a stronger insult than English `mundane thing`, Japanese `ありふれた`, or Chinese `世俗的`. Prefer `다른 곳으로 가라, 평범한 자여. 이 일은 필멸자와 상관없다.` | High |
| `27135` | meaning / naturalness / format | The named ballad is `Song of Sir Sagrell`; the current `기사 사그렐(Sagrell)의 노래` is awkward and inconsistent with the same-group label at `23002`, `사그렐 경(Sir Sagrell)의 노래`. Prefer `이 발라드의 마지막에는 사그렐(Sagrell)이 무덤 스레시(Grave Thresh)를 물리치고 승리해! 어떻게 된 건지는 모르겠지만, 누군가 '사그렐 경(Sir Sagrell)의 노래'를 바꿨어.` | High |
| `35890` | meaning / naturalness | English `the way of the Telling`, Japanese `伝承にはないこと`, and Chinese `与天谕之道不符` describe what is or is not consistent with the Telling. `전승의 섭리` overstates this as providence. Prefer `전승(The Telling)의 흐름과는 맞지 않아.` | Medium-high |
| `36433` | meaning / naturalness | `대리인` usually means a proxy or representative, but the person is asked to infiltrate the House as the woman's agent; Chinese explicitly says spy, and Japanese says her underling/agent. Prefer `그녀는 매번 상상도 못 할 보상을 내걸었어. 대가로 요구한 건 그녀의 첩자로 발라드의 집(House of Ballads)에 잠입하라는 것뿐이었지. 물론 아무도 받아들이지 않았어.` | High |
| `39090` | meaning / naturalness | English `What you want?`, Japanese `何が目的だ？`, and the parallel question at `45047` ask the visitor's business or intention. `무슨 일이야?` instead asks what happened. Prefer `무슨 볼일이지?` | High |
| `57368` | naturalness | `드문 공석` is an unnatural collocation for a rare vacancy; the Japanese and Chinese also emphasize that such a vacancy is unusual. Prefer `모두 잘 들어라! 이미 들었겠지만, 발라드의 집(House of Ballads)에 흔치 않은 공석이 생겼다!` | High |
| `58640` | meaning / terminology | This is `A child of dust`, not `a dustling`. The same phrase is rendered `먼지의 자손` at `7715` and `38818`; `먼지의 자식` is inconsistent. Prefer `먼지의 자손이라고? 여기에?` Keep this distinct from `Dustling` / `더스트링`. | High |
| `59397` | meaning / terminology | The same title at `10429` is `오지간을 처치한 자`; `오지건의 학살자` changes both the established spelling and the meaning of `Slayer`. This sentence also uses the awkward `기사 사그렐` instead of the established `사그렐 경(Sir Sagrell)`. Prefer `우리 종족의 이야기에서 큰 반전이 일어났다. 사그렐 경(Sir Sagrell)이 쓰러졌다. 오지간을 처치한 자이자 하크시의 왕관(Crown of Haxhi)의 수호자인 바로 그 사그렐(Sagrell)이 패배했다.` | High |
| `64438` | naturalness | `이건 엄청난 방해야` is a literal, unnatural rendering of `This is quite the interruption`; Chinese likewise frames it as an intrusive interruption. Prefer `방해가 되는구나, 더스트링(Dustling). 사그렐(Sagrell)이 죽었어. 전승(The Telling)에서 이런 비극은 드물어. 정말 드문 일이야.` | Medium-high |

## Holds

| IDs | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `587`, `12512`, `34251`, `41178` | meaning | English uses `hollow of Gorguath`; Japanese generally says cave (`洞穴`), while Chinese alternates between cave and open ground (`空地`). Korean varies among `빈터`, `공동`, `동굴`, and `굴`. The asset does not resolve whether each reference means the cave proper or the broader hollow/area. Do not globally normalize this landform term yet. IDs `12512` and `41178` have separate naturalness/plant-term candidates above. | Uncertain |
| `48305` | meaning | English `confirmation`, Japanese `承認` (approval), and Chinese `考验` (trial/test) do not establish the exact rite. Current `인준 시험` combines both readings. Keep provisional until the in-game function is confirmed. | Uncertain |
| `51917` | meaning | English and Chinese suggest that this attempt to claim a seat may succeed; Japanese instead says the speaker hopes this Telling will be the only/last attempt. Current Korean chooses the success reading. Keep it provisional rather than silently resolving the source divergence. | Uncertain |

## Coverage

All 216 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Fifteen correction findings affect 18 IDs. Three
source/context holds cover six ID references, two of which also have separate
correction candidates. Six exact-English duplicate groups (14 rows) already
have identical Korean text; Japanese or Chinese wording varies in some
groups, so no unsupported cross-ID unification was made. No embedded line
breaks, runtime markers, or markup were found. Speaker attribution and
dialogue order remain unknown at the localization-key level.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
