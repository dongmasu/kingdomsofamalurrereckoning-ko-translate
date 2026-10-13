# Preliminary Language Scan: `default` IDs 36201-36250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 36201-36250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 36201 | `기본 레코닝 강화 효과` for `Base Reckoning Buff` | Confirm whether `Base` is a named build/stat category and standardize the Reckoning buff label. | Korean retains the Reckoning term and buff meaning. English is an isolated UI label; Chinese's `惩罚` reading appears inconsistent with the game's Reckoning term and does not resolve the intended category. | Medium |
| 36218 | `먼지의 자식` for `Child of Dust` | Treat the capitalized address as a recurring title/identity term and align its Korean form across the corpus. | English capitalizes the address, and Japanese/Chinese likewise use a title-like phrase. Korean is a natural literal rendering, but consistency with `Children of Dust` and other titles remains open. | Medium |
| 36225 | `대사관` for `Embassy Hall` | Verify whether `Hall` is part of the named destination and should remain explicit in Korean. | English names an Embassy Hall; Japanese and Chinese retain a hall/building noun, while Korean says only `대사관`. The exact map/location convention is not clear from this label alone. | Medium |
| 36226 | `반려동물을 길들이면` for `Training a pet` | Confirm whether this tutorial refers to training an already acquired pet or taming it; preserve the special-bond/combat-benefit relation. | English and Japanese describe training. Korean uses `길들이다` (“tame”), which may imply a different stage/action. Chinese also says training. | Medium |
| 36232 | `대지의 신전` / `대기의 신전`; `아르케스` | Carry forward the historical question about shrine/temple naming and Arkes's foreknowledge. | English calls these `Shrines`; Japanese uses sanctuary/temple wording, Chinese uses shrine, and Korean uses `신전`. The source does not explain why Arkes knew the shrines would be needed. | High |
| 36237 | `시드헤` for `the Sidhe` | Align the proper group/place term with the project's established Sidhe form. | English and Chinese use the capitalized Sidhe name; Japanese transliterates it. Korean also transliterates, but this is a recurring glossary consistency item. | Medium |
| 36239 | `운명의 신전` for `Fate Shrine` | Confirm the canonical Korean rendering of named shrines and whether the request is funding rather than a loan. | English, Japanese, and Chinese identify a shrine and say Gelda could fund its repair. Korean uses `신전` and says she could provide repair money; it preserves the request without asserting a loan. | Medium |
| 36240 | `레버리` / `칼로바르` | Carry forward the historical ambiguity over whether `Reverie` is a named realm/state and how Calovar relates to it. | English capitalizes `Reverie`; Japanese/Chinese can read it as ordinary dreaming, while Korean transliterates it. The relationship expressed by “while Calovar walks the sands, I must sleep” remains context-dependent. | High |
| 36241 | `스캐브` for `scavs` | Standardize the creature/group name and its Korean display form. | English uses the short plural `scavs`; Japanese preserves a transliteration and Chinese identifies a creature descriptively. Korean transliterates the name, but the entity and plural/group convention require corpus context. | Medium |
| 36244 | `서약방패병` for `Pledgeshield` | Carry forward the historical rank/name question; do not settle whether it is a title or shield-related designation from this label alone. | English capitalizes the compound, Japanese interprets it as a mercenary rank, and Chinese retains a shield-like phrase. Korean uses a shield-soldier compound. | High |
| 36249 | `날 내버려 둬` for `Let me go` | Resolve whether the speaker asks to be physically released or left alone; retain the context-dependent reading. | English and Chinese can mean “release me,” while Japanese says “leave me alone.” Korean follows the Japanese pragmatic reading. Without scene context, neither sense can be confirmed. | Medium |

IDs 36202-36217, 36219-36224, 36227-36231, 36233-36236,
36238, 36242-36243, 36245-36248, and 36250 generally retain the
English meaning on this first reading. Names, register, and established
game terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 36200-36399 was checked against
  this batch. Its questions at 36232, 36240, and 36244 were rechecked against
  the current Korean and all three locale references.
- The recurring Sidhe, Scav, Child of Dust, shrine, and Reckoning terms were
  compared with the project's terminology patterns; no prior note was
  treated as approval.
- Historical questions are evidence only and do not authorize CSV edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 36201-36250 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 36211 keeps
  the three separate damage-stat lines in every locale.
- No runtime-token mismatch was detected. The three block values at 36211
  remain 8 Magic, 6 Melee, and 6 Ranged damage in all four versions.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 36201-36250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 36251.
