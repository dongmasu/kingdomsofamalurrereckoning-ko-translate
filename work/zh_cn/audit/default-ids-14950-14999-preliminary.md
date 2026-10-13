# Preliminary Language Scan: `default` IDs 14950-14999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 14950-14999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 14958 | `periodic wars that spring up` -> `주기적으로 일어나는 이런 전쟁` | Confirm whether this means recurring local conflicts or a specific named series of wars. | Korean retains periodic recurrence and the reason for neutrality; Japanese describes ongoing wars and Chinese supports periodically arising wars. Historical question remains open. | Medium |
| 14961 | `urns` / god Naros -> `항아리` / `나로스 신` | Distinguish ordinary urns from relic containers and verify the religious/lore framing. | Korean calls the vessels urns and preserves the corrupting magic in the ashes; Japanese specifies an ash urn and Chinese treats them as Naros artifacts. Historical question remains open. | Medium |
| 14965 | `make potions like their greatest` / Arcadium | Resolve the source's omitted noun and verify what Arcadium is. | Korean infers the omitted comparison as the gnomes' greatest potion-makers and preserves the trade access. English is elliptical; Japanese supports the maker inference, while Chinese reads “best potions.” Historical question remains open. | High |
| 14967 | `Common` / `Infrequent` -> `일반` / `비일반` | Verify the game's salvage rarity tiers and whether `비일반` is the intended player-facing term. | Korean preserves the localized `{*4...}` marker and readable contrast, but “non-common” is less idiomatic than a dedicated rarity label. Japanese and Chinese use “rare/uncommon”-type labels. Historical question remains open. | High |
| 14970 | `Kollossae` -> `콜로세` | Align the people-name with the official Korean manual and preserve the claim that the apostates kill those they encounter. | Korean preserves the abandonment of the gods and return to barbarism; its name form remains subject to glossary/manual verification. Historical question remains open. | Medium |
| 14971 | Barten / Canneroc / Widow / Cathrus; `rout the Widow` -> `몰아내다` | Verify the proper names and whether “rout” means defeat, drive away, or force a retreat. | Korean preserves the spider-attack threat and the likely retreat location; “drive off” is one plausible reading, but scene context is needed. Historical question remains open. | High |
| 14977 | `Wreath of Absolution` -> `사죄의 화관` / article of worship | Verify the formal item/rite name and whether `assembled` means crafted or put together. | Korean preserves Anokatos's making the worship object and the quest's next steps. Its name varies from other active candidates such as `면죄의 화관` and `면죄의 화환`; no canonical form is selected. Historical question remains open. | High |
| 14980 | Prismere chantries / Winter Fae -> `프리즘미어 성소` / `겨울 페이` | Verify the structures' formal name, Gadflow's surveillance, and the faction form. | Korean preserves construction in Klurikon, watching from there, and the toxic-prayer metaphor. “Chantry” is also rendered as chapel/temple elsewhere; terminology remains provisional. Historical question remains open. | Medium |
| 14986 | Scarlet Flowstone / Ysa's Breath | Standardize both alchemy ingredient names and retain quantities and recipe layout. | All four locales preserve the two ingredients and counts (2/1), with matching embedded line breaks. Korean names remain glossary candidates. Historical question remains open. | Medium |
| 14987 | `A Tender` / House / Cadoroc / Saturnyn -> `비탄의 집의 수호자 카도로크` | Determine whether Tender is a formal role, what “the House” denotes, and whether Cadoroc could be Saturnyn. | Korean explicitly identifies the House as the House of Sorrows and Tender as `수호자`; English/Japanese leave both compressed, while Chinese reads Tender as a keeper. Historical question remains open. | High |
| 14988 | `Kollossae Peasant M` -> `콜로세 농부(남성)` | Verify the people-name and whether `M` is a gender code intended to appear in this label. | Japanese/Chinese explicitly identify a male Kollossae peasant; Korean preserves that metadata in parentheses. Historical question remains open. | Medium |
| 14990 | `Frost Trap` / Ice Damage / Freezing Damage | Align the ability and damage-type terminology while preserving values, duration, and mana cost. | Korean distinguishes 35 cold damage from 6 freezing damage over 3 seconds and retains the 25-mana cost. Historical question remains open. | Medium |
| 14991 | House / Sagrell / `Your Grace` -> `발라드 가문` / `각하` | Confirm the House of Ballads referent and standardize the honorific. | Korean preserves the return greeting, playful correction, Windemere trials, and deferential title. Japanese uses a lordly honorific and Chinese “Your Majesty,” so exact rank/register remains open. Historical question remains open. | High |
| 14995 | `Gillehan reborn` -> `길리한의 부활` | Determine whether this is an objective/title or a statement that Gillehan has been reincarnated. | Korean preserves a concise “Gillehan's rebirth” reading; the isolated label does not establish the intended grammatical relation. Historical question remains open. | Medium |
| 14997 | cards / Well of Souls / Hugues | Preserve the prediction that the Well of Souls succeeds on the day Hugues is destined to die and verify the name form. | Korean renders the cards as fortune-telling and retains the coincidence/timing claim; Japanese and Chinese also support the prophecy reading. Historical question remains open. | Medium |
| 14998 | `Target Weight Melee` -> `대상 무게 근접` | Identify whether this is a target-weight category, melee-target parameter, or internal combat label. | Korean preserves the source components literally; no locale resolves the syntax or display context. Historical question remains open. | High |
| 14999 | Ambrose Flora / hidden goods / promised shield | Verify the name and preserve the recovery/reward relationship. | Korean retains finding Ambrose Flora's hidden goods and returning them to receive the promised shield. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 14958, 14961, 14965, 14967, 14970-14971,
  14977, 14980, 14986-14988, 14990-14991, 14995, and 14997-14999 against
  the active Korean and all three source locales. They remain preliminary
  questions; no historical disposition was treated as approval.
- Cross-batch terminology checks retain open questions for Kollossae,
  Wreath of Absolution, House of Sorrows, Saturnyn, and alchemy ingredients.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized brace/dollar/hash token
  class/order signatures match across all four locales. ID 14967 preserves
  `{LINE_SPACE}` and localized `{*4...}` marker order. Recipe ID 14986
  retains both ingredients and quantities (2/1); ID 14990 retains all
  damage values, duration, and mana cost.
- Active Korean CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`;
  no active CSV was edited.

## Batch Status

IDs 14950-14999 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 15000-15049.
