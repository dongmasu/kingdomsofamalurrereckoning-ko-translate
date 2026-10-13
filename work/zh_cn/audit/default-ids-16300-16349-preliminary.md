# Preliminary Language Scan: `default` IDs 16300-16349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16300-16349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16300-16301 | Moon Camp / Traveler / Watch / market | Standardize the faction/place and City Watch terms; preserve the thief's opportunity and market-guard directions. | Korean retains the camp in Erathell, the thief address, and guards posted before the market day and night. Chinese may treat Watch as a place/city name; English/Japanese and Korean read it as guards. | Medium |
| 16305 | `GRAND HP GRUNT` -> `그랜드 HP 그런트` | Determine whether this is an internal enemy/test label and whether HP should remain untranslated. | English/Japanese retain HP and grunt-like terms, while Chinese localizes both; Korean keeps HP and phoneticizes the rest. Its player-facing status is unclear. | High |
| 16310-16312 | The Midden / Cthongeny: Atlasus / Scholia Arcana | Verify whether the first two are proper names, a test string, or creature labels; align the academy name. | Japanese phoneticizes the first two; Chinese interprets them as a shell mound and advanced titan. Korean transliterates them, preserving uncertainty; the institution name recurs in other forms. | High |
| 16313 | malformed English `Still badly dresses, I see.` | Preserve the likely clothing joke without treating the source typo as meaningful. | Japanese and Chinese explicitly read this as an insult about poor clothing; Korean says the outfit is still terrible, matching that likely intent. | High |
| 16315-16316 | Tuatha lines / Fate's humor / prize blade | Preserve survival irony and clarify whether `prize blade` is an award blade or prized weapon. | Korean retains the broken lines, survival, and Fate joke; for the dying master's wish it calls the blade precious and preserves repair. | Medium |
| 16320 | Tuatha / `lust for battle` | Preserve the invading group's appetite for battle and the farms' destruction. | Korean's `전투에 굶주려 있다` retains the battle-hunger metaphor and the speaker's displacement/burned-farm account. | Medium |
| 16323 | commander needs gold / mutual silence | Preserve the conflict with prior orders and the implied secret bargain. | Korean retains the contradiction and the reciprocal “if you keep quiet, so will I” condition. | Medium |
| 16325 | `Narca` brethren / Alserund | Verify Narca as species/group and align place and people forms. | Korean preserves their kinship, desert habitat, attacks on anyone nearby, and inability to distinguish friend from foe; the name form remains provisional. | Medium |
| 16327-16328 | Well of Souls / Allestar Tower / barghest | Align names and preserve the resurrection/escape and magic-protection effect. | Korean retains both the completed escape and the pet barghest's magic resistance benefit. | Medium |
| 16330-16331 | life and family beyond the island / Seawatch / Byrn | Preserve what the speaker seeks to regain and the evaluation of Byrn's value. | Korean keeps the family and life, willingness to work for or become a killer, and the “worth more than ten men” statement as practical usefulness. | Medium |
| 16337 | `Flame Locus` -> `불꽃의 결절점` | Determine whether Locus is a place, node, or magical site and standardize its name. | Japanese says “land of flame,” Chinese “flame track,” and Korean chooses a “flame node/point.” The one-line label provides no context. | High |
| 16339-16340 | Gallows End / Dverga / Tirin's Rest charter | Verify the dwarf people's name and preserve the island's settlement history and village charter title. | Korean retains the island's successive inhabitants and Dverga as seafaring dwarves, then names the village charter. The Dverga term remains a cross-batch consistency issue. | Medium |
| 16341-16344 | House of Valor hero / Whitestone / charter cost / Fahrlangi | Verify faction/name forms and whether Fahrlangi is a people, faction, or religious collective. | Korean retains the hero's pre-speaker-era fame, charter sale with its exact gold variable, and Fahrlangi as a bilingual name. | Medium |
| 16343 | `$M0_SQ06.charter_cost$` | Preserve the exact runtime variable and its association with the sale. | Korean retains the exact variable spelling, position, and gold label. | High |
| 16349 | Belen / Fyragnos / servitude / puppet-master claim | Preserve the speaker's defiance, future threat, and distinction between their own will and the order's demands. | Korean retains the coerced-service accusation, Belen/Fyragnos references, whispered magical secrets, and self-asserted control. The English has the typo `acces`; Korean follows the intended sense. | High |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16305, 16310-16313, 16325, 16337,
  16339, 16344, and 16349 against all four active locale rows.
- The test-label status, proper-name forms, and Fahrlangi's identity remain
  open. The likely clothing-source typo at 16313 is interpreted consistently
  by Korean, Japanese, and Chinese; no historical note authorizes a change.
- Cross-batch consistency candidates include Traveler, Watch/City Watch,
  Court of Winter, Scholia Arcana, Narca, Allestar, barghest, Klurikon,
  Gallows End, Dverga, House of Valor, Fahrlangi, Belen, and Fyragnos.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. ID 16343 retains
  `$M0_SQ06.charter_cost$`; no structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16300-16349 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16350-16399.
