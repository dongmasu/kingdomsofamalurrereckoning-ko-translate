# Preliminary Language Scan: `default` IDs 30401-30450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30401-30450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30402 | `침대를 빌리겠다` / `$NQD_City_Ysa.m_inn_cost$` | Preserve the explicit “rent the bed” label and the exact gold-cost variable; check that “bed” is the intended UI object rather than a room. | Korean follows English/Japanese; Chinese says room. The variable is retained exactly in all locales. Historical audit flags this gold-cost variable. | Medium |
| 30404 | `약이 있는데` for `There are things for it` | Confirm whether the unspecified helpful items are medicine/reagents; preserve that the speaker could gather them personally if able to walk. | Korean adds “medicine,” while English only says “things for it.” Japanese says there are things that work, Chinese says things can heal it. Context is needed to identify the object. | Medium |
| 30407, 30069 | `새터닌` / `사투르닌` for `Saturnyn` | Standardize the character name across the corpus. | This row uses `새터닌`; other active rows use `사투르닌` and `새터닌`. The spelling varies even when the English name is identical. | Medium |
| 30408 | `시드` for `The Sidhe` | Determine whether Sidhe names a place/realm or people and establish a canonical Korean form. | Korean transliterates it, Japanese uses a phonetic form, and Chinese describes it as a fairyland. The English article and capitalization leave the referent context-sensitive. | Medium |
| 30409 | `유언단` for capitalized `the Testament` | Standardize this faction/institution name and reconcile the English `Testament` with Belen naming in other locales. | Korean literally renders the group as “will/testament sect,” while many active rows use `테스타먼트(Testament)` or `벨렌(Belen)의 테스타먼트`. Japanese/Chinese identify a Belen organization. Historical notes flag this faction conflict. | High |
| 30411 | `비전 이론이 교활함과 경험을 이길` | Confirm the intended challenge: whether arcane theory can outdo an opponent's cunning and experience. | Korean preserves the comparison. Japanese/Chinese also frame it as theory defeating experience/strategy; no structural or value issue was found. | Medium |
| 30412 | `창백한 지팡이` for `Paling Wand` | Confirm the named wand's farming function and canonical Korean name; avoid treating `Paling` as an ordinary color adjective if it is a pun/name. | Korean uses a literal “pale wand”; Japanese describes a farming/plowing wand, and Chinese gives a different name. Historical audit explicitly asks whether this wand is used for farming. | Medium |
| 30419 | `존재의 근본 법칙을 밝혀내는` for `determine the underlying rules and laws of existence` | Check whether scholars establish/define the laws rather than discover existing laws; preserve that this is where gnome power originates. | English says “determine,” and Japanese/Chinese say decide/set the rules. Korean `밝혀내다` means discover/reveal, shifting the agency and premise. | High |
| 30420 | `라스트 브래티건을 유혹했다` for achievement `Wooed Rast Brattigan` | Confirm the achievement's intended relationship sense and standardize Rast Brattigan's spelling. | Korean uses “seduced”; Japanese says won his affection, and Chinese uses “courted/flattered.” The outcome is relationship-oriented, but the exact achievement nuance needs context. | Medium |
| 30421 | `네 존경을 얻었군` for `You have earned my respect, Sagrell` | Check the possessive; the English speaker says the addressee earned the speaker's respect, not their own. | Korean literally says “you earned your respect.” Japanese and Chinese unambiguously say “my respect.” | High |
| 30432 | `텍스처에 렌더링하지 않음` for `Don't Render To Texture` | Confirm concise Korean UI wording for this renderer/graphics option and retain the negative command. | Korean conveys the option; Japanese also translates it, while Chinese text is garbled. Historical audit flags this exact renderer label. | Medium |
| 30436, 30348 | `대사제` for `the Hierophant` | Standardize the in-world title against the recurring Korean form `히에로판트`; preserve the plot that the Hierophant intended the speaker to die while stealing the book. | Both rows use generic `대사제`, whereas many other active rows transliterate `Hierophant` as `히에로판트`. Historical terminology is unresolved; the inconsistency is directly present in the active draft. | High |
| 30442 | Ice Damage resistance potion; White Flake (2), Ysa's Breath (1) | Standardize reagent names and preserve the Alchemy Workbench, effect, quantities, and blank lines. | Korean retains the recipe structure and 2/1 values. Locale renderings of White Flake and Ysa's Breath differ. | Medium |
| 30449 | `볼간들` for `bolgans`; coastal cliffs | Standardize Bolgan/Bolgans and preserve the condition that clearing the coastal cliffs earns the final tale. | Korean's `볼간` differs from forms such as `볼건` elsewhere in the active corpus. Historical audit flags bolgans and related creature terms. | Medium |
| 30450 | `사티바 섬유` / Scarwood Bark / Bloodroot / Essence of Fate | Standardize reagent names and retain the Physical-damage effect and quantities 3/3/2/1. | Korean uses the same Sativa Fibers rendering found elsewhere, but Japanese says Sativa leaves and Chinese says flax fiber. All four preserve recipe values and layout. Historical audit flags the reagent label. | Medium |

Rows 30401, 30403, 30405-30406, 30410, 30413-30418, 30422-30431,
30433-30435, 30437-30441, 30443-30448 generally retain the English meaning.
Their names, register, UI terms, and context remain for the integrated pass;
no separate high-confidence wording candidate was identified in this first
reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30400-30499 flags Bonnlach,
  Saturnyn, Sidhe, Testament, Paling Wand, dustling, Scholars, Sylvanite,
  Canneroc, Hierophant, Missives of Sable, Scholia Arcana, Summer Court,
  bolgans, Farrara, and numerous character/item names. These were checked
  against active rows in this batch where relevant.
- The narrower historical set explicitly flags the cost variable at 30402,
  equipment markers at 30406, Wooed at 30420, reagent label at 30428,
  renderer option at 30432, and recipes at 30442/30450. These controls,
  values, and structures were checked directly.
- Historical terminology questions for Paling Wand, Hierophant, Summer
  Court, and reagents remain open; no previous note was treated as an
  approved correction.
- The Korean candidates at 30419 and 30421 were identified in the active
  cross-locale reading and remain preliminary.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30401-30450 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales, including the gold variable at 30402 and
  the nested equipment controls at 30406.
- Recipe quantities match across all locales: 30442 has 2 and 1; 30450 has
  3, 3, 2, and 1. Korean preserves the blank-line layout.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30401-30450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30451.
