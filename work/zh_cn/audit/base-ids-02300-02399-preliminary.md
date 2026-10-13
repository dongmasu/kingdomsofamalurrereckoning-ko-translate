# Preliminary Language Scan: `base` IDs 2300-2399

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 2300-2399.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked related project glossary and historical audit entries where relevant.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2316, 2340, 2394 | 철제 뒤축 / 영혼결 무늬 뒤축 / 실바나이트 뒤축 | Review the recurring `Heel` equipment labels together; determine whether these are footwear items or literal heel components. | English and Japanese use `Heel`, while Chinese describes shoes/footwear. Korean `뒤축` can mean only the back/heel part of a shoe. Compare with `base` IDs 1499, 1935, 2268, and 2290; inventory category is still needed before choosing a canonical item term. | Medium |
| 2353 | 여름 궁정의 제국 기사 | Confirm what `Summer Court Imperial` names and whether `기사` is supported. | English is a compressed equipment/name label; Japanese suggests a court-issued designation, while Chinese reads as “Summer Court Imperial.” The current Korean adds “knight,” which is not explicit in English. This carries forward the historical question; inspect item/faction context before changing. | Medium |
| 2362 | 신비한 섬: 교수대 끝자락의 유혹 II | Treat `Gallows End` as a place name and align its Korean form only through the corpus-wide naming decision. | English, Japanese, and Chinese identify a named place. The current literal form adds another variant to the documented mix of transliterations and literal translations; this is not a row-local correction. | High |
| 2372 | 증폭의 보석 | Reconcile `Gem of Amplitude` with the related affix term and determine whether `Amplitude` is a named stat/effect or means abundance. | Japanese reads as amplification, Chinese as abundance, and the active Korean uses `증폭`. `affix` ID 236 currently uses `진폭` for `of Amplitude`, supported by most non-Chinese references. Decide the family with gameplay context rather than normalizing this row alone. | Medium |
| 2375 | 폐쇄 명령 | Determine whether `Close Order` is a military formation/command or an instruction to shut something. | English is ambiguous without its object or UI context; Japanese and Chinese also permit a literal “closure order” reading. This remains the historical question recorded for this ID. | Low |
| 2383 | 장인급 약탈자의 자루 | Check whether `Pilager` is a proper name/source typo or the intended common noun “pillager.” | The English spelling is `Pilager`; Japanese transliterates it and Chinese interprets it as a robber. The current semantic Korean is plausible, but the item-family identity is not established. | Low |
| 2397 | 사티바(Sativa) 줄기 | Confirm whether `Sativa` is a named plant/material and retain its identity consistently. | Japanese transliterates `Sativa`; Chinese specifies flax stalks, which is more interpretive than the English. Korean preserves the English name and the plant part. No botanical identification is approved here. | Low |

## Historical Audit Reconciliation

- IDs 2353, 2362, and 2375 remain unresolved historical questions; the active
  Korean was checked against the current source rows and retained as a
  candidate, not treated as previously approved.
- ID 2330's `Icey Dev Bow` remains a possible source typo/debug-asset question.
  The Korean `얼음 개발용 활` follows the likely intended sense but does not
  settle either issue.
- ID 2332's `Aodh` spelling/transliteration remains uncertain; `아오드` is
  retained as the current candidate, not a canonical decision.

## Other Checks

- ID 2303 `the House of Sorrows` remains part of the unresolved House/faction
  naming family. IDs 2307, 2336, 2358, and 2388 preserve their numbered/title
  structure.
- ID 2322 `Shillelagh` is a specific club; `곤봉` is plausible, but references
  disagree on the exact weapon category. Preserve the existing historical
  question rather than expanding it into a new decision.
- ID 2368 preserves the named location `Cape Solace`; ID 2379 retains the
  journal volume; ID 2392 retains the page number.
- The remaining inspected rows preserve their principal English meaning.
  Proper-name parenthetical display remains subject to a corpus-wide
  convention; no names were normalized.

## Batch Status

IDs 2300-2399 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
