# Asset Revalidation: `521918.quest_bxml` (`SQ13` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 97 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary register/layout
  reference; Chinese supplies secondary meaning evidence.
- Fifteen correction-candidate IDs and two evidence-limited holds.
- Translation CSVs and extracted assets were not changed. Candidates are
  proposals, not approval for the editor step.

## Context Evidence and Limits

The asset has 33 distinct serialized `dialog_line_*` handlers with the
`SQ13` prefix, but no explicit `QUEST_ID` or matching NPC symbol. Its
linked text concerns Marga, Oreyn, a staged antelope transformation,
the silver necklace, and Jottun capture. These clues support a topic group,
not individual speaker, branch, addressee, or playback-order mappings.
All per-key speakers remain unassigned and dialogue order remains unknown.
Journal content establishes text type without proving an NPC speaker.

## Correction Candidates

| ID(s) | Dimension | Source evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `637`, `1969`, `9737`, `61479` | Naturalness / text type | English and Japanese are completed or updated first-person quest-journal records. Korean mixes journal statements with reported conversational endings (`했대`, `했다고 해`, `말했어`, `돌아갔지`, `맹세했지`). Recast these records in ordinary journal prose, preserving each branch's distinct outcome. At `637`, use `오레인(Oreyn)은 ... 믿게 만들려 했다고 한다` and conclude `알려야겠다`; at `1969`, use `말했다` / `돌아갔다`; at `9737`, use `이미 죽여 고기를 발라낸 뒤였다`; at `61479`, use `말했다` / `맹세했다`. These are text-type edits, not inferred NPC speech-level changes. | High |
| `2370`, `51184` | Meaning / terminology | English `cage`, Japanese `檻`, and Chinese `笼子` refer to a person's confinement in a Jottun camp. Korean varies between `감옥 문`, `우리`, and bird-specific `새장`. Use `우리 문` at `2370` and `이 우리 말인데...` at `51184`; retain existing `우리` references and do not invent a prison building or bird cage. | High |
| `18505` | Meaning | English `Are you sure he's an antelope?` and Japanese `彼がレイヨウなのは確かか？` question the claim about Oreyn, not identification of an animal's species. Korean `저게 정말 영양이라고?` loses that subject. Consider `오레인(Oreyn)이 영양으로 변한 게 확실해?` | High |
| `19037`, `34655`, `59928`, `62327`, `62582` | Terminology / English pairing | These scoped references to `sprite` / `sprites` use unpaired `스프라이트`, while the same asset pairs Jottun and other named creatures. Japanese supplies the species name or a generic fairy term; English anchors the specific creature. Add `스프라이트(Sprite)` for singular source references (`19037`, `62582`) and `스프라이트(Sprites)` for plural references (`34655`, `59928`, `62327`), preserving the sentences and the unpaired ordinary animal `영양`. Do not equate every generic fairy in the corpus with Sprite. | High |
| `25713` | Naturalness / speech level | English `Thank Lupoku! I owe you one!` invokes the deity and then thanks the rescuer; Japanese uses informal `恩に着るよ`. Korean `로포쿠(Lopoku)님, 감사합니다! 신세를 졌군요!` makes both clauses formal and blurs that change of addressee. Consider `로포쿠(Lopoku)께 감사할 일이군! 신세 졌어!` Keep canonical `로포쿠(Lopoku)`: glossary `deity:lopoku` explicitly accepts source alias `Lupoku`. No name correction is needed. | Medium-high |
| `34306` | Meaning | English `They grabbed me and locked me up` does not say humans; Japanese likewise has no human noun. The linked Jottun-capture text (`9706`, `12177`, `42455`) supports avoiding Korean `사람들이`. Consider `그놈들이 날 붙잡아 가뒀어.` Preserve the following metaphor of escaping one cage only to enter another. | High |
| `51189` | English pairing | English explicitly names `Oreyn`; Korean has no pairing in this row. Use `오레인(Oreyn)과 난 천생연분이었어`, preserving the speaker's disbelief and existing informal level. This is a bounded name annotation, not a global alias assertion. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| --- | --- | --- |
| `16460` | Meaning | English `There was this one boy...` can introduce a remembered alternative, while Japanese continues a shared-life/without-him reading. Korean `그런 남자애가 하나 있었어` does not identify the referent. Hold referent expansion or a new backstory until the preceding choice is mapped. |
| `17197` | Speech level | Korean's `한 이야기에는 ... 남자가 나온다` is literary narration, while the near-topic `28763` uses conversational storytelling. Japanese itself is plain narrative, and the asset does not establish that the two are the same speaker/branch. Record the potential voice difference, but do not normalize it solely from shared story content. |

## Retained Readings and Structure

- `23730` reports that Oreyn was eaten, whereas other branches reveal
  that the antelope was a decoy. These source-defined outcomes are distinct;
  do not rewrite the journal to collapse the lie and truth branches.
- `31646`: `그럴 사람이 아닌데!` is retained as a conversational expression
  of disbelief, not evidence that the speaker has independently established
  Oreyn's innocence.
- English `Lupoku` at `25713` is not a spelling error to propagate into
  Korean; the confirmed menu spelling and source alias decision are reused.
- Four exact-English duplicate groups cover nine rows: the dedication
  sentence (`4609`, `7047`), Jottun-capture sentence (`9706`, `12177`),
  grandmother-story explanation (`13059`, `15054`), and `Quest Complete`
  (`18040`, `45412`, `57514`). Korean matches within all groups.
- All 97 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not playback/display testing.

## Complete Asset ID Set

`637`, `1597`, `1969`, `2370`, `2899`, `3549`, `4102`, `4291`, `4609`,
`5572`, `7047`, `7969`, `9098`, `9706`, `9737`, `10909`, `11265`,
`11449`, `12177`, `13059`, `14502`, `14789`, `15054`, `16460`, `17022`,
`17197`, `17324`, `18040`, `18261`, `18505`, `19037`, `19633`, `19762`,
`19926`, `20057`, `20500`, `20769`, `21931`, `23085`, `23162`, `23730`,
`24521`, `25260`, `25710`, `25713`, `27004`, `28655`, `28763`, `29444`,
`31235`, `31646`, `34306`, `34313`, `34537`, `34655`, `34750`, `36606`,
`36997`, `37139`, `39414`, `39852`, `40578`, `40737`, `41407`, `41730`,
`42455`, `42729`, `43951`, `44805`, `45412`, `45782`, `46351`, `47807`,
`47828`, `48793`, `50520`, `51172`, `51184`, `51189`, `51311`, `51544`,
`52247`, `54530`, `57455`, `57514`, `58860`, `59281`, `59532`, `59928`,
`60620`, `61145`, `61479`, `61609`, `62209`, `62327`, `62582`, and
`63773`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
