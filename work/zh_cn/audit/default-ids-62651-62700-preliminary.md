# Preliminary Language Scan: `default` IDs 62651-62700

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 62651-62700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 62651 | Sword core / alternate weapon crafting | Preserve the choice between repairing the sword and forging another weapon; retain that the core can also make a staff or daggers. | Korean preserves all options and the core reference. Verify the established crafting term for `core` and whether the speaker's offer is a smith interaction. | Medium |
| 62652 | Block values / `마법 피해 5 방어` | Preserve 5 Magic, 10 Melee, and 10 Ranged damage blocked as three separate labels/values. | Korean retains all three categories and values. The four locales preserve the same three-line structure. | High |
| 62653 | Champion / “end of the road” | Retain the gladiator address and warning that the Champion is the next opponent in the Arena. | Korean preserves the challenge and finality. “End of the road” is idiomatic; it need not mean the gladiator's literal death. | Medium |
| 62654 | `{*1Inventory}` / `{*1longbow}` | Preserve all three localized markers and verify the tutorial sequence and canonical UI labels. | Korean keeps inventory, longbow, and inventory markers in English-source order. Japanese reorders the first two; Chinese/Korean follow the English sequence. Marker codes and count are preserved. | High |
| 62658 | Ost Ordura / Brigand Hall Caverns / Hirelings | Confirm the cavern name and retain that the patrol is complete but Ost intends to investigate the Niskaru source that killed the other hirelings. | Korean preserves the mission and causal link. Japanese calls the victims third-class mercenaries, while English says Hirelings; the group/rank distinction needs context. | Medium |
| 62659 | Even / three-card draw | Preserve the parity challenge and the speaker's refusal after drawing a three. | Korean keeps the odd/even contradiction and refusal. The card-game rules are context-dependent. | Medium |
| 62661 | Agreement with the Champion / `합의` | Clarify whether this is a formal agreement, bargain, or alliance and retain the warning to be wary. | Korean preserves the caution. English/Japanese align; Chinese makes the relationship sound more personal. | Medium |
| 62662 | Master Healing Potion / `상급 치유 물약` | Verify the potion tier against the project's established item-name convention and retain Colm/Glasspillar Caves. | Korean uses “advanced” tier wording; English says Master, while Japanese names a large life potion. The game item's canonical tier is unresolved. | High |
| 62664 | Revived without choice / `결과야 어찌 되든` | Preserve the speaker's admission that they made the choice for the addressee and disregarded consequences. | Korean retains both points. English's `consequences be damned` is blunt; Korean conveys disregard without matching the profanity. | Medium |
| 62665 | Spirits and bogeymen / `영혼과 괴물` | Check whether “bogeymen” is literal supernatural beings or a scare-story expression, and retain the speaker's failed attempt to deter exploration. | Korean generalizes bogeymen to monsters; Japanese uses ghosts and demons, and Chinese uses ghosts and monsters. The source's folk-horror term remains open. | Medium |
| 62666 | Firstsworn / `퍼스트스원` | Confirm whether Firstsworn is a formal order/faction title and preserve the former Niskaru-hunter identity. | Korean keeps the named heroes and hunting role. English/Japanese/Chinese frame the relationship to the present group differently; historical terminology remains open. | Medium |
| 62667 | Order of Mitharu / `미사루 기사단` | Verify whether this is a religious order or specifically an order of knights; preserve Odwig's saintly status and the shackles' protective legend. | Korean calls it a knightly order, while Japanese/Chinese describe a religious group/sect. English only says Order of Mitharu, so `기사단` may be too specific. | High |
| 62670 | Children of Ohn / `오언의 자식들` | Confirm the established group/title rendering and whether “children” is literal, devotional, or factional. | Korean preserves the possessive title and uses the established Ohn name form; the exact group identity remains contextual. | Medium |
| 62676 | Feride Ouet / Adessa Mine experiment | Preserve the objective to find the gnomish scholar and help with his requested experiment; verify name and mine spellings. | Korean retains the objective but says the speaker should “take charge of” the experiment, which may be stronger than helping with it. Japanese explicitly says to accept the request to help. | Medium |
| 62677 | Chief Financial Officer / `최고 재무 책임자` | Determine whether this modern corporate title is intentionally player-facing or test/developer text. | Korean translates the title literally. The historical audit flags it as potentially anachronistic; preserve pending context rather than silently replacing it. | High |
| 62679 | Akara the Exile / `추방자 아카라` | Preserve the repeated imperative and confirm whether `the Exile` is a title/name. | Korean identifies Akara and retains the repeated “speak with” structure. Chinese parses “Akara and the exile” as two people, so the appositive/title reading should be checked. | Medium |
| 62680 | Reverie / `몽상` | Determine whether this is a proper location/status/UI label or a generic state of dreaming. | Korean translates the word generically; Japanese says meditation and Chinese says daydream. The isolated label cannot settle the intended referent. | High |
| 62686 | “on the lines” / `전선에서` | Confirm the military/front-lines sense and preserve the speaker's promise to watch the addressee's performance. | Korean reads it as the front line, matching Chinese; Japanese instead praises the addressee's fighting. English remains idiomatic without surrounding dialogue. | Medium |
| 62692 | Moon Camp / `달 야영지` | Confirm the proper location name and whether “Moon” is translated or retained as part of the official name. | Korean preserves it bilingually; Japanese uses “Moon Camp” literally, while Chinese says Moon Camp. Canonical naming remains open. | Medium |
| 62697 | Eagonn / Eamonn / `에아몬`, `이건` | Verify the two similar names and preserve the relation “foe of Eagonn, son of Eamonn.” | Korean keeps the relation and both names with English spellings. Japanese reverses the clause naturally; Chinese agrees with the English relationship. | Medium |
| 62699 | Sceptre / {*1} localized markers | Preserve the three marker identities/order, long-range function, Mage preference, and per-shot Mana cost. | Korean retains all three `{*1...}` markers and the gameplay details. Localized payloads differ by locale, as expected; no marker was dropped. | High |

Other reviewed rows generally preserve first-read meaning and voice/register,
including refugees, Grip, Benwick Athelm, Master Potion acquisition, Templar
Octienne, the return-from-death admission, keep guards, the concert ration,
login status, Adessa's history, the mayor's betrayal, wreck inquiry, front
line warning, Moon Camp, Orella, Crystal War, and Mel Senshir. Proper-name
spellings and bilingual parenthetical formatting remain provisional; this
pass does not impose a global display convention.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 62650-62749, including
  weapon cores/block values, Inventory-longbow markup, the Brigand Hall
  patrol, card-game parity, Champion agreement, Master Healing Potion,
  Templar Octienne, revival without choice, spirits/bogeymen, Firstsworn,
  Odwig/Mitharu, Children of Ohn, CFO, Akara the Exile, Reverie, the lines,
  Moon Camp, Eagonn/Eamonn, and Sceptre markers.
- The historical note spans IDs 62650-62749; entries outside this batch
  were not counted as reviewed here.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 62651-62700 once
  and in identical ascending order.
- Embedded newline counts match for every row. ID 62652 has two embedded
  newlines in every locale, preserving the three-line defense block.
- Runtime-marker counts and codes match. ID 62654 contains three `{*1}`
  markers; ID 62699 retains all three localized `{*1...}` markers.
- Values at 62652 (5/10/10 damage) and label `9` at 62660 are preserved.
- No translation CSV edit was made.

## Batch Status

IDs 62651-62700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 62701.
