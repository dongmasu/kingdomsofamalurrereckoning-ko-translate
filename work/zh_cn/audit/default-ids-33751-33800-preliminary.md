# Preliminary Language Scan: `default` IDs 33751-33800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33751-33800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33752 | `코르단 파상트가 자기 편지를 원한다` for `Courdan Passant wants his letter` | Preserve that Courdan wants his letter, and verify from quest context whether the task is to return/retrieve it; standardize the character's name. | Korean follows the short English statement. Japanese makes an imperative to return the letter, while Chinese says he wants to find it, adding different actions not explicit in English. | Low |
| 33756 | `계승자` for `the Scion` | Confirm whether this is the named Cape Solace office/title or a generic successor; standardize the Korean rendering while preserving the instruction not to distract her. | Korean translates the title as “successor.” Chinese reads it as a priest, while Japanese transliterates Scion. The source-keyed historical audit flags this office's terminology across the corpus. | Medium |
| 33759 | `기프르 가문과 성을 합치는` for `joined with Gifre` | Confirm the intended family-name/marriage relationship and standardize Wyvyrn/Gifre spellings; preserve that retaining the speaker's surname was unusual and agreed to by all. | Korean explicitly says the two families combined surnames. The English's `joined with Gifre` is compressed; Japanese and Chinese also describe joining/merging the families. The historical log asks about the family-name construction. | Medium |
| 33762 | `언더스타일` for `Understyle`; source `its the ruler` | Verify whether Understyle is a named district/site and correct the English typo only in interpretation, not in the source; preserve the speaker's surprise and sarcasm. | Korean transliterates Understyle and follows the intended `it's the ruler` despite the source typo. Chinese instead describes an “underworld garden,” showing the location sense is unresolved. Historical notes flag the place name. | Medium |
| 33763 | `활동 - 박수` for `Activity - Applause` | Determine whether this is a player-facing activity label or an internal/debug label, and localize only if intended for players. | The row resembles the `Activity - CarryLumber` label flagged earlier as possibly internal. All references treat it as an action, but its UI/debug status is unknown. | Low |
| 33764 | `갤로우스 엔드` for `Gallows End` | Standardize this location name against the many active corpus variants; retain the fast-travel restriction and island scope. | Korean transliterates the place name, while the corpus contains both transliterations and literal translations. The historical audit identifies Gallows End as a high-frequency consistency issue. | Medium |
| 33771 | `운명 없는 자` for `Fateless One` | Standardize the protagonist/title form without assuming it is a generic description. | Korean translates the title semantically; Japanese transliterates and Chinese uses a different abstract form. The source capitalizes it as a named designation. | Medium |
| 33778 | `티린의 쉼터` for `Tirin's Rest` | Determine whether this is a named settlement/location and standardize its display form; preserve the instruction to ask around there. | Korean translates `Rest` as refuge/resting place. Japanese interprets it as an inn town and Chinese as a dwelling/resting place; the historical inventory includes Tirin's Rest among location terms. | Medium |
| 33780 | `할로우` for `the Hollow` | Identify whether Hollow is a person, place, faction, or generic cave before choosing transliteration or translation. | English capitalizes the term; Japanese and Chinese translate it as a cave, while Korean transliterates it. The historical audit explicitly leaves the Hollow's identity unresolved. | High |
| 33782 | `윈더미어의 시녀` for `Maid of Windemere`; 13-line poem | Confirm whether `Maid` is a formal title, a maiden/young woman, or a servant; preserve the poem's speaker, gift/death/justice claims, and lineation. Record the line-wrap exception: English splits the word `each- / Other`, while Korean does not reproduce that hyphenated split. | Korean preserves 13 physical lines and the broad narrative, but `시녀` may imply a servant rather than a titled/young woman. The English line break is part of the source's `each- / Other` word-wrap, which is absent in Korean. The historical audit flags both the poem's roles/rhyme and its lineation. | High |
| 33792 | Lord Ohn's battle account / `Seelie`, `Rivener Tarsus`, `Gloamfrost`, `Ender's Fire` | Preserve the full causal sequence, the three exits from the swampy sinkhole, and the three named staffs; standardize faction and artifact names. | Korean retains the separated commander, unfamiliar ground, Seelie advantage, collapse/flight, ambush, slaughter, and earth-splitting account. Names and military terms remain consistency candidates; the historical log asks for the long battle account to be reconciled. | Medium |
| 33796 | `지속형 능력` for `Sustained Abilities` | Standardize the game's sustained-ability terminology and preserve the ongoing mana-bar cost while active. | Korean conveys continuous mana use during activation. The ability category and `mana bar` display term should match tutorial/UI terminology elsewhere. | Low |

IDs 33751, 33753-33755, 33757-33758, 33760-33761, 33765-33770,
33772-33777, 33779, 33781, 33783-33791, 33793-33795, and 33797-33800
generally retain the English meaning on this first reading. Proper names,
lore, voice, and display conventions remain integrated-pass candidates; no
additional distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33600-33799 was checked against
  this range. It explicitly records Scion terminology (33756), the joined
  Wyvyrn/Gifre family names (33759), Understyle and an activity label
  (33762-33763), Gallows End (33764), Tirin's Rest (33778), the Hollow
  (33780), the Maid of Windemere poem (33782), and the battle account (33792).
- The historical note requests preservation of the poem's 13 lines and
  line-wrap hyphenation. Korean has the same 13-line count but does not mirror
  the source's split `each- / Other`; this is recorded as a lineation
  exception, not a missing-row or newline-count mismatch.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33751-33800 once
  and in identical order.
- Embedded newline counts match across all four locales. ID 33782 has 12
  newline characters (13 physical lines) in every locale; the source's
  within-word hyphenation at the line boundary is not mirrored in Korean.
- No runtime-marker mismatch was detected.
- ID 33760 preserves `+8` physical damage and `+25%` damage with Sceptres.
- ID 33792 preserves all three named staffs and the only-three-exits count.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33751-33800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33801.
