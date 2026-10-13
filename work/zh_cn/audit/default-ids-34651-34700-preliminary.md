# Preliminary Language Scan: `default` IDs 34651-34700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34651-34700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34659 | `저 괴물이 다시 통제권을 되찾기 전에` | Preserve that the enemies regain control of the creature before it is too late; do not make the creature itself regain control. | English says “they” regain control of the creature. Korean makes the creature the subject that regains control, reversing the actor and object. Japanese leaves the agents implicit but describes the creature's control being released; Chinese follows the English agents. | High |
| 34661 | `주변의 유리` for `Glass of Ambient` | Verify whether `Glass of Ambient` is a named relic and establish its canonical Korean name; avoid reading `Ambient` as the ordinary adjective “surrounding.” | English capitalizes the item-like phrase. Japanese renders it as a named “Glass of Vista,” Chinese as a mirror, while Korean says ordinary glass “from around.” The historical audit explicitly flags this item/name and source wording. | High |
| 34670 | `재빠르게 칼을 휘둘러` for “sharp knives, soft feet” | Retain the source's paired stealth imagery: sharp knives and quiet/soft-footed intruders, rather than adding that they swiftly wielded the knives. | English is a compressed fragment describing the intruders and their qualities. Korean converts “soft feet” into speed and “sharp knives” into an action. Japanese also recasts the fragment; Chinese stays closer to the image. | Medium |
| 34679 | `수습 현자` for `Adept` | Check the established rank/title for Adept and distinguish it from a generic apprentice sage. | The row reports that Ignas was possessed. Korean preserves the event but selects a specific rank rendering; the historical log flags Adept terminology. | Medium |
| 34680 | `교수형 집행인단` for `the Hanged Men` | Verify the Hanged Men as a named group and standardize its name; avoid interpreting the group as executioners without evidence. | English names a group and identifies the Baronett as its last member. Japanese explicitly interprets them as pirates, Chinese as “hanged men,” and Korean's “executioner group” introduces an occupational reading. The source does not settle the group's exact identity. | High |
| 34681 | `사암 별장` for `Sandstone Villa` | Keep the location name consistent with other occurrences and distinguish a named villa from a generic sandstone villa. | The English capitalizes the location; Korean uses a literal descriptive form. Historical notes record Sandstone Villa name inconsistency. | Medium |
| 34683 | `한 가족이자 하나의 종족` | Preserve the invitation's family/race metaphor while checking whether `race` is literal, institutional, or rhetorical in context. | All locales retain the family and race/people comparison. Korean is close to English, but `종족` may imply a biological species more literally than the organization metaphor warrants. The historical audit flags this cultural/group sense. | Medium |
| 34684 | `미리 정해진 운명` for `the Preordained` | Check whether Preordained is a named group/title and distinguish that usage from the generic idea of predetermined fate; standardize Tuatha and Mitharan names. | English uses the capitalized collective in parallel with the Fae, Tuatha, and Mitharans. Korean turns it into an abstract noun phrase. Japanese and Chinese similarly use fate/destiny wording, so context and glossary are needed. | Medium |
| 34685 | `시녀` for `The Maid` | Determine whether this is the named Maid/title or a generic servant, and use the established entity form if confirmed. | English capitalizes the title and the historical audit asks whether the Maid is a title or person. Japanese supplies a more specific Windemere epithet, while Chinese is generic; the row alone does not resolve the identity. | Medium |
| 34688 | `미타란 사람들은 속수무책이었고` | Retain the characterization that the Mitharans were trusting/credulous, as well as their lack of a chance and the city's surrender within hours. | English explicitly says “The trusting Mitharans.” Korean omits that modifier; Japanese and Chinese both preserve it. | High |
| 34694 | `요정의 고분` for `Fae Cairns` | Check the established term for cairns as stone-pile landmarks/structures; avoid implying burial mounds unless supported by setting context. | English says `Cairns`; Chinese describes stone markers and Japanese transliterates the term. Korean `고분` specifically suggests a burial mound. The historical audit includes this named Fae landmark question. | Medium |
| 34699 | `더 높은 곳에서 내려온 지시` for `a higher source` | Preserve the chain-of-command implication (“higher authority/윗선”) without implying a literal place above. | English contrasts the speaker's request with a higher source of the idea. Korean's “from a higher place” can be spatial; Japanese explicitly says a higher order, while Chinese is literal/ambiguous. | Medium |
| 34700 | `나와 독대하게 해 달라고` for `ask to hold court with me` | Verify whether Argine requested a private meeting, an audience, or a formal hearing; retain only the sense supported by surrounding context. | English's “hold court with me” is ambiguous. Japanese adds “just the two of us,” and Korean's `독대` adopts that interpretation; Chinese instead reads it as appearing before a court. The historical notes flag Argine/Travelers context. | Medium |

IDs 34651-34658, 34660, 34662-34669, 34671-34678, 34682, 34686-34687,
34689-34693, 34695-34698 generally retain the English meaning on this first
reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 34600-34799 flags Glass of
  Ambient (34661), Bruten (34663), the Ljosalfar/Dokkalfar claim (34671),
  the Adept rank (34679), Hanged Men/Baronett (34680), Sandstone Villa
  (34681), the family/race metaphor (34683), the Maid (34685), and the
  translation joke at 34692. These were checked against active Korean and
  all locale references.
- The historical log's broader `34600` label overlaps the preceding
  completed batch at ID 34600; this report's scope starts at 34651 and does
  not treat that stale range boundary as coverage evidence.
- The Japanese source inserts `2人` (“two people”) at ID 34700. English
  does not specify a private/two-person meeting; Korean's `독대` follows the
  Japanese interpretation, and the ambiguity remains open.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34651-34700 once
  and in identical order.
- Embedded line-break counts match across all four locales; this range has
  no multiline entries.
- No runtime-marker discrepancy was detected.
- No numeric values occur in the active English, Chinese, or Korean rows.
  Japanese includes `2人` at ID 34700; the value is absent from the English
  source and other drafts.
- The active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV text or source file was edited.

## Batch Status

IDs 34651-34700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34701.
