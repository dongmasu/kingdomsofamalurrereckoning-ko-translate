# Preliminary Language Scan: `default` IDs 33001-33050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33001-33050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33002 | `깊은 잠을 밝히는` for `bring clarity to the Deep Slumber` | Determine whether `clarity` means understanding, lucidity, or revealing the named Deep Slumber; keep the item objective and blessing distinct. | English is ambiguous in the isolated sentence. Korean says the piece will help illuminate the Deep Slumber; Japanese/Chinese interpret clarity as lucidity/awakening. Historical notes flag this exact sense. | High |
| 33006 | `함께하는 시간이 길어질수록` / `더 잘하게 될 거야` for `the longer we play together` | Preserve the thrill and the prospect that they will improve the longer they perform/play together; check whether Korean's general “time together” loses the shared activity. | English and Chinese explicitly say play/perform together. Korean retains the growing improvement but omits the activity; Japanese is similarly general. The row alone does not identify whether this is music, a game, or another performance. | Medium |
| 33019 | `#NAMED_ICON_GRAY_360_RB#` | Preserve this opaque named-icon token exactly. | All four locales contain the identical icon token; no Korean change or token-order issue. | High |
| 33022 | Six-line endless-winter prophecy / Deathbringer / Siegebreaker / Fate usurper / twice-born / Godslayer | Preserve all six lines, the contrast between Fae winter and Tirnoch's winter, Ohn/nature claims, and every named title; verify lore terminology without resolving the prophecy by invention. | Korean retains six lines and the sequence of claims/titles. English, Japanese, and Chinese preserve five embedded breaks each. Proper titles and the phrase “ageless decay” remain glossary/context candidates. | Medium |
| 33025 | Four-paragraph Tome of Synthesis puzzle note | Preserve the narrator's possible death, reconciliation with Mitharu, four locks/four numbers, four shelves/four locks clue, and request to free the people; do not solve the code or invent context. | Korean retains all four paragraphs and six newline characters. It preserves the four magical locks, four numbers, four shelves, yellow triangle/Maxim Masterin clue, and final request. The last English paragraph's “free my people” becomes “liberate our people,” a close reading. | Medium |
| 33027 | `내 가문을 해방해 줘` for `liberate my house` | Keep open whether `house` means a family, formal House/faction, or another group; preserve the Tuatha objective and speaker's regret. | Korean selects a family/clan reading. English uses lower-case `house`; surrounding reference to “my people” does not fully establish whether a named institution is intended. | Medium |
| 33030 | `선견자들` for capitalized `the Preordained` | Standardize the faction/title and retain that Orella withholds the exact entry instructions for fear they are listening. | Korean translates the proper-noun-like group as “seers.” Historical terminology has multiple competing Korean forms for Preordained; English capitalization suggests a named group. Korean keeps the secrecy rationale and valuable hint. | High |
| 33041 | `승리의 경기` for `the Victory Games` | Confirm the official event/title form and preserve that the objective is to survive it. | English capitalizes Victory Games, while Korean reads as generic “victory games.” Japanese transliterates the event name and Chinese calls it a competition. | Medium |
| 33043 | `장검 사용 시` for fragment `with Longswords` | Retain the equipment/weapon-context fragment without turning it into a full sentence; verify whether `Longswords` is a named category or ordinary weapon class. | Korean reads as a conditional equipment label. Japanese parenthesizes “longsword,” and Chinese says “using longswords.” The historical question explicitly leaves the stat/equipment context open. | Medium |

IDs 33001, 33003-33005, 33007-33018, 33020-33021, 33023-33024, 33026,
33028-33029, 33031-33040, 33042, 33044-33050 generally retain the English
meaning on this first reading. Names, lore titles, and some dialogue context
remain integrated-pass candidates; no other distinct high-confidence wording
issue was identified.

## Historical Audit Reconciliation

- The source-keyed entry for IDs 33000-33099 flags the clarity sense at
  33002, the sucker taunt at 33003, the six-line prophecy at 33022, the
  four-paragraph puzzle note at 33025, references at 33027/33028, Victory
  Games and `with Longswords` at 33041/33043, and further named entities.
  These were checked against all four locale rows and active Korean.
- The capitalization and group status of Preordained at ID 33030 and the
  proper-name status of Victory Games at 33041 remain terminology questions.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33001-33050 once
  and in identical order.
- Embedded line-break counts match across all four locales. The prophecy at
  ID 33022 has five breaks/six lines; the note at ID 33025 has six breaks
  and four paragraphs.
- `#NAMED_ICON_GRAY_360_RB#` at ID 33019 is preserved exactly.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33001-33050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33051.
