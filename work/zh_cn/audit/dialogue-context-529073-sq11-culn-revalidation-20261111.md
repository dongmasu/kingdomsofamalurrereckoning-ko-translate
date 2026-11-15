# Asset Revalidation: `529073.quest_bxml` (`SQ11`)

- Date: 2026-11-11.
- Scope: all 94 linked `default` IDs, newly recorded in the ledger.
- English was checked for meaning, Japanese for voice/register and layout,
  and Chinese as secondary meaning evidence.
- Three correction-candidate IDs and four register-hold IDs are recorded.
- No translation CSV or extracted asset was changed. Findings are proposals,
  not approval to edit.

## Context Evidence and Limits

The asset has explicit `QUEST_ID` `SQ11`, NPC symbols
`NPC_DAL_SEE_Cras` and `NPC_POE_DOK_Urlik`, and 42 distinct serialized
dialogue handlers. The text covers New Culn, the Treasures of Culn,
Cras's deception, and Urlik. These clues group the rows by quest, but do
not map individual localization keys to handlers, speakers, branches,
addressees, or playback order. All per-key speakers remain unassigned
except the explicit self-identification at `23836`; playback order remains
unknown even for that row.

At `23836`, English `I am Lord Cras`, Japanese `私はクラス卿`, and Chinese
`我是克拉斯领主` directly identify the line's speaker as Lord Cras. This is
textual self-identification, not an attribution inferred from an NPC symbol.
It does not license assigning the remaining rows to him.

## Correction Candidates

| ID | Dimension | Source evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `15717` | Meaning / address | English `A nobler soul I've never met` praises the interlocutor; Japanese `なんと高潔な者だ` is an exclamation, and Chinese `我从未见过这样的高贵灵魂` likewise supplies no third-person comparator. Korean `그보다 고결한 영혼은 만나 본 적이 없어` introduces an unsupported third-person `그`. Consider `너처럼 고결한 사람은 처음 보는군. 자, 이제 내가 하려는 일을 말해 주지.` Preserve the following explanation of the plan and all name pairings. | High |
| `32569` | Naturalness / text type | English and Japanese are a first-person quest-journal record, not a spoken promise. Korean starts in journal style but ends `보상이 있는 곳까지 안내할 거야`. Consider `크라스(Cras)의 경호원 울릭(Urlik)이 보상이 있는 곳까지 안내해 줄 것이다.` This is a journal-ending correction, not an NPC register attribution. | High |
| `37938` | Naturalness / objective consistency | English `Kill Urlik` and Japanese `ウルリクを殺す` are objective labels. Korean `울릭(Urlik)을 처치하라` uses an isolated imperative while the asset's other objective labels use noun/infinitive forms (`회수`, `찾기`, `돌아가기`). Consider `울릭(Urlik) 처치`. This is UI wording, not dialogue speech-level normalization. | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `23`, `33539`, `36460`, `48315` | Speech level / naturalness | Korean has literary declarative endings (`지폈다`, `속했다`, `택했다`, `있다`) among many conversational rows. Japanese also uses plain declaratives in these lines, and English does not establish the desired Korean speech level. The multi-NPC asset does not establish speaker/stage continuity. Record these for a speaker-grounded follow-up rather than automatically converting them to `해체` or `하게체`. |

## Retained Readings and Format

- `26689`: English `never earning what I enjoyed` concerns unearned
  benefits, not inability to enjoy life. Existing `누린 것에 걸맞은 대가도
  치르지 않았어` follows English; the differing Japanese/Chinese wording
  does not justify changing it.
- `44774` and `56283`: the Japanese sources shorten the English responses.
  Existing Korean preserves the English meaning (`비참한 인생이나
  즐기시지`, `고맙지만 사양할게`), so no forced shortening is proposed.
- `34968`: Cras explicitly denies his earlier claimed origin and title.
  Do not harmonize this denial with the introduction at `23836`.
- `45074`: `hoard` does not alone establish whether the reward is in a
  chest, stash, or building. No spatial rewrite is proposed without scene
  evidence.
- Two exact-English duplicate groups cover four rows: `Hm.` (`7780`,
  `64376`) and `Cras lied to you too.` (`36222`, `62463`). Korean matches
  within both groups. No IDs are merged.
- All 94 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is a structural signature check,
  not game-display or playback validation.

## Complete Asset ID Set

`23`, `850`, `2505`, `5469`, `6028`, `7780`, `8330`, `8736`, `9753`,
`9799`, `10166`, `11511`, `12904`, `13796`, `14626`, `15717`, `15899`,
`16125`, `16692`, `17116`, `17200`, `18895`, `19463`, `20600`, `21244`,
`22009`, `22301`, `22348`, `23836`, `24708`, `24932`, `25136`, `25591`,
`25767`, `26228`, `26689`, `26945`, `27184`, `27420`, `29331`, `30292`,
`30569`, `31142`, `31272`, `32569`, `32616`, `33539`, `33636`, `33660`,
`34486`, `34968`, `35651`, `35895`, `36079`, `36217`, `36222`, `36460`,
`37145`, `37818`, `37938`, `38599`, `38919`, `40826`, `41298`, `43989`,
`44036`, `44359`, `44774`, `45074`, `45508`, `47082`, `48102`, `48267`,
`48315`, `49327`, `49675`, `50232`, `51036`, `51811`, `52128`, `54105`,
`54862`, `55278`, `55323`, `55997`, `56283`, `57417`, `58222`, `59533`,
`62409`, `62463`, `62572`, `64376`, and `65008`.

All four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
