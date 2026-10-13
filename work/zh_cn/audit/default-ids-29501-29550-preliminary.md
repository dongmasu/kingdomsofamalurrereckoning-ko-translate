# Preliminary Language Scan: `default` IDs 29501-29550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 29501-29550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 29501 | `보석 술집` for Gemstone Tavern; `she` refers to a person passed out | Confirm the venue's official name and preserve the casual joke that a woman is likely passed out under a table. | English and Japanese identify the subject as female; Chinese also retains the feminine pronoun. Korean follows the joke without adding context. | Medium |
| 29503 | Gale Crossing / Madding Wind | Preserve the contrast between Gale Crossing's quaint appearance and meager offerings, and the rumor that area's real treasures are locked in Madding Wind. | Korean calls the place charming but says its goods are few and unremarkable; the place names are transliterated rather than consistently bilingual. | Medium |
| 29504 | Crilgarin returns after the Hierophant's arrest | Preserve the event sequence and the speaker's inference that Crilgarin was somehow involved; do not turn suspicion into confirmed fact. | English and all locales retain the inference and ellipsis. Korean preserves the sequence and uncertainty. | Medium |
| 29506 | Wayfarer among the Warsworn | Confirm whether `wayfarer` is a generic traveler or formal role and preserve the recruitment offer for able-bodied people needing a home. | English says another wayfarer among the Warsworn; Korean renders it as another traveler and retains the offer of useful work. Japanese/Chinese also treat the traveler wording generically. | Medium |
| 29507 | `밴션 - 동글볼트 - 탄약` for `Banshaen - DongleBolt - Ammo` | Identify this developer-facing/debug label and confirm whether Banshaen is a proper name or control/entity identifier; do not infer meaning from the opaque string. | English preserves the opaque label, Japanese transliterates it, Chinese renders Banshaen as a snake demon, and Korean transliterates it. The historical audit flags the whole label as unresolved. | Medium |
| 29510 | `몇 개를 {1}하시겠습니까?` | Determine the grammatical operation represented by `{1}` (for example, use, sell, or select) and retain its exact token identity and position. | The row lacks the action context. Korean places the token after the object phrase; Japanese/Chinese place it before or within the quantity question. The runtime token is preserved. | Medium |
| 29514 | Volcanic clinker dust alloyed into cuirass steel | Confirm the material meaning and Korean term for `volcanic clinkers`; preserve that alchemical alloying produces the enchanted steel in the cuirass. | English specifies volcanic clinker dust. Korean uses volcanic pyroclastic material/powder; Japanese and Chinese describe volcanic debris/slag, so the exact material remains uncertain. | Medium |
| 29517 | `내 단검` for source plural `the daggers` | Preserve the warning against stealing the speaker's daggers and the Traveler-trickery accusation; check whether Korean singular is generic or loses the source plural. | English explicitly says `daggers` (plural). Korean uses a singular “my dagger”; Japanese also singularizes, while Chinese has a plural/general knife reference. | High |
| 29519 | Lovebirds joking versus “bloody murder by noon” | Preserve the sharp contrast between a playful couple when the speaker is absent and anticipated violence by midday; verify who “they” refers to in context. | Korean retains the contrasting days and renders the second image as a bloodbath. The referents are not named in the row. | Medium |
| 29525 | `너희 같은 인간들 때문에 난 세상을 떠났어` | Preserve that the speaker left the world because of people like the addressee and the hostile dismissal; check whether “left the world” means death or departure from mortal society. | English is figurative/ambiguous; Korean's `세상을 떠났어` can imply death. Japanese and Chinese make a similar world-leaving statement, but the exact intended sense needs story context. | Medium |
| 29528 | `변화를 이끌 사자` / Century Plants | Confirm whether “agent of change” means a catalyst/champion or messenger, and standardize Century Plants. Korean `사자` may read as envoy, messenger, or lion. | English uses “an agent of change.” Korean says an agent/leader rendered as `사자`, Japanese uses “messenger,” and Chinese uses “carrier.” Korean preserves the Century Plants blooming as the means to cauterize the wounds. | High |
| 29529 | `슈올리아 아르카나 수석관` for Scholia Arcana Prefect | Confirm Prefect as an institutional rank and standardize Scholia Arcana presentation. | English names a Prefect. Korean uses `수석관`; Japanese calls the role an instructor and Chinese a dean, indicating the rank/function remains open. | Medium |
| 29531 | `개인 최고 기록` / antelope challenge | Preserve that the antelope remain available and the player may return to attempt a personal best; note the Japanese row is malformed. | English and Korean give a coherent challenge prompt. Japanese omits the subject of “personal best,” while Chinese supports the intended record attempt. | High |
| 29532 | Egan's disappearance beyond the walls | Preserve the two-night timeline, firewood trip, and urgency to find Egan before further harm; verify the name spelling. | Korean retains the timeline and objective. Japanese identifies Egan and the firewood trip; the name remains a proper-name candidate. | Medium |
| 29533 | Alyn Shir's dagger pins the note after Tirnoch's defeat | Preserve the event order and the fact that the note was pinned to the wall with one of Alyn Shir's daggers. | All locales retain the sequence and possessive. Korean's parenthetical English name supports traceability. | Medium |
| 29538 | `감전된 이븐루트` for `Shocked Evenroot` | Determine whether `shocked` means electrically charged/affected or merely startled, and align the named plant and status adjective with item conventions. | English capitalization suggests a label. Korean reads “electrocuted,” Japanese says thunder/lightning Evenroot, and Chinese says startled Evenroot. The intended status is not resolved by the row alone. | High |
| 29540 | `아가씨` for direct-address `dove`; Niskaru / Blackened Hall | Preserve the familiar or affectionate/patronizing address without replacing it with an age/status title unless context supports that choice. Also confirm whether the speaker says the Niskaru took the king's throne/position or the Hall itself. | English directly addresses `dove` and says the Niskaru “took it right over.” Korean uses `아가씨` and makes the object a throne; Japanese omits the address and Chinese uses “messenger.” Historical notes flag `dove` and Blackened Hall. | High |
| 29542 | Sagecrafting / Order Magic field | Confirm the official Sagecraft term and preserve that the enchanted relic is used in the process and creates a field of Order Magic. | Korean says the relic is used for magic-item crafting and appears to create an Order-magic field. Japanese/Chinese also localize Sagecraft and the field. | Medium |
| 29543 | `+30% 기절한 적에게 주는 피해` | Preserve the +30% damage modifier against stunned enemies; confirm the canonical status label. | All locales retain +30% and the stunned-target condition. | High |
| 29545 | Halcyor / Narca affliction / Fellfire Bloom | Standardize all three names/terms and preserve the conditional reasoning that the accused must be defeated and the land healed with the Bloom. | English, Japanese, Chinese, and Korean retain the accusation, required defeat, and healing objective. The name and affliction spellings remain glossary candidates. | Medium |
| 29546 | `어둠... 엠피리언...` | Confirm the intended referent and canonical spelling of Empyrean, while preserving the speaker's fragmented memory. | English, Japanese, Chinese, and Korean retain the broken recollection. The proper term's interpretation depends on surrounding lore. | Medium |
| 29547 | Decrying commands while willingly obeying | Preserve the deliberate contradiction between condemning commands and willingly following them, as well as the repeated “and yet” emphasis. | Korean retains both the contradiction and repeated clause structure. | Medium |
| 29548 | Pet wolf increases critical-hit damage | Confirm this is a combat-status notification and preserve that the bonus is critical-hit damage, not critical-hit chance. | All locales state increased critical-hit damage; no numeric value is supplied in this row. | High |
| 29550 | Sandstone Villa | Confirm the established place-name rendering and whether a parenthetical English form is expected in this label. | Korean translates the name literally; Japanese transliterates it and Chinese also translates it. Historical terminology review covers Sandstone Villa. | Medium |
| 29502, 29505, 29508-29509, 29511-29513, 29515-29516, 29518, 29520-29524, 29526-29527, 29530, 29534-29537, 29539, 29541, 29544, 29547, 29549 | Dialogue, names, item/UI labels, and objectives | Recheck register, established names, and terminology in the integrated pass. | Korean generally conveys the English. Calovar, Eamonn's Isle, Warsworn, Keen/Lan/Myfa, Tari, Thorir Arding, Mayor Eswin, Tetran, Argoth, Secandra, Idris Theonen, Adessa, and related terms remain candidates. | Medium |

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 29500-29599 flags Gemstone Tavern,
  Calovar, Gale Crossing, Crilgarin, Eamonn, Warsworn, Century Plants,
  Alyn Shir, Lupoku, Evenroot, Niskaru, Sagecraft, Narca/Fellfire Bloom,
  Adessa, Sandstone Villa, and related names. These were checked in the
  active rows.
- The same entry flags the Banshaen/DongleBolt/Ammo label at 29507, the
  placeholder at 29510, personal-best wording at 29531, Niskaru and `dove`
  at 29540, and the Sagecraft field at 29542. Findings remain open.
- The malformed Japanese personal-best line is recorded as a source-locale
  comparison note, not as an issue in the Korean structure.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 29501-29550 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. `{1}` at 29510 is preserved.
- The +30% stunned-target modifier at 29543 is consistent across locales.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 29501-29550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 29551.
