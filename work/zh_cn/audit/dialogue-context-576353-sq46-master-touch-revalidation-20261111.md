# Asset Revalidation: `576353.quest_bxml` (`SQ46` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 102 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Twenty-three correction-candidate IDs and three evidence-limited hold IDs.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset has 42 `SQ46`-prefixed serialized dialogue handlers but no
explicit `QUEST_ID` or NPC symbol. The story concerns Gavroche Valle,
Efyr Dynnwel, Haldebier's Blade, and the repair material Master's Tallow.
The handler prefix and shared story are grouping clues, not evidence mapping
particular IDs to speakers, branches, or playback order. No per-key speaker
or order is inferred. Journal and objective text are assessed separately.

## Correction Candidates

| ID(s) | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1129`, `13362`, `31759`, `40105`, `47823`, `57991`, `59191`, `5998`, `55729`, `53577` | Material naming / English pairing | The same `Master's Tallow` is variously `장인의 동물성 지방`, `명인의 기름`, `명인의 탤로`, `장인의 탤로우`, `마스터스 탈로우`, and `명장의 동물성 지방`. Existing D-17823/D-20258 accepts `장인의 동물성 지방`; D-20148 verifies that term at `53664`. Consider `장인의 동물성 지방(Master's Tallow)` for these explicit source mentions, adapting particles and wording, and use a natural short reference for the second mention in `47823`. This is a bounded quest-context proposal, not a new global material identity. `57991` also has the place-name candidate below. | High |
| `5998`, `55729`, `57991`, `21396` | Place name / English pairing | Each explicitly names `Hurvar's Doorsill`. Korean uses a nested `허바르(Hurvar)의 문지방(Hurvar's Doorsill)`, unpaired `허바르의 문턱`, or unpaired `허바르스 도어실`. Reuse the complete row-local form already at `13362`, `허바르의 문턱(Hurvar's Doorsill)`, avoiding double annotation; do not assert a broader alias. The first two identical English rows must stay aligned. | Medium-high |
| `8360`, `14861`, `10939`, `11581`, `12164`, `19097`, `28676`, `28839`, `59710` | Epithet / consistency | English `Hermit Smith` is a recurring descriptive title and Korean varies between `은둔 대장장이` and `은둔자 대장장이`, without English pairing. Consider `은둔 대장장이(Hermit Smith)` for these explicit uses, adapting particles. At `10939` also use objective form `도움 구하기` rather than `도움을 받아라`. D-21591 treats this as a source-local description rather than a global alias; preserve that limit. `13362`/`46969` already identify the person by full paired name and need not receive a nested title annotation. | Medium-high |
| `15885` | Meaning | English `No lessons! No precious pearls of wisdom! I've left that all behind` and Japanese say the speaker offers no instruction, rather than rejecting instruction from the player. Korean `교훈은 필요 없어 ... 지혜도 필요 없다고` changes the direction. Consider `가르침은 없어! 귀한 지혜도 없다고! 그런 건 모두 뒤로하고 떠났어.` | High |
| `17234` | Naturalness | English `green apprentice` and Japanese `青二才の弟子` mean an inexperienced apprentice, not a literal green color. The same description at `1049`/`5862` already uses `풋내기 견습생`. Consider `그 풋내기 제자는...` instead of `초록내기 제자는...`, preserving the uncertainty about training. | High |
| `43028` | Name / English pairing | English explicitly supplies the surname `Dynnwel`; Korean `딘웰` is unpaired. Consider `이름은 딘웰(Dynnwel)이야`, retaining the rumor and the speaker's disclaimer. D-21591 confirms the full person name; this local surname annotation does not add a global alias. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| --- | --- | --- |
| `46969` | Source conflict / meaning | English says Gavroche `had a broken sword he could mend`, while Japanese and Chinese say he could not, and related journal IDs `7035`, `9783`, `13362`, `33237`, and `53664` explicitly say he cannot. Current Korean follows English `고칠 수 있는` but contradicts those quest records. Strong evidence suggests a source typo, yet this is a material English conflict; hold the change to `고칠 수 없는` until explicitly adjudicated rather than silently overriding English. |
| `41426` | Material | English describes a rare `wax`, Japanese `脂`, and Korean `밀랍` specifically implies beeswax. The item is named `Master's Tallow` elsewhere and an earlier decision chooses animal fat, but these sources do not establish its exact composition. Hold a material-specific replacement pending reconciliation. |
| `45504` | Speech level | Korean uses polite `-요` while Japanese is plain. The asset does not establish the line's speaker or addressee, and situational politeness is possible. Hold a forced register change. |

## Retained Decisions and Structural Checks

- `38103` retains source-lowercase `Haldebier's blade` as required by
  D-21249; other full labels keep their existing approved capitalization.
- `13362` and `46969` already pair `Efyr Dynnwel`; D-21591 does not register
  `Hermit Smith` as a global person alias.
- Six exact-English duplicate groups match in Korean: `1049`/`5862`,
  `5998`/`55729`, `8360`/`14861`, `9010`/`12259`/`60596`,
  `22431`/`24311`, and `50217`/`54655`.
- `57991` differs from `5998`/`55729` by a comma in English and differs in
  Japanese; it is not counted as an exact duplicate, though the same
  independently verified material and place terminology applies.
- All 102 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`422`, `484`, `740`, `1049`, `1129`, `3235`, `5862`, `5998`, `7035`,
`7710`, `8360`, `8725`, `9010`, `9783`, `10022`, `10412`, `10615`,
`10939`, `11100`, `11581`, `12164`, `12259`, `12845`, `13362`, `13680`,
`13849`, `14266`, `14340`, `14861`, `15885`, `16316`, `16356`, `17234`,
`17581`, `18221`, `19097`, `19129`, `19825`, `19959`, `20040`, `21396`,
`21987`, `22013`, `22421`, `22431`, `23671`, `23839`, `24311`, `26161`,
`26560`, `26818`, `28676`, `28839`, `29708`, `29949`, `30356`, `31569`,
`31759`, `33134`, `33237`, `33278`, `33406`, `33814`, `34340`, `35044`,
`37783`, `38103`, `38976`, `40105`, `40350`, `41419`, `41426`, `42398`,
`42709`, `43028`, `44415`, `45504`, `46969`, `47491`, `47778`, `47823`,
`48594`, `49243`, `49501`, `50217`, `50463`, `51211`, `51593`, `53577`,
`53664`, `54344`, `54655`, `55729`, `57593`, `57991`, `59191`, `59417`,
`59710`, `60252`, `60596`, `60621`, and `64653`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
