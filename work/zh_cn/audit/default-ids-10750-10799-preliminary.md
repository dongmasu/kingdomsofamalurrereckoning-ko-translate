# Preliminary Language Scan: `default` IDs 10750-10799

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10750-10799.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10750 | enchanted raven's claw | Confirm whether this is a literal claw talisman, an enchanted object, or a named Varani tradition. | Korean preserves the magical enhancement of a warrior's skill and the raven-claw image; Japanese specifies a large raven while English/Chinese do not. | Medium |
| 10751 | Lyenna / Mitharan secrets / necklace | Verify Lyenna's spelling and retain the necklace as a possible key, not confirmed proof. | Korean preserves the possibility but compresses “a trove of Mitharan secrets” to Mitharan secrets. Corpus spellings of Lyenna also vary. | Medium |
| 10755 | `this is so much larger` / Arkes | Keep the referent of `this` unresolved and preserve the speaker's realization that Arkes knew. | Korean specifies `이곳` (“this place”); Japanese reads it as sin and Chinese as a complicated matter. English does not identify the referent. | High |
| 10758 | `a poet with a hammer` | Preserve the metaphor for a smith's artistry without implying a literal poet or weapon category. | Korean accurately keeps the poet/hammer image and the praise of the woman's blades. | Low |
| 10759 | `{*1reagents}` / `{*1alchemy}` tutorial | Confirm established UI terms and preserve all four runtime markers. | Korean localizes the marker payloads and retains their class/order and the line-space marker. The instruction accurately links Alchemy skill investment to reagent harvesting. | Medium |
| 10762 | `containers you dispelled` → `해제한 용기들` | Determine whether the containers were unsealed, dispelled, or had a spell removed. | Korean retains the payment and offer of more work, but the exact action on the containers remains unclear. | Medium |
| 10764 | `This drink is piss.` | Preserve the blunt register. | Korean is explicit like English and Chinese; Japanese softens this to a bad-tasting drink. | Low |
| 10768 | stray wind / unfortunate accident | Preserve the speaker's dry, formal sarcasm and awkward analogy. | Korean keeps the “stray wind” comparison and the deliberately elaborate question rather than naturalizing it away. | Medium |
| 10770 | `Sister to our smith, sister to us all` | Confirm whether this is an epitaph/tribute and retain its inclusive sense. | Korean renders a literal sister relationship to the smith and the whole group; the line alone does not identify the person or occasion. | Medium |
| 10771 | `Champion of Valor` → `용맹의 투사` | Confirm whether this is a formal rank/title and align the Korean rendering of `Champion`. | The Korean phrase is plausible but may be read as “fighter of Valor”; the English capitalization suggests a title distinct from House of Valor. | Medium |
| 10773 | Scuttle Beach → `스커틀 해변` | Preserve the established place-name form. | Korean matches recurring `Scuttle Beach` usage; Chinese's literal porthole reading should not override the proper-name evidence. | Low |
| 10774 | Lykeios → `라이케이오스` | Align with the more common active form `리케이오스` and the previously logged variation. | This row repeats the alternate form already flagged elsewhere. Do not normalize globally from one row. | High |
| 10779 | Brit Codgan / `Fae Honor Brand` / spinster's thread | Confirm whether `Brand` is the item's formal name/type; preserve the insult and bluntness joke. | Korean renders it as `페이 명예검`, while Japanese retains the English-like “Honor Brand.” The bad blade is said not to cut even a spinster's thread. | Medium |
| 10781 | thresh / Luca Soren / `She` | Align the creature term and keep the reward-giver's identity open. | Korean consistently uses `스레시` and retains the feminine pronoun without assigning it to Luca. | Medium |
| 10783 | Othel's sister → `오델의 자매` | Verify Othel's spelling; do not infer the sister's relative age. | Korean preserves the sibling relation without marking older/younger age. | Low |
| 10784 | `the Cycle of the seasons` | Confirm whether Cycle is the named Great Cycle or a generic seasonal cycle. | Korean uses `계절의 순환`; the capitalized English `Cycle` and Japanese quotation marks may signal a lore term. | Medium |
| 10788 | `Paul's Things n Stuff` → `폴의 잡동사니` | Decide whether to preserve the deliberately informal shop/sign wording. | Korean conveys a casual assortment of things but loses the source's playful `n Stuff` construction. | Low |
| 10790 | encoded dot/slash sequence | Preserve every symbol, space, and record break. | Korean matches the English and Japanese encoded sequence exactly, including all four line breaks. The Chinese source has altered spacing/symbols and only three line breaks; record this as a locale structural exception, not a Korean mismatch. | High |
| 10791 | `You shall play the Jottun` → `요툰 역할을 맡게 될 거야` | Determine whether `play` means portray a role, participate in a game, or act as a Jottun. | Korean follows the role-playing interpretation; the row lacks scene context to decide among senses. | Medium |
| 10793 | Red Legion | Preserve the faction-name reading and the villagers' hearsay. | Korean uses the established `레드 리전` and retains that the report is hearsay about retreating into the shadows. | Low |
| 10795 | `bandit` / `scavenger` → `산적` / `폐허를 뒤지는 자` | Confirm the hostile sense of `scavenger` in the encounter. | Korean interprets it as someone who searches ruins; the source may instead mean a looter or scavenger. | Medium |
| 10798 | `Beckoned` / city-only task | Align the title and retain the speaker's claim that no one else in the city can perform the task. | Korean preserves the enthusiastic greeting and exclusivity of the request. | Medium |
| 10799 | `Just look at it` | Keep the object unspecified. | Korean says `그냥 직접 봐`; neither the English nor nearby row context identifies the object. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 10750-10751, 10755, 10758-10759,
  10762, 10768, 10770-10771, 10779, 10781, 10783, 10786, 10788,
  10790-10791, 10793, and 10795-10799.
- Compared the Lykeios and Scuttle Beach forms against prior active rows.
  The Lykeios difference remains a candidate consistency issue.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- Record line-break counts and normalized runtime-marker classes/order match
  except ID 10790: English, Japanese, and Korean have four breaks; Chinese
  has three. Korean's encoded ID 10790 field is byte-identical to English.
- The inn-cost variable at ID 10754 is retained. ID 10759's marker order is
  preserved.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10750-10799 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10800-10849.
