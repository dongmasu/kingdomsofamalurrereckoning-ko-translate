# Preliminary Language Scan: `default` IDs 35101-35150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35101-35150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35103 | `무심한 항로` for `A Careless Passage` | Confirm whether this is a named place/route or a descriptive phrase/title; standardize it with the game's location and quest naming conventions. | English capitalizes the phrase. Japanese transliterates it, Chinese translates it literally, and Korean interprets it as an uncaring/careless route. The standalone label does not resolve whether `Careless` is a proper name. | Medium |
| 35105 | `해제술 교관` for `Dispelling Trainer` | Confirm whether this trainer teaches a named Dispel/Dispelling ability and standardize the skill/rank terminology. | Korean conveys an instructor for dispelling. English and Japanese both suggest a specific magical ability category; the exact glossary equivalent is not established by the row. | Medium |
| 35107 | `흐린` / `은은히 빛나는` / `순수` Shards | Standardize the three capitalized clarity tiers Cloudy, Lambent, and Pristine; preserve the weakest-to-strongest ordering. | Korean translates the categories descriptively, including Lambent as “softly glowing.” English, Chinese, and Korean retain the ordered strength scale; Japanese instead uses generic lower/middle/upper quality tiers. Historical notes explicitly flag these shard-quality names. | Medium |
| 35111 | `{*1[무기 공격]}` / `회피 중 ... 사용할 수 있는` | Preserve the `{*1[...]}` wrapper and localize only its payload; clarify that these special attacks are performed from/after Dodge rather than while actively dodging. | The marker wrapper, order, and paragraph break match all locales, and the payload is localized. English says attacks “from Dodge”; Japanese says launched from an evasion state and Chinese says dodge-triggered. Korean `회피 중` can instead mean during the dodge action. | High |
| 35117 | `프리즈미어 예배당` for `Prismere Chantries` | Standardize Chantry/Chantries as a religious institution and keep Prismere as the named modifier; align it with the chantries question at ID 34949. | Korean renders the plural as chapels. Japanese/Chinese also use chapel/church terms, but the exact religious institution remains open in the historical terminology notes. | Medium |
| 35124 | Cora Banick's four dated journal entries | Preserve all four day headings (7, 11, 13, 21), the 34 source line breaks, the cage/cult/tree-god sequence, Keska's transformation, and the unresolved threat that the writer may be next. | Korean retains the progression, tone, and every paragraph/line break. The account includes sexualized self-reproach, ritual violence, cannibalism, and captivity; keep the source's grim voice without embellishing it. Japanese adds an explicit “two legs” numeral; English/Korean already express the pair. | Low |
| 35127 | `갈레눈 헤젬 회고록` / `다음 회고록` | Standardize Galenun Hegem and the offices Domus Politica/Grand Bursar; retain that the next portion of the same memoirs is located at the Grand Bursar's. | Korean transliterates the name differently from some locale spellings and says “the next memoir,” which may imply a separate work. English says the next portion of his memoirs; Japanese says the next chapter and Chinese the next part. The historical audit flags the Galenun/Ganelun spelling and office names. | Medium |
| 35129 | `혼돈의 첩자들` for `agents of Chaos` | Confirm whether the agents are spies, servants, emissaries, or a broader group under Telogrus; preserve the rebuttal that not everyone is under his control. | Korean narrows `agents` to spies. English/Chinese use broader followers/agents and Japanese describes the group as Chaos spies. Context is insufficient to settle the precise role. | Medium |
| 35144 | `성 이드릭의 유해` for `St. Eadric's Remains` | Confirm whether Remains means bodily remains, relics, or a named artifact and standardize the saint's spelling. | Korean and Chinese say remains; Japanese interprets it as a shroud. The historical log explicitly asks whether the term denotes a relic or remains. | Medium |
| 35147 | `카스토르의 분노` for `Castor's Wrath` | Confirm whether this is Castor's anger or wrath directed at Castor, and standardize the proper item/skill/title name. | Korean and Chinese read a possessive “Castor's anger”; Japanese reads revenge against Castor. The standalone name cannot settle the relation. | Medium |
| 35148 | `안녕, 그대` for `Greetings dove` | Preserve `dove` as an affectionate form of address (or use the approved Korean equivalent), while retaining the warm greeting and welcome from Paddy. | Korean replaces the pet name with the generic `그대`. Japanese/Chinese omit it, but English explicitly addresses the addressee as “dove.” Historical notes specifically flag this affectionate address. | Medium |

IDs 35101-35102, 35104, 35106, 35108-35110, 35112-35116, 35118-35123,
35125-35126, 35128, 35130-35143, 35145-35146, and 35149-35150 generally
retain the English meaning on this first reading. Proper names, lore, voice,
and display conventions remain integrated-pass candidates; no additional
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 35000-35199 flags the shard
  clarity tiers (35107), localized ability marker (35111), Galenun/Ganelun
  Hegem and Domus Politica/Grand Bursar (35127), and the Cora Banick
  journal (35124). It also flags St. Eadric's Remains (35144), Castor's
  Wrath (35147), and `dove` (35148). These were checked against active
  Korean and all locale references.
- The historical note explicitly records all 34 line breaks at ID 35124
  and the runtime marker at ID 35111; both were rechecked directly.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 35101-35150 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 35124 retains
  34 line breaks; ID 35111 retains one break between its marker and
  description.
- Runtime structure is preserved: ID 35111 retains the `{*1[...]}` wrapper
  identity/order with localized payload, and ID 35122 retains the exact
  `#NAMED_ICON_GRAY_360_LB#` token.
- ID 35124 preserves Day 7/11/13/21; Japanese writes the “pair” at the
  pretty-legs phrase as `2本`, consistent with English/Korean wording.
  English's “fourth chapter” at ID 35127 is represented as chapter four in
  Korean.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 35101-35150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 35151.
