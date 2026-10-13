# Preliminary Language Scan: `base` IDs 4400-4499

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4400-4499.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for historical terminology questions and
  reconciled `base` audit entries only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4401 | 성 에드릭(Eadric)의 영구 선교회 | Confirm whether `Mission` is a permanent religious institution/mission rather than a “mission” in the task sense, and choose a natural Korean institution name after checking context. | English says `Perpetual Mission`; Spanish/French retain “mission,” Japanese says monastery, and Chinese/Russian suggest a preaching parish. The current `선교회` is plausible but leaves the institution type unsettled. | Medium |
| 4405, 4408 | 은빛 충격 수호자 / 청동 수호자 | Determine whether `Guard` means a protective component/effect or a named guardian; avoid treating it as a person if these are inventory parts. | German/French/Italian/Russian render protection, guard, or a crafting blank; Spanish uses “guard,” while Japanese retains the English. Korean `수호자` strongly suggests an agent/person. This repeats the historical question. | High |
| 4418 | 기본형 고문 손잡이 | Confirm whether `Tormenting` names a crafting property/effect or literally describes torture; compare related `Grip` component names. | English and sibling locales retain a torment/torture modifier, but the isolated item title does not identify the mechanic. Korean is literal and may sound like a torture device rather than an equipment component. This repeats the historical question. | Medium |
| 4425 | 무두질한 가죽 보호대 | Identify the equipment form of `Brace` before standardizing the Korean item noun. | German/Spanish/French/Italian/Russian identify a support, bracer, or armor blank; English/Japanese are less specific. `보호대` is broad and plausible, but exact gear type remains uncertain. This repeats the historical question. | Medium |
| 4437 | 단단한 보석 | Confirm whether `Rigid` is a physical property or a named magical modifier. | German, Spanish, French, and Italian also describe rigidity/hardness; Russian instead suggests an “Unyielding” property. Korean follows the literal physical reading, but the mechanic is not established. This repeats the historical question. | Medium |
| 4441 | 굴욕의 보석 | Check whether `Mortification` denotes humiliation, regret/chagrin, or religious self-discipline. | English supports humiliation or mortification; Japanese leans toward regret and Chinese toward shame. Korean's `굴욕` is plausible but may overstate the intended effect. This repeats the historical question. | Medium |
| 4466 | 피커럴위드(Pickerel Weed) | Confirm whether to keep the traceable phonetic plant name or use an established Korean common name. | English names a real plant; French and Chinese use localized plant names, while Japanese uses a botanical term. The Korean transliteration preserves source identity but is not a settled Korean plant name. This repeats the historical question. | Medium |
| 4467 | 야수 우리 자재 목록 | Keep the source typo `Penl` distinct in the audit; confirm that context supports reading it as `Pen` without silently changing the source. | English has `Beast Penl Materials List`; Japanese, Chinese, German, Spanish, French, Italian, and Russian all indicate materials for a beast pen/enclosure. Korean conveys the likely intended meaning without reproducing the typo. This repeats the historical question. | Medium |
| 4471 | 껍데기 | Determine whether isolated `Shell` means a shell, casing, or outer covering before narrowing it. | The references offer literal shell/outer-cover readings and provide no object context. Korean `껍데기` is broad and appropriately provisional. This repeats the historical question. | Medium |
| 4474 | 콜로새(Kollossae)의 연도문 | Confirm whether `Litany` is a prayer text/rite or a named document, and use a natural Korean religious-text term. | English says `Litany`; Japanese interprets it as a litany/prayer book, while other locales largely retain a litany-like term. `연도문` preserves the specific religious sense but may be unfamiliar as an item title. This repeats the historical question. | Medium |
| 4477 | 그레이브홀(Gravehal) 대사관 | Confirm whether this labels a building or a diplomatic mission/representative office. | English, German, Spanish, French, and Italian support an embassy; Russian also identifies an embassy, while Chinese suggests an envoy. The Korean building reading is the majority reading, but the in-world referent remains unverified. This repeats the historical question. | Medium |
| 4485 | 상급 수선 안감 | Confirm the crafting effect behind `Mending` and align it with the project's established recovery/healing terminology. | English/Spanish suggest repair; French/Italian/Russian suggest healing. Korean `수선` may imply repairing the lining itself rather than its restorative effect. | Medium |
| 4493 | 어둠의 파편 | Establish whether `Dark Sliver` names a dark shard/material, a property, or a specific item; preserve uncertainty around `Sliver`. | French/Italian/Spanish describe a dark shard/splinter, while Russian reads it as blackened silver; Japanese leaves the phrase in English. Korean follows the shard reading. This repeats the historical question. | Medium |
| 4499 | DLC2 개발용 원초의 페이 블레이드 | Confirm whether `DLC2 DEV` is an intentional internal/test label and preserve it if this row is visible to players. | English/Japanese and several sibling locales retain the developer marker; Spanish localizes it as development content. Korean keeps the marker rather than silently removing it. | Low |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4401, 4405, 4408, 4418,
  4425, 4437, 4441, 4466, 4467, 4471, 4474, 4477, and 4493 against the
  active Korean and source locales. Their institution, equipment, modifier,
  plant-name, typo, shell, litany, embassy, and item-name readings remain
  open or provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` item rows.

## Other Checks

- IDs 4432 (`Properous Trim`) and 4467 (`Penl`) contain apparent English
  source typos. The Korean conveys the likely intended meaning; this scan
  does not authorize changing the source or normalizing unrelated rows.
- IDs 4483 (`Chakrams`) and 4492 (`Cell Doors Lever`) remain understandable
  as short inventory/UI labels; exact number and concatenation depend on
  their in-game use.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4400-4499 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
