# Preliminary Language Scan: `default` IDs 14650-14699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 14650-14699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 14651 | “the Crosse woman” -> `크로스 부인` | Confirm whether this is a surname used as a dismissive description or a formal honorific. | English uses “woman” and hesitant repetition; Korean's `부인` may make it sound like a formal title. Historical context is limited. | Medium |
| 14652 | Crossing Keepers -> `교차로의 수호자들` | Determine whether the Crossing is a named place/entity and align the Keepers' title with prior usage. | English and Chinese use “Crossing”; Korean translates it as a generic crossroads. The group has been guarding it longer than expected. Historical question remains open. | High |
| 14658 | `Champion` -> `투사` | Confirm whether this is an arena rank, combatant role, or general title. | English/Japanese/Chinese use “champion”; Korean selects `투사`, a fighter/gladiator reading. Context is absent. | Medium |
| 14661 | `Motus Mining Interests` -> `모투스 광업 회사` | Align the corporate name with other Motus Mining occurrences, including ID 14591. | Here Korean treats it as a company; at ID 14591 it uses `모투스 광업 이해관계자들`, which may misread the capitalized entity name as stakeholders. | High |
| 14665 | `Hospitalis Quarters` -> `병원 숙소` | Determine whether this is a medical ward, named building, or lodging associated with a hospital. | English is a capitalized location label; Japanese/Chinese use a treatment/hospital-area reading and Korean chooses quarters/lodging. Historical question remains open. | High |
| 14669 | `plant the Missives on Argine` | Clarify whether Missives are named documents/evidence and whether “plant” means hide them among Argine's belongings. | Korean says to secretly plant the letters on Argine so gnomes will come and take her down. The source does not fully specify whether this is framing, seizure, or killing. Historical question remains open. | High |
| 14674 | `Place` -> `놓기` | Use the screen context to distinguish an action command (“place/put down”) from a noun (“placement”). | All sources are isolated short UI terms; Korean chooses an action-like noun. Historical question remains open. | Medium |
| 14680 | Crilgarin / `Knave of Coins` -> `동전의 시종` | Align the title with ID 14181, where the same English label was translated `동전의 잭`. | Korean uses `동전의 시종` here and at ID 14630; the title remains inconsistent across batches. Japanese/Chinese have their own differing readings. | High |
| 14684 | Varani / “a long way from a pub” | Clarify whether this is a distance observation, a sobriety joke, or an inference from gait. | English/Chinese mention distance from a pub and the person's gait; Japanese interprets it as not having drunk recently. Korean preserves the distance reading. Historical question remains open. | High |
| 14688 | Quake / 48-78 physical damage / 18 mana | Verify the official skill name and retain both values and the two-line layout. | Korean renders Quake as `지진 공격`, keeps 48–78 damage and 18 mana, and preserves one embedded line break. Historical question remains open. | Medium |
| 14693 | `Sagecrafting` -> `마법물품 제작` | Verify the official crafting-skill term and its specific craft domain. | Korean repeats the broad term used at ID 14238; Japanese identifies jewelcrafting while Chinese says enchanting. This remains a terminology question. | High |
| 14695 | Circle of Engard -> `엥가드 결사단` | Verify whether Circle of Engard is a formal faction/religious order and standardize the proper name. | Korean chooses an order/fellowship interpretation; other locales also vary in whether they transliterate or translate “Circle.” Historical question remains open. | Medium |
| 14698 | `worn on her` / “not a good fit” | Preserve the idiomatic sense that the surrounding community may have weighed on her and that she did not fit in. | Korean renders both as hardship and lack of fit, consistent with English; Chinese is less idiomatic and may suggest gradual depletion. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 14652, 14665, 14669, 14674, 14684,
  14688, and 14695 against the active Korean and all three source locales.
  They remain preliminary questions; no historical disposition was treated
  as approval.
- Cross-batch checks confirm that Motus Mining, Crilgarin's title, and
  Sagecrafting require terminology reconciliation with IDs 14591, 14181/14630,
  and 14238 respectively.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed embedded line-break counts match across the batch, including the
  Quake damage/cost description at ID 14688.
- Brace, dollar, and hash-token signatures match. `$STR0 $STR1 $STR2` at ID
  14642 is present in the same order in all four locales.
- Active Korean CSV hash matches the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 14650-14699 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 14700-14749.
