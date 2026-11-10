# SQ93 / Nomeron Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 55 `default` keys found in `1310335.quest_bxml` (`SQ93`).
- The initial group review was read-only. Subsequent targeted edits in the
  active Korean CSV are recorded below; extracted resources remain unchanged.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ93`, the asset-level symbol
`NPC_YSA_SEE_Nomeron`, and 24 serialized `dialog_line_*` handlers. Its text
concerns the Font's waning flow, the Water Lock, the Sacred Pools, and the
Gardens of Ysa.

All 55 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map keys to individual callbacks, speakers, branches, addressees, or
playback positions. The Nomeron symbol therefore does not establish that
Nomeron speaks every dialogue-like row. The group also contains player
choices, objectives, journal text, titles, and UI labels.

IDs `32258` and `39530` were not added to this group: the index links them to
`2601222.quest_bxml` and `747925.quest_bxml`, respectively, and neither key
matches `1310335.quest_bxml`. Those asset associations do not establish a
connection to SQ93 or Nomeron.

## Revalidation Findings

Remaining `candidate` findings are review proposals, not blanket approval to
edit the active Korean CSV. `uncertain` preserves an unresolved reading rather
than proposing a speculative correction.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `17812`, `24798`, `25126`, `26475`, `28565`, `35789`, `48638`, `53537`, `59217` | Named-term consistency | The Font is the same named magical source throughout this quest. The established display is `샘(The Font)`. This pairing is now present at `17812`, `25126`, `28565`, and `53537`; the first three were rechecked and removed from the candidate ledger. Other explicit references remain under review where their current text is still unpaired or varies. Preserve each sentence's grammar and do not replace every `flow` with literal water where the source does not specify it. | High for identity and display; wording remains ID-specific |
| `29173`, `31218`, `35633`, `38715`, `53537`, `63620` | Term consistency / naturalness | `Sacred Pools` appears as `성스러운 못`, `성스러운 샘`, `성스러운 연못`, `신성한 연못`, and `샘물`. English and Chinese support pools; Japanese uses springs. Consider a consistent named form such as `성스러운 연못(Sacred Pools)`, subject to the spring/pool distinction. At `29173`, `다섯 성스러운 못` is awkward; consider `성스러운 연못(Sacred Pools) 다섯 곳`. At `63620`, `샘물 두 곳` treats the two locations as water; consider `성스러운 연못(Sacred Pools) 두 곳`. At `35633`, retain five: English and Chinese say five, while Japanese says four; the Korean currently follows English and Chinese. At `38715` and `53537`, four agrees across the English, Japanese, Chinese, and Korean rows. | Medium; count findings are source-specific |
| `26260` | Naturalness / speech level | The row shifts from casual `아직 늦지 않았어` to the marked question ending `생각이 있나?`. English and Japanese use plain speech. Consider a consistent plain conversational form, e.g. `아직 시간은 있어. 하지만 우리가 직접 나서야 해. 이 비극을 막으려고 나와 함께할래?` The speaker is not mapped to this key. | Medium |
| `37487` | Naturalness | The final `시들어 가는 것 같으니` leaves the utterance syntactically hanging, whereas English, Japanese, and Chinese finish the thought. Consider `최근 들어 그 흐름이 약해졌어. 부자연스러운 일이야. 세상의 마법은 강해지는데도 페이(Fae)는 시들어 가는 것 같아.` | High |
| `46948` | Meaning / naturalness | `Master of the Font` is rendered as `샘(The Font)의 주인`, which can imply ownership. Japanese `泉の管理者` supports a keeper/manager reading. Consider `샘(The Font)을 관리하는 노메론(Nomeron)이니까 알지` or `샘(The Font)의 관리자인 노메론(Nomeron)이니까 알지`, preserving the rest of the line's meaning and conversational tone. | Medium-high |

The following existing holds remain unresolved and are not converted into
corrections:

- `32853`: the English fragment `Of the Gardens of Ysa, Of the Summer Court`
  does not establish the exact relationship expressed by the Korean `에서`.
  The prior source review held this because the surrounding utterance is
  unavailable; retain that hold.
- `34462`: the prior reviewer proposed recasting the omen phrase, but the
  independent verifier held it because the current Korean still conveys the
  source. The deference in `주군` and the Japanese plain style also leave the
  register unsettled; do not apply the earlier proposal as approved text.
- `42889`: `전하` is combined with plain endings, but Japanese also uses plain
  speech when addressing the king. Preserve the existing honorific/register
  uncertainty rather than normalizing it without scene evidence.
- `44398`: `Fontmaster` and the office/title relationship remain unresolved
  in prior terminology records. The current `샘의 관리자` is understandable;
  do not impose a new title without broader evidence.
- `57348`: the exact referent of `Font's yield` remains uncertain. Japanese
  describes flow from the Font and Chinese describes its output; the local
  quest context supports water but does not settle whether the English means
  water, magical yield, or both. Retain the current water reading for now.
  This does not reopen the separately verified correction clarifying that
  the Gardens retain their power.

No exact duplicate English full-string groups occur among these 55 keys. The
previously reviewed count at `35633` remains five in Korean, matching English
and Chinese despite Japanese's four. The objective at `38715` remains four,
matching all four language rows.

The other 33 rows showed no clearly supported correction in this pass. Across
the four locales, the 55 rows have no embedded line breaks, runtime
placeholders, or markup.

## Coverage and Limits

All 55 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. The initial review
recorded 17 correction candidates and five unresolved findings. After
rechecking the applied Font pairing at `17812`, `25126`, and `28565`, 14
correction candidates and five unresolved findings remain. The pairing at
`53537` is fixed, but the row remains a candidate for its separate `Sacred
Pools` wording. The current Korean CSV therefore contains targeted edits; the
initial read-only review did not modify it. The ledger retains four-language
source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`1461`, `1659`, `5972`, `9676`, `11970`, `15464`, `16756`, `17812`,
`19126`, `23296`, `24798`, `25126`, `26260`, `26475`, `28088`, `28565`,
`29173`, `30460`, `31218`, `32853`, `34462`, `34576`, `35442`, `35633`,
`35789`, `36107`, `36561`, `37487`, `38236`, `38715`, `41388`, `42625`,
`42889`, `44387`, `44398`, `45497`, `45710`, `46077`, `46376`, `46948`,
`48638`, `48998`, `49278`, `49699`, `53537`, `55756`, `56609`, `57019`,
`57348`, `57763`, `59217`, `59847`, `60223`, `62306`, `63620`.
