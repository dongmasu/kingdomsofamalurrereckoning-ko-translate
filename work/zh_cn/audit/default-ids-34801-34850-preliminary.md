# Preliminary Language Scan: `default` IDs 34801-34850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34801-34850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34804 | `시녀` for `the Maid` | Determine whether the Maid is the named character/title and use the established form rather than a generic servant term if confirmed. | English capitalizes `Maid`; Korean is generic. Japanese uses a specific Windemere epithet and Chinese says “maiden,” while the historical notes leave this entity unresolved. | Medium |
| 34805 | `시일리` for `the Seelie` | Confirm whether Seelie is a named faction/people formed by the formerly divided group and standardize the name. | The sentence describes a collective identity that results from joining together. Korean transliterates it; Chinese gives a seasonal-fae term and Japanese transliterates it. The historical inventory flags Seelie as a possible group name. | Medium |
| 34811 | `미타루의 교리` for `Mitharu's creed` | Confirm the established Korean for this religious creed/tenet and distinguish it from doctrine in the institutional sense. | All locales ask about a religious teaching, but the exact in-world doctrine and terminology are not supplied in this row. Historical notes explicitly flag Mitharu's creed. | Medium |
| 34817 | `성스러운 성소` for `holy hollow` | Verify whether `hollow` is a named sacred cave/landform or means a sanctuary; retain the accusation that Gadflow desecrated it. | Korean resolves the source's “holy hollow” as sanctuary. Japanese says sacred cave, while Chinese renders a sacred void; the source's setting-specific referent remains uncertain. | Medium |
| 34819 | `첫 서약자들의 유산` / `그들의 이름으로 맹세` | Standardize Firstsworn as a named people/order and determine whether capitalized Oaths refers to a formal rite, not only ordinary vows. | Korean preserves the legacy and oath claims but renders the group and Oaths generically. Japanese/Chinese treat Firstsworn as an inherited tradition/spirit; the historical log flags Firstsworn. | Medium |
| 34820 | `여름 궁정` for `Court of Summer` | Confirm the named court/faction and standardize its Korean form; retain the question asking where it can be found. | Korean translates the name literally. Japanese/Chinese also translate it; the historical audit lists Court of Summer as an unresolved named entity. | Medium |
| 34823 | `낮은 숫자니까 네가 이겼어` for the card-game line | Preserve `Lower` as the card game's low/high call and the three-card value; confirm whether the final line explicitly states a win or merely congratulates the player. | Korean correctly interprets “a three” as card value 3 and connects it to the low call. Japanese explicitly says the player won; the English says “good on you,” so the win is strongly implied but not fully explicit. The historical audit flags `Lower` in the card-game context. | Low |
| 34825 | `파세터` / Pacetor and the signed letter | Confirm the writer's canonical name (Pacetor/Paceter variants occur across locale/history) and retain the letter's longing, enforced confinement, and hope of reunion. | Korean preserves the main message and blank-line signature. Locale spellings differ. The English contains several grammatical errors (“by encounter,” “this mean”), which Korean sensibly repairs rather than reproducing. Historical notes ask to reconcile Pacetor/Pacet(or) and Idylla forms. | Medium |
| 34826 | `장어 꽃잎` / `씨플랙스` and potion recipe | Confirm the established Korean names for Eel Petal and Seaflax; preserve the temporary 75% Shock chance and all four ingredient quantities. | Korean retains 75% and the ingredient quantities 3, 2, 1, and 1, plus the blank-line recipe layout. The isolated plant names need the item glossary; historical notes flag this recipe. | Medium |
| 34831 | `남편을 살해한 자의 시신 앞에 선` | Correctly preserve that Allyn stands over her murdered husband's body; do not turn it into the body of the person who murdered her husband. | English “her murdered husband,” Japanese “murdered husband,” and Chinese all identify the husband as the victim. Korean instead says she stands before the corpse of the person who killed her husband, reversing the relationship. It then refers to the beloved's corpse, reinforcing the intended reading. | High |
| 34841 | `레퀴엠호` for `The Requiem` | Confirm The Requiem as the ship's formal name and keep it distinct from the common noun “requiem.” | The threat calls it a funeral barge, suggesting wordplay on a vessel name. Korean explicitly adds the ship suffix `호`, while Japanese/Chinese omit it. The historical log flags The Requiem as a possible proper name. | Medium |
| 34843 | `히에로펀트` for `The Hierophant` | Confirm whether this is a formal title/rank or a named individual and standardize the Korean term. | Korean transliterates the title; Japanese calls it a guide and Chinese a high priest. The historical audit lists Hierophant terminology as unresolved. | Medium |
| 34844 | `템플러` for `Templar Vinthur` | Confirm Templar as an institutional rank/title and standardize its Korean display form. | The salutation preserves the name and address, but Korean retains the English-derived title. Japanese and Chinese translate it as a temple knight; historical notes flag Templar terminology. | Medium |
| 34850 | `라시르 2 진입` for `EnterRathir2` | Determine whether this is a player-facing label or an internal quest/debug key before deciding whether its identifier-like form should be translated. | English preserves a concatenated internal-looking identifier, while Korean splits and localizes it; Japanese/Chinese also translate the label. Historical notes explicitly caution that it may be internal. | High |

IDs 34801-34803, 34806-34810, 34812-34816, 34818, 34821-34822,
34824, 34827-34830, 34832-34840, 34842, 34845-34849 generally retain
the English meaning on this first reading. Proper names, lore, voice, and
display conventions remain integrated-pass candidates; no additional
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 34800-34999 includes the
  Scholar Jamane/Dverga text (34801), Seelie, Mitharu's creed, the holy
  hollow, Firstsworn, Court of Summer, the `Lower` card call, Pacetor/Idylla,
  the ingredient recipe, The Requiem, Hierophant, Templar, and
  `EnterRathir2`. These were checked against active Korean and all locale
  references.
- The initial historical issue log for ID 34795's finger joke, completed
  in the preceding batch, identifies a related but separate item from the
  long letter/recipe in this batch.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34801-34850 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 34825
  preserves the letter/signature breaks; ID 34826 preserves the recipe
  paragraph and ingredient-list layout.
- No runtime-marker discrepancy was detected.
- Values agree: the potion is 75% at ID 34826 and its four ingredient
  quantities are 3, 2, 1, and 1. English spells out some number values in
  prose; Korean preserves their meaning.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 34801-34850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34851.
