# Preliminary Language Scan: `base` IDs 3400-3499

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3400-3499.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled earlier `base` findings only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3405 | 페이트스원(Fatesworn)의 희망 각반 | Align `Fatesworn` with the established expansion/faction name and display convention. | English and Japanese name Fatesworn; the Korean form `페이트스원` is a transliteration but differs from the competing semantic title used in project notes. Keep the name decision distinct from generic “sworn to fate” phrases. | Medium |
| 3407 | 빙글이 톰(Spinning Tom)의 모루 | Reconcile `Spinning Tom` with the related `Spinning Tom's Blades` at `default` ID 1629. | English capitalizes this compound as a name; Japanese translates it as “Fast-Spinning Tom,” while Chinese translates it literally as “Spinning Tom.” Korean uses a playful name but the identity/wordplay is unresolved across resources. | Medium |
| 3412 | 상위 시약 출처 | Confirm whether `PARENT` is an internal asset/category label that should remain visible. | English explicitly says `PARENT Reagent Source`; Japanese/Chinese also indicate a parent/source label. Korean localizes it as `상위`, consistent with the earlier `PARENT Reagent` candidate, but player-facing disposition is not established. | Medium |
| 3423 | 갤로우스 엔드(Gallows End) 생물 도감 | Preserve the proper location name and note the source typo in `Beastiary`. | English misspells `Bestiary`; Japanese/Chinese describe a creature compendium. Korean meaning is understandable, but the `Gallows End` form should follow the corpus-wide name decision. | Medium |
| 3424, 3433, 3459 | 성 오드위그(St. Odwig)의 성당 / 성 하드윈(St. Hadwyn)의 선교회 / 성 하드윈(St. Hadwyn)의 영원한 선교회 | Determine whether these name churches, missions, monasteries, or another religious institution, and align the saint-name forms. | English varies between an incomplete `St. Odwig's` and `Mission`; Japanese uses saint/monastery forms and Chinese suggests preaching sites. Korean commits to `성당`/`선교회` without enough location context. | Medium |
| 3449 | 엔파마니르(Enfamanir)의 그림자 | Confirm the Korean spelling of `Enfamanir`. | English and Japanese/Chinese use substantially different phonetic forms; the Korean follows English but should be checked against other appearances before standardization. | Medium |
| 3454 | 아니(Arny)의 상자 | Resolve the character's name before standardizing. | English says `Arny`; Japanese reads Annie and Chinese reads Yani. Korean follows English, but the references do not establish the intended pronunciation. | Medium |
| 3460 | 은빛(Argent) | Determine whether `Argent` is a named item/material or the ordinary color “silver.” | English capitalizes the term and Japanese transliterates it; Chinese translates it as silver. Korean preserves both readings provisionally. | Medium |
| 3473 | 구리 수호자 | Determine whether `Copper Guard` names armor, a defensive effect, or a person/group. | This repeats the ambiguity at `Gold Guard` (`base` ID 3365). The English is category-ambiguous, Japanese retains English, and Chinese suggests a copper guardian. | Medium |
| 3482 | 에라시(Erathi)의 인장 | Resolve the material English/Japanese source conflict before disposition. | English and Chinese say an Erathi signet/seal; Japanese says a sea cave. Korean follows English/Chinese, but the source discrepancy remains open. | High |
| 3491 | 간수 흐레이드(Hreid)의 집 | Confirm the proper-name spelling of `Hreid`. | Japanese and Chinese transliterations differ from the English-based Korean form. The role `Warden` is also rendered literally as `간수`, so verify whether it is a rank/title here. | Medium |
| 3492 | 장례용 토크 | Confirm the Korean equipment term for `Torc` and whether the burial context is literal. | English names a specialized neck ring; Japanese and Chinese describe a burial ornament. Korean `토크` is transliterated and may be opaque without an equipment glossary entry. | Medium |
| 3494 | 드베르간 지도 - 솔라스 곶(Cape Solace) | Confirm the proper Korean form of `Cape Solace` and the map label. | English names Cape Solace; Japanese gives a different phonetic form and Chinese translates the “solace” meaning. Korean uses `솔라스 곶`, which remains provisional. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `base` questions for IDs 3400, 3403, 3404, 3407,
  3412, 3416, 3423, 3424, 3430, 3433, 3445, 3449, 3454, 3455, 3457, 3459,
  3460, 3461, 3467, 3469, 3473, 3482, 3484, 3491, 3492, 3493, and 3494.
  They remain open; relevant `Sorrow`, developer-label, name, rank, `Fulcrum`,
  `Guard`, `Erathi`, and place-name questions are retained above or in the
  historical inventory.

## Other Checks

- IDs 3420 and 3352 both use `Ward` as `워드`; confirm the established
  gameplay protection term before global normalization.
- IDs 3423 and 3494 add to the corpus-wide `Gallows End` and `Cape Solace`
  name questions.
- ID 3457 follows the English `Master` tier; Japanese uses a high-tier label.
- The remaining inspected rows preserve their principal item, location, and
  name meanings. No structure or target keys were changed.

## Batch Status

IDs 3400-3499 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
