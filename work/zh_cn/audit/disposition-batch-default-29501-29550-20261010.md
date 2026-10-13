# Disposition and Edit Batch: `default` IDs 29501-29550

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29501-29550, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the historical audit.
- Decisions: three accepted, fourteen `not an issue`, and sixteen uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29527 | `부모님과 동생 던버트까지.` | `부모님, 그리고 형제 던버트와 함께였지.` | English says `brother` without specifying relative age. Japanese/Chinese use younger-brother wording, but English is the semantic anchor; remove the unsupported age inference, consistent with prior accepted sibling-neutral corrections. |
| 29528 | `변화를 이끌 사자` | `변화를 가져올 존재` | English `agent of change` means a catalyst/agent, not necessarily a messenger. Korean `사자` introduces an unintended messenger/lion ambiguity; the correction preserves an unspecified agent without deciding its identity. |
| 29547 | `그런데도 넌 여기 있고, 내 말을 듣고 있지.` | `그런데도 넌 여기 있지. 그런데도 내 말을 듣고 있어.` | English and Chinese repeat “And yet” for rhetorical emphasis. The previous Korean merged the two clauses and lost that repetition; restore it while retaining the following contradiction. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29501 | Woman passed out under a table | Not an issue: Korean preserves the joke, the female referent, and the likely drunken collapse. The venue's canonical name remains open separately. |
| 29503 | Quaint Gale Crossing / few offerings / treasure in Madding Wind | Not an issue: the contrast and the rumor about the area's treasures are retained; place-name forms remain open separately. |
| 29504 | Crilgarin's return / Hierophant's arrest | Not an issue: the sequence and the speaker's uncertain inference of involvement are preserved. |
| 29506 | Warsworn wayfarer / recruitment offer | Not an issue: Korean retains the greeting, welcome, offer of a home, and need for able-bodied workers. |
| 29514 | Volcanic clinker alloy in cuirass | Not an issue: Korean preserves volcanic material, alchemical alloying, enchanted steel, and the cuirass. The exact technical material term remains open separately. |
| 29519 | Lovebirds / anticipated violence | Not an issue: the contrast between the couple's playful behavior and possible violence by noon is retained. |
| 29531 | Antelope / personal best | Not an issue: the antelope remain available and the player may return for a new personal best; the malformed Japanese row does not contradict English and Korean. |
| 29533 | Note after Tirnoch / Alyn Shir's dagger | Not an issue: timing, possession, and the dagger pinning the note to the wall are preserved. Canonical personal-name spelling remains open separately. |
| 29542 | Sagecrafting / Order Magic field | Not an issue: Korean retains the relic's use in Sagecrafting and the resulting Order Magic field; the project-approved `마법물품 제작` term is used. |
| 29543 | Damage versus stunned enemies | Not an issue: the +30% value and stunned-target condition are preserved. |
| 29545 | Defeat Halcyor / heal land with Fellfire Bloom | Not an issue: the conditional sequence and required healing action are retained; canonical names/terms remain open separately. |
| 29546 | Fragmented Dark / Empyrean memory | Not an issue: the broken recollection and repeated inability to remember are preserved. The lore term remains open separately. |
| 29548 | Pet wolf critical-hit damage | Not an issue: the notification correctly states increased critical-hit damage, not critical-hit chance. |
| IDs 29501-29550 structural and remaining ordinary text | Keys/order, breaks, runtime markers, and unflagged wording | Not an issue: all four locales contain the same 50 IDs in order; line-break counts and normalized runtime-token identities/order match. `{1}` at 29510 and the +30% value at 29543 are preserved. |
| 29501 | Gemstone Tavern | Uncertain: it may be a named venue; Korean's semantic rendering is plausible, but canonical Korean name treatment is not established. |
| 29503 | Gale Crossing / Madding Wind | Uncertain: the events and contrast are preserved, but the proper-name forms and whether Madding Wind is a prison/place need corpus/context alignment. |
| 29507 | `Banshaen - DongleBolt - Ammo` | Uncertain: the label appears developer-facing or internal; locale renderings conflict and its intended use is not established. |
| 29510 | `{1}` action | Uncertain: token identity and position are preserved, but the missing runtime context is needed to know whether it represents using, selling, or selecting. |
| 29514 | `volcanic clinkers` | Uncertain: the Korean technical rendering is broad and plausible; the precise source material and established Korean term remain unresolved. |
| 29517 | Plural `daggers` / Korean singular `단검` | Uncertain: Korean count nouns can be generic, but the English plural may refer to multiple daggers. No safe correction is established by Japanese/Chinese. |
| 29525 | `I left the world` / `세상을 떠났어` | Uncertain: English and the other locales retain the world-leaving phrase, but whether it means death or departure from mortal society depends on context. |
| 29529 | Scholia Arcana Prefect | Uncertain: English gives a formal rank, while Japanese/Chinese suggest instructor/dean; the hierarchy and canonical title are unresolved. |
| 29532 | Egan | Uncertain: the event and urgency are preserved, but the personal-name transliteration needs corpus alignment before normalizing `이건`. |
| 29533 | Alyn Shir | Uncertain: chronology and dagger use are preserved, but active Korean occurrences have differing transliterations; no isolated spelling is approved. |
| 29538 | `Shocked Evenroot` | Uncertain: `감전된` may imply electrical damage, while Chinese supports a startled reading and Japanese a lightning association; the source/status meaning is unresolved. |
| 29540 | `dove` / Blackened Hall / `took it right over` | Uncertain: the address and the referent of “it” are context-dependent; Korean's `아가씨` and “throne” may over-specify what English leaves open. |
| 29545 | Halcyor / Narca affliction / Fellfire Bloom | Uncertain: causal and healing relations are retained, but the character, affliction, and plant's canonical forms need glossary/context alignment. |
| 29546 | `Empyrean` | Uncertain: the fragmented memory is preserved, but this capitalized lore term's identity and Korean rendering cannot be settled from the line. |
| 29550 | Sandstone Villa | Uncertain: Korean translates the name semantically while Japanese transliterates and Chinese also translates it; the project-wide proper-name policy remains open. |
| Other named terms in IDs 29501-29550 | Eamonn's Isle / Keen / Lan / Myfa / Warsworn / Banshaen / Tari / Lupoku / Tetran / Secandra / Adessa and related names | Uncertain: Korean generally follows the source, but canonical spelling, faction, place, and internal-label conventions need integrated glossary review. |

## Verification

- Only the approved `Texto` cells at IDs 29527, 29528, and 29547 changed.
- IDs, row order/count, delimiter, quoting, BOM, and newline distribution
  were preserved. `{1}` and combat values remain intact.
- Active default CSV SHA-256:
  `b6c7c3b966894b8dbe8fdc281fb161720f805ad5638b919ac5f75c1f4d8449c2`.
- Register totals after this batch: 904 accepted, 3,185 `not an issue`, and
  5,230 uncertain (9,319 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29551; 35,584 `default` IDs remain.

These working dispositions do not constitute independent final linguistic
approval.
