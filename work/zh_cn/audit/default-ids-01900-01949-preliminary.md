# Preliminary Language Scan: `default` IDs 1900-1949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1900-1949.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked names, terminology,
  numeric content, and dialogue register.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1903 | 브리건드 홀(Brigand Hall)의 서약방패병(Pledgeshield)이신가요? | Confirm the formal `Pledgeshield` rank and whether `Brigand Hall` names a faction, organization, or place. | English/Japanese/Chinese all identify a Pledgeshield associated with Brigand Hall, but the locale references differ on whether the Hall is a cave, hall, or lair. Korean preserves both English spellings and a formal title, consistent with the historical question. | Medium |
| 1917 | 목 베기(Cut Throat) - 물리 피해 +15%, 생명력 흡수 확률 +1%... | Verify the skill name and exact condition/duration for the gold-drop effect. | English and sibling locales agree on +15%, +1%, 20% of damage, and 5 seconds, but the compact English syntax can attach the duration ambiguously. Korean preserves all values and ties the 5 seconds to attacks on downed enemies; retain the historical mechanic question. | Medium |
| 1920 | 지부 도서관에 오신 걸 환영합니다... | Confirm whether `Chapter Library` means a branch/office library or a literal chapter library. | English and Japanese say Chapter Library/branch library; Chinese and Spanish support a chapter-house reading, while German/Russian omit the term. Korean's `지부 도서관` follows Japanese/context and remains a historical terminology question. | Medium |
| 1922 | ... 사투르닌(Saturnyn)은 ... 그는 속임수였어. 존재 자체가 날조된 거지. | Preserve the source's reveal that Saturnyn was fabricated and confirm whether the name refers to a person, decoy, or false identity. | English, Japanese, Chinese, and all sibling locales agree that the existence was a ruse/fabrication. The ambiguity is about the lore/entity, not the Korean meaning; historical question remains open. | Medium |
| 1930 | ... 정강이받이로 알맞지만, 사실은 ... 팔 보호대다. | Keep the source typo and the two distinct equipment uses documented; verify the intended item category in context. | English says `grieves` (likely `greaves`); Japanese and most sibling locales identify greaves for humans/Alfar but armguards for Kollossae. Korean correctly expresses the contrast and preserves both equipment parts. | High |
| 1939 | ... 하지만 공성 파괴자(Siegebreaker)는 할 수 있지. | Determine whether `Siegebreaker` is a named person/title or an object/weapon that can inspire soldiers. | English, Japanese, and sibling locales treat this as an entity/title with agency, but do not establish its referent. Korean retains the English spelling and follows the source; keep the historical question open. | Medium |
| 1945 | 윈더미어의 시녀 | Standardize the named `Maid of Windemere` title and decide whether to include English alongside Korean. | English uses a formal title; Japanese interprets it as a fierce heroine, Chinese as a maiden, and European locales mostly use Maid/maiden. Korean is compact and follows English, but differs from the bilingual-name convention used elsewhere. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 1903, 1917, 1920, 1922,
  1930, 1933, and 1939 against the active Korean and source locales. The
  formal title, skill mechanic, institution, fabricated Saturnyn, source
  typo, lore poem, and `Siegebreaker` referent remain open or provisional.
- The same-numbered historical `base` notes were kept separate from these
  `default` dialogue, UI, and status rows.

## Other Checks

- ID 1917 preserves +15% Physical Damage, +1% Health Steal chance, 20% of
  damage, and 5 seconds in source order.
- ID 1936 preserves +5% maximum Health and +3% elemental resistance.
- The remaining inspected dialogue and UI lines preserve their main meaning
  and conversational tone; no variables or line breaks were changed.

## Batch Status

IDs 1900-1949 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
