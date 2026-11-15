# Sequential `default` Revalidation: IDs `18250`-`18499`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared with English, Japanese,
  Chinese, current terminology evidence, and formatting.
- Sixty existing ledger records had matching four-language fingerprints;
  190 previously unrecorded IDs were reviewed and added.
- No new correction candidate was added. Six existing candidates were
  rechecked and retained; 17 evidence-limited holds are recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Retained Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `18293` | Speech level | The same Korean utterance begins and ends politely (`떨어졌어요`, `물어보세요`) but shifts to `왔어야 하는데`; Japanese remains polite. Use a consistent polite ending, for example `오늘 아침에 더 들어왔어야 하는데요.` | High |
| `18315` | Speech level / naturalness | `보상은 꼭 해 주겠네` has a marked `-겠네` ending against the conversational Japanese and the rest of the Korean line. Consider `보상은 꼭 해 줄게, 친구.` | Medium-high |
| `18322` | Meaning / terminology | This is the magical Well consistently called `샘` elsewhere, but Korean says `우물`. English `well`, Japanese `泉`, and related quest rows support `샘은 찾았나?` | High |
| `18371` | Meaning | English `Why ‒ yes, they are!` is affirmative recognition; Korean begins `아니, 맞아!`, which contradicts it. Consider `아, 맞아!` while preserving the following question. | High |
| `18398` | Naturalness | `그는 비밀이 많고 혼자 지내지만` is stiff. English, Japanese, and Chinese describe someone who reveals little and keeps to himself. Consider `속내를 잘 드러내지 않고 혼자 지내는 사람이지만, 뭔가 특정한 걸 찾는 것 같아.` | Medium |
| `18433` | Naturalness | `기쁘다` is a stiff standalone declaration after the conversational question and explanation. Japanese `よかった` supports a natural reaction such as `다행이야.` | Medium-high |

## Evidence-Limited Holds

These are not confirmed translation errors. Available row-level evidence does
not settle the relevant distinction.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `18268` | Meaning / terminology | English names the `Tuatha Guard` unit; Korean describes the elite light infantry and skirmishers but does not identify that unit. Japanese and Chinese differ on whether the named unit is part of the displayed item description. |
| `18278` | Terminology / reference | `Dustling` is paired as `더스트링(Dustling)`, while `Children of Dust` is rendered `먼지의 자손`. The row and locale references do not establish whether these are one term or distinct labels. |
| `18283` | Meaning / terminology | `Fall` may name an event or the season, and `Children of Dust` may be a formal group. Japanese and Chinese translate the phrase as autumn / children of dust; canonical lore treatment is unresolved. |
| `18292` | Meaning / item category | `Family Arms` could mean weapons, heirlooms, or heraldic arms. Japanese favors heirloom weapons, while the English and Chinese label do not resolve the item category. |
| `18307` | Meaning / terminology | `Bolganbane Armament` may name an item, weapon type, or organization. The locale readings do not establish which category the Korean label should express. |
| `18330` | Meaning / reference | The fragment does not identify who `him` is or whether the Hierophant's forgiveness is religious absolution or a pardon. |
| `18344` | Meaning / item category | `Lost Litanies` could refer to prayers or a litany book; Japanese specifies a book and Chinese says prayers. The project term `연도문` does not settle the object category. |
| `18363` | Format / UI context | `SpawnVol2` remains literal in Korean and Japanese, while Chinese translates it. The row does not show whether it is internal or player-facing. |
| `18395` | Meaning / terminology | The Crownhold `Warden` may be a guard or prison official. Japanese supports a guard role and Chinese a prison-warden reading. |
| `18411` | Meaning / place type | English says `memorial`, Japanese says tomb, and Chinese says memorial hall; the exact site type is unresolved. |
| `18438` | Meaning / source conflict | The myth's names and chronology vary across locales, including the account of Helius's works and Vraekor's request. The current five-line sequence is intact, but the source conflict cannot be resolved from this row. |
| `18452` | Meaning / terminology | English `local warden`, Japanese guard, Chinese prison warden, and Korean `감시관` do not establish the official's exact role. |
| `18453` | Meaning / reference | The isolated plural `Wyvyrns` does not establish whether it names a species, people, or faction; Korean `와이번족` may over-specify that category. |
| `18462` | Meaning / reference | `the first Magnus' time` may refer to the earliest Magnus or the first one in a sequence. `초대 매그너스` selects one reading that the row cannot confirm. |
| `18471` | Meaning / source conflict | English `culled his strength` is unclear; Japanese suggests gaining strength, while Chinese says Lord Ohn's strength weakened. The six-line chronology and layout are preserved, but the disputed clause remains unresolved. |
| `18493` | Meaning / reference | `The Eldest` may be an individual, a formal title, or a group name. The locale readings do not settle the referent. |
| `18496` | Meaning / source conflict | The archaic `wore but lies upon him` is read as lies by English/Chinese and as burdens by Japanese. Korean follows the lies reading; context is insufficient to choose conclusively. |

## Rechecked and Cleared Earlier Findings

- `18288` now says `첨탑 꼭대기의 사람들`, avoiding the unsupported
  interpretation that they are nobles.
- `18311` now uses one quote pair around the quoted jest, and `18331` uses
  `화염 계열 마법 부여`, supported by Japanese and Chinese.
- The accepted shared-source, register, and wording findings at `18288`,
  `18311`, and `18331` are reflected in the current Korean rows.
- Existing candidate records at `18293`, `18315`, `18322`, `18371`, `18398`,
  and `18433` retain their current fingerprints and dispositions.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the English, Japanese,
  Chinese, and active Korean tables.
- Sixty-nine exact-English duplicate groups touch this range (797 corpus
  rows). Every group has identical Korean text.
- The range contains 26 logical line breaks in English and Korean and 25 in
  Japanese and Chinese. At `18346`, Korean matches the six-break English
  layout; Japanese and Chinese each have five breaks. The other multiline
  rows match across all four languages: `18280` (2), `18283` (3), `18295`
  (4), `18345` (1), `18438` (4), `18471` (5), and `18476` (1).
- Localized payloads within `{*...}` markers differ at `18274` and `18419`
  while their wrappers are retained. At `18449`, Japanese alone reorders
  the Hold label and controls; Korean matches English and Chinese.
- Of the 190 new IDs, 125 have indexed quest-asset links and 65 do not; five
  link to multiple assets. Asset links do not establish individual speakers,
  addressees, or playback order; unsupported attributions remain unassigned.

The ledger now contains 30,699 of 65,135 IDs (47.13%), leaving 34,436
unreviewed. The next sequential range is `18500`-`18749`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
