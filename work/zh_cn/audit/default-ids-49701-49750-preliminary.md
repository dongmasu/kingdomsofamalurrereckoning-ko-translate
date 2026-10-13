# Preliminary Language Scan: `default` IDs 49701-49750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 49701-49750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 49702 | Crying Eyes / `크라잉 아이즈`; “그곳에 도착하면” | Confirm whether Crying Eyes is a location, group, or other referent, and whether English “reach them” points to people or things rather than a place. | The Korean turns the English plural “them” into a place-like “there.” Japanese also uses an arrival construction but names Crying Eyes; Chinese retains a plural pronoun. Historical notes explicitly flag Crying Eyes. | Medium |
| 49703 | Lorca-Rane / `로르카-레인` | Confirm the canonical Korean spelling and hyphenation. | Japanese and Chinese use different phonetic forms. No unsupported correction was made; cross-corpus name consistency remains unresolved. | Low |
| 49708 | Phasmer / `파스머`; “저주받았어” | Resolve the omitted antecedent and whether the line says Phasmer is affected by the same condition, or instead contrasts Phasmer with the addressee. | English says “No, maybe not. But Phasmer does,” without naming the predicate in this row. Korean and Chinese infer a curse; Japanese instead contrasts the addressee with Phasmer. Historical notes record this source disagreement. | Medium |
| 49709 | Eel Petal / `장어 꽃잎`; Ysa's Breath / `이사의 숨결` | Confirm canonical reagent names and keep both ingredient quantities attached to the correct names. | The Korean keeps Eel Petal (2) and Ysa's Breath (1), matching the English quantities. The recipe's blank line and line breaks are preserved across locales. | Medium |
| 49718 | `독 피해 120을 5초 동안 추가` | Confirm that this describes 120 Poison Damage dealt over a five-second duration, not 120 damage on each tick or a five-second delay. | English and Japanese express damage over five seconds; the Korean retains 120 and five seconds in the same relation. Chinese wording is less explicit about duration semantics. | Medium |
| 49724 | Cape Solace / `케이프 솔러스` | Confirm the established Korean place-name form and apply it consistently across the corpus. | Japanese gives a different phonetic reading and Chinese translates the name semantically. The historical audit lists Cape Solace as a canonical-name question. | Medium |
| 49731 | Solemn Bell / `엄숙의 종`; Dolve Wayle / `돌브 웨일`; assembly hall / `회당` | Confirm the canonical place and bell names, and whether “old assembly hall” should use a civic/meeting-hall term rather than a religiously suggestive one. | Korean follows the English and Japanese route wording. Chinese calls Dolve Wayle a castle and renders the destination as an old meeting hall; the English and Japanese identify an entrance and an old auditorium/assembly hall. Historical notes flag the names and title. | Medium |
| 49736 | “거창한 겉치레도 무너졌소. 참 잘했구려.” | Preserve the breached-facade image and the sarcastic praise; verify who “Our” refers to in the repeated clauses. | The Korean follows the English sequence of a defeated champion, lost advantage, and breached facade. Japanese changes the final image to a cleared heart, while Chinese follows the English. | Medium |
| 49738 | the Sorrows / `슬픔의 집`; votives / `봉헌물` | Confirm whether “the Sorrows” is a place/faction/entity and whether votives are offerings or a specific named item type. | Korean reads the phrase as a route to the House of Sorrows. Japanese and Chinese use different interpretations, while the English remains context-dependent. Historical notes explicitly flag both terms. | Medium |
| 49743 | Neophyte / `수련자` | Confirm whether Neophyte is a formal rank/title and use the established Korean form consistently. | The Korean meaning is plausible, but historical notes identify the term as a rank question. Japanese uses a trainee-like rank and Chinese a generic apprentice term. | Medium |
| 49746 | Colet and the Echoes / `콜렛과 메아리들`; Mitharan music / `미사루 음악` | Confirm the canonical act name and whether “Mitharan” denotes a people, culture, or language; preserve the intended traditional-music reference. | English contains the apparent source typo “musical ensembled.” Korean conveys a band and the tour, but renders “Echoes” literally. The Japanese and Chinese versions also differ in proper-name and Mitharan forms. Historical notes flag the ensemble and music context. | Medium |
| 49747 | Enconeg's nymph / `엔코네그의 님프` | Confirm whether “nymph” is a creature/species term or a named individual, and keep Enconeg's relationship and the southward objective clear. | Korean follows the English objective and retains the possessive. Chinese replaces “nymph” with “beautiful maiden,” so English remains the meaning anchor. | Medium |
| 49750 | Sorcerer - Rune Chant Only / `마법사 - 룬 노래 전용` | Verify the official class and ability terminology and preserve that this entry restricts the item/option to Rune Chant. | Korean retains the restriction and matches the English wording. Chinese also says Rune Chant only; Japanese uses a Sorcerer transliteration. Historical notes explicitly flag this boundary entry. | Medium |

Other names and recurring terms in this range, including Venris, Tywili
Coast, Magnus, Phasmer, Egan, Pengaras, Lykeios, Fort Olghorn, Tuatha,
Kollossae, Galafor, Morkan, Colet, Mithros, Mitharan, Enconeg, and Cassera,
remain subject to corpus-wide terminology and bilingual-name consistency
review. Existing Korean forms were preserved.

IDs 49701, 49704-49707, 49710-49717, 49719-49735, 49737, 49739-49745,
49748-49749 generally retain the English meaning on this first reading.
Numbers, recipe quantities, damage duration, and the modifier values remain
intact. Names, idioms, UI labels, and lore terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries for IDs 49650-49749 and
  49750-49849. The first range flags Phasmer's predicate disagreement
  (49708), the Sorrows/votives (49738), Neophyte (49743), Mitharan music
  (49746), Crying Eyes (49702), and Solemn Bell/Dolve Wayle (49731). The
  second range flags the Rune Chant restriction at 49750.
- IDs 49749 and 49750 are included once as the batch endpoint and boundary,
  respectively. Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 49701-49750 once
  and in identical ascending order.
- ID 49709 retains reagent quantities 2 and 1 and the recipe line breaks.
- ID 49718 retains 120 Poison Damage and the five-second duration.
- ID 49745 retains +1 Piercing Damage, +9%, and the maximum-arrow increase
  of 1, with its three-line layout.
- No line-break differences, detected runtime-token discrepancies, or
  hidden format/control characters were found.
- No translation CSV edit was made.

## Batch Status

IDs 49701-49750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 49751.
