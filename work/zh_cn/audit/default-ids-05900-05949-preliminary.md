# Preliminary Language Scan: `default` IDs 5900-5949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5900-5949.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5900 | `make amends for the deaths` → `죽음을 ... 만회` | Reconsider `만회하다`; the source is about making amends/atoning for deaths caused, not recovering a loss. | English/Japanese/Chinese all express inability to atone for deaths. Korean's `죽음을 만회하다` is semantically awkward and may sound like undoing the deaths. | High |
| 5901 | `Alyn Shir` → `앨린 쉬어` | Keep the name consistent with the project's other Alyn Shir rows; preserve the speaker's inference rather than claiming certainty. | All sources identify the same woman and say she could have killed the group while they were weak. Korean retains the conditional reasoning. | Medium |
| 5902 | `The Den` / `riff-raff` / `poultices` | Confirm whether The Den is a named gambling venue and preserve the speaker's dismissive tone. | Japanese identifies a gambling place; English/Chinese describe riff-raff and poultices. Korean retains the name and the contrast. | Medium |
| 5905 | red-eyed Fae / armor | Confirm whether this describes a specific hostile Fae group and preserve the rabid-wolf comparison. | All sources say the group differs from familiar Fae and has red eyes matching its armor. Korean retains both images. | Medium |
| 5907 | `Flawless Mitharan Piercing Grip` → `완벽한 미사란 관통 손잡이` | Clarify the item construction and whether `Piercing` names an effect/category; align Mitharan modifiers with related items. | The item-name structure is opaque across languages. Korean preserves the components without resolving the mechanic. | Low |
| 5911 | `forgotten stores` → `잊힌 비축품` | Keep “stores” as stored supplies unless local context identifies shops. | English is ambiguous; Japanese says shops, while Chinese appears to mean provisions. Korean chooses supplies, which fits the need for resupply. | Medium |
| 5914 | Warrior class description | Preserve the comparison between damage output and trained defense; verify `resilience` against official combat terminology. | All sources say Warriors can enter the thickest fights and their damage ability is matched only by defense. Korean keeps the comparison and class voice. | High |
| 5918 | `{3}%`, `{1}`, `{2}`, `{4}` parameterized effect | Preserve English token identity/order; record that Japanese swaps `{1}` and `{2}`. Verify the visible grammar around the hyphen and substitutions. | English/Chinese/Korean token order is `{3}`, `{1}`, `{2}`, `{4}`; Japanese is `{3}`, `{2}`, `{1}`, `{4}`. Korean follows English, the semantic authority. | High |
| 5919 | `got the best of me` → `이번엔 제대로 당했어` | Retain the idiomatic meaning “outmaneuvered/beat me” and the speaker's reluctant admission. | All sources agree the woman got the better of the speaker in this deal and it will yield little profit. Korean captures the idiom and resigned tone. | High |
| 5921 | Myfa Rhonwen / Cape Solace / envoy | Standardize both names and confirm the scope of the envoy role (`to foreign lands`) and the keep she serves. | The language references vary on Cape Solace and Myfa's diplomatic role. Korean identifies her as an overseas envoy serving the addressee's keep. | Medium |
| 5924 | `old Death-and-Flames` → `옛 죽음과 화염` | Confirm whether this is a formal epithet/name for Fyragnos and preserve its relation to the Tomb of Fyragnos. | The capitalized English compound is likely a title; Japanese/Chinese also describe an ancient death/fire entity. Korean renders it descriptively. | Medium |
| 5925 | `Silent Choir` → `침묵의 성가대` | Verify whether this is a named faction, sect, or literal choir; preserve the rumor about tongues being cut out. | Japanese calls it a choir; Chinese calls it a silent order. Korean uses the literal choir reading. | Medium |
| 5926 | `Occupied or unoccupied` → `점령 중이든 아니든` | Keep the political/territorial reading provisional and preserve the honor-based exclusion. | English/Japanese support occupied/not occupied; Chinese can also be read as populated/unpopulated. Korean selects occupation. | Medium |
| 5927 | `Freemen` → `자유민(Freemen)` | Confirm whether Freemen is a named faction or generic free people; retain the speaker's suspicious speculation. | English capitalization and Japanese faction wording suggest a group name; Chinese is more generic. Korean preserves the name but its Korean rendering is undecided. | Medium |
| 5933 | 15% chance / 30 Poison Damage / 5 seconds / 25% Mana | Preserve all values and ordering; clarify whether sustained cost is 25% of maximum Mana. | All four sources retain 15%, 30 damage, 5 seconds, and 25%. Japanese explicitly says maximum Mana; English/Chinese/Korean do not specify the basis. | High |
| 5935 | `base work` → `천한 일` | Keep the class/status meaning (“menial work”), not a physical/base-work interpretation. | English phrase is idiomatic; Japanese/Chinese describe low-status/easy work. Korean's `내 격에 비하면 천한 일` conveys the intended social sense. | High |
| 5941 | `Traveler` → `여행자(Traveler)` | Confirm capitalization/group-name policy and use the same rendering for the Travelers faction elsewhere. | The capitalized singular may identify a group member; Korean preserves English traceability. | Medium |
| 5943 | wartime outlaws / relocation | Preserve the causal sequence and matter-of-fact voice; treat the English comma/capitalization as source punctuation, not Korean content. | All sources say wartime outlaws forced a relocation that the speaker believes was ultimately best. Korean conveys the sequence. | High |
| 5945 | `Stealth` → `은신` | Confirm whether this is a skill/category name and align with established ability terminology. | English/Japanese/Chinese use a short gameplay label; Korean provides a concise functional equivalent. | Medium |
| 5949 | City Watch Captain greeting | Retain the abrupt, dryly sarcastic questions about lost property and prison visits; standardize City Watch and Captain terms. | The languages preserve a polite welcome followed by a brusque service-counter joke. Korean retains the shift in tone and both examples. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 5902, 5905, 5907, 5911,
  5914, 5918-5919, 5921, 5924-5927, 5935, and 5941 against active Korean
  and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts match across all four locales.
- Runtime markers at ID 5918 are all present. Korean follows English token
  order; Japanese swaps `{1}` and `{2}`.
- Numeric values at IDs 5906, 5918, 5933, and 5947 were compared; no Korean
  value loss was found.
- No active CSV structure or text was changed.

## Batch Status

IDs 5900-5949 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
