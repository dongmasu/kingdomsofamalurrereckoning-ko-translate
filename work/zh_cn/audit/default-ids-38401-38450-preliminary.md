# Preliminary Language Scan: `default` IDs 38401-38450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38401-38450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38404 | Well / `샘` | Determine whether capitalized Well is the named Well of Souls and use the established Korean name if context confirms. | Korean uses a generic spring/well term. The line ties it to eternal life; earlier audit notes repeatedly leave the Well's proper-name status open. | Medium |
| 38406 | `what may be an impossible crime` / `불가능에 가까운 범죄` | Preserve the uncertainty and clarify whether the alleged crime is impossible to commit or merely exceptionally difficult to prove. | English is ambiguous. Korean says “a crime close to impossible,” while Japanese and Chinese also differ in how they describe the accusation. The planting/evidence and escape sequence is retained. | Medium |
| 38417 | Crossing / `교차로` | Verify whether the capitalized Crossing is the named location and standardize its Korean rendering. | English capitalizes it as a destination; Korean uses the generic “intersection/crossroads.” Previous audit reports track this recurring proper-name ambiguity. | High |
| 38425 | Tirin's Rest / `티린의 안식처` | Standardize the place-name spelling and determine whether `Rest` is a proper name, lodging, or refuge. | Korean retains the meeting and reward details. Existing audits record multiple Korean spellings and place-type interpretations for Tirin's Rest. | Medium |
| 38429 | `.` / empty Korean string | Preserve the source punctuation unless context establishes that the dot is a deliberate non-display value. | English, Japanese, and Chinese contain a period; the Korean text field is empty. This is a one-character content omission, though keys and row structure remain aligned. | High |
| 38437 | `I shall tend to you in a moment` / `잠시만 기다리세요. 곧 돌봐 드리겠습니다.` | Check the speaker's intent and register; retain the possible threat/menace rather than making it sound like routine helpful service. | Chinese says the speaker will “deal with” the addressee and Japanese offers a reprieve. Korean's polite waiting/care phrasing reads as courteous assistance and may reverse the tone. | High |
| 38440 | `our lost` / `실종자들` | Determine whether “our lost” refers to the dead rather than missing people, while retaining that earrings are recovered from their bodies. | English uses a euphemism; Korean explicitly calls them missing persons, which conflicts with “bodies” in the same sentence. Japanese also uses a broad “lost ones” form and Chinese makes the deceased reading explicit. | Medium |
| 38447 | Tender / `보살핌꾼` | Standardize the formal House of Sorrows role and retain that Cadoroc fled the group's ranks and is suspected of a link to Saturnyn. | Korean conveys both claims. Other audit entries leave the Tenders' exact caretaker/guardian role open; this semantic form is one rendering among several. | Medium |

IDs 38401-38403, 38405, 38407-38416, 38418-38424, 38426-38428,
38430-38436, 38438-38439, 38441-38446, and 38448-38450 generally retain
the English meaning on this first reading. Proper names, lore, register,
and UI context remain subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log does not cover this range;
  its documented gap includes IDs 37700-40349. No historical disposition
  is inferred for IDs 38401-38450.
- Existing consolidated audit notes were applied to the Well, The Crossing,
  Tirin's Rest, and Tenders. Their terminology remains unresolved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38401-38450 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales.
- The potion recipe at ID 38435 retains all three ingredients, quantities
  (2, 1, 2), and list layout. ID 38423 preserves 11 Magic, 8 Melee, and
  8 Ranged damage blocked on three lines.
- ID 38429 is a text-content exception: the Korean field is empty while
  the other three locales contain `.`. No translation CSV or immutable
  source file was edited.

## Batch Status

IDs 38401-38450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 38451.
