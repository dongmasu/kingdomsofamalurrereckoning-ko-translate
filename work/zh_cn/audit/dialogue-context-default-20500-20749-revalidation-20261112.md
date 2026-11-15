# Sequential `default` Revalidation: IDs `20500`-`20749`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 55 existing ledger records and added 195 previously unrecorded
  IDs. The existing candidate at `20674` and holds at `20615` and `20657`
  were retained.
- Recorded nine new correction candidates and six evidence-limited holds.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These findings are proposals for separate review, not approval to edit the
translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `20504` | Name / title pairing | `Curse of Armorcrush` is rendered as `갑옷 분쇄의 저주` without the English label. If this is the named curse/title used by the game, consider `갑옷 분쇄의 저주(Curse of Armorcrush)`; retain the current Korean meaning. | Medium |
| `20529` | Meaning / naturalness | `One way or another, this will be over soon` becomes `어떻게든 곧 끝장을 내겠어`, which adds the speaker's intent to end the matter. Consider `어떤 식으로든 이 일은 곧 끝날 거야`, preserving the prediction rather than making it a promise of action. | Medium-high |
| `20577` | Name pairing | The place label `High Fulgen` is rendered `하이 풀겐` without the source name. Consider `하이 풀겐(High Fulgen)` while retaining the current transliteration. | Medium-high |
| `20622` | Terminology | `Blacksmithing skill` is `대장 기술`, while the established skill label throughout the active table is `대장기술` (for example, IDs `14350`, `17521`, and `18628`). Consider using `대장기술` here; preserve the recipe, quantities, and paragraph breaks. | High |
| `20671` | Meaning | `In other times` is translated as `평소라면`, which suggests an ordinary situation rather than a different time or former condition. Chinese supports a past-time reading (`曾几何时`); consider `예전 같았으면 페이(Fae)들은 이런 독에 취약하지 않았을 텐데...`, preserving the speaker's pauses. | Medium-high |
| `20674` | Naturalness / objective form | The existing candidate remains open: `Collect Peasant Clothes` is `농민의 옷을 모아라`, while related source-language objective labels use a compact action form and the established Korean preference is `-하기`. Consider `농민 옷 모으기`; confirm the in-game objective presentation before applying. | Medium-high |
| `20675` | Naturalness / register | `가 주겠나?` followed by `싶거든` mixes a stiff `-나` question with casual explanatory speech. Consider a consistent conversational form such as `이제 손님들을 맞이해야 하니 그만 가 줘. 난 좋은 주인이고 싶거든.` Speaker identity and intended relationship remain unknown. | Medium |
| `20704` | Meaning / idiom | `You know where you stand with a gnome` is rendered `노움이 어떤 존재인지는 알잖아`, which does not clearly convey the idiom's point that gnomes are straightforward and leave no room for lies. Consider `노움은 믿을 만하다는 거 알잖아`, while retaining the following explanation. | Medium |
| `20713` | Name / title pairing | The named label `Master Guide Liana` is rendered `수석 안내인 리아나` without its English title/name. Consider `수석 안내인 리아나(Master Guide Liana)` if the full string is displayed as a named character label. | Medium |
| `20742` | Address / title | `Lady Sagrell` is rendered `사그렐 부인(Lady Sagrell)`. The project's user-approved `Lady` form is `여사`; consider `사그렐 여사(Lady Sagrell)` to avoid reading `부인` as a marital status. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `20502` | Meaning / proper-name status | English capitalizes `the Sorrows`; Japanese describes `嘆きの力` (“power of sorrow”), while Chinese uses `悲灵`. Korean `비탄` follows the abstract reading, but the row alone does not establish whether this is a named force or a generic concept. |
| `20573` | Meaning | English `cove` and Chinese `海湾` support a bay/cove, while Japanese `洞穴` means cave. Korean `만` follows English and Chinese; the source-language conflict does not support changing it. |
| `20576` | Register / context | English `How do you do?` and Japanese `お元気？` are greetings; Korean `잘 지냈어?` can imply a prior relationship and is more casual than Japanese. The speaker and interaction context are not established, so preserve provisionally. |
| `20638` | Meaning / context | Korean calls the object `성물`, but English says only `it` and Japanese likewise leaves the object implicit; Chinese names a holy relic. The asset association does not establish that the Korean addition is warranted. |
| `20696` | Meaning / title | English `Dren, Defender of Pride` does not explicitly say `House`; Japanese expands this as a guardian of the House of Pride, while Chinese retains a more general “defender of pride.” Korean's `긍지의 집 수호자` follows Japanese, but the title's intended scope remains unresolved. |
| `20726` | Meaning / UI context | The standalone `Higher` is `높음`; Japanese gives `ハイ` and Chinese `较高`. It may be a comparative option or a tier/label. Without its UI context, do not force a comparative form. |

## Rechecked Existing Findings

- `20615` remains on hold with `2600` and `2975`: the parallel `Found
  [person]` labels mix Korean completed-event and action forms, and their
  UI stage remains unknown.
- `20657` remains on hold: Japanese is plain while Korean uses polite
  `-요`; the available asset does not identify the speaker or interaction
  stage.
- `20674` remains a correction candidate pending confirmation of its
  objective-display style.

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 59 exact-English duplicate groups (975 corpus rows); Korean wording
  is identical within each group. Japanese differences in short greetings,
  names, and the card-game instruction were preserved rather than normalized
  from English alone.
- Logical line-break counts and detected runtime/localized-wrapper token
  sequences match across all four languages for all 250 rows. The poem at
  `20621`, recipe at `20622`, poem at `20629`, combat description at `20680`,
  five-line verse at `20722`, and structured help text at `20723` retain their
  layout and markers.
- Asset associations and serialized order were not used to assign speakers or
  playback order.

The ledger now contains 32,342 of 65,135 IDs, leaving 32,793. The next
sequential range is `20750`-`20999`.
