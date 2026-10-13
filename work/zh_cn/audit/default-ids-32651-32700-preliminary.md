# Preliminary Language Scan: `default` IDs 32651-32700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32651-32700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32656 | `샌드스톤 빌라` for `Sandstone Villa` | Standardize the established place name without deciding here between transliteration and descriptive translation. | The same working CSV uses `샌드스톤 저택`, `사암 별장`, and `샌드스톤 빌라` in other rows. Prior audit notes already flag the name. English, Japanese, and Chinese identify the same estate but do not settle the Korean form. | High |
| 32663 | `안개 낀 이마` for `brumey brow` | Preserve the personified mist image while checking whether “brow” is literal, a cloud-edge metaphor, or deliberately opaque wording. | Korean translates the “brow” literally as a foggy forehead. English's `brumey` is unusual; Japanese recasts the edge and Chinese translates it as a thick eyebrow. All locales retain seven poem lines and six embedded breaks. | Medium |
| 32665 | `꼬박 10년 동안` for `ten long years` | Retain the exact duration and emphasis; no value discrepancy found. | English spells out ten and Korean uses `10년`; both preserve the decade. Japanese and Chinese also state ten years, although Chinese uses a form that can read as “more than ten.” | High |
| 32666 | `부하들` for `the boys` | Check whether a crew/companion term is preferable to a word that specifically implies subordinates. | English's colloquial `me and the boys` does not itself establish rank. Japanese uses `仲間` (companions) and Chinese `伙计们` (mates/crew), while Korean `부하들` adds hierarchy. | Medium |
| 32670 | Poison-damage potion recipe | Preserve the effect, reagent order, and exact quantities; verify item-name forms in the integrated terminology pass. | All four locales list Cripplespore Caps (3), Scarwood Bark (2), and Bloodroot (1). Korean keeps the four newline characters and quantities. Ingredient names vary across locales. | High |
| 32677 | `히에로판트가 몰락하자` for `the Hierophant fell` | Keep the event open between loss of office, defeat, or death; avoid narrowing “she's gone” without context. | Korean's `몰락` and Japanese's `失脚` suggest loss of standing/office. English is ambiguous and Chinese's `倒` does not resolve it. All versions say the Travelers scattered and depended on her. | Medium |
| 32678 | `마력이 ... 재료를 만들어 냈거든` for `magic ... cooked up ... ingredients` | Preserve the colloquial creative metaphor and the claim that the Plain's magic produces strange ingredients. | Korean conveys the magic-generated ingredients; Japanese shifts to the area's appeal, while Chinese supports the English creation sense. No material meaning loss is evident. | Medium |
| 32681 | `재를 쓸어 모으는 구석` / `짐승을 가둬 두는 우리` | Preserve the paired refuse-corner and beast-pen images; check whether the demeaning comparison is intentional in the wider passage. | English, Korean, and Chinese retain both images directly. Japanese compresses them to a dust-gathering place and livestock shed. Korean preserves the three-sentence progression and its harsh tone. | Medium |
| 32683 | Merchants who know how to enter the town | Preserve the source's awkward self-correction and that the merchants are reluctant to share the entry method. | English is syntactically disfluent (`I know a few others ... know ... merchants`). Korean makes the merchants the few people who know, which is a plausible reading supported by Japanese and Chinese; the antecedent of “get in” remains unstated. | Medium |
| 32684 | `더 큰일도 맡을 수 있겠어` for `cut out for more than the odd contract` | Preserve the compliment that the addressee is suited to work beyond occasional contracts, not merely able to accept a larger job. | English idiom concerns aptitude. Korean's “can take on bigger work” is close but may shift suitability toward capacity/scale. Japanese also reads as being capable of work beyond temporary contracts; Chinese diverges. | Medium |
| 32686 | `...신이 ... 하시기 때문이지` for fragment `Why the great god of order...` | Retain the unfinished “Why...” fragment and verify its attachment to surrounding dialogue before deciding the Korean connective. | English is a sentence fragment beginning with “Why”; Chinese also begins “Why,” while Japanese turns it into a complete statement. Korean's causal ending can connect to a preceding question/reason but depends on unavailable neighboring context. | Medium |
| 32700 | `노움 학자들` / `참회의 서` / `템플러` | Check the institutional use of capitalized `Scholars`, the artifact/title forms, and `Templar` consistency without adding an unsupported rank or organization. | English capitalizes `Scholars`; Korean treats them as scholars generically. Japanese/Chinese likewise describe gnome scholars and identify the returned Tome and Templar Fastrada. The row alone does not establish whether `Scholar` is a formal title. | Medium |

IDs 32651-32655, 32657-32662, 32664, 32667-32669, 32671-32676, 32679-32680,
32682, 32685, 32687-32699 generally retain the English meaning on this first
reading. Proper-name spelling, lore titles, and dialogue register remain
integrated-pass candidates; no other distinct high-confidence wording issue
was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 32600-32699 flags Sandstone
  Villa, Olma Volgard, the seven-line river poem and `brumey brow`, royal
  quarters, the Hierophant, Forsaken Plain, the beast-pen image, and the
  order god. The entry for 32700-32799 flags gnome Scholars, Tome of
  Contrition, Templar Fastrada, and related names. These were checked against
  the four locale rows and active Korean.
- Sandstone Villa already has multiple Korean forms in the active corpus;
  this batch adds `샌드스톤 빌라` and does not resolve the established form.
- The questions at IDs 32677, 32681, and 32686 remain context-dependent.
  Findings are candidates for integrated review, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 32651-32700 once
  and in identical order.
- Embedded line-break counts match across the four locales throughout the
  range. ID 32663 has six breaks in each version; the recipe at ID 32670
  preserves its blank-line and item-list layout.
- ID 32670 preserves the reagent quantities `3`, `2`, and `1`.
- Detected runtime-marker signatures match across all four locale rows.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 32651-32700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32701.
