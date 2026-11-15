# Asset Revalidation: `1695875.quest_bxml` (`SQ152` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 92 linked `default` IDs, newly recorded in the review ledger.
- English controls meaning; Japanese supplies the primary voice/register
  reference; Chinese supplies supporting evidence.
- Eleven correction-candidate IDs and 16 IDs with unresolved findings are
  recorded. Three IDs have both a correction candidate and a title hold.
- This is a read-only translation review. No translation CSV or extracted
  asset was changed, and no candidate is approved for application here.

## Context Evidence and Limits

The asset contains `NPC_ADE_GNO_Bruten` and 31 distinct serialized
`dialog_line_*` handlers with an `SQ152` prefix, but no explicit `QUEST_ID`.
The linked text concerns the player's surveillance in Adessa, Jorielle,
Bruten, and the Well of Souls. These are asset/topic associations, not
per-key speaker, handler, branch, addressee, or playback-order mappings.
Individual speakers remain unassigned and dialogue order remains unknown.
In particular, the Bruten symbol does not make Jorielle's apparent
responses, player choices, journal entries, or objectives Bruten's speech.

## Correction Candidates

| ID(s) | Dimension | Source evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `209`, `38728`, `46314` | Meaning / terminology | All three English journal entries place Jorielle in `the Forum`. Japanese varies between `評議院` and `公会堂`; Chinese consistently uses `议事堂`. Korean varies between `포럼` and `공회장`. The active location labels at `5842` and `12161` are `포럼(Forum)`. Reuse `포럼(Forum)` in these three references; do not infer two different buildings from the Japanese variation. The title hold below is separate. | High |
| `9158` | Naturalness | English: `had nothing intended for this meeting`; Japanese: `この会合に何も意図がないとは思わないわ`. Korean `이번 만남에 아무 의도도 없었다고는 믿기 어렵군` is cumbersome. Consider `나를 여기까지 찾아왔으니, 만나려는 이유가 있었겠지?` Retain the current informal level without assigning a speaker. | Medium-high |
| `9770` | Meaning / terminology | English `this observation` refers to the surveillance described by `17733` and `20419`; Japanese explicitly says `監視`. Replace the detached-sounding `이 관찰을 진행하려 했어` with `널 감시하려 했어`, e.g. `아니. 솔직히 말하면, 네가 눈치채지 못하게 감시하려 했어.` | High |
| `25939` | Meaning / address | English ends `it seems I am indebted`, after the player kills Bruten; Japanese ends `借りができたわね`, and Chinese also describes a debt of gratitude without naming a third person. Korean `그에게 빚을 졌군` incorrectly supplies a third-person beneficiary and can point back to Bruten. Consider `그가 내 죽음에 관해 한 말도 들었어... 네게 빚을 졌네.` | High |
| `34663` | Meaning | English `One of your own, fool`; Japanese `仲間の一人だ`; Chinese `你自己的人`. Korean `네 동족 중 하나지` unnecessarily turns affiliation into shared race. Consider `네 부하 중 하나지, 멍청아. 브루튼(Bruten) 말이야.` If the preceding reply cannot establish a subordinate relationship, use the less specific `네 쪽 사람 중 하나지` instead. Do not infer the player's race. | High for removing racial restriction; medium for `부하` |
| `43026` | Meaning / terminology | English capitalizes `the Well`; Japanese uses `泉`. Within this asset, `20054` and `53057` explicitly name `Well of Souls`, already translated as `영혼의 샘(Well of Souls)`. Korean `우물` breaks that referent. Consider `조리엘(Jorielle)만 치우면 고용주들이 영혼의 샘(Well of Souls)을 차지할 거야. 그 힘도 전부 손에 넣겠지.` This is a scoped referent correction, not a global replacement of `well`. | High |
| `59641` | Meaning / naturalness | English `You were never meant to know ... It could make my quarry ... suspicious` links discovery of surveillance to the quarry's suspicions; Japanese likewise says `それは標的を... 怪しませてしまう`. Korean follows `몰라야 했어` with the unclear `그럼 내 사냥감이... 의심할 수도 있으니까`. Consider `네가 감시당한다는 걸 눈치채면 안 됐어. 내 표적이... 수상하게 여길 수도 있으니까.` Preserve the hesitation. | Medium-high |
| `63778` | Meaning | English quest title `Under Watch`, Japanese `監視下`, and Chinese `监视之下` place the player under surveillance. Korean `감시 중` can mean actively conducting surveillance. Consider `감시받는 자` or `감시 아래`; settle the Korean title separately. Absence of a full English quest-title parenthetical is not itself flagged. | Medium-high |
| `64110` | Naturalness | English `she doesn't want to be found`; Japanese `姿を見せたくない`. Korean `찾히고 싶지 않은 건지` is awkward. Consider `그렇게 바쁜 건지, 아니면 모습을 드러내기 싫은 건지 모르겠군.` Keep the existing informal register. | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `209`, `3131`, `17448`, `27822`, `27992`, `38728`, `46314`, `49018`, `51702`, `53858`, `55735`, `57032` | Title terminology | Singular `Templar` varies between `템플러`, `성전기사`, and `성전 기사`; several compound names pair only `Jorielle`, not the title. The glossary's confirmed `faction:gnome-templars` entry expressly excludes singular personal ranks. The earlier DLC1 SQ04 report also leaves this title unresolved. Do not apply the plural faction decision to personal titles without approval; record the inconsistency and retain the current text pending that decision. |
| `747`, `49440` | Speech level | `747` is polite in Korean although Japanese is informal. `49440` has mixed Japanese informal/polite endings and polite Korean. These are possible register questions, not proof of a same-speaker mismatch. Without per-key speaker and scene-stage evidence, hold any register conversion. |
| `24786` | Address | Korean uses `자네`, while apparent related responses elsewhere use `너`. Japanese supplies no explicit second-person pronoun here. The asset does not establish the same speaker/stage, so do not globally change the address. |
| `22586` | Meaning | English `if not a king-maker` is not matched by Japanese `王を作るとは言わないまでも`; Korean asserts `왕을 세울 정도로`. The strength of the claim differs across sources. Retain pending an explicit resolution rather than treating the Japanese phrasing as a simple voice correction. |

