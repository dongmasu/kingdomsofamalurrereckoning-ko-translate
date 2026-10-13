# Preliminary Language Scan: `default` IDs 55601-55650

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55601-55650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55601 | `아르진(Argine)` | Confirm the established spelling of Argine. | Japanese and Chinese use different phonetic forms; Korean preserves the English spelling parenthetically. | Low |
| 55602 | `지속 소모: 마나 25%` | Verify whether the cost is 25% of maximum Mana or 25% Mana generally. | English and Chinese omit “maximum”; Japanese explicitly says maximum Mana. Korean follows English. This ambiguity is also in the historical question log. | Medium |
| 55604 | `요툰(Jottun)` | Confirm the established Korean name and whether the line asks for an imitation/performance. | English “take on” and Japanese “act as” support the draft's “imitate”; name forms vary across locales. | Medium |
| 55605 | `사반트(Savant)` | Determine whether Savant is a rank/title and establish its Korean form. | English is an isolated label; Japanese describes a first-class mage while Chinese says learned person. Context is insufficient to settle the in-world meaning. | Low |
| 55608 | `룩셈부르크(Luxembourg)` | Check whether this is a proper-name/test string and whether bilingual marking is warranted. | English is a single standalone string; Chinese interprets it as the Grand Duchy, while Japanese transliterates the country name. | Low |
| 55614 | `엘더스트`, `위대한 저울` | Confirm the terms `Eldest` and `Great Scale` and distinguish the paired characters' relationship. | Korean preserves Alarane, Caelrod, and the path-opening objective. The exact rank and place-name conventions remain terminology questions. | Medium |
| 55620 | `디어드리 귄트`; `갤러스 엔드` | Verify Deirdre's canonical Korean name and align Gallows End with the project-wide place-name convention. | English contains a later source misspelling, `Dierdre`; Korean consistently uses Deirdre. `Gallows End` has several established Korean variants, including literal and phonetic forms, so this occurrence should be considered in that broader review. | Medium |
| 55623 | `파워` | Identify whether `power` is a named resource/stat or a generic ability value. | The row is a short effect label; Japanese and Chinese also use a generic power/energy term. | Low |
| 55627 | `미사란 강습 손잡이` | Check the item-part meaning and canonical rendering of `Assailing Grip`. | Korean preserves the item quality, Mitharan attribution, and Grip component, but the specialized equipment term needs glossary/context review. | Medium |
| 55631 | `제작자 회관(Craft Hall)` | Confirm the institution's established Korean name and capitalization policy for bilingual names. | English personifies the institution as the speaker's “head and heart”; the Korean preserves both leadership and emotional importance. | Medium |
| 55632 | `윈드스톤` / `차임` | Confirm the established terms for the five Windstones and the action of ringing each chime. | Korean preserves the count of five, the remaining locations, and the gate-opening condition. Japanese/Chinese use different localized terms. | Medium |
| 55636 | `아만의 눈`; `영리한 페이 아만` | Verify the artifact and creator's canonical names/title. | English identifies the Eye as a magical token made by Fae Amman the Clever; Korean retains the gem, artifact, and creator relationship. | Medium |
| 55639 | `지상을 돌보고 있어` | Confirm that “shepherd the surface” is a stewardship/guardianship metaphor. | Japanese supports watching over the surface; Chinese reads it literally as herding. Korean follows the contextual metaphor and preserves Aurenda sleeping below. | Medium |
| 55646 | `운명의 메아리(Echo of Fate)` | Determine whether this is a named item, title, or interface label and check bilingual marking. | The source is an isolated label; Chinese translates it, while Japanese uses a phonetic form. | Low |
| 55649 | `료스알브`; `울프 팩` | Confirm canonical forms for Ljosalfar and the Wolf Pack, and retain the accuracy comparison. | Korean preserves the sharpshooter/leader roles and the claim that few Alfar match his accuracy. Other locales use translated or phonetic faction/race forms. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Snaketail Grotto,
Hallam the White, St. Eadric's Well, Vraekor, Galafor, Albert Zoef, Spine
Bender, Liordran, Caelrod, Akara, Mel Senshir, Balor, Rotclaw, Dren,
Urul-Tusk, Erathell, Haxhi, Aurenda, and Ljosalfar.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55550-55649`.
  Relevant prompts include the 25% Mana wording (55602), Jottun and Savant
  (55604-55605), the Eldest/Great Scale terms (55614), Deirdre and Gallows
  End (55620), Power (55623), Assailing Grip (55627), Craft Hall,
  Windstones/chime (55631-55632), Eye of Amman (55636), and “shepherd the
  surface” (55639).
- The historical entry's boundary ID 55550 belongs to the preceding active
  report and is not repeated here. The next historical range starts at
  55650, which is included once in the next active batch.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55601-55650 once
  and in identical ascending order.
- All four files contain 65,135 default records. Newline counts, recognized
  runtime-token sequences, and numeric values showed no structural
  discrepancies in this batch.
- Active CSV SHA-256 values match the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 55601-55650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55651.
