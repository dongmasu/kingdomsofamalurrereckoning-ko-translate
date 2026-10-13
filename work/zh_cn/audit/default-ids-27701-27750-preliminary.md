# Preliminary Language Scan: `default` IDs 27701-27750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27701-27750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27701-27703, 27706-27710, 27713-27719, 27722-27724, 27726-27730, 27732-27733, 27737-27739, 27743-27746, 27748-27750 | Dialogue, objectives, names, and concise UI text | Recheck voice, register, and recurring names in the integrated pass; retain fragments, sarcasm, and source typos without silently repairing them. | Korean generally conveys the English meaning and follows Japanese voice/register. ID 27738's English grammar error is not reproduced in Korean. ID 27727 remains an intentionally incomplete source sentence. | Medium |
| 27702, 27705, 27711-27712, 27715, 27720, 27725, 27731, 27735-27736, 27740, 27742, 27747 | Adept / Fateless One / Sagecrafting / Beckoned / Ljosalfar / House of Ballads / Well of Souls / Engard poem / Windstones / House of Vengeance / knights' verse / Court of Summer / potion title | Reconcile title, faction, crafting, fate, and lore terminology; preserve named entities and the runtime placeholder. | Korean keeps `{1}` at 27735 and retains the six-line Engard poem layout at 27731. The historical inventory groups these names and literary/UI texts for glossary and context review. | Medium |
| 27705 | `운명 없는 자인 너를 보러` for “here for you, the Fateless One” | Check whether the source means the people came to see the Fateless One or came for their sake. | English “here for you” and Chinese “came for you” support the latter/broader reading; Japanese says they came to the addressee. Korean selects “came to see you,” which may narrow the intended meaning. | Medium |
| 27722 | `이 친구, 반갑군` for “My fine fellow.” | Recheck the colloquial vocative and whether a direct greeting or compliment is intended. | English is a familiar address (“my fine fellow”); Japanese reduces it to a greeting and Chinese says “my good companion.” Korean's `이 친구` can sound like a third-person reference rather than a natural direct address. | Medium |
| 27728 | `아쉽게도 이제 걱정할 필요가 없겠네` | Preserve the speaker's sarcastic response to the war's end without making the regret sound sincere. | English is deliberately ironic about having worried over the outcome; Japanese also frames the speaker as rueful. Korean's final sentence supports sarcasm, but its emotional force merits voice review. | Medium |
| 27734, 27741 | `MQ05` functionality note / player-entry and prediction note | Determine whether internal/developer-facing text should remain untranslated or be localized under a project-wide rule. | Both rows describe quest/system behavior rather than player-facing prose. Korean translates them and expands `MQ05` to `주요 퀘스트 05`; the historical audit specifically flags the MQ05 internal note and similar labels. | Medium |
| 27742 | `Court of Summer` in `Gardens of Ysa` | Preserve the likely location relationship while retaining the malformed English structure as a source question. | English says “meet in the Court of Summer the Gardens of Ysa”; Japanese and Chinese support reading the Court as located in the Gardens. Korean makes that relationship explicit. | Medium |
| 27750 | `버팀목이 썩어 가고 있어` for “the crutch ... is rotting” | Preserve the crutch metaphor and the contrast between expected and “foresaw” outcomes. | Korean follows the English image and the sarcasm. The metaphor and Travelers/Hierophant terminology recur in the historical inventory and should be considered with related rows. | Medium |

## Historical Audit Reconciliation

- The 27700-27799 source-keyed inventory flags the Maid/Belmaid poem,
  Gask, Hierophant, Fateless One, Sagecrafting, House of Ballads, Well of
  Souls, the sarcastic war remark, Engard's poem, the MQ05 internal note,
  House of Vengeance, the knights' verse, and Chancellor Erawn.
- It also flags the Minor Alchemist's Art potion and the crutch metaphor at
  27750. These notes are issue inventory, not approval or a consolidated
  review disposition.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27701-27750 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. `{1}` at 27735 and the six-line Engard poem at 27731
  preserve their structures.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 27701-27750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27751.
