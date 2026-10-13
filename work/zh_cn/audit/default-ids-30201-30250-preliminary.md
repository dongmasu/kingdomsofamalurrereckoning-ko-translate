# Preliminary Language Scan: `default` IDs 30201-30250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30201-30250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30202 | `에테르 파편` / 130 Physical Damage | Confirm the canonical item name and retain 130 physical damage plus the stagger effect. | Korean preserves the damage type, amount, and effect. Japanese treats the splinters as magical energy; Chinese omits “physical,” so English remains the meaning anchor. | Medium |
| 30205 | `연도문` / `연도 제단` | Standardize Litany/Litany Altar terminology and preserve that activating the altar makes other litanies useful. | Korean retains the activation and future-collection instruction. The English terms are capitalized game concepts; the Japanese imperative differs in agency from the English completed action. | Medium |
| 30209 | `성스러운 유물`, `여러 요새`, `집으로 돌아올 때` | Preserve that the relics served their role in multiple strongholds and are now to be returned home in exchange for gold. | Korean follows English and Japanese. Chinese's “they” pronouns may obscure the relic antecedent, while Korean correctly uses “relics.” | Medium |
| 30211 | Localized `{*1...}` Faeblades/Rogue tutorial | Preserve each `{*1}` wrapper, index, order, and localized payload; standardize Faeblades and Rogue terminology. | English, Japanese, Chinese, and Korean each retain three wrappers with index sequence 1, 1, 1. Payloads are localized per locale; this is not a token-identity error. Korean preserves the fast attack against clustered enemies. | High |
| 30216 | `비탄(Sorrows)` | Determine whether Sorrows is generic grief, the named lore substance/group, or a House-related term; standardize its display. | English capitalizes the standalone term. Korean retains an English parenthetical, while Japanese and Chinese semantically translate it. Historical audit explicitly flags Sorrows. | Medium |
| 30225 | `발걸음을 가볍게 하게` for `Step with a light foot` | Confirm whether this is a warning to move quietly or a general farewell/blessing; preserve the speaker's register. | Korean retains the light-foot image. Japanese interprets it as wishing a good journey, while Chinese advises keeping one's steps light. The isolated phrase does not settle the intended speech act. | Medium |
| 30230 | `키닝(The Keening)` | Confirm the canonical Korean location/name form and distinguish the place from the ordinary noun/verb “keening.” | English capitalizes the title; Korean retains the English spelling parenthetically, while Japanese transliterates and Chinese gives a semantic place-name rendering. | Medium |
| 30231 | `좋은 징조` for `an auspicious claim` | Treat the English wording as a possible source oddity; confirm the intended sense from surrounding dialogue rather than forcing a literal “claim.” | English's phrase is unusual in context. Japanese says it seems an omen and Chinese calls it a good thing; Korean follows those contextual readings. | Medium |
| 30233 | `고문(Counsel)` | Determine whether Counsel is a named person, title, or generic advisor and preserve the conditional consequence and player's choice. | Korean's bilingual form flags the uncertainty; Chinese says strategist/advisor and Japanese uses advisor. The source-keyed historical audit explicitly asks who or what Counsel denotes. | Medium |
| 30234 | `오랫동안` / `몇 시간씩` for two uses of `ages` | Preserve the repeated-time joke: they have not spoken in ages, and a conversation with Molly can itself last for ages. | Korean naturally renders the second instance as “for hours”; Chinese repeats “a long time.” The joke remains but shifts from deliberate repetition to a specific duration. | Medium |
| 30236 | `크로싱` / Halcyor | Confirm The Crossing as the named place/phenomenon and standardize bilingual display; verify Halcyor's spelling. | Korean uses bare `크로싱` here, while many other active rows use `크로싱(The Crossing)`. The Crossing's exact referent may be a passage, site, or magical structure; historical context is relevant. | Medium |
| 30238 | `완전히 사라질지도 몰라` for `become nothing ‒ nothing at all` | Preserve the speaker's fear of complete loss/nonexistence without reducing it to ordinary weakness or physical disappearance. | Korean reads as possibly disappearing; Japanese also says returning to nothing, while Chinese interprets becoming useless. The English is metaphysical/figurative and context-dependent. | Medium |
| 30240 | `나를 다르게 만드는 단 하나` | Identify the unstated “one thing” from context, if available, and preserve the contrast with the Tuatha without inventing an object. | All four texts leave the object implicit. Korean retains the contrast and insult; the isolated sentence does not specify what the speaker wants. | Medium |
| 30246 | `너무 단순해` for `Too easy, for one` | Confirm whether “easy” describes the plan or “for one” introduces a reason; retain the clarification that the plan has grown beyond vengeance. | Korean says the plan is too simple, supported by Japanese/Chinese readings, while English is fragmentary and can also be read as “too easy.” Historical context may resolve it. | Medium |
| 30250 | `짐만 있었어도 금방 멀쩡해졌을 텐데` for `If I still had my pack, I'd be right as rain` | Confirm whether `pack` is a specific pack/equipment item; preserve the idiomatic recovery meaning. | Korean renders the idiom naturally as getting well again. Chinese says “my bag,” while English does not identify the pack contents. | Medium |

Rows 30201, 30203-30204, 30206-30208, 30210, 30212-30215, 30217-30224,
30226-30229, 30232, 30235, 30237, 30239, 30241-30245, 30247-30249
generally retain the English meaning. Their names, fragments, register, and
terminology remain for the integrated pass; no separate high-confidence
wording candidate was identified in this first reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30200-30299 flags Arena rewards,
  Aether Splinter, Sagecraft Altars, Sorrows, Felltown, Canneroc, House of
  Accolades/Pride, Coilsbane, Niskaru, Phasmer Humm, Caeled Coast, and
  Seawatch. This batch was checked against the relevant terms where present.
- The narrower historical set explicitly flags Simonides, Sorrows, Counsel,
  Coilsbane, House titles, Phasmer Humm, and Private Cornall. IDs 30214,
  30216, and 30233 remain open terminology/context candidates; no historical
  finding was treated as approved.
- ID 30200, at the edge of the preceding batch, was reviewed against the
  same historical range and is recorded in the 30151-30200 report.
- The English wording at 30231 and possible metaphysical sense at 30238 are
  noted as source/context questions, not confirmed Korean defects.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30201-30250 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales.
- At ID 30211, all locales preserve three `{*1}` wrappers in the same order.
  The wrapper payloads are localized as expected and were excluded from the
  normalized marker comparison.
- The value 130 and physical-damage type at ID 30202 are retained in Korean.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30201-30250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30251.