## Retained Readings and Structure

- `57921`: `half-pint` is a belittling size-based address, not a quantity to
  translate literally. Chinese says `矮子`; Japanese omits the address.
  Existing `꼬마` is retained. Do not infer the addressee's age or race.
- `28638`: English `convicted`, Japanese `罪ある者`, and Chinese
  `被判有罪` support retaining the conviction reading. Do not silently
  emend the English to `convinced` based on the surrounding discussion.
- `3131`: English and Chinese support the authority/law meaning; Japanese
  differs materially. The Korean meaning is retained, separate from the
  unresolved singular title.
- Two exact-English duplicate groups cover six rows: `Who is your
  employer?` (`31043`, `58991`, `62313`) and `Where is Templar Jorielle?`
  (`49018`, `53858`, `55735`). Korean matches within each group; the latter
  still shares the unresolved title notation.
- All 92 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is a structural signature check,
  not game-display or playback validation.

## Complete Asset ID Set

`11`, `209`, `747`, `1477`, `1634`, `1858`, `3131`, `5550`, `5593`,
`6012`, `6856`, `7998`, `8354`, `9158`, `9410`, `9770`, `12595`,
`14687`, `15860`, `16143`, `17448`, `17733`, `18158`, `20054`, `20419`,
`20913`, `22586`, `22920`, `23039`, `23532`, `23967`, `24344`, `24786`,
`25939`, `26701`, `27822`, `27992`, `28638`, `30782`, `31043`, `31710`,
`32278`, `32666`, `33091`, `34663`, `35514`, `37126`, `37159`, `38728`,
`39513`, `40880`, `41065`, `41164`, `41466`, `42805`, `43026`, `45045`,
`45578`, `46314`, `46897`, `48347`, `48635`, `49018`, `49440`, `49853`,
`51315`, `51702`, `53009`, `53057`, `53858`, `55187`, `55735`, `56930`,
`57032`, `57359`, `57815`, `57921`, `58991`, `59641`, `59984`, `60690`,
`61043`, `61581`, `61628`, `62313`, `62340`, `62774`, `63177`, `63344`,
`63778`, `64110`, and `64852`.

All four-language fingerprints and dimension-level dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
