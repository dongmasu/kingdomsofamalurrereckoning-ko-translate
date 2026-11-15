# Sequential `default` Revalidation: IDs `21500`-`21749`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with their English, Japanese, and
  Chinese counterparts for meaning, naturalness, register, terminology,
  names, and structure.
- Rechecked 69 existing ledger records and added 181 previously unrecorded
  IDs. Ten candidate IDs and eleven evidence-limited hold IDs are recorded;
  `21589` and `21608` each have both a candidate and a hold dimension.
- All 69 existing four-language fingerprints were current. No translation
  CSV, immutable source, extracted asset, or localization binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `21514` | Naturalness | `일시적으로, 공격을 받았을 때 ... 확률이 60%가 됩니다` is understandable but awkwardly split. Consider `일시적으로 공격을 받으면 60% 확률로 적을 빙결시킵니다.` Preserve the duration, trigger, effect, and value. | Medium-high |
| `21541` | Meaning / naturalness | `위대한 페이(Fae)의 사기꾼` can mean a con artist belonging to the Fae. English `great Fae trickster`, Japanese `フェイの奇術師`, and Chinese `伟大的灵族骗术大师` describe a Fae trickster. Consider `위대한 페이(Fae) 장난꾸러기가 남긴 보물` or another natural construction that preserves the mythic trickster sense. | High |
| `21555` | Meaning / terminology | In the altar quest, `Make the Sacrifice` is rendered `희생하기`, which can suggest giving oneself up. The quest journal describes offering a sacrifice, so consider the objective form `제물 바치기`. Retain the prior asset review finding. | High |
| `21580` | Speech level | Japanese `ありがとう！` and Chinese `谢谢你！` are neutral thanks; Korean `고맙네!` adds a marked older/senior tone. Consider `고마워!`, as in the related asset's other neutral thanks. This is a line-level comparison, not speaker attribution. | Medium-high |
| `21589` | Name pairing | The `Gautliffe` name varies in Korean within the SQ66 group and is unpaired in this row. The asset review supports `고틀리프(Gautliffe)` for name consistency, independently of the unresolved rank. | Medium-high |
| `21608` | Title pairing | The displayed work title `A History of Gnome Exploitation in Apotyre` is translated without its English title. Consider pairing the complete work title, e.g. `아포타이어의 노움 착취 역사(A History of Gnome Exploitation in Apotyre)`, without changing the author's name. | High |
| `21634` | Naturalness / speech level | The line mixes literary `그대` with casual endings and unexpectedly honors the player in `그대를 찾으셔`. The Japanese uses conversational address and a casual ending. Consider a consistent conversational form such as `이제 모든 트래블러(Travelers)가 네 식구고, 너도 그들의 식구야. 자, 대사제(Hierophant)가 다시 널 불렀어. 예언자가 부르면 응해야 해.` | Medium-high |
| `21645` | Meaning | English `doesn't have what it takes` is broader than courage alone; Chinese says he lacks ability, and Japanese says he does not know what is needed. Korean `배짱이 없어` narrows the reason to nerve. Consider a broader ability/qualification expression, while retaining the preceding criticism about dirty work. | Medium |
| `21699` | Naturalness | `저기, 당신은 누구시죠?` is stilted for the hesitant first question `Um, who are you?`; Japanese and Chinese also use a simple question. Consider `저기, 누구세요?` without inferring who speaks. | Medium-high |
| `21745` | Terminology / consistency | This is one occurrence in the linked `Belen's Testament` / `the Testament` group, whose Korean varies among `테스타먼트`, `성약단`, `결사`, and `교단`, and varies in Belen's spelling. Consider the group's existing proposal `성약단(The Testament)` here, with sentence grammar preserved. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `21507` | Name / source discrepancy | English says `Grian Sheen`, while the character is consistently `Grian Shane` elsewhere; Japanese phonetics and the Korean `(Grian Shane)` support the established name. Treat this as a likely source typo, but do not silently rewrite either source or translation from this isolated objective. |
| `21512` | Meaning | The English refers to one person from Firetrench and then uses singular `their`; Japanese also says one person. Korean `이들의 기력` may read as plural. Keep the current wording pending enough context to settle the referent. |
| `21545` | Proper-name status | Capitalized `the House` may be a named Winter institution or a generic family/household. The three translations do not resolve its identity; do not infer a faction name. |
| `21589` | Rank terminology | The rank `Private` is rendered `일병`; English and Japanese `兵卒` do not establish a precise Korean rank mapping. This hold overlaps the separate name-pairing candidate. |
| `21608` | Meaning | `Gnome Exploitation` can mean exploitation of gnomes or exploitation carried out by gnomes. Japanese and Chinese favor different readings, and the title alone does not settle the direction. This hold overlaps the title-pairing candidate. |
| `21616` | Proper-name status | `the Circle` may identify an organization, while the line does not identify which circle. Keep `서클` provisionally and do not invent a faction name. |
| `21623` | Meaning / item identity | `Lucern Repeater` may be an enemy/target or a named weapon. Japanese and Chinese render the phrase differently, and this isolated objective does not settle what is being trapped. |
| `21627` | Item terminology | `Heel` may name a heel component or a footwear/armor slot. The title and locale references do not establish the item's exact form; retain `뒤축` provisionally. |
| `21692` | Meaning | English `collections` may mean collected objects or collections/funds. Japanese says donations, while Chinese supports collectible objects; retain `모금액` pending context. |
| `21721` | Text type / context | `Mexico` is translated consistently across the four locales, but the isolated label could be an internal/test string rather than player-facing text. No context establishes a correction. |
| `21738` | UI meaning | English/Japanese show `PRIOR`, Chinese says `Page Up`, and Korean says `이전`. The target input/platform meaning is not established; retain the current label. |

## Rechecked Findings And Structure

- The prior `21541`, `21555`, `21580`, `21634`, and `21745` candidates remain
  supported after the four-language comparison. `21589` retains its
  name-pairing candidate and now records the separate unresolved rank.
- `21645` reopens the earlier no-issue disposition because the current
  four-language comparison shows that Korean narrows the source's broader
  ability phrase to courage. `21656`'s `비탄의 힘` is retained: English ID
  `64074` defines the Sorrows as magical energy. The urgent, polite request at
  `21682` remains natural and is not assigned to an individual speaker.
- The range touches four exact-English duplicate groups (eight rows); Korean
  wording matches within every group. All four languages have 15 logical
  line breaks, with per-row break counts matching.
- Runtime variables and control markers are present in the same order.
  Localized content inside `{*1...}` wrappers at `21521`, `21733`, and `21736`
  differs by language as expected; no Korean control marker is missing.
- Asset links and co-occurring NPC/handler symbols were treated only as
  grouping clues. No individual speaker, branch, or playback order was
  inferred.

The ledger now contains 33,094 of 65,135 IDs (50.81%), leaving 32,041.
Sequential review reaches ID `21749`; the next range is `21750`-`21999`.
