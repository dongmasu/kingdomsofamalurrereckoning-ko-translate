# Preliminary Language Scan: `default` IDs 40501-40550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40501-40550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40503 | `Invoices Recovered` / `송장을 되찾음` | Confirm whether this is a quest/UI title and standardize invoice versus receipt terminology. | English says invoices; Korean follows that, while Chinese calls them receipts. The objective state “recovered” is preserved. | Low |
| 40508 | `Or what's left of him` / `그자에게 남은 것이라도` | Keep the grim implication that Barten may be dead or reduced to remains, without asserting more than the source. | Korean's “what is left of him” retains the euphemism. Japanese makes the corpse interpretation explicit; Chinese says remains. | Medium |
| 40509 | `dog of war` / `전쟁터의 개` | Check whether to retain the deliberately harsh mercenary metaphor or use a more idiomatic Korean rendering; preserve the boast about battlefield pay. | English and Japanese both keep the dog image. Korean mirrors it literally, while the line identifies the speaker with the metaphor and contrasts this front's unusually high pay. | Medium |
| 40510 | `a boot full of vipers` / `장화 속에 독사가 가득한 꼴` | Confirm whether the vivid insult should remain literal and whether Whitestone is a place name here. | Korean preserves the English image and complaint. Japanese and Chinese also keep a boot-and-snakes image; the locale references differ in the final degree of frustration. | Low |
| 40513 | `the stage will miss her` / `무대도 이제 그녀를 그리워하진 않겠군` | Preserve the dry, dismissive joke without replacing it with a literal resurrection claim. | Korean follows the English stage metaphor. Japanese instead speculates that she will not return, and Chinese stays close to the stage wording. | Medium |
| 40523 | `FAIL LINE` / `대사 실패` | Determine whether this is an internal/debug status string that should remain literal or a user-facing localized label. | English and Japanese retain `FAIL LINE`; Chinese and Korean translate it differently. The isolated row does not establish its runtime visibility. | Medium |
| 40525 | `waterpoof`, `curiass`, `scav`, `Gallows End` | Treat the apparent English misspellings as source issues, then confirm the creature/place forms and item terminology in context. | Korean reasonably reads the intended `waterproof` and `cuirass`, and preserves the jacket/chest-armor and wetland-camouflage details. Historical notes already flag these spellings and names; no CSV correction is made. | High |
| 40530 | `Senior Project Manager of Trade Marketing` | Confirm whether this isolated corporate-style job title is intentional game text or stray/imported content; retain provisionally rather than inventing a setting context. | Japanese leaves it in English; Korean and Chinese translate it. No neighboring source context establishes a speaker or organization. | Medium |
| 40531 | `mission` / `선교관` | Check whether `mission` is the named religious institution/site and align it with the project's Mission terminology. | The row asks that Brother Fallon's prayer beads be brought there. Japanese says monastery, while Chinese says preaching place; Korean's `선교관` is plausible but needs setting context. | Medium |
| 40533 | `devotion` / `헌신` | Confirm whether the speaker means religious devotion, reverence, or an emotional quality alongside energy. | Korean uses “dedication.” English's capitalized sacred-hall context and Chinese `圣洁` suggest a religious sense; Japanese substitutes “deep love.” | Medium |
| 40535 | `She's got it for a song` / `그녀에겐 아주 싸게 해줄게` | Preserve the bargain/very-low-price meaning while checking who is buying or setting the price in the surrounding exchange. | Korean follows Japanese and Chinese in reading the idiom as a low price, but makes the seller's offer explicit. English's subject and transaction context remain elliptical. | Low |
| 40537 | merchant galley or old naval vessel | Retain the speaker's uncertainty about what kind of large ship it was. | Korean preserves the self-inspection caveat, ship size, and both alternatives; no unsupported vessel type is selected. | High |
| 40540 | `which end of a hammer is up` / `망치 어느 쪽을 위로 해야 하는지도` | Check the Korean joke's naturalness while preserving the self-deprecating claim of not knowing how to use a hammer. | Korean translates the English image literally; Japanese and Chinese likewise retain the hammer-end joke. | Low |
| 40544 | `+{1} {2} {3}` | Preserve the English/Chinese/Korean placeholder order; record the Japanese-only order difference without normalizing any CSV. | English, Chinese, and Korean use `{1}`, `{2}`, `{3}` in that order. Japanese uses `{2}{3}+{1}`. All three Korean placeholders and the plus sign are present. | High |
| 40545 | Arduath / `those boots` | Confirm Arduath's canonical Korean form and which boots are meant; do not infer a specific item from this isolated warning. | Korean preserves the fatal-risk warning and the conditional reason to go. English and Japanese say “those boots”; Chinese supplies a specific-looking boot name, which English does not. | Medium |
| 40546 | `Shard` / `Sagecrafting` / `gem` | Confirm `파편` and recurring item terminology while preserving the localized marker contents and marker identities. | Korean keeps all four `{*1...}` markers in source order and localizes their display labels. Historical notes identify Sagecraft as `마법물품 제작`; shard/gem naming remains a terminology check. | Medium |
| 40549 | `Enter the Arena.` / `투기장에 입장.` | Check whether this objective label should retain an explicit imperative or the current concise quest-objective style. | Korean preserves the destination/action as a compact objective. Japanese uses a sentence-like imperative; Chinese also uses an imperative. | Low |

IDs 40501-40502, 40504-40507, 40511-40512, 40514-40522, 40524,
40526-40529, 40532, 40534, 40536, 40538-40539, 40541-40543, 40547-40548,
and 40550 generally retain the English meaning on this first reading. Proper
names, established terms, register, and plot references remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical log has an entry spanning IDs 40450-40549.
  Its questions for IDs 40508-40509, 40513, 40525, 40529, 40530, 40537,
  40545, and 40546 were checked against the current four-locale rows.
- Historical questions concerning Barten, the `dog of war` idiom, the stage
  joke, item-source spellings, `Scav`, `Gallows End`, the trade-marketing
  label, the unidentified ship, the boots, and Shard/Sagecrafting remain open.
- The official Korean manual could not be text-searched in this environment;
  no new manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40501-40550 once
  and in identical order.
- Embedded line-break counts match across all four locales. At ID 40544,
  Japanese alone reorders the runtime placeholders; Korean matches English
  and Chinese. ID 40546 retains all four localized markers in source order.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40501-40550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40551.
