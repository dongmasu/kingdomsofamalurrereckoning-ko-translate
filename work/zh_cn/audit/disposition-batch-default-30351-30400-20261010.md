# Disposition and Edit Batch: `default` IDs 30351-30400

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30351-30400, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, recurring terminology, and
  source-keyed historical notes.
- Decisions: one accepted, seven `not an issue`, and twelve uncertain.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30375 | `스네일테일에서 벌어진 일은 여행자들 탓이 아니야.` | `스네이크테일에서 벌어진 일은 여행자들 탓이 아니야.` | English names Snaketail. The active Korean corpus consistently renders this name as `스네이크테일` elsewhere; `스네일테일` is an isolated misspelling that reads like “snail-tail.” |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30351-30354, 30356, 30358, 30360-30361, 30363-30364, 30366-30368, 30370-30372, 30374, 30376-30382, 30384-30387, 30389, 30391, 30393-30397, 30400 | Remaining dialogue, objectives, journal prose, item labels, and ordinary text | Not an issue: the Korean preserves the evident English meaning and register at preliminary level. Proper names and context-dependent terms are tracked separately. |
| 30355 | Rotelos journal and final standalone period | Not an issue: Korean retains the English/Chinese paragraph layout and source's final `.` line. Japanese alone omits that line; following the English source is appropriate. |
| 30357 | Severed Niskaru Hunter appendage made into a ceremonial weapon | Not an issue: Korean keeps the appendage as part of the Hunter's arm before severing, its taking as a prize, its later fashioning into a weapon, and the retained original magic. Canonical creature terminology remains open separately. |
| 30377 | `???` placeholder | Not an issue: Korean preserves the English placeholder exactly rather than replacing it with another locale's unrelated text. |
| 30388 | Battle Frenzy resistance effect | Not an issue: the Battle Frenzy condition and +20% Physical and Piercing Damage Resistance are retained. |
| 30390 | `Unless... Unless you depart Amalur forever.` | Not an issue: `네가 ... 떠나지 않는 한` is the standard Korean conditional construction corresponding to “unless you depart”; the negative form does not reverse the English condition. |
| 30398 | Southeast route to Hollowlands | Not an issue for source fidelity: Korean follows English `southeast`. Japanese and Chinese say southwest, so the route-reference conflict remains open separately. |

## Uncertain

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30351 | Creation poem / Sidhe | Uncertain: English's “weighted plans of origins,” “two piece planks,” and water flowing through the Sidhe are obscure. Korean follows the imagery, but the intended sense and whether Sidhe is a people, place, or realm need lore context. |
| 30357 | Niskaru Hunter | Uncertain: the object description is coherent, but canonical Korean spelling and creature terminology need corpus-wide alignment. |
| 30359 | Livrarium | Uncertain: Korean transliterates the named institution; Japanese and Chinese render a library/institute. Its canonical name convention is unresolved. |
| 30362 | Cryamor / murghan / Bareth | Uncertain: the release plan is retained, but the isolated pronoun does not identify Cryamor's referent or the precise identities of the named groups/person. |
| 30365 / 30181 | Refugee account and `her` | Uncertain: Korean preserves the pronoun and the ten-year observation, but the woman's identity is not established by these duplicate lines. |
| 30369 | Creth / `she desires` | Uncertain: the claim that Creth is mistaken is retained, but the desired woman's identity and canonical name spellings need context. |
| 30373 | `remake it` | Uncertain: Korean retains the promise to remake it, but the object is omitted from the isolated source line. |
| 30383 | `this House` | Uncertain: English capitalization may denote an in-world House/faction; Korean `가문` can instead read as a family or household. Japanese and Chinese also diverge. |
| 30392 | Notices | Uncertain: English capitalizes the term and ties it to supporting the army in Klurikon; Japanese specifies call-up notices while Chinese reads general notices. |
| 30398 | Hollowlands direction | Uncertain: Korean follows English `southeast`, but Japanese and Chinese both say southwest. Do not silently change the English-led translation without resolving the source conflict. |
| 30399 | Mitharu / offering | Uncertain: Korean uses the variant `미타루`, while the active corpus commonly uses `미사루`; whether the offering names a specific rite also needs glossary/context review. |
| Other named terms in IDs 30351-30400 | Architect / Rotelos / Heurix / Niskaru Hunter / Livrarium / Cryamor / murghan / Bareth / Frea Almar / Alfar Army / Tirin / Creth / Agarth Ulfrik / St. Eadric / Ironfast / Mitharu and related forms | Uncertain: canonical name, faction, deity, institution, and lore-term spellings need integrated glossary alignment. |

## Verification

- IDs 30351-30400 occur once and in ascending order in English, Japanese,
  Chinese, and Korean. Embedded runtime-token identities/order match.
- Embedded line-break counts differ only at 30355: Japanese has two breaks;
  English, Chinese, and Korean have three. Korean retains the English source's
  standalone period line. This Japanese-only difference is documented, not
  normalized.
- The +20% Physical and Piercing Damage Resistance at 30388 is preserved.
- Only the accepted Korean `Texto` cell at ID 30375 changed. The UTF-8 BOM,
  72,046 CRLF endings, and 39 existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `d288826630e37cfd1bfc1b5c744cba4b82ab879b35c50ff5a0ffe1078d31e9f3`.
- Register totals after this batch: 917 accepted, 3,424 `not an issue`, and
  5,499 uncertain (9,840 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30401; 34,734 `default` IDs remain.

These working dispositions are not independent linguistic approval.
