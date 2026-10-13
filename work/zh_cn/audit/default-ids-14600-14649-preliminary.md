# Preliminary Language Scan: `default` IDs 14600-14649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 14600-14649.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 14600 | `your take on the Hero` -> `영웅 역할을 어떻게 해내는지` | Determine whether this asks for a portrayal of a specific Hero title or the addressee's interpretation of heroism. | English is context-dependent; Japanese/Chinese support playing/portraying the Hero, as does Korean. Historical question remains open. | Medium |
| 14601 | Faeblades delayed attack | Preserve the weapon name and the delayed launch mechanic. | All locales describe a delayed attack with Faeblades that launches an enemy; Korean preserves the mechanic. | Low |
| 14605 | `Enemy Focus` -> `적 주시` | Confirm whether this is a target-lock state, combat stat, or UI label. | English is an isolated interface term; Japanese treats it as focusing on an enemy while Chinese translates it literally. Historical question remains open. | Medium |
| 14607 | Belen's Testament -> `베이렌 결사` | Determine whether Testament names a group, doctrine, or literal testament and align Belen's spelling. | English and Chinese say Testament; Japanese says a Belen association/order. Korean's `결사` reflects a group interpretation. Historical question remains open. | Medium |
| 14611 | `the Teeth's troubles` -> `나로스의 이빨에서 벌어지는 문제` | Confirm whether this means the political troubles in the Teeth of Naros region or its literal dangers. | Korean treats it as trouble occurring in the named place; the phrase remains compressed. Historical question remains open. | Medium |
| 14620 | Gloamthicket -> `글룸시커릿` | Verify the canonical place name and whether the English compound is a forest, thicket, or cave. | Japanese reads it as a flourishing cave and Chinese as a twilight forest; Korean preserves an English-derived name without choosing a terrain noun. Historical question remains open. | Medium |
| 14623 | Reckoning / fateshifting / unraveling / `{LINE_SPACE}` / `{1}` | Preserve gameplay logic, localized markers, line-space token, and continue-button placeholder. | The Korean instruction retains the condition and consequence. All four locales include three localized-markup tokens followed by `{LINE_SPACE}` and `{1}` in the same order. | Low |
| 14627 | Agarth / Fate / `drowned yourself in drink` | Preserve the idiom describing abandoning one's sword and drinking heavily. | Korean's `술에 빠져 살았다` captures the idiomatic sense; English's “drowned yourself” is not literal. | Low |
| 14630 | Crilgarin / `Knave of Coins` -> `동전의 시종` | Align the title with the same English name at ID 14181, where Korean uses `동전의 잭`. | The English label is identical, but Korean changes the title noun from `잭` to `시종`; Japanese and Chinese also offer differing readings. This is an unresolved cross-batch consistency question. | High |
| 14634 | Garvin Dulac / Almain scribe / command the elements | Verify the name form and preserve that he became the first human able to command the elements. | Korean retains the source's causal sequence and role; Japanese/Chinese support the achievement. The name lacks the source spelling in parentheses, unlike many nearby entries. | Medium |
| 14637 | dispelling skill -> `봉인 해제 기술` | Verify the official Korean skill term and preserve the increase by three points. | All locales give a temporary +3 to dispelling; Korean uses “unsealing” terminology. | Medium |
| 14639 | `Warsworn` -> `전쟁의 맹세자` | Align this direct address with the established faction rendering `워스원`. | Most other active Korean occurrences retain `Warsworn` as `워스원` (including ID 14583); this row translates it descriptively. This is a likely name-consistency issue. | High |
| 14640 | Bisarane -> `비사레인` / House of Sorrows | Align the character's spelling with recurring `Bisarane` occurrences. | The active Korean corpus commonly uses `비사라네(Bisarane)` (for example, IDs 612, 1114, and 2303), while ID 14640 uses `비사레인`. Historical question remains open. | High |
| 14641 | `the line was broken` -> `대열이 무너졌지` | Confirm whether line means a military formation or another kind of line/boundary. | Korean chooses the military-formation reading; English and Chinese leave some context dependence. Historical question remains open. | Medium |
| 14645 | Fae / foe | Preserve the Fae/foe wordplay while keeping the medical condition and indiscriminate attacks clear. | English uses near-rhyme/alliteration; Korean says they cannot distinguish Fae from enemies, preserving meaning but not the sound play. | Medium |
| 14649 | `Sea cruise, indeed!` | Confirm the speaker's situation and retain the sarcastic tone. | Korean's `유람선 여행이라니, 참 대단하군!` reads as sarcastic, consistent with the historical question and Japanese rendering. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 14600, 14605, 14607, 14611, 14620,
  14641, and 14649 against the active Korean and all three source locales.
  They remain preliminary questions; no historical disposition was treated
  as approval.
- Cross-batch terminology checks additionally found Korean variants for
  Crilgarin's title (14630 vs. 14181), Warsworn (14639 vs. the prevailing
  `워스원` form), and Bisarane (14640 vs. recurring `비사라네`).
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed embedded line-break counts match across the batch.
- Brace, dollar, and hash-token signatures match, including the three
  localized markup markers and `{LINE_SPACE}`/`{1}` at ID 14623 and the
  `$STR0 $STR1 $STR2` sequence at ID 14642.
- Active Korean CSV hash matches the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 14600-14649 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 14650-14699.
