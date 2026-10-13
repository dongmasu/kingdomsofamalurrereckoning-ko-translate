# Preliminary Language Scan: `default` IDs 42451-42500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42451-42500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42452 | Chaos Portal / Rifts / `혼돈의 차원문` / `균열` | Standardize the two connected-location terms with the rest of the UI and lore. | All languages preserve the instruction to approach the portal to reveal connected Rifts on the mini-map; exact established Korean terms remain a glossary question. | Medium |
| 42456 | security fee / exterminator / `경비 비용` / `해충 구제업자` | Clarify whether the speaker means a personal security/guard expense and whether `exterminator` is a specific monster-control service. | Japanese says guard fee, Chinese says security expense and “rat exterminator”; Korean is plausible but broad. This is an explicit historical question. | Medium |
| 42460 | Travelers / Grim Onwig / Crilgarin / `트래블러스`, `그림 온위그`, `크릴가린` | Verify canonical spellings and the organization's formal name; retain its stated identity as a thieves' organization. | English calls the Travelers an illustrious organization of thieves. All locales retain the recruitment objective and camp leader, but names vary phonetically. | Medium |
| 42461 | `Bad idea. ... Job well done, Lina.` / `잘못된 생각이었어... 수고했어, 리나.` | Preserve the speaker's sarcastic rebuke/praise rather than reading either clause as sincere. | The context says Lina read a document she was supposed to remove unseen. Korean wording can sound sincere without the sarcastic context; English and Japanese both support the irony. | Medium |
| 42463 | `Care to purchase a title.` / `칭호를 사시겠습니까?` | Keep the likely shop prompt but note the English source's unusual terminal period and terse wording. | Japanese and Chinese render it as an offer to buy a title; Korean supplies a natural question without adding content. | Low |
| 42468 | quickling / `퀵링` | Confirm the canonical creature/race name and maintain the direct-address form. | English explicitly addresses “quickling”; Japanese omits that address and Chinese transliterates it as a species term. Korean retains it. | Medium |
| 42471 | No trouble / `괜찮아` | Follow the English/Japanese reassurance unless context indicates a different Chinese reading. | English, Japanese, and Korean mean “no problem”; Chinese instead says “don't cause trouble,” changing the speech act. | High |
| 42472 | Warsworn creed / `워스원`; “sell honor” | Preserve the deliberately paradoxical creed and settle the faction-name form in the integrated terminology pass. | Korean retains the contrast between an ordinary mercenary selling a sword without honor and Warsworn selling honor while armed. Chinese rephrases the second clause as sharing glory; Japanese preserves the paradox. | Medium |
| 42477 | Widow / `위도우` | Determine whether `Widow` is a character title/name or a generic widow before choosing transliteration versus translation. | Japanese transliterates “Widow,” while Chinese translates it generically as widow; the English capitalization alone is inconclusive. | Medium |
| 42482 | old Primos / shroud / `늙은 프리모스`, `수의` | Confirm whether Primos is a person or office and preserve the prophecy's shroud/death imagery without adding a specific cause. | English and Chinese support a shroud/being wrapped reading; Japanese says clothing everyone will wear. Korean makes the burial-garment reading explicit, which remains plausible but interpretive. | Medium |
| 42484 | Reverie / Calovar verse / `몽상` | Confirm whether Reverie is a named place or a dreamlike state; review the compressed poetic syntax and repeated rising image. | English, Japanese, and Chinese all retain a lying/waking/rising sequence with differing syntax. Korean preserves the repetition and sands image but uses a generic “reverie” reading. | Medium |
| 42488 | Slayer / `학살자` | Check whether this is a formal title, achievement/rank, or generic role; assess the intensity of `학살자`. | All four sources give a one-word label, but Korean's term can imply massacre and may be stronger than a generic slayer. | Medium |
| 42491 | auroch / `오록` | Verify the creature/material term against established Korean terminology. | English names auroch stew; Chinese describes wild-ox stew and Japanese transliterates the animal. Korean uses a phonetic form. | Medium |
| 42492 | Lykeios / Onesimos / `리케이오스` / `오네시모스` | Confirm venue/name forms and preserve the English objective to speak with Onesimos for the reward. | Korean follows English. Chinese appears to direct the speaker to talk to Lykeios, while Japanese agrees with the English target Onesimos; the historical log flags this reference. | Medium |
| 42496 | You won't hurt anyone / `아무도 다치게 하지 않을 거야` | Resolve the subject/agency difference before fixing the line's interpretation. | English says “you won't hurt anyone”; Japanese says “I won't let you hurt anyone.” Korean omits the subject, so its agent is ambiguous and may conceal the source divergence. | High |
| 42498 | Chaos Thrall VI / `혼돈의 노예 VI` | Preserve the rank/variant number and use one numeral style consistently. | English, Chinese, and Korean use Roman `VI`; Japanese uses Arabic `6`, an equivalent value. | High |
| 42500 | 25% chance to siphon health / `체력을 흡수할 확률 25%` | Preserve the exact proc chance and health-siphon effect. | All four locales agree on 25% and the effect. | High |

IDs 42451, 42453-42455, 42457-42459, 42462, 42464-42467, 42469-42470,
42473-42476, 42478-42481, 42483, 42485-42487, 42489-42490, 42493-42495,
42497, and 42499 generally retain the English meaning on this first reading.
Proper names, register, and recurring terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 42450-42549 were checked.
  This batch overlaps questions about security costs/exterminator (42456),
  Traveler names and organization (42460), the intentionally paradoxical
  Warsworn creed (42472), Widow (42477), Primos and the shroud prophecy
  (42482), Reverie (42484), Auroch and Lykeios/Onesimos (42491-42492).
- The historical note says ID 42458's percentages, duration, cooldown, and
  bullet order are preserved. Direct comparison confirms the Korean values
  and bullet order align with English, Chinese, and the source layout; the
  Japanese source reverses the first two value-bearing clauses.
- Historical notes also record `{*3Leech}` at 42501, outside this batch;
  it will be checked with the next range.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42451-42500 once
  and in identical ascending order.
- Embedded line-break counts and normalized runtime marker IDs/order match
  across all four locales. ID 42458 retains all three `{LINE_BULLET}` markers.
- ID 42458 retains 30% chance, 25% Health threshold, 20% restoration,
  +30% damage for 10 seconds, and 300-second cooldown. The Japanese text
  presents the threshold before the chance, unlike English/Chinese/Korean;
  the associated values remain intact.
- ID 42498's Japanese Arabic `6` is numerically equivalent to Roman `VI` in
  the other locales. No other numeric discrepancies were detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42451-42500 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-42451-42500-20261010.md`](disposition-batch-default-42451-42500-20261010.md).
This remains a preliminary pass, not independent linguistic approval.
Continue at `default` ID 42501.
