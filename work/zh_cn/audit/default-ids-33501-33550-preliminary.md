# Preliminary Language Scan: `default` IDs 33501-33550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33501-33550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33503 | `규율이 필요하거든` for `in need of... discipline` | Preserve the implied warning/threat in the ellipsis and establish whether `discipline` means self-control, punishment, or imposed order for the Travelers. | English and Chinese leave “discipline” open; Japanese interprets it as lack of self-control. Korean follows the English term but cannot convey the possible euphemistic threat without scene context. | Medium |
| 33511 | `연금술 기술이 ... 2 증가한다` for `increases ... skill by 2` | Check whether the value is skill points, levels, or another game unit; preserve the exact +2 effect. | Korean retains the value but omits a unit. Japanese specifies two levels, while Chinese says two points; English does not identify the unit. | Medium |
| 33514 | `그만두겠…… 아니, ... 분명히 말했어` for `de-sist ‒ I mean, I insist` | Preserve the speaker's deliberate verbal stumble from `de-sist` to `insist` and the toll/bribe condition, without making the first word sound like a complete decision to quit. | Historical notes explicitly identify `de-sist / insist` as intentional wordplay. Korean signals a self-correction, but its first fragment may read as a separate incomplete intention rather than a malapropism. | Medium |
| 33520 | `+5% 장궁 피해` for `+5% Damage with Longbows` | Preserve the source's generic damage modifier; verify whether this is distinct from the physical-damage line and whether the target game UI uses a more specific damage category. | Korean follows English's general `Damage`; Chinese specifies “piercing damage,” which is unsupported by this English row. The +2, +5%, and +1 values and blank-line layout are preserved. | Medium |
| 33521 | `대회계관의` for `Grand Bursar's` | Retain this possessive fragment and standardize the title `Grand Bursar` against the Korean terminology used elsewhere. | English is a standalone possessive fragment rather than a complete noun phrase. Korean preserves the possessive ending; the title form remains a corpus-wide consistency question. | Low |
| 33523 | `살아 계실 때` for `in her time` | Avoid implying the mother is deceased unless surrounding story context confirms it; retain that she visited ancient places long ago. | English says the mother was there long ago and saw many ancient places “in her time.” Japanese and Chinese explicitly say “while she was alive,” and Korean follows that stronger reading, adding a death implication not explicit in English. | Medium |
| 33527 | `핏빛 뼈` for `Bloody Bones` | Determine whether this is a proper name/title or a descriptive phrase and standardize its display form. | English capitalization, Japanese transliteration, and the Chinese semantic rendering support more than one reading; Korean translates the components literally. | Medium |
| 33528 | `핏빛 이빨과 발톱` for `Red in Tooth and Claw` | Check whether this title is intended as the idiom for savage/violent nature, and retain the source's animalistic image without reducing it to a literal color description. | Korean closely translates the visible words. Chinese renders the idiomatic sense as “ruthless,” while Japanese also uses a literal tooth/claw image; title context is unavailable in the row. | Medium |
| 33532 | `애쉬무어 가문` for `the house of Ashmoor` | Confirm whether `house` denotes a family, noble house, or location and standardize Ashmoor's name. | Korean interprets `house` as a family; Japanese reads Ashmoor as a place/stronghold and Chinese preserves “House.” The English alone does not settle the entity type. | Medium |
| 33533 | Omission of `berk` in `구역에서는 하루를 버티게 해줄 게 별로 없어` | Preserve the dismissive/colloquial address or insult if it refers to the addressee; clarify what `the Quarters` names before choosing a setting-specific Korean term. | Historical notes flag both `berk` and the Quarters context. English is grammatically compressed; Japanese instead calls the infirmary a boring place, while Chinese uses barracks. Korean renders the lack of diversions but omits the possible address. | Medium |
| 33539 | `선량한 주민들` for `people of this good village` | Check whether `good` describes the village's prosperity/status rather than the residents' moral character; preserve the contrast with their high social strata and valuable collection. | English modifies the village, not directly the people. Korean shifts this into “virtuous residents”; Japanese says the villagers belonged to the highest class, and Chinese describes the village favorably. | Medium |
| 33542 | `특별한 혈통` for `a special breed` | Verify whether `breed` means a distinct species/kind or ancestry/bloodline in this speaker's context; retain the prediction about the listener's future role and required skills. | Korean and Chinese use bloodline, while Japanese uses species. The line's special-group terminology is context-dependent. | Medium |
| 33547 | `시스템 관리자` for `Systems Administrators` | Determine whether this is an actual in-world role/title to localize or an internal/system label that should remain literal. | The historical audit explicitly leaves localizability open. English and Japanese retain the English string; Chinese and Korean translate it. | Low |
| 33550 | `활동 - 목재 나르기` for `Activity - CarryLumber` | Verify whether `CarryLumber` is a player-facing activity label or an internal/debug identifier; retain the visible activity meaning if intended for players. | The historical audit identifies this as a possible debug/activity string. Korean translates the operation but localizes the identifier; Chinese and Japanese render it as an ordinary action. | Medium |

IDs 33501-33502, 33504-33510, 33512-33513, 33515-33519, 33522,
33524-33526, 33529-33531, 33534-33538, 33540-33546, 33548-33549 generally
retain the English meaning on this first reading. Proper names, lore, voice,
and display conventions remain integrated-pass candidates; no additional
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33500-33599 was checked against
  this batch. It explicitly flags the `de-sist / insist` stumble (33514), the
  possessive fragment (33521), `berk` and Quarters (33533), the
  localizability of `Systems Administrators` (33547), and the possible
  debug/activity label `CarryLumber` (33550). These were reconciled with the
  active Korean and all locale references.
- The same historical range flags the later four-line cosmological poem and
  multiple names/terms outside this batch; those remain for their respective
  ID batches.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33501-33550 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range. ID 33520 retains two stat lines and one blank line in every locale.
- No runtime-marker mismatch was detected.
- ID 33520 preserves `+2`, `+5%`, and `1`; ID 33511 preserves the increase
  value `2`.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33501-33550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33551.
