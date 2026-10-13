# Preliminary Language Scan: `default` IDs 30301-30350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30301-30350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30301 | `그들은 내 숨을 들일 가치도 없어` for `they're not worth my breath` | Preserve the idiom's dismissive meaning (“not worth speaking about/responding to”) rather than a literal breath-taking image. | Korean reads as though the people are not worth inhaling for. English and Chinese make the speaker unwilling to spend attention/breath on them; Japanese says they have no value to the speaker. The long journal's seven-paragraph structure is retained. | High |
| 30303 | `지속 소모: 마나 25%` | Confirm whether sustained cost is 25% of maximum mana and use a clear stat label; preserve 15% chance, 40 Poison Damage, 5 seconds, and 25% cost. | Korean retains all numbers and line structure. Japanese explicitly says maximum mana; English/Chinese say 25% Mana without specifying the pool. | Medium |
| 30306 | `거미들이 부모님을 죽였다고` for `the spiders got them` | Preserve the report that the parents were killed while confirming whether the source's euphemism should stay indirect. | Korean makes “got them” explicit as killing. The context strongly suggests the parents were killed, while the English is colloquial and less specific. | Medium |
| 30312, 30323 | `스캐브`, `스캐브 가죽` | Confirm Scav as a creature/class name and standardize the creature and material terms. | Korean transliterates Scav in the creature label and leggings description. Other locales use differing creature names; historical notes explicitly ask what Scav denotes. | Medium |
| 30314 | `자신의 괴롭히던 자` | Check the Korean particle; intended sense is the person who tormented Matrim, i.e. `자신을 괴롭히던 자`. | The current Korean construction is grammatically malformed. English/Japanese/Chinese all identify the soldier's tormentor as the person slain. | High |
| 30316 | `농장에서 자랐지` for `Farm boy` | Preserve whether the speaker identifies as a farm boy/worker or only says he grew up on a farm. | English gives a compact social/occupational identity; Korean turns it into a childhood background statement. Japanese calls him a shepherd/boy, while Chinese preserves “farm boy.” | Medium |
| 30327 | `개화` for capitalized `Flowering` | Determine whether Flowering is a named rite, event, or literal blooming process; standardize the term. | Korean asks “What is blooming/flowering?” Japanese identifies a “Flowering rite,” while Chinese says flowering period. Historical notes explicitly flag the event's nature. | Medium |
| 30328, 30111 | `히페리안` / `히페리온` for `Hyperian` | Standardize the named Hyperian and clarify the account of the former Primos Arkes trying to raise it/join it to the city. | Korean uses `히페리안` here but `히페리온` at ID 30111 for the same English spelling. The lore and entity identity remain context questions in the historical audit. | Medium |
| 30331 | `로그 메드거와 오스거 크라스트` | Remove or justify the added `로그` sense in context; preserve the two named Red Legion members and their status as rogues in the following sentence. | English names Medgar and Osgar Krast, then calls them rogues in the next sentence. Korean inserts `로그` before Medgar and again calls them `불한당` afterward, potentially adding an unsupported class/role. | High |
| 30333 | `크로싱` for capitalized `the Crossing` | Confirm the named site's canonical form and use the bilingual display convention consistently. | The Korean corpus often writes `크로싱(The Crossing)`, but this row uses only `크로싱`. English/Japanese/Chinese differ in whether they transliterate or describe it as an intersection/passage. | Medium |
| 30338 | `그 시간 속에서 새로 태어날` for `be reborn to it` | Confirm the antecedent of `it` and preserve the speaker's hope of healing and rebirth on rising again. | Korean resolves `it` as the time for healing. The sentence is poetic and isolated; Japanese/Chinese also resolve or restructure the pronoun differently. | Medium |
| 30342 | `여행자들` for capitalized `Travelers` | Confirm whether Travelers is the named faction/order and standardize capitalization/display across the corpus. | Korean uses a generic plural. The word is capitalized in English and elsewhere appears as an in-world group term. | Medium |
| 30346 | `고용인` for `Hireling` | Confirm whether this is a generic hired worker, a rank, or a named class/title; standardize the project term. | Korean says hired person, Chinese says hireling, and Japanese gives a third-tier mercenary interpretation. Historical terminology remains open. | Medium |
| 30348 | `대사제` for `Hierophant` | Use the established in-world title consistently; compare with the corpus form `히에로판트`. Preserve the instruction to enter Guian's lab and retrieve the pick using the device. | The active Korean corpus repeatedly transliterates the named title as `히에로판트`; this row alone changes it to the generic `대사제`. The source-keyed audit flags Hierophant terminology and the pick/device context. | High |
| 30343 | `{1}`, `{*1junk}`, `{*1merchant}` tutorial | Preserve all marker identities, indices, and order while localizing the wrapper payloads consistently. | Korean moves items to localized junk and sells with one button press. The three locales retain the same variable and two wrapper indices/order; localized contents differ as expected. | High |

Rows 30302, 30304-30305, 30307-30311, 30313, 30315, 30317-30326,
30329-30330, 30332, 30334-30337, 30339-30341, 30344-30345,
30347, 30349-30350 generally retain the English meaning. Their names,
register, lore, UI terminology, and isolated context remain for the
integrated pass; no separate high-confidence wording candidate was identified
in this first reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30300-30399 flags the 30300
  recipe, Lyria, Crows, Cartery Jayck, Windstones, Dark Harbor, Skald Atlas,
  Scav, Flowering, Primos/Arkes/Hyperian, Medgar and Osgar Krast, Crossing,
  Drewn Ansilla, Long Winter, Argine, and numerous lore/item names. These
  were checked against the active rows in this batch.
- Historical structural/context notes specifically call out recipe layout,
  nested UI markup at 30343, Hierophant at 30348, source/lore wording at
  30337, and several unresolved referents in later rows. The 30343 markers
  and all line breaks in this batch are preserved.
- The historical entry asks what Flowering denotes and clarifies that
  Hyperian/Crossing need lore context. It also flags Scav as a possible
  creature/material term. These remain open rather than being silently
  normalized.
- The Korean wording concerns at 30301, 30314, 30331, and 30348 are new
  active-row observations. They are candidates only and do not authorize CSV
  edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30301-30350 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. This includes the long entry at 30301, the
  two-line combat effect at 30303, and the variable/wrappers at 30343.
- Numeric values at 30303 match: 15% chance, 40 damage, 5 seconds, and 25%
  sustained cost. Onslaught at 30320 retains its 10-stack cap.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30301-30350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30351.
