# Consolidated Context Review: The Hanged Men

- Date: 2026-10-11.
- Scope: repeated `The Hanged Men` references in `default`, including the
  existing uncertainties at IDs 9364, 26687, 27856, 28296, 29944, 46869,
  47514, 57244, and 63469, plus related named-crew rows.
- Sources checked by exact ID: English, Japanese source and preserved
  Japanese-derived Korean, Chinese, and active Korean CSVs.
- English governs meaning; Japanese informs the named-pirate-crew reading;
  Chinese is supporting evidence and does not override English.

## Finding

Repeated English contexts identify the Hanged Men as Dead Kel's named pirate
crew: the Baronett is their first and possibly deadliest member (ID 8462),
the Alfar Merchant Navy calls them his murderous crew (10882), their members
are described as notorious buccaneers (27856), they are called Amalur's
fiercest pirates (28302), and the Baronett is identified as Dead Kel's
cruelest Hanged Man (41055). Japanese repeatedly renders them as
`首吊海賊団`. Chinese often uses `吊死鬼`, which is not used as the semantic
authority. Earlier accepted decisions D-3145, D-3665, and D-10394 establish
`교수형 사내들(Hanged Men)` for this identified crew and its standalone
label.

This resolves the named-crew meaning but does not settle every row's other
name, voice, verse-fragment, or Korean display-style question.

## Decisions

| Decision | IDs | Disposition | Result |
| --- | --- | --- | --- |
| D-18244 | 9364, 11418, 11833, 21179, 26687, 27856, 28302, 31464, 32516, 34680, 35010, 40810, 41055, 47514, 57244, 63469 | Accepted terminology correction; retain unrelated row uncertainties | Use the established named-crew form where Korean had a transliteration, “executed people,” or “executioners.” Six previously uncertain keys are accepted (9364, 26687, 27856, 47514, 57244, 63469); ID 28302 is reclassified from `not an issue` to accepted. The other nine edits are term-only and do not clear their remaining row uncertainties. |
| D-18245 | 46869 | Not an issue | The existing `교수형 사내들` accurately names the group; the surrounding English and Japanese establish the island-dwelling group as Dead Kel's pirate crew. Reclassify this one prior uncertainty without editing the cell. |
| D-18246 | 28296, 29944 | Uncertain retained; not recounted | The entity is a named group, but these exact standalone labels still leave the Korean display choice between transliteration and translated naming unresolved. Preserve `행맨(The Hanged Men)` and defer both rows rather than generalizing a preferred style. |

## `Texto` Changes

Only the active Korean `Texto` cells at these 16 IDs changed:

| ID | Previous Korean fragment | Applied Korean fragment |
| ---: | --- | --- |
| 9364 | `행드 맨(Hanged Men)` | `교수형 사내들(Hanged Men)` |
| 11418 | `교수형자들(Hanged Men)` | `교수형 사내들(Hanged Men)` |
| 11833 | `교수형자들(Hanged Men)의 선원들이` | `교수형 사내들(Hanged Men)의 선원들이` |
| 21179 | `처형자들의 마지막인` | `교수형 사내들(Hanged Men) 중 마지막인` |
| 26687 | `교수형에 처한 자들` | `교수형 사내들(The Hanged Men)` |
| 27856 | `데드 켈(Dead Kel)의 행맨(Hanged Men) 선원들은` | `데드 켈(Dead Kel)의 교수형 사내들(Hanged Men)은` |
| 28302 | `행맨(The Hanged Men)` | `교수형 사내들(The Hanged Men)` |
| 31464 | `행잉 멘도 같이 있었나?` | `교수형 사내들(Hanged Men)도 함께였나?` |
| 32516 | `목매달린 자들 중 하나` | `교수형 사내들(Hanged Men) 중 하나` |
| 34680 | `교수형 집행인단의 마지막 생존자인` | `교수형 사내들(Hanged Men) 중 마지막 생존자인` |
| 35010 | `교수형 집행인단을 거느리고` | `교수형 사내들(Hanged Men)을 거느리고` |
| 40810 | `데드 켈과 교수형 해적단은` | `데드 켈과 교수형 사내들(Hanged Men)은` |
| 41055 | `데드 켈의 교수형 해적단에서 가장 잔혹한 바론넷` | `데드 켈의 교수형 사내들(Hanged Men) 중 가장 잔혹한 바론넷` |
| 47514 | `교수형 당한 자들이 실재했구나.` | `교수형 사내들(Hanged Men)이 실재했구나.` |
| 57244 | `교수형 당한 자들이 황야를` | `교수형 사내들(Hanged Men)이 황야를` |
| 63469 | `행드 맨(Hanged Men)` | `교수형 사내들(Hanged Men)` |

IDs 11418, 11833, 21179, 31464, 32516, 34680, 35010, 40810, and 41055
remain uncertain for separate letter imagery, poster voice/place names,
Baronett spelling, other named terms, incomplete verse context, or harbor
terminology. ID 35010's neighboring rows do not identify the poem's
unexpressed subject, so its row remains uncertain despite the crew-term fix.
ID 28296 and 29944 were not edited.

## Verification and Totals

- English, Japanese, Japanese-derived Korean, Chinese, and active Korean
  contain the checked IDs; source structure and active default key order
  were preserved.
- The active default CSV has 65,135 data rows. Only the 16 listed `Texto`
  values changed. UTF-8 BOM, ID order, outer and embedded line endings,
  per-row line-break counts, and detected runtime markers are preserved.
- Pre-edit SHA-256:
  `d2812e4d72b9d5ae24615f80475c73051fe28b4d96823dae218db4c9c4ee460a`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-hanged-men-context-20261011.csv`.
- Post-edit SHA-256:
  `1aa595e9d3fd82767b4db2cf641daab1bf4e6b846a8573017feef8857bc95400`.
- Raw line-ending totals are unchanged: 72,011 CRLF and 73 bare LF.
- Cross-resource totals through D-18246: 1,927 accepted, 23,080
  `not an issue`, and 13,515 uncertain (38,522 total); next D-18247.
  These are working dispositions, not independent final linguistic
  approval.
