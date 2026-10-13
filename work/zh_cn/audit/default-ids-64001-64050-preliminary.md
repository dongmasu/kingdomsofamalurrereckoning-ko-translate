# Preliminary Language Scan: `default` IDs 64001-64050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 64001-64050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 64001 | `Face my supposition!` / `내 추론을 들어 봐` | Keep the odd English imperative open; verify whether the speaker means “hear my hypothesis/reasoning.” | Japanese says “my hypothesis is this” and Chinese says “look at my reasoning”; Korean gives a natural invitation to hear the inference. | Medium |
| 64002 | two-legs / `두 발 달린 이` | Preserve the nonhuman speaker's direct, potentially affectionate address and urgent request. | All locales retain the “two-legged” address; Korean preserves both the unusual vocative and request for help. | Low |
| 64003 | Beckoned / one-person camp | Verify whether “room enough for one” means one occupant total or one additional space; keep the dismissal conditional on having no business. | Korean follows the one-person reading supported by Japanese and Chinese. | Medium |
| 64004 | Shepard / Ballegar | Verify both canonical names and the succession relation after Ballegar. | Korean retains the armor attribution and identifies Shepard as Warsworn commander after Ballegar; other locales transliterate both names differently. | Medium |
| 64009 | Red Legion | Verify the faction's established Korean form and retain the warning not to underestimate them. | Korean transliterates the proper name and preserves the advice to withdraw from the “ugly business.” | Medium |
| 64012 | “small game” / `꼬마` | Confirm that `small game` is a diminutive address rather than a literal game/activity; preserve the offer of goods to someone seeking advancement. | Japanese addresses the addressee as a small one; Chinese misreads it literally as a small game. Korean correctly treats it as a person-address. | Medium |
| 64013 | Argine / camp leader | Preserve the sequence of speaking with Argine, getting work, distracting the Hierophant, and meeting again. | Korean retains the instructions and the speaker's promise to find the addressee. Name spelling remains provisional. | Low |
| 64015 | unfinished research sentence | Preserve the source's trailing em dash and the explicit two-year comparison; do not invent the continuation. | English and Chinese end mid-thought; Japanese completes the sentence. Korean retains the unfinished source form and the two-year timeframe. | High |
| 64017 | Online Services Testers | Determine whether this is an internal/test label that should remain untranslated or a user-facing role name. | English and Japanese retain the English label; Chinese translates it, while Korean leaves it unchanged. | Medium |
| 64018 | sailor's yarn / `허풍 섞인 이야기` | Preserve the affectionate interest in tall tales without making the stories necessarily false. | English idiom `yarn` and Japanese/Chinese “stories” support the tale sense; Korean adds the tall-tale nuance. | Low |
| 64021 | daughter's lost/disappeared status | Clarify whether the daughter is missing, dead, or otherwise gone; retain the consolation and modest reward. | English/Chinese say lost, Japanese implies she is gone/dead, and Korean says disappeared. The translations leave the underlying outcome unresolved. | High |
| 64023 | `FourthRoomEntrance` / `네 번째 방 입구` | Verify whether this is a translatable UI label or an internal identifier. | English uses a concatenated identifier-like string; Japanese/Chinese/Korean render it as ordinary localized text. | Medium |
| 64029 | “right with you” / Jokull | Determine whether this means Jokull supported the addressee from the start or correctly judged them. | English is ambiguous; Japanese says he has been on the addressee's side, and Korean follows that supportive reading. | Medium |
| 64032 | `suppose` / “감방에 있어야” | Record the English grammatical error (`suppose` for `supposed`) and verify that the intended question is preserved. | Korean follows the intended “aren't you supposed to be in a cell?” sense, consistent with Chinese. Japanese is less explicit. | Medium |
| 64033 | Aergase, Hunting Herald | Verify title/name order and whether `Hunting Herald` is a formal office or descriptive epithet. | Korean keeps both the Korean title and parenthetical source name; other locales place or translate the title differently. | High |
| 64038 | `{1}` / `{*1sprint}` tutorial | Preserve both runtime markers and check whether the localized instruction should say “toggle sprint” or explicitly “turn on and off.” | Korean keeps `{1}` followed by the sprint marker and interprets toggle as `켜고 끌 수`; all locales retain the same control/ability identities. | Medium |
| 64046 | Forge Ysa Honor Brands | Verify whether `Honor Brands` names an item, crafting station, or crafting action before standardizing the Korean phrase. | Korean translates the task as crafting an honor mark associated with Ysa; English's capitalization is ambiguous. | High |
| 64047 | Hyperian/Ethene poem | Preserve the speaker's conditional wish to create faithful people, raise the Hyperian, and end the “befouled”; verify Ethene's demand and the final line's agency. | Korean retains the five-line structure and the creation/raising/ending progression. The source's “do for Ethene what she demands of the wretched” remains obscure. | High |
| 64050 | ancestral home / ruin | Preserve that the speaker's ancestors once lived in a beautiful place now ruined and overrun by monsters. | Korean retains the contrast and does not add a cause for the ruin. | Low |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the Champion taunt, Red Legion warning, the die-roll label, the
lost-daughter consolation, the cell question, Aergase's title, the Chaos
effect values, and the short combat/UI strings. Proper names and lore terms
remain provisional. Findings are not confirmed corrections.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 63950-64049 against
  this batch, including the small-game address, Argine, the unfinished
  research line, Online Services Testers, sailor's yarn, the lost daughter,
  FourthRoomEntrance, Jokull's greaves, Aergase, Ysa Honor Brands, and the
  Hyperian/Ethene poem.
- Also checked the historical entry beginning at ID 64050 for the
  ancestral-home line.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 64001-64050 once
  and in identical ascending order.
- Embedded newline counts match for every row. The unfinished source line
  at 64015 and five-line poem at 64047 preserve their Korean line structure.
- Runtime markers at 64020 and 64038 retain their identities and order;
  numeric values and the `{1}` die-roll variable are preserved. The poem at
  64047 retains its five-line layout.
- No translation CSV edit was made.

## Batch Status

IDs 64001-64050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 64051.
